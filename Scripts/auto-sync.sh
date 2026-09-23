#!/usr/bin/env bash
# ==============================================================================
# 🔄 PERSONAL-DEVELOP AUTO-SYNC DAEMON (BASH / LINUX & MACOS)
# Tự động hóa kiểm tra, commit, pull và push định kỳ 15-30 phút khi có thay đổi.
# ==============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$WORKSPACE_ROOT" || exit 1

PID_FILE="$SCRIPT_DIR/.auto-sync.pid"
LOG_FILE="$SCRIPT_DIR/auto-sync.log"
BRANCH="main"
REMOTE="origin"
DEFAULT_INTERVAL_MIN=30

# Màu sắc hiển thị
C_RESET='\033[0m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_YELLOW='\033[0;33m'
C_BLUE='\033[0;34m'
C_CYAN='\033[0;36m'
C_BOLD='\033[1m'

install_cron() {
    local cron_cmd="*/30 * * * * /bin/bash \"$SCRIPT_DIR/auto-sync.sh\" cron >/dev/null 2>&1"
    if crontab -l 2>/dev/null | grep -F "auto-sync.sh" >/dev/null 2>&1; then
        crontab -l 2>/dev/null | grep -v -F "auto-sync.sh" | crontab -
    fi
    (crontab -l 2>/dev/null; echo "$cron_cmd") | crontab -
    echo -e "${C_GREEN}✅ Đã cài đặt Cron Job tự động đồng bộ định kỳ 30 phút/lần thành công!${C_RESET}"
    echo -e "   - Lệnh: ${C_CYAN}$cron_cmd${C_RESET}"
}

uninstall_cron() {
    if crontab -l 2>/dev/null | grep -F "auto-sync.sh" >/dev/null 2>&1; then
        crontab -l 2>/dev/null | grep -v -F "auto-sync.sh" | crontab -
        echo -e "${C_GREEN}🛑 Đã gỡ bỏ Cron Job tự động đồng bộ khỏi crontab.${C_RESET}"
    else
        echo -e "${C_YELLOW}⚠️ Không tìm thấy Cron Job auto-sync.sh trong crontab.${C_RESET}"
    fi
}

is_running() {
    if [ -f "$PID_FILE" ]; then
        local pid
        pid="$(cat "$PID_FILE" 2>/dev/null)"
        if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
            return 0
        fi
    fi
    return 1
}

# Hàm thực hiện 1 chu kỳ kiểm tra và đồng bộ
do_sync_tick() {
    local now
    now="$(date '+%Y-%m-%d %H:%M:%S')"
    export GIT_TERMINAL_PROMPT=0

    # Giới hạn dung lượng file log tối đa 5MB (chống tràn ổ đĩa)
    if [ -f "$LOG_FILE" ]; then
        local log_sz
        log_sz=$(stat -c%s "$LOG_FILE" 2>/dev/null || echo 0)
        if [ "$log_sz" -gt 5242880 ]; then
            tail -n 500 "$LOG_FILE" > "$LOG_FILE.tmp" 2>/dev/null && mv "$LOG_FILE.tmp" "$LOG_FILE"
        fi
    fi

    export GIT_TERMINAL_PROMPT=0

    # 1. Kiểm tra kết nối và kéo cập nhật từ remote (nếu có)
    if git remote get-url "$REMOTE" >/dev/null 2>&1; then
        local has_stash=0
        if [ -n "$(git status --porcelain)" ]; then
            git stash push -u -m "Auto-sync stash $now" >/dev/null 2>&1
            has_stash=1
        fi

        if git pull --rebase "$REMOTE" "$BRANCH" >/dev/null 2>&1; then
            if [ "$has_stash" -eq 1 ]; then
                git stash pop >/dev/null 2>&1
            fi
        else
            if [ "$has_stash" -eq 1 ]; then
                git stash pop >/dev/null 2>&1
            fi
            echo "[$now] ⚠️ [FETCH/PULL] Không thể kéo cập nhật từ remote (kiểm tra mạng/credentials)." >> "$LOG_FILE"
        fi
    fi

    # 2. Kiểm tra xem có file nào thay đổi không
    local changes
    changes="$(git status --porcelain)"
    if [ -z "$changes" ]; then
        # Không có thay đổi nào -> yên lặng bỏ qua
        return 0
    fi

    echo "[$now] 📝 Phát hiện thay đổi dữ liệu, đang tự động commit & push..." >> "$LOG_FILE"
    git add -A

    local host_str
    host_str="$(hostname 2>/dev/null || echo 'PC')"
    local commit_msg="Auto-sync [$host_str] ($(date '+%Y-%m-%d %H:%M')): Tự động đồng bộ tiến trình"

    if git commit -m "$commit_msg" >/dev/null 2>&1; then
        local push_output
        push_output="$(git push "$REMOTE" "$BRANCH" 2>&1)"
        if [ $? -eq 0 ]; then
            echo "[$now] ✅ [SUCCESS] Đã tự động đẩy thay đổi lên GitHub thành công!" >> "$LOG_FILE"
        else
            echo "[$now] ⚠️ [PUSH FAILED] Commit cục bộ thành công nhưng chưa push được lên GitHub." >> "$LOG_FILE"
            echo "[$now]    Chi tiết lỗi: $push_output" >> "$LOG_FILE"
            echo "[$now]    👉 Khắc phục: Chạy 'git push' trong terminal 1 lần để lưu mật khẩu (credential.helper store)." >> "$LOG_FILE"
        fi
    fi

}

# Vòng lặp chạy ngầm vĩnh viễn của daemon
daemon_loop() {
    local interval_min="${1:-$DEFAULT_INTERVAL_MIN}"
    local interval_sec=$((interval_min * 60))

    echo "$$" > "$PID_FILE"
    echo "$interval_min" > "$SCRIPT_DIR/.auto-sync.interval"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 🚀 Auto-sync daemon đã khởi động (Chu kỳ: ${interval_min} phút, PID: $$)" >> "$LOG_FILE"

    while true; do
        sleep "$interval_sec"
        do_sync_tick
    done
}

start_daemon() {
    local interval_min="${1:-$DEFAULT_INTERVAL_MIN}"

    if is_running; then
        local current_pid
        current_pid="$(cat "$PID_FILE")"
        echo -e "${C_GREEN}✅ Auto-Sync Daemon ĐANG CHẠY với PID: ${C_BOLD}$current_pid${C_RESET}"
        return 0
    fi

    # Khởi động daemon hoàn toàn tách rời bằng setsid
    if command -v setsid >/dev/null 2>&1; then
        setsid -f "$0" daemon-loop "$interval_min" >/dev/null 2>&1
    else
        nohup "$0" daemon-loop "$interval_min" >/dev/null 2>&1 &
    fi

    # Đợi daemon ghi PID
    for _ in {1..5}; do
        sleep 0.5
        if is_running; then
            break
        fi
    done

    if is_running; then
        local new_pid
        new_pid="$(cat "$PID_FILE")"
        echo -e "${C_GREEN}🚀 Đã kích hoạt Auto-Sync Daemon thành công!${C_RESET}"
        echo -e "   - PID: ${C_CYAN}$new_pid${C_RESET}"
        echo -e "   - Chu kỳ kiểm tra: ${C_YELLOW}${interval_min} phút/lần${C_RESET}"
        echo -e "   - File nhật ký: ${C_BLUE}$LOG_FILE${C_RESET}"
        return 0
    else
        echo -e "${C_RED}❌ Lỗi: Không thể khởi động Auto-Sync Daemon.${C_RESET}"
        rm -f "$PID_FILE"
        return 1
    fi
}


stop_daemon() {
    if is_running; then
        local current_pid
        current_pid="$(cat "$PID_FILE")"
        kill "$current_pid" 2>/dev/null
        rm -f "$PID_FILE"
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] 🛑 Auto-sync daemon đã dừng (PID: $current_pid)" >> "$LOG_FILE"
        echo -e "${C_GREEN}🛑 Đã dừng Auto-Sync Daemon thành công (PID: $current_pid).${C_RESET}"
        return 0
    else
        rm -f "$PID_FILE"
        echo -e "${C_YELLOW}⚠️ Auto-Sync Daemon hiện không hoạt động.${C_RESET}"
        return 0
    fi
}

status_daemon() {
    local has_cron=0
    if crontab -l 2>/dev/null | grep -F "auto-sync.sh run-once" >/dev/null 2>&1; then
        has_cron=1
    fi

    if is_running; then
        local current_pid
        current_pid="$(cat "$PID_FILE")"
        local interval_val="30"
        if [ -f "$SCRIPT_DIR/.auto-sync.interval" ]; then
            interval_val="$(cat "$SCRIPT_DIR/.auto-sync.interval")"
        fi
        echo -e "${C_GREEN}🟢 [ACTIVE] Auto-Sync Daemon ĐANG CHẠY (Background)${C_RESET}"
        echo -e "   - PID: ${C_CYAN}$current_pid${C_RESET}"
        echo -e "   - Chu kỳ: ${C_YELLOW}${interval_val} phút/lần${C_RESET}"
    else
        echo -e "${C_YELLOW}⚪ [INACTIVE] Auto-Sync Daemon chạy ngầm hiện đang tắt${C_RESET}"
    fi

    if [ "$has_cron" -eq 1 ]; then
        echo -e "${C_GREEN}⏰ [CRONTAB: ACTIVE] Cron Job hệ thống ĐANG CHẠY tự động mỗi 30 phút!${C_RESET}"
    fi

    if [ -f "$LOG_FILE" ]; then
        echo -e "\n${C_BLUE}📜 5 dòng log gần nhất:${C_RESET}"
        tail -n 5 "$LOG_FILE"
    fi

    if is_running || [ "$has_cron" -eq 1 ]; then
        return 0
    else
        return 1
    fi
}

ACTION="${1:-status}"
INTERVAL="${2:-$DEFAULT_INTERVAL_MIN}"

case "$ACTION" in
    start)
        start_daemon "$INTERVAL"
        ;;
    stop)
        stop_daemon
        ;;
    restart)
        stop_daemon
        sleep 1
        start_daemon "$INTERVAL"
        ;;
    status)
        status_daemon
        ;;
    install-cron)
        install_cron
        ;;
    uninstall-cron)
        uninstall_cron
        ;;
    daemon-loop)
        daemon_loop "$INTERVAL"
        ;;
    cron)
        do_sync_tick
        ;;
    run-once)
        echo -e "${C_BLUE}🔄 Đang thực thi 1 chu kỳ kiểm tra và đồng bộ ngay lập tức...${C_RESET}"
        do_sync_tick
        echo -e "${C_GREEN}✅ Hoàn tất chu kỳ đồng bộ!${C_RESET}"
        ;;
    *)
        echo -e "${C_YELLOW}Cách sử dụng: $0 {start [phút]|stop|restart [phút]|status|run-once|install-cron|uninstall-cron}${C_RESET}"
        echo -e "Ví dụ:"
        echo -e "  $0 start 30       -> Chạy ngầm daemon định kỳ 30 phút/lần"
        echo -e "  $0 install-cron   -> Cài đặt Cron Job hệ thống tự chạy mỗi 30 phút"
        echo -e "  $0 status         -> Kiểm tra trạng thái đang chạy hay tắt"
        echo -e "  $0 stop           -> Dừng tiến trình daemon ngầm"
        echo -e "  $0 run-once       -> Đồng bộ ngay lập tức 1 lần"
        exit 1
        ;;
esac


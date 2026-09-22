#!/usr/bin/env bash
# ==============================================================================
# 🔄 PERSONAL-DEVELOP SYNC ENGINE (BASH / LINUX & MACOS)
# Tự động hóa kéo (pull), đẩy (push) và đồng bộ (sync) tiến trình phát triển cá nhân
# ==============================================================================

# Màu sắc hiển thị
C_RESET='\033[0m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_YELLOW='\033[0;33m'
C_BLUE='\033[0;34m'
C_CYAN='\033[0;36m'
C_BOLD='\033[1m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$WORKSPACE_ROOT" || exit 1

ACTION="${1:-sync}"
CUSTOM_MSG="${2:-}"
BRANCH="main"
REMOTE="origin"

echo -e "${C_CYAN}${C_BOLD}======================================================${C_RESET}"
echo -e "${C_CYAN}${C_BOLD} 🚀 COACH ANH — PERSONAL-DEVELOP SYNC ENGINE (v1.0)   ${C_RESET}"
echo -e "${C_CYAN}${C_BOLD}======================================================${C_RESET}"
echo -e "Thư mục làm việc: ${C_YELLOW}$WORKSPACE_ROOT${C_RESET}"

# Kiểm tra git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo -e "${C_RED}❌ Lỗi: Thư mục hiện tại không phải là Git repository!${C_RESET}"
    exit 1
fi

# Kiểm tra remote
if ! git remote get-url "$REMOTE" >/dev/null 2>&1; then
    echo -e "${C_YELLOW}⚠️ Cảnh báo: Chưa cấu hình Git remote '$REMOTE'. Vui lòng kiểm tra lại!${C_RESET}"
    exit 1
fi

do_pull() {
    echo -e "\n${C_BLUE}📥 [PULL] Đang kiểm tra và tải cập nhật từ GitHub ($REMOTE/$BRANCH)...${C_RESET}"
    
    # Kiểm tra xem có thay đổi cục bộ chưa commit hay không
    HAS_LOCAL_CHANGES=0
    if [ -n "$(git status --porcelain)" ]; then
        HAS_LOCAL_CHANGES=1
        echo -e "${C_YELLOW}⚠️ Phát hiện thay đổi chưa commit cục bộ. Đang tạm cất vào Git Stash an toàn...${C_RESET}"
        git stash push -u -m "Auto-stash before sync $(date '+%Y-%m-%d %H:%M:%S')" >/dev/null 2>&1
    fi

    # Thực hiện pull rebase
    if git pull --rebase "$REMOTE" "$BRANCH"; then
        echo -e "${C_GREEN}✅ Kéo dữ liệu mới nhất thành công!${C_RESET}"
        if [ "$HAS_LOCAL_CHANGES" -eq 1 ]; then
            echo -e "${C_BLUE}📦 Đang khôi phục các thay đổi cục bộ từ Git Stash...${C_RESET}"
            if git stash pop >/dev/null 2>&1; then
                echo -e "${C_GREEN}✅ Khôi phục thay đổi cục bộ thành công, không có xung đột!${C_RESET}"
            else
                echo -e "${C_RED}⚠️ Có xung đột khi pop stash. Vui lòng kiểm tra 'git status' để xử lý!${C_RESET}"
            fi
        fi
    else
        echo -e "${C_RED}❌ Lỗi: Không thể kéo dữ liệu từ remote. Vui lòng kiểm tra kết nối mạng hoặc SSH/PAT!${C_RESET}"
        if [ "$HAS_LOCAL_CHANGES" -eq 1 ]; then
            git stash pop >/dev/null 2>&1
        fi
        return 1
    fi
    return 0
}

do_push() {
    echo -e "\n${C_BLUE}📤 [PUSH] Đang chuẩn bị đẩy dữ liệu lên GitHub ($REMOTE/$BRANCH)...${C_RESET}"
    
    STATUS_OUTPUT="$(git status --porcelain)"
    if [ -z "$STATUS_OUTPUT" ]; then
        echo -e "${C_GREEN}✨ Không có thay đổi mới nào cần commit & push!${C_RESET}"
        return 0
    fi

    echo -e "${C_YELLOW}📝 Danh sách các file thay đổi:${C_RESET}"
    git status -s

    git add -A

    HOSTNAME_STR="$(hostname 2>/dev/null || echo 'Linux-PC')"
    TIMESTAMP_STR="$(date '+%Y-%m-%d %H:%M')"
    if [ -n "$CUSTOM_MSG" ]; then
        COMMIT_MSG="Sync [$HOSTNAME_STR] ($TIMESTAMP_STR): $CUSTOM_MSG"
    else
        COMMIT_MSG="Sync [$HOSTNAME_STR] ($TIMESTAMP_STR): Cập nhật tiến trình phát triển bản thân"
    fi

    echo -e "${C_BLUE}✍️ Đang commit với nội dung: ${C_YELLOW}\"$COMMIT_MSG\"${C_RESET}"
    git commit -m "$COMMIT_MSG"

    if git push "$REMOTE" "$BRANCH"; then
        echo -e "${C_GREEN}✅ Đã đẩy toàn bộ tiến trình lên GitHub thành công!${C_RESET}"
    else
        echo -e "${C_RED}❌ Lỗi: Không thể push lên remote. Vui lòng kiểm tra quyền truy cập hoặc chạy 'pull' trước!${C_RESET}"
        return 1
    fi
    return 0
}

do_status() {
    echo -e "\n${C_BLUE}📊 [STATUS] Trạng thái Git hiện tại:${C_RESET}"
    git branch -vv
    echo ""
    git status -s
    echo -e "\n${C_BLUE}🕒 3 Commit gần nhất:${C_RESET}"
    git log -n 3 --oneline --graph --decorate
}

case "$ACTION" in
    pull)
        do_pull
        ;;
    push)
        do_push
        ;;
    sync)
        if do_pull; then
            do_push
        fi
        ;;
    status)
        do_status
        ;;
    *)
        echo -e "${C_RED}❌ Lựa chọn không hợp lệ: '$ACTION'${C_RESET}"
        echo -e "Cách sử dụng:"
        echo -e "  $0 pull                 -> Kéo cập nhật mới nhất về máy"
        echo -e "  $0 push [nội dung]      -> Đẩy các cập nhật lên GitHub"
        echo -e "  $0 sync [nội dung]      -> Vừa kéo vừa đẩy (khuyên dùng)"
        echo -e "  $0 status               -> Xem trạng thái hiện tại"
        exit 1
        ;;
esac

echo -e "\n${C_CYAN}${C_BOLD}🎉 Hoàn tất tác vụ '$ACTION'! Sẵn sàng làm việc cùng Coach Anh.${C_RESET}\n"

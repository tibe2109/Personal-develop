# 🔄 CẨM NANG ĐỒNG BỘ ĐA MÁY TÍNH & DUY TRÌ KÝ ỨC LIÊN SESSION
### Đơn giản · Liền mạch · Tự động 100% · Làm việc với Coach Anh ở bất cứ đâu

> **🎯 Mục tiêu tối thượng:** Dù bạn đang dùng **Linux ở công ty**, **Windows ở nhà**, hay **Laptop cá nhân**, chỉ cần có bộ source này: **Ngay khi bạn mở lời chào hoặc bắt đầu trao đổi, Coach Anh sẽ tự động kéo toàn bộ nội dung mới nhất về máy và kích hoạt cơ chế bảo vệ ngầm**. Mọi nội dung thảo luận, nhật ký, hay kế hoạch đều được đẩy lên Git ngay lập tức, không bao giờ bị đứt quãng tiến trình.

---

## ⚡ 1. CƠ CHẾ TỰ ĐỘNG ĐỒNG BỘ 2 CHIỀU ĐẦU & CUỐI PHIÊN (REAL-TIME SESSION SYNC)

Bạn không cần phải bận tâm nhớ gõ lệnh thủ công nữa, Coach Anh đã được cài đặt quy trình tự động hóa 2 chiều:

```
      [BƯỚC 1: BẮT ĐẦU PHIÊN CHAT]                 [BƯỚC 2: TRONG & CUỐI PHIÊN CHAT]
   ┌─────────────────────────────────────┐      ┌─────────────────────────────────────┐
   │         SESSION-START (PULL)        │      │          SESSION-END (PUSH)         │
   │ - Tự động kéo cập nhật mới nhất từ  │      │ - Tự động ghi nhận Session Log      │
   │   GitHub (origin/main) về máy       │ ──►  │ - Cập nhật Current-State.md         │
   │ - Tự động kiểm tra/bật Auto-Sync    │      │ - Tự động Commit & Push ngay lập tức│
   │   Daemon chạy ngầm (15 phút/lần)    │      │   lên GitHub                        │
   └─────────────────────────────────────┘      └─────────────────────────────────────┘
```

### 💻 Lệnh thủ công dự phòng (Nếu bạn muốn tự chạy từ Terminal):
- **Trên Windows (PowerShell):**
  ```powershell
  # Đầu phiên (Kéo về + bật daemon):
  .\Scripts\sync.ps1 -Action session-start

  # Cuối phiên (Đẩy lên ngay lập tức):
  .\Scripts\sync.ps1 -Action session-end -Message "Lưu phiên làm việc"

  # Xem trạng thái:
  .\Scripts\sync.ps1 -Action status
  ```
- **Trên Linux / macOS (Bash):**
  ```bash
  # Đầu phiên:
  ./Scripts/sync.sh session-start

  # Cuối phiên:
  ./Scripts/sync.sh session-end "Lưu phiên làm việc"

  # Xem trạng thái:
  ./Scripts/sync.sh status
  ```

---

## 🧠 2. CƠ CHẾ "KHÔNG BAO GIỜ MẤT TRÍ NHỚ" CỦA COACH ANH

Khi bạn bắt đầu một **phiên chat mới (session mới)** trên bất kỳ IDE hay máy tính nào:

```
         Bạn mở chat: "Chào anh" / "Bắt đầu ngày mới" / đặt câu hỏi bất kỳ
                             ↓
              AI tự động thực thi Session-Start:
              1. Kéo toàn bộ ký ức mới nhất từ GitHub về máy
              2. Đọc Current-State.md + Session log gần nhất
              3. Đối chiếu 4 tài liệu cốt lõi Overview/
                             ↓
         Coach Anh mở lời chào tiếp nối:
         - Đính kèm tag: [🛡️ Auto-Sync: Active | 📥 Synced: origin/main]
         - Gọi đúng chủ đề cuộc trò chuyện phiên trước
         - Nắm trọn vẹn cảm xúc & việc đang dang dở (Open Loops)
         - Theo sát Con Ếch A1 hôm nay
```

---

## 🛡️ 3. LÁ CHẮN NGẦM ĐỊNH KỲ (AUTO-SYNC DAEMON 15 PHÚT)

Bên cạnh việc đồng bộ tức thì đầu và cuối phiên, hệ thống duy trì một **tiến trình ngầm (Daemon)** hoạt động như pháo đài bảo hiểm an toàn:

### 🌟 Cách thức hoạt động:
1. **Chu kỳ quét 15 phút/lần:**
   - Tự động stash các thay đổi dở dang, pull rebase từ remote để tránh xung đột.
   - Quét xem có file nào được chỉnh sửa hoặc thêm mới không (`git status`).
   - **Chỉ khi có dữ liệu thay đổi:** Tự động commit và đẩy lên GitHub!
   - **Nếu không có gì thay đổi:** Daemon ngủ yên, tiêu tốn 0% CPU.
2. **Chống xung đột thông minh (Conflict Prevention):**
   - Mọi tiến trình đều stash trước khi kéo và pop stash sau khi rebase.
   - Các file nhật ký được lưu độc lập theo ngày tháng, hạn chế tối đa nguy cơ xung đột nội dung.

### 🕹️ Lệnh quản trị Daemon:
- **Windows:**
  ```powershell
  .\Scripts\auto-sync.ps1 -Action status   # Kiểm tra trạng thái
  .\Scripts\auto-sync.ps1 -Action start    # Khởi động (mặc định 15 phút)
  .\Scripts\auto-sync.ps1 -Action stop     # Dừng tiến trình
  .\Scripts\auto-sync.ps1 -Action run-once # Chạy ngay 1 chu kỳ kiểm tra
  ```
- **Linux / macOS:**
  ```bash
  ./Scripts/auto-sync.sh status
  ./Scripts/auto-sync.sh start 15
  ./Scripts/auto-sync.sh stop
  ./Scripts/auto-sync.sh run-once
  ```

---

## 🗂️ 4. BẢNG PHÂN BỔ DỮ LIỆU ĐƯỢC ĐỒNG BỘ

| Thư mục / File | Ý nghĩa | Trách nhiệm cập nhật |
| :--- | :--- | :--- |
| **`Current-State.md`** | **Trạng thái sống & Neo ký ức tức thời** | Coach Anh tự động cập nhật cuối phiên |
| **`Sessions/`** | **Nhật ký hội thoại & biên bản phiên làm việc** | Coach Anh tự động tạo theo template chuẩn |
| **`Journal/`** | **Nhật ký tâm sự nội tâm cá nhân & Shadow Work** | Bạn tự viết khi có cảm xúc dâng trào |
| **`Plan/`** | **Kế hoạch 3 năm, kế hoạch tháng, kế hoạch ngày** | Bạn & Coach Anh cùng hợp lực lên kế hoạch |
| **`Report/`** | **Kết quả thực tế cuối ngày & Scorecard** | Bạn & Coach Anh cùng tổng kết |
| **`Overview/`** | **Hồ sơ tâm lý, Sứ mệnh, Dashboard KPI vĩ mô** | Kim chỉ nam bất biến & Dashboard chiến lược |
| **`Startup-B2B-Software-Studio/`** | **Kế hoạch kinh doanh, Kiến trúc Core & Sales Playbook** | Bộ chỉ huy phát triển Studio phần mềm B2B |

---

## 🔑 5. THIẾT LẬP LẦN ĐẦU TRÊN MÁY TÍNH MỚI (SETUP GUIDE)

Nếu bạn vừa cài lại máy hoặc cấu hình trên một máy tính mới tinh:
```bash
# 1. Clone repository
git clone https://github.com/tibe2109/Personal-develop.git
cd Personal-develop

# 2. Lưu credential Git (chỉ cần làm 1 lần)
git config --global credential.helper store

# 3. Kích hoạt đồng bộ đầu phiên
# Trên Windows:
.\Scripts\sync.ps1 -Action session-start
# Trên Linux/Mac:
./Scripts/sync.sh session-start
```
*(Trên Windows, nếu gặp lỗi ExecutionPolicy, mở PowerShell Admin chạy: `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned`)*

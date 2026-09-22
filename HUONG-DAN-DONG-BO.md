# 🔄 CẨM NANG ĐỒNG BỘ ĐA MÁY TÍNH & DUY TRÌ KÝ ỨC LIÊN SESSION
### Đơn giản · Liền mạch · Làm việc với Coach Anh ở bất cứ đâu

> **🎯 Mục tiêu tối thượng:** Dù bạn đang dùng **Linux ở công ty**, **Windows ở nhà**, hay **Laptop cá nhân**, chỉ cần có bộ source này và thực hiện thói quen 2 lệnh đơn giản, **Coach Anh sẽ lập tức nhớ trọn vẹn mọi điều** (tâm sự trước đó, con ếch trong ngày, cảm xúc dở dang) mà không bao giờ bị đứt quãng tiến trình.

---

## ⚡ 1. CHỈ CẦN NHỚ THÓI QUEN 2 LỆNH (DAILY SYNC HABIT)

Mỗi ngày hoặc mỗi khi bạn chuyển đổi giữa các máy tính, chỉ cần nhớ:

```
           BẮT ĐẦU NGỒI VÀO MÁY                    RỜI KHỎI MÁY / XONG VIỆC
          ┌──────────────────────┐                 ┌───────────────────────┐
          │     1. SYNC PULL     │                 │      2. SYNC PUSH     │
          │ Kéo ký ức mới nhất về│                 │ Đẩy tiến trình lên Git│
          └──────────────────────┘                 └───────────────────────┘
```

### 💻 Trên Linux / macOS:
```bash
# Khi bắt đầu:
./Scripts/sync.sh pull

# Khi làm xong (hoặc vừa chat xong với Coach Anh):
./Scripts/sync.sh push "Nội dung ngắn gọn (tùy chọn)"

# Hoặc vừa kéo vừa đẩy tự động:
./Scripts/sync.sh
```

### 🪟 Trên Windows (PowerShell):
```powershell
# Khi bắt đầu:
.\Scripts\sync.ps1 -Action pull

# Khi làm xong:
.\Scripts\sync.ps1 -Action push -Message "Nội dung ngắn gọn (tùy chọn)"

# Hoặc vừa kéo vừa đẩy tự động:
.\Scripts\sync.ps1
```

---

## 🧠 2. CƠ CHẾ "KHÔNG BAO GIỜ MẤT TRÍ NHỚ" CỦA COACH ANH

Khi bạn bắt đầu một **phiên chat mới (session mới)** trên bất kỳ IDE hay công cụ AI nào:

```
         Bạn mở chat: "Chào anh" / "Bắt đầu ngày mới"
                             ↓
              AI tự động đọc Current-State.md
              + Session log gần nhất trong Sessions/
              + Kế hoạch hôm nay + Bộ tứ Overview/
                             ↓
         Coach Anh mở lời chào:
         - Nhắc lại đúng cuộc trò chuyện trước
         - Hỏi thăm đúng cảm xúc & việc đang dang dở
         - Kiểm tra Con Ếch A1 hôm nay
```

### 📝 Khi muốn lưu lại cuộc trò chuyện:
Bạn chỉ cần nhắn:
> *"Lưu phiên trò chuyện này lại giúp em"* hoặc *"Hôm nay thế thôi anh"*

Coach Anh sẽ tự động:
1. Đúc kết các quyết định và bài học quan trọng.
2. Tạo file log tại `Sessions/MM-YYYY/YYYY-MM-DD-Session-[STT]-[Chu-De].md`.
3. Cập nhật `Current-State.md` để lần sau mở máy khác lên là có ngay.
4. Nhắc bạn gõ lệnh `sync push`.

---

## 🛠️ 3. THIẾT LẬP LẦN ĐẦU TRÊN MÁY TÍNH MỚI (SETUP GUIDE)

Nếu bạn có một máy tính mới tinh (ví dụ vừa cài lại Win hoặc có laptop mới):

### Bước 1: Clone Repository về máy
```bash
git clone https://github.com/tibe2109/Personal-develop.git
cd Personal-develop
```

### Bước 2: Cấu hình Git Credential (để không phải gõ mật khẩu nhiều lần)
- **Nếu dùng SSH (Khuyên dùng):** Thêm SSH Key của máy vào GitHub Settings.
- **Nếu dùng HTTPS:** Dùng GitHub CLI (`gh auth login`) hoặc lưu Personal Access Token (PAT):
  ```bash
  git config --global credential.helper store
  ```

### Bước 3: Kiểm tra thử nghiệm
- Trên Linux/Mac: `./Scripts/sync.sh status`
- Trên Windows: `.\Scripts\sync.ps1 -Action status`
*(Nếu Windows báo lỗi Script Execution Policy, chạy 1 lần: `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned`)*

---

## 🗂️ 4. SƠ ĐỒ DỮ LIỆU ĐƯỢC ĐỒNG BỘ

Toàn bộ cuộc đời và tiến trình phát triển của bạn được gói gọn trong Git:

| Thư mục / File | Ý nghĩa | Ai cập nhật |
| :--- | :--- | :--- |
| **`Current-State.md`** | **Trạng thái sống & Neo ký ức tức thời** | Coach Anh tự động cập nhật cuối phiên |
| **`Sessions/`** | **Nhật ký hội thoại & biên bản làm việc với Coach Anh** | Coach Anh tự động tạo theo template |
| **`Journal/`** | **Nhật ký tâm sự nội tâm cá nhân & Shadow Work** | Bạn viết khi có cảm xúc dâng trào |
| **`Plan/`** | **Kế hoạch 3 năm, kế hoạch tháng, kế hoạch ngày** | Bạn & Coach Anh cùng lên kế hoạch |
| **`Report/`** | **Kết quả thực tế cuối ngày & 3 điều tốt** | Bạn điền vào cuối mỗi ngày |
| **`Overview/`** | **Hồ sơ tâm lý, Sứ mệnh, Dashboard KPI vĩ mô** | Kim chỉ nam bất biến & Dashboard |

---

## 🛡️ 5. CƠ CHẾ BẢO VỆ CHỐNG XUNG ĐỘT (MERGE CONFLICT SAFETY)

Script `sync.sh` và `sync.ps1` đã được lập trình sẵn các lớp bảo vệ:
1. **Auto-Stash Thông Minh:** Nếu bạn đang sửa dở một file mà quên chưa commit, khi chạy `pull`, script sẽ tự động cất file vào Git Stash, kéo code mới về rồi mới khôi phục lại, không bao giờ làm mất chữ nào của bạn.
2. **Thiết Kế Phân Tán Theo Ngày/Tháng:** Các file nhật ký và kế hoạch đều đặt tên theo ngày (`YYYY-MM-DD`), nên dù bạn viết nhật ký trên máy A và tạo kế hoạch trên máy B, hai file hoàn toàn độc lập, tỷ lệ đụng độ (conflict) gần như bằng 0.

### ❓ Nếu chẳng may xảy ra xung đột (Conflict)?
Đừng hoảng loạn! Hãy mở chat với Coach Anh và gõ:
> *"Anh ơi, Git báo có conflict khi pull, gỡ giúp em với"*

Coach Anh sẽ hướng dẫn hoặc tự động gỡ conflict ngay lập tức mà vẫn giữ nguyên 100% nội dung của bạn.

---

## 🤖 6. CƠ CHẾ TỰ ĐỘNG ĐỒNG BỘ NGẦM (AUTO-SYNC DAEMON 15-30 PHÚT)

Bạn không cần phải nhớ gõ lệnh thủ công mỗi lần nữa! Hệ thống đã được trang bị **Cơ chế Tự Động Đồng Bộ Ngầm (Auto-Sync Daemon)**:

### 🌟 Cách thức hoạt động:
1. **Tự động kiểm tra & kích hoạt khi chat:** Mỗi lần bạn mở phiên trò chuyện hoặc nhắn tin với Coach Anh, anh sẽ **tự động kiểm tra xem tiến trình Auto-Sync có đang chạy không**. Nếu chưa chạy, anh sẽ **tự động bật nó chạy ngầm** ngay lập tức.
2. **Chu kỳ quét 15–30 phút (Mặc định: 20 phút):**
   - Daemon âm thầm kiểm tra và kéo cập nhật mới từ remote về.
   - Kiểm tra xem bạn có thay đổi file nào không (`git status`).
   - **Chỉ khi có dữ liệu mới thay đổi:** Daemon mới tự động commit và đẩy lên GitHub!
   - **Nếu không có gì thay đổi:** Daemon nghỉ ngơi hoàn toàn, không tiêu tốn tài nguyên máy.

### 🔑 Bước chuẩn bị 1 lần duy nhất (Để Git tự push ngầm không hỏi mật khẩu):
Chạy lệnh này 1 lần trong terminal để Git lưu thông tin đăng nhập:
```bash
git config --global credential.helper store
```
Sau đó gõ `./Scripts/sync.sh push` một lần đầu tiên để nhập Username và Personal Access Token (PAT). Từ thời điểm đó trở đi, tiến trình ngầm sẽ tự đẩy dữ liệu lên GitHub 100% trơn tru!

### 🕹️ Lệnh điều khiển thủ công (Nếu bạn muốn tự bật/tắt):
- **Trên Linux & macOS:**
  ```bash
  ./Scripts/auto-sync.sh status      # Xem tiến trình đang chạy hay tắt
  ./Scripts/auto-sync.sh start 20    # Kích hoạt ngầm định kỳ 20 phút/lần
  ./Scripts/auto-sync.sh stop        # Dừng tiến trình ngầm
  ./Scripts/auto-sync.sh run-once    # Đồng bộ ngay lập tức 1 lần
  ```
- **Trên Windows (PowerShell):**
  ```powershell
  .\Scripts\auto-sync.ps1 -Action status
  .\Scripts\auto-sync.ps1 -Action start -IntervalMinutes 20
  .\Scripts\auto-sync.ps1 -Action stop
  .\Scripts\auto-sync.ps1 -Action run-once
  ```


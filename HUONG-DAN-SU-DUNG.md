# 🧭 HƯỚNG DẪN VẬN HÀNH — BỘ CÔNG CỤ PHÁT TRIỂN BẢN THÂN
### Đơn giản · Thực tế · Làm được ngay

> **🎯 Tính năng quan trọng nhất:** Khi bạn nhắn *"tạo kế hoạch ngày mai"*,
> AI sẽ **không lập tức tạo file** — mà sẽ đóng vai **Coach Anh**, phỏng vấn bạn
> về ngày hôm nay, giúp bạn rút ra bài học sâu sắc, rồi mới tạo kế hoạch
> cá nhân hóa dựa trên những gì bạn vừa chia sẻ.

---

## ❓ HỆ THỐNG CÓ TỰ THEO DÕI TASK CHƯA XONGKhông?

**Câu trả lời ngắn: Không tự động — nhưng AI sẽ làm điều đó cho bạn khi bạn yêu cầu.**

### Cơ chế hoạt động:

```
Bạn nhắn: "Tạo kế hoạch ngày mai"
          ↓
AI tự động đọc Report hôm nay
          ↓
Kiểm tra task nào [ ] chưa tick
          ↓
Carry-forward sang Plan ngày mai với [↩ CHUYỂN TIẾP] ở ưu tiên cao
          ↓
CHỈ khi bạn tick [x] trong Report = task mới được coi là xong
```

### Nguyên tắc cốt lõi:
> **Task chưa có Report = chưa xong = sẽ xuất hiện lại ngày mai.**
> Task chỉ được coi là "xong" khi bạn điền vào file Report và tick ✅.

### Chạy kiểm tra thủ công (tùy chọn):
```powershell
# Xem ngay task nào chưa xong từ Report hôm nay:
.\Scripts\Check-Incomplete-Tasks.ps1
```

---

## BỘ CÔNG CỤ CÓ GÌ? (Nhìn tổng quan 30 giây)

```
Person-develop/
├── Overview/        ← Hồ sơ & sứ mệnh của bạn — ĐỌC KHI CẦN NHẮC NHỞ BẢN THÂN
├── Plan/            ← Kế hoạch 3 năm + kế hoạch từng ngày
│   └── Daily/07-2026/    ← 📅 Kế hoạch ngày  [TẠO TỐI HÔM TRƯỚC]
├── Journal/07-2026/      ← 📓 Nhật ký cảm xúc [VIẾT KHI CÓ CẢM XÚC]
├── Report/07-2026/       ← 📊 Kết quả thực tế [ĐIỀN CUỐI NGÀY]
└── Scripts/              ← Script tự động hóa
    └── Check-Incomplete-Tasks.ps1
```

---

## VÒNG LẶP HÀNG NGÀY — 3 HÀNH ĐỘNG CHÍNH

```
         SÁNG (5 phút)          TRONG NGÀY           TỐI (15 phút)
         ┌─────────────┐        ┌──────────┐          ┌─────────────┐
         │ Đọc Plan    │──────► │ Làm theo │ ────────► │ Điền Report │
         │ ngày hôm nay│        │ kế hoạch │           │ + Viết 3    │
         └─────────────┘        └──────────┘           │ điều tốt   │
                                                        └─────────────┘
```

---

## CHI TIẾT TỪNG THỜI ĐIỂM

---

### 🌙 TỐI HÔM TRƯỚC — 21:00 (15 phút)
**Làm gì:** Tạo file kế hoạch cho ngày mai

**Bước 1:** Hỏi AI assistant:
> "Tạo kế hoạch ngày mai [Thứ ... ngày ...] cho tôi"

**Bước 2:** File được tạo tại:
`Plan/Daily/07-2026/YYYY-MM-DD-Plan-[Ten-Ngay]-Tuan-[So].md`

**Bước 3:** Đọc lại 1 lần, xác nhận A1 (Con ếch — việc quan trọng nhất)

**⏱ Thời gian thực tế:** 10–15 phút

---

### ☀️ ĐẦU NGÀY — Sáng (5 phút)
**Làm gì:** Kích hoạt não vào chế độ hành động

**Bước 1:** Mở file Plan của hôm nay
**Bước 2:** Đọc phần "CON ẾCH" — chỉ 1 đoạn ngắn
**Bước 3:** Tự hỏi: *"Tôi sẽ làm A1 lúc mấy giờ hôm nay?"*
**Bước 4:** Đặt điện thoại xuống. Bắt đầu.

**⏱ Thời gian thực tế:** 5 phút

---

### 💼 TRONG NGÀY — Làm theo kế hoạch
**Thứ tự ưu tiên:**
1. Làm **A1** trước (Con ếch) — không làm gì khác khi chưa xong
2. Làm **A2** khi A1 xong
3. Làm **B** khi A xong
4. Bỏ qua **E** (danh sách loại bỏ) — nhắc mình không làm những thứ này

**Khi bị phân tâm / muốn trốn tránh:**
→ Đọc lại "Thách thức dự kiến" trong file Plan — có hướng dẫn sẵn rồi
→ Kỹ thuật 5 giây: đếm 5-4-3-2-1 rồi làm ngay

---

### 🌆 CUỐI NGÀY — 20:50 (10 phút)
**Làm gì:** Điền kết quả vào file Report

**Bước 1:** Mở file:
`Report/07-2026/YYYY-MM-DD-Report-[Ten-Ngay]-Tuan-[So].md`

**Bước 2:** Tick checklist — đã làm gì, chưa làm gì

**Bước 3:** Viết 3 điều tốt hôm nay (BẮT BUỘC — Thói quen #1)
```
Hôm nay điều tốt xảy ra:
1. ___
2. ___
3. ___
```

**Bước 4:** Tự cho điểm 1-10

**⏱ Thời gian thực tế:** 10 phút

---

### 📓 NHẬT KÝ — Viết khi có cảm xúc (Không bắt buộc theo giờ)
**Khi nào viết:**
- Khi đang lo lắng, sợ hãi, buồn chán — viết ra để "tắt" cảm xúc
- Khi có insight / bài học quan trọng
- Khi cần cam kết lại với mục tiêu

**Cách viết:**
> Nhắn AI: "Lưu lại nhật ký của tôi: [nội dung...]"

**File được tạo tại:** `Journal/07-2026/YYYY-MM-DD-Journal-[Ten-Ngay].md`

---

## VÒNG LẶP CUỐI TUẦN — THỨ 6 HOẶC THỨ 7

### 📋 CUỐI TUẦN (30 phút) — Nhìn lại & Lên kế hoạch tuần mới

**Bước 1 — Review tuần vừa qua (15 phút):**
Mở file `Plan/09-Weekly-Review-Template.md` và điền:
- Tuần này đạt được gì?
- Thói quen #1 và #2 làm được mấy ngày / 7?
- Điều gì đang cản trở nhiều nhất?

**Bước 2 — Lên kế hoạch tuần tới (15 phút):**
Nhắn AI:
> "Tạo kế hoạch tuần [số] cho tôi — tuần từ [ngày] đến [ngày]"

**File Weekly Report lưu tại:** `Report/07-2026/Weekly/YYYY-W[So]-Weekly-Report.md`

---

## BẢNG TÓM TẮT — LÀM GÌ LÚC NÀO

| Thời điểm | Thời gian | Hành động | File sử dụng |
|-----------|-----------|-----------|-------------|
| **Tối hôm trước** (21:00) | 15 phút | Tạo Plan ngày mai | `Plan/Daily/07-2026/` |
| **Sáng** (thức dậy) | 5 phút | Đọc Plan, xác nhận A1 | `Plan/Daily/07-2026/` |
| **Trong ngày** | — | Làm theo thứ tự A→B→C | — |
| **Cuối ngày** (20:50) | 10 phút | Điền Report + 3 điều tốt | `Report/07-2026/` |
| **Khi có cảm xúc** | 5–10 phút | Viết Journal | `Journal/07-2026/` |
| **Cuối tuần** (Thứ 6/7) | 30 phút | Weekly Review + Plan tuần tới | `Plan/09-Weekly-Review-Template.md` |

---

## CHỈ CẦN NHỚ 3 SỐ NÀY

```
┌──────────────────────────────────────────────────┐
│   5 phút sáng  +  1 Con ếch  +  10 phút tối    │
│                                                   │
│   Làm đủ 3 cái này = Ngày thành công tối thiểu   │
└──────────────────────────────────────────────────┘
```

---

## NHỜ AI ASSISTANT LÀM GÌ?

Bạn có thể nhắn trực tiếp:

| Câu lệnh | Kết quả |
|---------|---------|
| `"Tạo kế hoạch ngày mai cho tôi"` | Tạo file Plan theo format chuẩn |
| `"Lưu lại nhật ký: [nội dung...]"` | Tạo file Journal |
| `"Tạo Report cho hôm nay"` | Tạo file Report template |
| `"Làm Weekly Review tuần này"` | Tạo báo cáo tuần |
| `"Tôi đang cảm thấy [cảm xúc]"` | AI phân tích và ghi Journal |

---

## KHI NÀO CẦN ĐỌC FILE TRONG Plan/ (Kế hoạch tổng thể)?

| File | Đọc khi nào |
|------|-------------|
| `00-Master-Plan-3-Nam.md` | Khi mất phương hướng, cần nhớ mình đang đi đâu |
| `07-Phat-trien-ban-than.md` | Khi bị trì hoãn nặng, cần chiến lược vượt qua |
| `08-Tinh-cam-Gia-dinh.md` | Khi lo lắng về mối quan hệ, cần định hướng |
| `09-Weekly-Review-Template.md` | Mỗi cuối tuần |

---

## QUY TẮC VÀNG — KHI MỌI THỨ CẢM THẤY QUÁ TẢI

> **Chỉ làm 1 việc:**
> Mở file Report tối nay → Viết 3 điều tốt → Xong.
>
> Đó là ngày thành công tối thiểu. Không cần gì thêm.

---

*Hệ thống này không cần bạn hoàn hảo. Nó chỉ cần bạn không bỏ 2 ngày liên tiếp.*
*Cập nhật lần cuối: 19/07/2026*

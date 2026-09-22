# 📂 THƯ MỤC SESSIONS — KHO LƯU TRỮ NHẬT KÝ PHIÊN COACHING

## 🎯 Mục Đích & Vai Trò
Thư mục `Sessions/` lưu trữ toàn bộ biên bản/nhật ký của từng phiên làm việc, trao đổi chiến lược và tâm sự giữa bạn (`tibe2109`) và **Coach Anh**.

Khác với `Journal/` (nơi bạn tự viết nhật ký nội tâm cá nhân) hay `Report/` (nơi báo cáo tiến độ KPI ngày/tuần), `Sessions/` là **bộ nhớ đối thoại 2 chiều** ghi lại:
1. Bạn đã chia sẻ những gì với Coach Anh.
2. Coach Anh và Hội đồng cố vấn đã phân tích và định hướng ra sao.
3. Các quyết định chiến lược đã chốt.
4. Con ếch và hành động vi mô đã cam kết thực hiện.

## 🗂️ Quy Ước Đặt Tên & Tổ Chức Thư Mục
Các phiên được tổ chức theo từng thư mục tháng: `Sessions/MM-YYYY/`
- Tên file: `YYYY-MM-DD-Session-[Số Thứ Tự]-[Tên-Chủ-Đề].md`
- Ví dụ:
  - `Sessions/09-2026/2026-09-22-Session-01-Khoi-Tao-He-Thong-Dong-Bo.md`
  - `Sessions/09-2026/2026-09-23-Session-02-Duy-Tri-Ky-Luat-FTI-AM.md`

## 🔄 Quy Trình Vận Hành
1. **Khởi tạo:** Khi phiên trò chuyện có nhiều thông điệp quan trọng hoặc khi bạn yêu cầu *"Lưu lại phiên trò chuyện này"*, Coach Anh sẽ tự động tạo file log theo `Sessions/Template/_TEMPLATE-Session-Log.md`.
2. **Cập nhật State:** Nội dung cốt lõi của Session sẽ được tóm tắt đưa vào `Current-State.md` làm neo ngữ cảnh cho phiên sau.
3. **Đồng bộ:** Chạy script `./Scripts/sync.sh push` (hoặc `.\Scripts\sync.ps1 -Action push`) để đưa ký ức này lên GitHub, sẵn sàng cho các máy tính khác tải về.

# 📑 BỘ TÀI LIỆU TOÀN DIỆN: SEMINAR PLAYWRIGHT x A.I. AGENTS — KIỂM THỬ TỰ ĐỘNG KHÔNG CẦN BIẾT CODE
**Nơi lưu trữ:** `D:\Solution\Person-develop\Plan\Playwright-Slide`  
**Ngày sự kiện:** Thứ Sáu, ngày 24/07/2026  
**Triết lý cốt lõi:** *Tập trung tối đa vào LỢI ÍCH của Playwright và CÁCH PROMPTING với các IDE tích hợp A.I. (VS Code, Google Antigravity, Claude Code, Gemini, ChatGPT) để AI tự đọc Knowledge Base, nghiệp vụ, source code và tự động săn tìm ít nhất 5 - 10 lỗi nghiêm trọng mỗi phiên cho đến khi hệ thống sạch bóng lỗi trước khi giao QC.*

---

## 💡 BƯỚC CHUYỂN MÌNH CHIẾN LƯỢC: TỪ KỸ THUẬT PHỨC TẠP SANG "A.I. AUTONOMOUS QA LOOP"

Bộ slide này **lược bỏ hoàn toàn các kiến thức kỹ thuật hàn lâm phức tạp** (như giao thức CDP tầng thấp, kiến trúc đa tiến trình rắc rối) để tập trung 100% vào giá trị thực chiến:
> **"Bạn không cần phải là chuyên gia viết code Automation! Chỉ cần hiểu Lợi ích của Playwright và nắm bộ 6 Prompts Chuẩn Mẫu trong các IDE A.I. (Antigravity, VS Code Copilot, Claude Code, Gemini), A.I. sẽ tự làm toàn bộ quy trình: từ tự cấu hình, tự đọc tài liệu nghiệp vụ, tự viết test, tự săn 5-10 lỗi mỗi phiên, xuất báo cáo cho Dev fix, và tự recheck cho đến khi không còn bug!"**

### 🌟 Những Lợi Ích Vượt Trội Của Playwright (Tại Sao Ai Cũng Mê?):
1. **Tự động chờ (Auto-waiting thần thánh):** Không bao giờ phải canh thời gian mạng load hay gõ `sleep()`. Playwright tự biết khi nào giao diện, nút bấm, animation đã sẵn sàng để thao tác.
2. **Ghi hình thao tác chuột (Codegen):** Bật trình duyệt, click chuột và điền form -> Tự động sinh ra kịch bản test chuẩn xác.
3. **Hộp Đen Máy Bay (Trace Viewer & UI Mode):** Chụp lại toàn bộ hình ảnh giao diện thực tế theo từng mili-giây. Khi có lỗi, bạn kéo thanh timeline xem bằng mắt thường là thấy rõ ràng nguyên nhân, không cần đọc log code!
4. **Giả lập lỗi mạng (Network Mocking):** Tự động chặn API và giả lập lỗi server 500 để kiểm tra xem giao diện có bị đơ/crash hay hiển thị thông báo lịch sự cho người dùng.

---

## 🚀 BỘ 6 PROMPTS THỰC CHIẾN TỪ A -> Z TRONG CÁC IDE A.I. (ANTIGRAVITY / VS CODE / CLAUDE / GEMINI)

Bộ tài liệu hướng dẫn chi tiết 6 giai đoạn Prompting để bạn điều khiển AI như một đội ngũ QA tự động:

| Giai Đoạn Prompting | Mục Tiêu & Kịch Bản Làm Việc | Đóng Góp Vào Chất Lượng Dự Án |
| :--- | :--- | :--- |
| **Prompt 1: Cấu hình & Cài đặt** | Ra lệnh cho AI tự cài đặt Playwright chuẩn mực vào dự án, cấu hình multi-browser, base URL và môi trường test. | Setup tự động trong 60 giây, không lỗi cấu hình môi trường. |
| **Prompt 2: Tự Đọc Knowledge Base & Source Code** | Cho AI tự quét toàn bộ tài liệu nghiệp vụ (PRD, Jira, Confluence), Knowledge Base và Source code để lập Kế hoạch Kiểm thử (Test Plan). | Hiểu sâu 100% nghiệp vụ và kiến trúc, không bỏ sót bất kỳ luồng tính năng nào. |
| **Prompt 3: Tự Sinh Test Cases Toàn Diện** | AI tự động viết test suite bao phủ Happy Path, Edge Cases, phân quyền RBAC và kiểm tra tính chính xác giao diện/nghiệp vụ. | Viết test nhanh gấp 10 lần, đảm bảo code sinh ra đúng chuẩn W3C Accessibility. |
| **Prompt 4: Vòng Lặp Săn Lỗi "Hunting Loop" (5-10 Bugs)** | Ra lệnh cho AI liên tục chạy test, giả lập edge cases, stress UI cho đến khi **bắt được ít nhất 5 - 10 lỗi nghiêm trọng/lỗi sai nghiệp vụ mỗi phiên**. | Chốt chặn thép! Không chịu dừng lại cho đến khi phơi bày mọi bug ẩn giấu sâu nhất. |
| **Prompt 5: Xuất Báo Cáo Chi Tiết Cho Dev Handover** | AI tự đọc file `trace.zip`, phân tích DOM/Network và xuất Báo Cáo Lỗi (Bug Report) chi tiết kèm hình ảnh, bước tái hiện và gợi ý fix cho Dev. | Giao tiếp mạch lạc Dev - QA, Dev nhìn báo cáo là biết fix ngay trong 5 phút. |
| **Prompt 6: Tự Động Recheck & Regression Loop** | Sau khi Dev báo đã fix bug, ra lệnh cho AI tự động chạy recheck lỗi cũ và regression toàn hệ thống **cho đến khi sạch bóng lỗi thì thôi**. | Đảm bảo lỗi đã fix không bao giờ tái phát (Zero Regression), tự tin release 100%. |

---

## 📂 DANH SÁCH TÀI LIỆU TRONG GÓI NÀY

| Tên file | Mô tả nội dung | Cách sử dụng |
| :--- | :--- | :--- |
| **`01-Master-Script-Slide-Seminar-Playwright.md`** | Kịch bản chi tiết 22 Slides (Tập trung lợi ích, bỏ kỹ thuật sâu, hướng dẫn quy trình AI Autonomous QA Loop và trọn bộ 6 Prompts mẫu từ A-Z). | Mở file này ra xem như sườn chính để trình chiếu và dẫn dắt buổi Seminar. |
| **`02-Lo-Trinh-Demo-FTI-AM-Playwright.md`** | Lộ trình Live Demo 15 phút trình diễn 4 bước thực chiến trên FTI-AM với IDE Antigravity / Claude Code (Tự đọc KB -> Săn 5-10 lỗi -> Xuất Report cho Dev -> Recheck tới khi sạch lỗi). | Thực hành theo lộ trình này trong IDE trước ngày diễn để trình diễn live thật mượt. |
| **`03-Kich-Ban-Kahoot-Game-On-Tap.md`** | Bộ 12 câu hỏi trắc nghiệm gay cấn kèm đáp án và lời thoại MC xoay quanh Lợi ích Playwright, quy trình Prompting AI và tư duy kiểm thử tự động cho mọi người. | Tạo game trên `kahoot.com` theo danh sách này để khuấy động không khí cuối Seminar. |

---

## 🗓️ LỘ TRÌNH CHUẨN BỊ 4 NGÀY (TỪ 20/07 ĐẾN 24/07)

```
[ CHỦ NHẬT 20/07 ] ──► Đọc lướt file `01-Master-Script-Slide...` để thấm nhuần tư duy AI Autonomous QA & 6 Prompts (30p).
[ THỨ HAI 21/07 ]  ──► Mở Canva hoặc PowerPoint, copy/paste layout từ Slide 01 đến Slide 12 (45p).
[ THỨ BA 22/07 ]   ──► Hoàn thiện Slide 13 đến 22 + Mở IDE Antigravity/VS Code setup sẵn các Prompts ở file `02-Lo-Trinh-Demo...` (60p).
[ THỨ TƯ 23/07 ]   ──► Chạy thử (Dry-run) bấm giờ toàn bộ 35p thuyết trình + 15p Demo dưới local (45p).
[ THỨ NĂM 24/07 ]  ──► Thư giãn, tạo bộ câu hỏi trên `kahoot.com` từ file `03-Kich-Ban-Kahoot...` (20p).
[ THỨ SÁU 24/07 ]  ──► 🚀 TỎA SÁNG TRÊN SÂN KHẤU SEMINAR!
```

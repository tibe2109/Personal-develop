# 🎤 KỊCH BẢN THUYẾT TRÌNH CHI TIẾT (MASTER SCRIPT): SEMINAR PLAYWRIGHT x A.I. AGENTS
**Chủ đề:** Dân Chủ Hóa Kiểm Thử Tự Động — Ứng Dụng Playwright & A.I. Prompting Thực Chiến Cho Mọi Vai Trò (BA, PM, Dev, QC)  
**Thời lượng:** 35 Phút Thuyết Trình + 15 Phút Demo Thực Chiến + 10 Phút Kahoot Game & Q&A  
**Nguyên tắc cốt lõi:** *Bỏ qua kỹ thuật hàn lâm rắc rối — Tập trung 100% vào Lợi ích thực tế, Sức mạnh của Playwright, và Quy trình 6 Prompts thần thánh trong các IDE A.I. (VS Code Copilot, Google Antigravity, Claude Code, Gemini) để AI tự đọc Knowledge Base, tự viết test, tự săn 5-10 lỗi nghiêm trọng mỗi phiên, xuất báo cáo cho Dev và tự recheck đến khi sạch bóng lỗi.*

---

## 🧭 CẤU TRÚC 22 SLIDE CHI TIẾT

```
[ PHẦN 1: THỰC TRẠNG & NỖI ĐAU ] ─── Slide 01 -> 04 (8 phút)
[ PHẦN 2: LỢI ÍCH & SỨC MẠNH PLAYWRIGHT ] ─── Slide 05 -> 10 (10 phút)
[ PHẦN 3: KỶ NGUYÊN A.I. AUTONOMOUS QA & 6 PROMPTS THỰC CHIẾN ] ─── Slide 11 -> 18 (12 phút)
[ PHẦN 4: SHIFT-LEFT QUALITY & TỔNG KẾT ] ─── Slide 19 -> 22 (5 phút)
```

---

# PHẦN 1: THỰC TRẠNG & NỖI ĐAU CỦA QUY TRÌNH KIỂM THỬ TRUYỀN THỐNG (Slide 01 -> 04)

## SLIDE 01: TITLE SLIDE (MỞ ĐẦU)
* **Tiêu đề lớn (H1):** DÂN CHỦ HÓA KIỂM THỬ TỰ ĐỘNG CÙNG PLAYWRIGHT & A.I. AGENTS
* **Tiêu đề phụ (H2):** Khi A.I. Tự Đọc Knowledge Base, Săn Lỗi Và Bảo Vệ 100% Chất Lượng Nghiệp Vụ Dự Án FTI-AM
* **Người trình bày:** [Tên của bạn] — Project Manager / Technical Leader
* **Hình ảnh gợi ý:** Hình ảnh một BA/PM thảnh thơi nhấp trà, bên cạnh là màn hình IDE (Google Antigravity / VS Code) với AI Agent đang tự động chạy kiểm thử giao diện ứng dụng với tốc độ ánh sáng.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Xin chào tất cả các anh chị lãnh đạo, các bạn BA, PM, Dev và QC thân mến đang có mặt trong buổi Seminar ngày hôm nay!
> 
> Có bao giờ các bạn tự hỏi: Tại sao mỗi lần chuẩn bị release một tính năng mới, cả phòng chúng ta lại căng thẳng đến nghẹt thở? Tại sao BA viết yêu cầu rất rõ ràng, Dev code rất nhiệt tình, nhưng đến khi giao sang cho QC test thì lại lòi ra hàng loạt lỗi nghiêm trọng — từ lỗi crash 500 cho đến những lỗi sai lệch nghiệp vụ cơ bản? Và đau đớn nhất là mỗi lần Dev sửa xong lỗi A thì lại hỏng sang tính năng B?
> 
> Hôm nay, tôi không đứng ở đây để giới thiệu với các bạn một công cụ kỹ thuật hàn lâm phức tạp chỉ dành cho lập trình viên. Tôi ở đây để chia sẻ một **quy trình đột phá**: Sự kết hợp hoàn hảo giữa công nghệ kiểm thử tự động **Playwright** và **A.I. Agents** ngay trong các IDE hiện đại như Google Antigravity, VS Code hay Claude Code. Với quy trình này, **bất kỳ ai trong chúng ta — dù không hề biết code — cũng có thể cho A.I. tự đọc tài liệu nghiệp vụ, tự viết test, và tự động săn tìm ít nhất 5 đến 10 lỗi nghiêm trọng mỗi phiên cho đến khi hệ thống sạch bóng bug trước khi bàn giao cho QC!**"*

---

## SLIDE 02: NỖI ĐAU CỦA QUY TRÌNH "THỦ CÔNG & PHÁT HIỆN LỖI MUỘN"
* **Tiêu đề:** TẠI SAO CHÚNG TA LUÔN BỊ CHẬM TIẾN ĐỘ & TRÀN NGẬP BUG?
* **Nội dung chính:**
  * **Late Defect Discovery (Phát hiện lỗi quá muộn):** Lỗi phát hiện ở khâu QC/Staging tốn thời gian và chi phí sửa gấp **10 lần** so với phát hiện ngay lúc Dev vừa code xong.
  * **Regression Test "Hành xác":** Mỗi lần thêm tính năng mới, QC phải bấm chuột test tay lại toàn bộ tính năng cũ hàng trăm lần -> Kiệt sức, dễ bỏ sót lỗi.
  * **Bức tường ngăn cách giữa BA - Dev - QC:** BA hiểu nghiệp vụ nhưng không biết viết code test automation; Dev biết code nhưng lười viết test giao diện; QC muốn làm automation nhưng thiếu tài nguyên và áp lực deadline.
* **Hình ảnh gợi ý:** Biểu đồ đường cong chi phí sửa lỗi (Bug Cost Curve): Lỗi phát hiện ở Dev (1x) -> QC (10x) -> Production (100x kèm mất uy tín với khách hàng).

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Hãy cùng nhìn thẳng vào thực tế dự án FTI-AM của chúng ta hiện tại. Chúng ta đang gặp phải 3 nút thắt chí mạng:
> Thứ nhất là bệnh 'phát hiện lỗi muộn'. Khi Dev code xong một API hay một màn hình giao diện, không ai kiểm chứng tự động toàn diện ngay lập tức. Đợi đến 3 ngày sau QC mới vào test thì ứng dụng crash đơ màn hình. Lúc này Dev phải mở lại code cũ ra nhớ lại logic, tốn gấp 10 lần thời gian sửa!
> Thứ hai là nỗi ám ảnh mang tên 'Regression Test' — kiểm thử hồi quy. Ngân hàng tài sản của FTI-AM có hàng trăm luồng: từ Cấp phát, Thu hồi, Điều chuyển đến Khảo sát. Mỗi lần release, nếu QC phải bấm chuột điền form test tay lại từ đầu thì không một con người nào có đủ sức khỏe và sự kiên nhẫn để làm mãi mà không nhầm lẫn.
> Và thứ ba là bức tường kỹ thuật: BA nắm giữ linh hồn nghiệp vụ nhưng không thể tự chạy automation vì ngại viết code; Dev thì sợ viết test E2E vì nghĩ nó phức tạp. Chúng ta cần một cầu nối để phá vỡ bức tường này!"*

---

## SLIDE 03: TẠI SAO CÁC CÔNG CỤ AUTOMATION CŨ (SELENIUM) LẠI THẤT BẠI?
* **Tiêu đề:** NỖI ÁM ẢNH MANG TÊN "FLAKY TESTS" CỦA CÔNG NGHỆ CŨ
* **Nội dung chính:**
  * **Flaky Tests (Lúc Pass lúc Fail ngẫu nhiên):** Các công cụ cũ như Selenium rất chậm, hay bị lỗi nghẽn mạng hoặc đơ UI. Test chạy 10 lần thì 3 lần báo lỗi giả dù hệ thống bình thường -> Mất niềm tin.
  * **Phải viết hàm `sleep()` thủ công:** Người test phải tự đoán xem mạng load mất bao lâu (`sleep(5000)`), làm tổng thời gian chạy kịch bản dài lê thê hàng tiếng đồng hồ.
  * **Khó cài đặt, bảo trì cực khổ:** Mỗi lần trình duyệt cập nhật phiên bản là kịch bản test cũ hỏng hết, phải sửa code liên tục.
* **Hình ảnh gợi ý:** Một cái cân bị lệch bên trái là "Selenium chậm chạp, hay báo fail ảo", bên phải là sự mệt mỏi của kỹ sư automation bị ngợp vì sửa script.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Nhiều bạn QC sẽ nói với tôi: 'Anh ơi, ngày xưa dự án mình cũng thử làm Automation với Selenium rồi nhưng thất bại, kịch bản cứ lúc pass lúc fail rắc rối lắm!'. 
> Đúng! Đó là nỗi đau chung của ngành phần mềm 10 năm trước. Công nghệ cũ gặp phải căn bệnh gọi là 'Flaky Test' — tức là kịch bản cực kỳ nhạy cảm với tốc độ mạng. Chỉ cần server hơi chậm nửa giây, nút bấm chưa kịp hiện ra là tool cũ báo lỗi Fail ngay lập tức! Để lách luật, người ta phải nhét hàng loạt câu lệnh 'chờ ngốc nghếch' như `sleep 5 giây`, `sleep 10 giây`. Kết quả là bộ test chạy mất 2 tiếng đồng hồ, và mỗi lần giao diện đổi một xíu màu sắc hay ID là bộ test vỡ vụn. Chúng ta cần một nền tảng thông minh hơn!"*

---

## SLIDE 04: GIẢI PHÁP ĐỘT PHÁ — PLAYWRIGHT x A.I. AGENTS
* **Tiêu đề:** KỶ NGUYÊN KIỂM THỬ THÔNG MINH — KHÔNG CẦN CODE, AI CŨNG LÀ CHUYÊN GIA
* **Nội dung chính:**
  * **Playwright (Microsoft):** Công cụ kiểm thử tự động số 1 thế giới hiện nay — SIÊU NHANH, SIÊU ỔN ĐỊNH, và THÔNG MINH vượt trội.
  * **Sự kết hợp hoàn hảo với A.I. IDEs:** Khi Playwright kết hợp với các IDE A.I. (Google Antigravity, VS Code Copilot, Claude Code, Gemini), chúng ta tạo ra một cỗ máy tự trị: A.I. tự hiểu nghiệp vụ, tự điều khiển Playwright để kiểm thử và báo cáo bug.
  * **Democratized Automation (Dân chủ hóa kiểm thử):** BA, PM, Manual QC giờ đây sở hữu quyền năng tự test tự động mà không cần phải học khóa lập trình phức tạp nào!
* **Hình ảnh gợi ý:** Logo Playwright và Logo của các A.I. Models (Gemini, Claude, GPT-4) kết hợp tỏa sáng, bên dưới là 4 nhân vật (BA, PM, Dev, QC) cùng nắm tay cười tươi.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Và giải pháp tối thượng cho chúng ta đã xuất hiện, được bảo trợ bởi gã khổng lồ Microsoft: **Playwright**!
> Playwright được sinh ra để khắc phục 100% nhược điểm của công nghệ cũ. Nhưng điều tuyệt vời nhất không dừng lại ở công cụ Playwright đơn thuần. Khi chúng ta đưa Playwright vào bên trong các IDE tích hợp Trí tuệ nhân tạo thế hệ mới như Google Antigravity, VS Code hay Claude Code, một phép màu sẽ xảy ra:
> A.I. sẽ đóng vai trò như một kỹ sư Automation 10 năm kinh nghiệm. Bạn chỉ cần đưa tài liệu Yêu cầu nghiệp vụ (PRD) cho A.I., A.I. sẽ tự đọc hiểu, tự tạo kịch bản Playwright, tự mở trình duyệt lên chạy thao tác, tự động bắt lỗi và báo cáo cho chúng ta. Đây không còn là công việc riêng của kỹ sư lập trình nữa, đây là quyền năng trong tay tất cả BA, PM, Dev và QC!"*

---

# PHẦN 2: LỢI ÍCH & SỨC MẠNH VƯỢT TRỘI CỦA PLAYWRIGHT (Slide 05 -> 10)

## SLIDE 05: LỢI ÍCH SỐ 1 — TỰ ĐỘNG CHỜ THÔNG MINH (AUTO-WAITING)
* **Tiêu đề:** KHÔNG BAO GIỜ CẦN `SLEEP` — PLAYWRIGHT TỰ BIẾT KHI NÀO APP SẴN SÀNG
* **Nội dung chính:**
  * **Auto-waiting Mechanism:** Trước khi click hay điền vào bất kỳ ô nào, Playwright tự động kiểm tra 4 điều kiện "Actionability Checks":
    1. Thành phần giao diện đã tồn tại trong trang chưa? (Attached)
    2. Nút bấm có đang hiển thị rõ ràng không? (Visible)
    3. Animation/Hiệu ứng chuyển động đã dừng hẳn chưa? (Stable)
    4. Nút bấm có bị một popup hay loading spinner nào che khuất không? (Not Obscured)
  * **Lợi ích thực tế:** Loại bỏ hoàn toàn lỗi "lúc pass lúc fail ảo" (Flaky tests). Kịch bản chạy nhanh với tốc độ tối đa của hệ thống!
* **Hình ảnh gợi ý:** Bảng so sánh 4 bước kiểm tra tự động của Playwright với hình ảnh một robot đang kiên nhẫn quan sát nút bấm sáng lên mới click.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Hãy cùng khám phá vì sao Playwright lại thông minh đến kỳ lạ. Lợi ích đầu tiên chính là cơ chế **Tự Động Chờ (Auto-waiting)**.
> Khi bạn bảo Playwright click vào nút 'Duyệt yêu cầu tài sản', Playwright sẽ không lao vào click bừa bãi như người mù. Nó tự động thực hiện 4 bước kiểm tra siêu nhanh: Nó nhìn xem nút đó đã xuất hiện chưa? Nút có bị ẩn không? Hiệu ứng animation bay bay của màn hình đã dừng hẳn chưa? Và đặc biệt là nút đó có đang bị cái vòng xoay loading hay popup nào che khuất không?
> Chỉ khi cả 4 điều kiện này xanh mượt, Playwright mới thực hiện thao tác click. Chính nhờ sự thông minh này mà chúng ta không bao giờ phải viết câu lệnh chờ `sleep` tốn thời gian nữa, và hiện tượng lỗi ảo flaky test bị tiêu diệt hoàn toàn!"*

---

## SLIDE 06: LỢI ÍCH SỐ 2 — GHI HÌNH THAO TÁC ZERO-CODE (CODEGEN)
* **Tiêu đề:** BIẾN THAO TÁC CHUỘT HÀNG NGÀY THÀNH KỊCH BẢN TỰ ĐỘNG TRONG 10 GIÂY
* **Nội dung chính:**
  * **Lệnh thần thánh `npx playwright codegen <URL>`:** Mở trình duyệt lên, bạn click chuột ở đâu, gõ chữ gì, chọn dropdown nào -> Playwright tự động viết ra đoạn code chuẩn chỉnh bên cạnh.
  * **Semantic & Accessibility Locators:** Code sinh ra không dùng các ID rắc rối dễ hỏng, mà dùng chuẩn định vị ngữ nghĩa W3C (ví dụ: `getByRole('button', { name: 'Đăng nhập' })`, `getByLabel('Tên tài sản')`).
  * **Lợi ích thực tế:** BA, PM hay Manual QC có thể tự record lại toàn bộ luồng nghiệp vụ phức tạp của FTI-AM chỉ bằng thao tác chuột thông thường!
* **Hình ảnh gợi ý:** Ảnh chụp màn hình chia đôi: Bên trái là trình duyệt FTI-AM đang được click, bên phải là cửa sổ Playwright Inspector tự động nhảy từng dòng code ngữ nghĩa rõ ràng.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Lợi ích thứ hai là món quà tuyệt vời nhất dành cho các bạn không biết code: Tính năng **Ghi hình thao tác chuột (Codegen)**.
> Bạn chỉ cần gõ đúng một lệnh trên máy tính: `npx playwright codegen` và gõ trang web FTI-AM vào. Ngay lập tức, trình duyệt bật lên. Bạn hãy thao tác như một người dùng bình thường: gõ tài khoản, click đăng nhập, chọn danh mục tài sản, bấm gửi yêu cầu.
> Điều kỳ diệu xảy ra ở cửa sổ bên cạnh: Playwright tự động theo dõi từng cú click chuột và sinh ra kịch bản test cực kỳ sạch sẽ. Và đặc biệt, nó bắt trúng phễu ngữ nghĩa của giao diện: ví dụ `getByRole button Đăng nhập`. Cách định vị này cực kỳ bền vững, dù Dev có đổi cấu trúc code HTML bên trong thì kịch bản test của bạn vẫn chạy phăm phăm!"*

---

## SLIDE 07: LỢI ÍCH SỐ 3 — HỘP ĐEN MÁY BAY (TRACE VIEWER & UI STUDIO)
* **Tiêu đề:** DU HÀNH THỜI GIAN DEBUG BẰNG HÌNH ẢNH — KHÔNG CẦN ĐỌC LOG CODE
* **Nội dung chính:**
  * **Playwright UI Studio (`test --ui`):** Giao diện đồ họa trực quan giúp chạy test, dừng ở bất kỳ bước nào, xem ngay lập tức DOM thực tế.
  * **Trace Viewer (Hộp đen máy bay):** Đóng gói toàn bộ quá trình chạy test vào 1 file `.zip` (chứa hình ảnh DOM snapshot, Network requests, Console logs theo từng mili-giây).
  * **Time-Travel Debugging:** Bạn có thể kéo thanh timeline lùi về quá khứ hoặc tiến tới tương lai để nhìn bằng mắt thường xem tại sao nút bấm đó bị lỗi, app bị crash ở giây thứ mấy.
* **Hình ảnh gợi ý:** Giao diện Playwright Trace Viewer hiển thị thanh timeline thời gian ở trên, hình ảnh DOM snapshot ở giữa và danh sách network bên phải.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Lợi ích thứ ba chính là tính năng mà tôi gọi là 'Hộp Đen Máy Bay' — **Playwright Trace Viewer**.
> Ngày xưa, khi test chạy fail, hệ thống ném ra một đống chữ log tiếng Anh rắc rối, QC đọc không hiểu, gửi cho Dev thì Dev bảo: 'Ủa máy anh chạy bình thường mà!'.
> Với Playwright Trace Viewer, mọi câu chuyện tranh cãi chấm dứt! Khi test chạy, Playwright chụp lại hình ảnh sống động của ứng dụng (DOM Snapshot) ở từng mili-giây cùng toàn bộ lịch sử gọi API network. Bạn mở Trace Viewer lên, chỉ cần nắm chuột trượt thanh timeline về quá khứ là nhìn thấy rõ ràng bằng mắt thường: lúc giây thứ 3 trang web hoàn toàn bình thường, đến giây thứ 4 khi bấm nút Lưu thì Backend trả về lỗi 500 đỏ rực làm màn hình bị đơ. Gửi đúng file `.zip` này cho Dev là Dev tâm phục khẩu phục và sửa ngay lập tức!"*

---

## SLIDE 08: LỢI ÍCH SỐ 4 — GIẢ LẬP MẠNG & CHẶN LỖI (NETWORK INTERCEPTION)
* **Tiêu đề:** KIỂM THỬ SỨC CHỊU ĐỰNG CỦA GIAO DIỆN MÀ KHÔNG CẦN TẮT BACKEND
* **Nội dung chính:**
  * **`page.route()` Mocking:** Playwright cho phép bạn can thiệp vào dòng chảy dữ liệu giữa Trình duyệt và Máy chủ Backend.
  * **Giả lập tình huống khắc nghiệt:** Bạn có thể ra lệnh: *“Khi gọi API `/api/v1/assets`, hãy giả vờ trả về lỗi `500 Server Error` hoặc `403 Unauthorized` hoặc trả về danh sách rỗng 0 tài sản”*.
  * **Lợi ích thực tế:** Kiểm tra xem Frontend FTI-AM có bị trắng trang (crash UI) khi Backend sập hay không, và có hiển thị thông báo lỗi thân thiện cho người dùng không.
* **Hình ảnh gợi ý:** Sơ đồ dòng chảy bị chặn giữa Browser và Server: Playwright đứng ở giữa chặn API và gửi về cục dữ liệu giả `500 Error` để kiểm tra độ kiên cường của Frontend.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Lợi ích thứ tư là một quyền năng mà các QC thủ công rất khó làm được: **Giả lập dữ liệu và chặn lỗi mạng (Network Interception & Mocking)**.
> Giả sử chúng ta muốn kiểm tra xem: Nếu máy chủ Backend của FTI-AM đột ngột bị sập hoặc trả về lỗi `500 Server Error`, thì màn hình Frontend có bị nổ tung hay trắng xóa hay không? Hay nó sẽ hiện thông báo lịch sự: 'Hệ thống đang bảo trì, vui lòng quay lại sau'?
> Nếu test tay, bạn phải gọi Dev tắt máy chủ đi rất phiền phức. Nhưng với Playwright, chỉ cần 1 câu lệnh chặn đường bay, Playwright sẽ đứng ở giữa giả vờ trả về lỗi 500 cho Frontend. Nhờ đó, chúng ta kiểm thử được mọi kịch bản lỗi khắc nghiệt nhất một cách cực kỳ an toàn và chủ động!"*

---

## SLIDE 09: LỢI ÍCH SỐ 5 — ĐA TRÌNH DUYỆT & ĐA VAI TRÒ TRONG 1 NHỊP THỞ
* **Tiêu đề:** TEST ĐỒNG THỜI CROSS-BROWSER VÀ LUỒNG PHÂN QUYỀN RBAC PHỨC TẠP
* **Nội dung chính:**
  * **Cross-browser 100%:** Chỉ với 1 kịch bản test, Playwright tự động chạy đồng thời trên cả 3 engine trình duyệt lớn nhất: Chromium (Chrome/Edge), WebKit (Safari), Firefox.
  * **Browser Contexts (Đa vai trò độc lập):** Playwright có thể mở cùng lúc 2 hoặc 3 cửa sổ ẩn danh độc lập hoàn toàn về session/cookie trong cùng 1 test case.
  * **Lợi ích thực tế cho FTI-AM:** Kiểm thử luồng tương tác thực tế: Cửa sổ 1 (Nhân viên tạo yêu cầu tài sản) -> Cửa sổ 2 (Quản lý nhận thông báo realtime và bấm Duyệt) -> Cửa sổ 1 lập tức đổi trạng thái sang "Đã duyệt"!
* **Hình ảnh gợi ý:** Hình ảnh 2 cửa sổ trình duyệt đặt cạnh nhau: Bên trái là User "Nhân viên" đang nhấn nút Gửi, bên phải là User "Quản lý" lập tức thấy số thông báo nhảy lên và bấm Duyệt.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Lợi ích thứ năm sẽ làm cho các bạn BA và PM cực kỳ thích thú: Khả năng **Kiểm thử Đa vai trò (Multi-role Browser Contexts)**.
> Trong dự án FTI-AM của chúng ta, luồng nghiệp vụ quan trọng nhất là Phân quyền phê duyệt: Nhân viên làm đơn -> Quản lý vào duyệt -> Kế toán xuất tài sản.
> Nếu test thủ công, bạn phải liên tục đăng xuất ra rồi đăng nhập lại bằng tài khoản khác, rất mỏi tay và dễ lẫn lộn. Playwright cho phép bạn mở song song 2, thậm chí 3 cửa sổ trình duyệt hoàn toàn độc lập ngay trong một lần chạy! Cửa sổ A là Nhân viên vừa bấm nút 'Tạo đơn', bạn nhìn sang cửa sổ B là Trưởng phòng lập tức thấy thông báo hiện lên và bấm 'Duyệt'. Toàn bộ chuỗi tương tác phối hợp giữa các vai trò được test tự động trơn tru trong 5 giây!"*

---

## SLIDE 10: TỔNG KẾT LỢI ÍCH PLAYWRIGHT
* **Tiêu đề:** VÌ SAO PLAYWRIGHT LÀ NỀN TẢNG KIỂM THỬ SỐ 1 CHO NGƯỜI KHÔNG BIẾT CODE?
* **Nội dung chính:**
  * **Nhanh gọn:** Không chờ đợi lãng phí, tự động hóa tối đa tốc độ.
  * **Ổn định:** Định vị ngữ nghĩa, chống Flaky test tuyệt đối.
  * **Trực quan:** Debug bằng hình ảnh Trace Viewer, ai nhìn cũng hiểu.
  * **Toàn diện:** Bao phủ từ UI, Network Mocking đến Phân quyền đa vai trò.
* **Hình ảnh gợi ý:** Bảng tổng hợp 4 trụ cột Lợi ích của Playwright với các icon checkmark xanh mượt rực rỡ.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Tóm lại, Playwright không chỉ là một công cụ viết script, mà là một **hệ sinh thái bảo chứng chất lượng toàn diện**. Nó nhanh gấp mười lần công nghệ cũ, ổn định vững như bàn thạch, trực quan đến mức người không biết code nhìn hình ảnh timeline là hiểu lỗi, và đủ mạnh mẽ để test những luồng nghiệp vụ phức tạp nhất của FTI-AM. Và bây giờ, chúng ta sẽ bước sang phần hấp dẫn nhất của buổi Seminar: Làm thế nào để điều khiển Playwright bằng Trí Tuệ Nhân Tạo mà không cần tự viết code!"*

---

# PHẦN 3: KỶ NGUYÊN A.I. AUTONOMOUS QA & BỘ 6 PROMPTS THỰC CHIẾN (Slide 11 -> 18)

## SLIDE 11: SỨC MẠNH CỦA A.I. TRONG CÁC IDE HIỆN ĐẠI
* **Tiêu đề:** BIẾN IDE (VS CODE, ANTIGRAVITY, CLAUDE CODE) THÀNH KỸ SƯ QA TỰ TRỊ
* **Nội dung chính:**
  * **Các IDE tích hợp A.I. hàng đầu:** Google Antigravity, VS Code + Copilot/Cursor, Claude Code CLI, Gemini AI Studio.
  * **Khả năng tự lập (Autonomous Capabilities):** Khi được cấp quyền đọc thư mục dự án, AI có thể:
    1. Đọc hiểu tài liệu `Knowledge Base / PRD / Acceptance Criteria` từ thư mục `Overview/` hoặc `Plan/`.
    2. Quét hiểu kiến trúc `Source Code / API Specs / UI Components`.
    3. Tự lập kế hoạch test và viết code Playwright chính xác theo nghiệp vụ.
* **Hình ảnh gợi ý:** Sơ đồ luồng: `Knowledge Base + Source Code` ──► `IDE A.I. Agent` ──► `Tự tạo & Chạy bộ test Playwright` ──► `Báo cáo lỗi chấn động`.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Các bạn hãy quên đi tư duy 'phải mở tài liệu ra đọc từng dòng rồi tự gõ từng lệnh code'. Chúng ta đang sống trong kỷ nguyên của Trí tuệ nhân tạo Agentic!
> Khi bạn mở các môi trường làm việc hiện đại như **Google Antigravity**, **VS Code tích hợp Copilot**, hay **Claude Code**, A.I. không còn là một chatbot chỉ biết trả lời bơ vơ trên trình duyệt nữa. Nó nằm ngay bên trong thư mục dự án FTI-AM của chúng ta!
> Nó có khả năng tự động đọc toàn bộ tài liệu Knowledge Base, tự đọc hiểu các file Yêu cầu nghiệp vụ của BA, tự quét qua source code Backend/Frontend để biết hệ thống có những nút nào, API nào. Và từ đó, A.I. sẽ tự động viết ra hàng chục kịch bản kiểm thử Playwright sắc bén để kiểm tra chính ứng dụng của chúng ta!"*

---

## SLIDE 12: QUY TRÌNH 6 PROMPTS THẦN THÁNH — TỪ A ĐẾN Z
* **Tiêu đề:** BỘ CÔNG THỨC ĐIỀU KHIỂN A.I. AGENTS DÀNH CHO BA, PM & QC
* **Nội dung chính:**
  * **Quy trình khép kín 6 Giai đoạn (6-Stage Autonomous Workflow):**
    * **P1:** Setup & Configuration (Tự cài đặt & cấu hình Playwright chuẩn AI).
    * **P2:** Context Ingestion (AI tự đọc Knowledge Base & nghiệp vụ lập Test Plan).
    * **P3:** Test Case Generation (Tự sinh code test bao phủ Happy Path & Edge Cases).
    * **P4:** Autonomous Bug Hunting Loop (Vòng lặp tự săn **ít nhất 5-10 lỗi nghiêm trọng/phiên**).
    * **P5:** Dev Handover Reporting (Đọc Trace `.zip` & xuất báo cáo lỗi chi tiết cho Dev fix).
    * **P6:** Fix Verification & Recheck Loop (Tự động test lại lỗi cũ & regression đến khi sạch bug).
* **Hình ảnh gợi ý:** Vòng lặp vô cực (Infinity Loop) hiển thị 6 bước khớp nhau như bánh răng đồng hồ, nhấn mạnh mũi tên quay lại từ P6 về P4 nếu vẫn còn lỗi.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Và để điều khiển cỗ máy A.I. này làm việc chính xác tuyệt đối mà không cần đụng đến code, tôi đã đóng gói sẵn cho dự án FTI-AM chúng ta **Bộ 6 Prompts Thần Thánh**.
> Đây là quy trình làm việc khép kín từ lúc dự án chưa có gì cho đến khi sản phẩm hoàn hảo không còn một hạt sạn: Từ việc cấu hình cài đặt ban đầu, cho AI nạp kiến thức nghiệp vụ, tự sinh kịch bản test, mở chế độ 'săn lỗi liên tục' cho đến khi bắt được ít nhất 5-10 bug mỗi phiên, xuất báo cáo cho Dev, và cuối cùng là tự recheck sau khi Dev sửa xong! Ngay bây giờ, chúng ta sẽ đi vào chi tiết từng Prompt để anh em có thể copy-paste dùng ngay chiều nay!"*

---

## SLIDE 13: PROMPT 1 — CẤU HÌNH & CÀI ĐẶT PLAYWRIGHT CHUẨN MỰC
* **Tiêu đề:** GIAI ĐOẠN 1: TỰ ĐỘNG CÀI ĐẶT & CẤU HÌNH TRONG 60 GIÂY
* **Mục tiêu:** Mở IDE (Antigravity / VS Code / Claude Code), ra lệnh cho AI setup toàn bộ môi trường Playwright với cấu hình multi-browser, base URL, timeout và báo cáo chuẩn xác.
* **MẪU PROMPT CHUẨN (Copy & Paste vào IDE):**

```text
[ROLE]: Bạn là chuyên gia Lead Automation Architect.
[NHIỆM VỤ]: Hãy kiểm tra thư mục dự án hiện tại và tự động thực hiện cài đặt, cấu hình Playwright chuẩn mực nhất cho dự án FTI-AM:
1. Chạy lệnh cài đặt `npm init playwright@latest` với cấu hình TypeScript.
2. Cập nhật file `playwright.config.ts` với các thiết lập tối ưu sau:
   - Base URL: `https://fti-am-staging.yourdomain.com` (hoặc `http://localhost:3000`).
   - Bật quay Trace tự động khi có lỗi: `trace: 'on-first-retry'`, chụp ảnh màn hình `screenshot: 'only-on-failure'`.
   - Cấu hình chạy đồng thời trên 3 trình duyệt: Chromium, Firefox, WebKit.
   - Thiết lập cấu trúc thư mục rõ ràng: `e2e/specs/`, `e2e/pages/` (mô hình Page Object Model tinh gọn) và `e2e/reports/`.
Hãy tự động chạy lệnh setup và xác nhận với tôi khi cấu hình hoàn tất 100%!
```

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Ở Giai đoạn 1, thay vì phải ngồi tra Google xem cài Playwright như thế nào, gõ lệnh gì, bạn chỉ cần mở IDE lên và paste đoạn **Prompt 1** này vào chat.
> Bạn ra lệnh cho A.I. với tư cách là Lead Automation Architect. Ngay lập tức, A.I. sẽ tự chạy lệnh cài đặt trong Terminal, tạo ra thư mục test, và quan trọng nhất là cấu hình file `playwright.config.ts` tối ưu với tự động chụp hình, tự động quay Trace 'Hộp đen máy bay' mỗi khi lỗi. Mọi thứ sẵn sàng chỉ sau 60 giây, hoàn toàn tự động!"*

---

## SLIDE 14: PROMPT 2 — A.I. TỰ ĐỌC KNOWLEDGE BASE & NGHIỆP VỤ DỰ ÁN
* **Tiêu đề:** GIAI ĐOẠN 2: NẠP TRI THỨC NGHIỆP VỤ & LẬP KẾ HOẠCH KIỂM THỬ (TEST PLAN)
* **Mục tiêu:** Cho AI đọc tài liệu PRD, Acceptance Criteria (AC), Knowledge Base (`KB/` hoặc `Plan/`) và Source code để hiểu rõ từng nút, từng logic nghiệp vụ trước khi viết test.
* **MẪU PROMPT CHUẨN (Copy & Paste vào IDE):**

```text
[ROLE]: Bạn là Senior QA Analyst & Domain Expert dự án Quản lý Tài sản FTI-AM.
[NGUỒN DỮ LIỆU CẦN ĐỌC]:
- Tài liệu nghiệp vụ/Knowledge Base: Hãy quét toàn bộ các file markdown trong thư mục `Plan/`, `Overview/` và tài liệu mô tả chức năng FTI-AM.
- Source Base: Hãy đọc các component giao diện trong `src/pages/` hoặc `src/components/` để nắm rõ cấu trúc DOM, ID và các định vị (locators) của ứng dụng.

[NHIỆM VỤ]:
1. Phân tích chi tiết nghiệp vụ chức năng: **[ĐIỀN TÊN CHỨC NĂNG, ví dụ: Quản lý Yêu cầu Cấp phát Tài sản]**.
2. Lập ra Bảng Kế Hoạch Kiểm Thử (Test Plan) bao gồm 3 danh sách rõ ràng:
   - Danh sách Happy Path (Luồng chuẩn thành công).
   - Danh sách Edge Cases (Luồng biên, bỏ trống form, nhập dữ liệu sai, ký tự đặc biệt).
   - Danh sách Phân quyền & Bảo mật (Tài khoản nhân viên vs Trưởng phòng phê duyệt).
Hãy liệt kê chi tiết dưới dạng bảng Markdown trước khi chúng ta sang bước viết code test!
```

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Sang Giai đoạn 2, đây chính là sự khác biệt giữa automation cũ và AI automation hiện đại. Trước khi viết test, A.I. cần hiểu sâu nghiệp vụ giống như một bạn BA thực thụ!
> Với **Prompt 2**, chúng ta chỉ định cho A.I. tự động đọc tất cả các tài liệu Knowledge Base, file mô tả yêu cầu trong thư mục `Plan/` và thậm chí đọc thẳng vào source code giao diện của Dev để nhìn thấy cấu trúc các nút bấm. A.I. sẽ tổng hợp lại thành một Bảng Kế hoạch Kiểm thử cực kỳ chi tiết với đầy đủ luồng Happy Path, luồng lỗi Edge Cases và luồng phân quyền. Bạn BA hay PM chỉ cần nhìn bảng kế hoạch này gật đầu là xong!"*

---

## SLIDE 15: PROMPT 3 — TỰ ĐỘNG SINH TEST CASES PLAYWRIGHT SÂU SẮC
* **Tiêu đề:** GIAI ĐOẠN 3: BIẾN KẾ HOẠCH NGHIỆP VỤ THÀNH KỊCH BẢN PLAYWRIGHT CHUẨN W3C
* **Mục tiêu:** Từ Test Plan đã được duyệt ở bước 2, AI tự viết code test Playwright TypeScript bằng Semantic Locators, có đầy đủ Assertions kiểm tra nghiệp vụ khắt khe.
* **MẪU PROMPT CHUẨN (Copy & Paste vào IDE):**

```text
[ROLE]: Bạn là Senior Playwright Automation Engineer.
[INPUT]: Dựa trên Bảng Kế Hoạch Kiểm Thử (Test Plan) đã thống nhất ở bước trước và thông tin từ Source base của FTI-AM.
[NHIỆM VỤ]:
Hãy tạo file kịch bản kiểm thử Playwright hoàn chỉnh tại `e2e/specs/[ten-chuc-nang].spec.ts` đáp ứng NGHIÊM NGẶT các tiêu chuẩn sau:
1. LUÔN LUÔN sử dụng Semantic & Accessibility Locators (`getByRole`, `getByLabel`, `getByPlaceholder`, `getByText`). TUYỆT ĐỐI KHÔNG dùng XPATH hay CSS Selector giòn gãy.
2. Viết đầy đủ các bước kiểm chứng `expect(...)`:
   - Kiểm tra hiển thị thông báo Toast thành công/thất bại chính xác theo nghiệp vụ (`expect(toast).toHaveText(...)`).
   - Kiểm tra sự thay đổi trạng thái dữ liệu trong bảng sau khi thao tác (`expect(rowStatus).toHaveText('Chờ phê duyệt')`).
   - Kiểm tra các nút bị Disable/Enable đúng logic phân quyền.
3. Chú thích rõ ràng bằng Tiếng Việt trước mỗi `test.step('...', async () => {})` để người không biết code (BA/PM/QC) nhìn vào là hiểu ngay kịch bản đang kiểm tra bước nào!
Hãy sinh code và lưu file ngay lập tức!
```

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Khi Kế hoạch Kiểm thử đã rõ ràng, **Prompt 3** là cú bấm nút biến ý tưởng thành kịch bản Playwright TypeScript hoàn chỉnh.
> Bạn ra lệnh cho A.I. tuân thủ kỷ luật sắt đá: Chỉ được phép dùng bộ định vị ngữ nghĩa W3C (`getByRole`, `getByLabel`) để kịch bản cực kỳ kiên cường, không bị gãy khi sửa UI. Đặc biệt, A.I. phải đóng gói từng thao tác bên trong các khối `test.step()` có ghi chú tiếng Việt rõ ràng. Khi chạy kịch bản, các bạn BA hay PM mở lên xem sẽ thấy từng dòng tiếng Việt hiện ra: 'Bước 1: Điền thông tin tài sản', 'Bước 2: Bấm nút Gửi yêu cầu', 'Bước 3: Kiểm tra Toast thành công'. Mọi thứ minh bạch và chuẩn nghiệp vụ 100%!"*

---

## SLIDE 16: PROMPT 4 — VÒNG LẶP SĂN LỖI TỰ ĐỘNG (AUTONOMOUS BUG HUNTING LOOP)
* **Tiêu đề:** GIAI ĐOẠN 4: VÒNG LẶP "HUNTING LOOP" — SĂN ÍT NHẤT 5-10 LỖI NGHIÊM TRỌNG MỖI PHIÊN
* **Mục tiêu:** Ra lệnh cho AI tự động chạy test, phân tích chỗ thất bại, tự động viết thêm test stress edge-cases, thử nghiệm nhồi nhét dữ liệu khốc liệt **cho đến khi phơi bày ít nhất 5 đến 10 lỗi nghiêm trọng/lỗi sai logic/lỗi giao diện trước khi bàn giao QC!**
* **MẪU PROMPT CHUẨN (Copy & Paste vào IDE):**

```text
[ROLE]: Bạn là Elite Red-Team QA Hunter (Chuyên gia săn lỗi kiên cường không khoan nhượng).
[CHỈ DẪN TỐI THƯỢNG - AUTONOMOUS HUNTING LOOP]:
Mục tiêu của bạn trong phiên làm việc này là PHẢI TÌM VÀ BẮT ĐƯỢC ÍT NHẤT 5 ĐẾN 10 LỖI NGHIÊM TRỌNG (Critical Bugs), lỗi sai nghiệp vụ, lỗi chức năng không đúng mô tả PRD, hoặc lỗi vỡ giao diện trên hệ thống FTI-AM!

Hãy thực hiện vòng lặp tự trị sau đây cho đến khi đạt chỉ tiêu lỗi hoặc xác nhận hệ thống hoàn toàn kiên cường:
1. Chạy bộ test Playwright hiện có bằng lệnh `npx playwright test`.
2. Nếu test Pass hết, HÃY TỰ ĐỘNG TẠO THÊM CÁC SPEC TEST SIÊU KHẮC NGHIỆT (Extreme Stress Tests):
   - Nhập dữ liệu chuỗi siêu dài 5000 ký tự, thẻ HTML XSS `<script>alert(1)</script>`, emoji đặc biệt vào form.
   - Thử submit form liên tục 10 lần trong 1 giây (Double-click/Spam submit) xem có bị tạo lặp dữ liệu không.
   - Dùng `page.route` giả lập lỗi mạng chậm 10 giây hoặc trả về 500 Server Error xem Frontend có bị đơ trắng trang không.
   - Kiểm tra logic nghiệp vụ chéo: Nhập số lượng tài sản xin cấp phát là số âm (`-5`) hoặc vượt quá số lượng trong kho xem hệ thống có chặn đúng không.
3. Chạy các test siêu khắc nghiệt này và ghi nhận mọi điểm crash, mọi phản hồi sai nghiệp vụ vào Danh sách Bug Săn Được.
Hãy liên tục chạy và kiểm thử TRONG VÒNG LẶP CHO ĐẾN KHI BẮT ĐƯỢC ÍT NHẤT 5 - 10 BUG HOẶC KHI KHÔNG CÒN LỖI NGHIÊM TRỌNG NÀO NỮA thì dừng lại và tổng hợp danh sách!
```

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Và đây chính là trái tim của buổi Seminar hôm nay — **Prompt 4: Vòng Lặp Săn Lỗi Tự Động (Autonomous Bug Hunting Loop)**!
> Nếu chỉ test những trường hợp êm đềm Happy Path thì quá bình thường. Chúng ta muốn chặn 100% lỗi nghiêm trọng trước khi đưa cho đội QC. Vì vậy, chúng ta ra lệnh cho A.I. hóa thân thành một **Elite Red-Team QA Hunter** — một thợ săn lỗi không khoan nhượng!
> Chúng ta giao chỉ tiêu cứng cho A.I.: **Mỗi phiên làm việc phải thử mọi cách để phơi bày ít nhất 5 đến 10 lỗi nghiêm trọng hoặc lỗi sai logic nghiệp vụ!** Nếu chạy kịch bản thường mà pass, A.I. tự động sinh ra kịch bản 'tra tấn hệ thống': nó nhét 5000 ký tự vào ô input, nó bấm spam nút Submit 10 lần/giây xem có bị lặp dữ liệu không, nó nhập số lượng tài sản là số âm `-5` xem hệ thống có bị lỗi logic không, và nó giả lập mạng đứt gãy. A.I. cứ tự động chạy xoay vòng trong IDE cho đến khi nào đào ra đủ bug hoặc chứng minh hệ thống hoàn toàn vô đối thì mới chịu dừng lại!"*

---

## SLIDE 17: PROMPT 5 — ĐỌC TRACE VIEWER & XUẤT BÁO CÁO CHI TIẾT CHO DEV
* **Tiêu đề:** GIAI ĐOẠN 5: TỰ PHÂN TÍCH HỘP ĐEN & XUẤT BÁO CÁO LỖI (BUG REPORT) CHUYỂN GIAO DEV
* **Mục tiêu:** AI tự động đọc các file `trace.zip` và log lỗi vừa thu thập từ vòng lặp săn bug, phân tích chính xác nguyên nhân gốc rễ (Root Cause) và xuất Báo Cáo Lỗi Markdown chuẩn chỉnh cho Dev fix.
* **MẪU PROMPT CHUẨN (Copy & Paste vào IDE):**

```text
[ROLE]: Bạn là QA Lead & Root-Cause Analysis Expert.
[INPUT]: Các file log kết quả và file `test-results/**/trace.zip` từ Giai đoạn Săn Lỗi vừa qua.
[NHIỆM VỤ]:
Hãy giải mã file Trace và Log lỗi, tự động xuất một file Báo Cáo Lỗi Chi Tiết tại `e2e/reports/BUG_REPORT_HANDOVER.md` để chúng ta chuyển giao cho đội Dev sửa lỗi ngay lập tức. Cấu trúc báo cáo PHẢI có:
1. **Bảng Tổng Hợp Lỗi (Executive Summary):** Mã lỗi, Tên Bug, Mức độ nghiêm trọng (Critical / High / Medium), Trạng thái.
2. **Chi Tiết Từng Lỗi Săn Được (Chi tiết 5-10 bugs):**
   - **Mô tả lỗi & Yêu cầu nghiệp vụ bị vi phạm (Business Requirement Violation).**
   - **Các bước tái hiện (Steps to Reproduce):** Rõ ràng từng bước 1, 2, 3.
   - **Kết quả thực tế (Actual Result) vs Kết quả mong đợi (Expected Result).**
   - **Phân tích Hộp Đen Trace Viewer (Technical Root Cause Insight):** Lỗi xảy ra tại dòng DOM nào? API network trả về status gì (`400 Bad Request` hay `500 Internal Error`)? Payload gửi đi bị sai chỗ nào?
   - **Gợi ý hướng sửa lỗi cho Dev (Actionable Fix Suggestion):** Dev cần sửa ở component Frontend nào hoặc bổ sung check validation gì ở Backend.
Hãy tạo file Báo Cáo rõ ràng, sắc nét để Dev đọc là tâm phục khẩu phục và fix được ngay!
```

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Sau khi cỗ máy A.I. của chúng ta săn được một giỏ đầy lỗi, làm sao để giao cho Dev sửa một cách vui vẻ và nhanh nhất? Đó là lúc dùng **Prompt 5: Đọc Trace Viewer và Xuất Báo Cáo Lỗi Handover**.
> Bạn ra lệnh cho A.I. tự mở các file Hộp Đen `trace.zip` ra đọc. A.I. tự phân tích xem tại mili-giây lỗi đó, API gửi đi bị thiếu trường gì, hay Backend ném ra status 500 ở endpoint nào. Sau đó, A.I. xuất ra một file Báo Cáo Markdown cực kỳ chuyên nghiệp với đầy đủ 5-10 bug: có các bước tái hiện từng bước 1-2-3, có so sánh Kết quả thực tế vs Mong đợi, và có luôn **Phân tích nguyên nhân gốc rễ kèm gợi ý hướng fix chính xác cho Dev**! Bạn chỉ cần gửi file báo cáo này cho Dev, Dev nhìn vào là biết sửa ở dòng code nào ngay trong 5 phút!"*

---

## SLIDE 18: PROMPT 6 — VÒNG LẶP RECHECK & REGRESSION CHO ĐẾN KHI SẠCH BUG
* **Tiêu đề:** GIAI ĐOẠN 6: TỰ ĐỘNG KIỂM CHỨNG LẠI SAU KHI DEV FIX — CHẠY ĐẾN KHI 0 BUG THÌ THÔI!
* **Mục tiêu:** Khi Dev thông báo đã fix xong bug, ra lệnh cho AI tự động chạy recheck chính xác các bug cũ và chạy trọn bộ regression test để đảm bảo không bị "hỏng lây rây" sang chức năng khác. Vòng lặp lặp lại đến khi 100% Pass!
* **MẪU PROMPT CHUẨN (Copy & Paste vào IDE):**

```text
[ROLE]: Bạn là QA Quality Gatekeeper (Chốt chặn bảo chứng chất lượng cuối cùng).
[BỐI CẢNH]: Đội lập trình (Dev Team) vừa thông báo đã hoàn thành sửa chữa toàn bộ danh sách lỗi trong file `e2e/reports/BUG_REPORT_HANDOVER.md`.
[NHIỆM VỤ - CLOSED-LOOP RECHECK & REGRESSION]:
Hãy thực hiện vòng lặp kiểm chứng khắt khe sau đây:
1. **Chạy Recheck mục tiêu (Targeted Recheck):** Thực thi lại ngay các kịch bản test đã từng báo fail trước đó bằng lệnh `npx playwright test --grep "Bug ID/Name"`. Kiểm tra xem các lỗi nghiêm trọng đã thực sự được fix 100% chưa.
2. **Chạy Kiểm thử Hồi quy Toàn bộ (Full Regression Test):** Chạy toàn bộ bộ test suite của hệ thống FTI-AM để đảm bảo việc fix bug không làm gãy hỏng (side-effect) bất kỳ tính năng cũ nào đang chạy bình thường!
3. **Đánh giá & Quyết định (Quality Gate Decision):**
   - **NẾU VẪN CÒN LỖI (DÙ CHỈ 1 LỖI):** Tự động cập nhật file Báo cáo lỗi với trạng thái `[REOPENED]` kèm bằng chứng Trace mới và thông báo rõ: "Phát hiện lỗi tái phát/lỗi mới, yêu cầu Dev tiếp tục xử lý!" -> Quay lại vòng lặp.
   - **NẾU 100% TEST PASS (0 CRITICAL BUGS):** Xuất Báo Cáo Chứng Nhận Chất Lượng (`e2e/reports/QUALITY_CERTIFICATE.md`) xác nhận: "HỆ THỐNG ĐÃ HOÀN TOÀN SẠCH LỖI NGHIÊM TRỌNG — SẴN SÀNG BÀN GIAO CHO ĐỘI QC / RELEASE STAGING!".
Hãy chạy ngay vòng lặp kiểm chứng này cho đến khi đạt trạng thái 0 Bug!
```

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Và giai đoạn cuối cùng trong quy trình 6 Prompts chính là **Prompt 6: Vòng Lặp Recheck & Regression cho đến khi sạch bóng bug**!
> Trong quy trình cũ, khi Dev hô: 'Anh fix xong rồi em ơi!', QC hì hục vào test lại thì phát hiện lỗi A sửa xong lại làm vỡ tính năng B, lại cãi nhau.
> Bây giờ, bạn chỉ cần paste Prompt 6 vào IDE. A.I. đóng vai trò là một **Quality Gatekeeper — Chốt chặn chất lượng thép**. Nó tự động chạy kiểm tra nhắm mục tiêu vào các bug cũ xem đã hết thật chưa, rồi chạy kiểm thử hồi quy toàn bộ hệ thống FTI-AM. NẾU phát hiện dù chỉ 1 lỗi nhỏ tái phát hay bị hỏng lây rây, A.I. lập tức đóng dấu `REOPENED` và gửi lại Dev. Vòng lặp này cứ tự động diễn ra cho đến khi nào cỗ máy A.I. xác nhận **100% kịch bản PASS, 0 lỗi nghiêm trọng**, và xuất ra tờ 'Chứng nhận Chất lượng' thì chúng ta mới ung dung bàn giao cho đội QC hoặc bấm nút Release! Đó chính là tự động hóa khép kín hoàn hảo!"*

---

# PHẦN 4: SHIFT-LEFT QUALITY & TỔNG KẾT (Slide 19 -> 22)

## SLIDE 19: SHIFT-LEFT QUALITY — BẢO VỆ CHẤT LƯỢNG NGAY TỪ KHÂU DEV
* **Tiêu đề:** TRIẾT LÝ SHIFT-LEFT: CHẶN LỖI TỪ GỐC, GIẢM 90% CHI PHÍ SỬA CHỮA
* **Nội dung chính:**
  * **Shift-Left là gì?** Dời khâu kiểm tra chất lượng sang bên trái của dòng thời gian phát triển — tức là kiểm tra ngay trong lúc Dev viết code và BA review, chứ không đợi đến cuối tuần thảy sang cho QC.
  * **Cơ chế phối hợp mới:**
    - Dev code xong tính năng ──► Chạy ngay Prompt 2, 3, 4 trong IDE A.I. để tự test.
    - BA/PM nhận bản build ──► Chạy Prompt 6 để recheck nghiệp vụ trước khi duyệt.
    - Đội QC chuyên nghiệp ──► Được giải phóng khỏi việc test tay lặp lại, tập trung vào test bảo mật, hiệu năng và UX nâng cao.
* **Hình ảnh gợi ý:** Sơ đồ dòng chảy thời gian phát triển phần mềm, với mũi tên lớn màu xanh dịch chuyển khối "QA/Quality Check" từ cực bên phải (cuối Sprint) sang cực bên trái (ngay sau khâu viết code).

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Khi chúng ta áp dụng trọn bộ 6 Prompts A.I. + Playwright vừa rồi, chúng ta đang thực hiện một cuộc cách mạng quản trị gọi là **Shift-Left Quality Assurance** — Dời chất lượng sang bên trái!
> Nói một cách dễ hiểu: Ngày xưa chúng ta xây nhà xong hết rồi mới đi kiểm tra xem móng có bị nứt không — đó là phát hiện lỗi muộn ở bên phải. Còn bây giờ, với A.I. và Playwright, ngay khi Dev vừa trát xong viên gạch nào, BA và Dev bấm nút cho A.I. tự động vào kiểm tra độ vững chắc ngay tại chỗ!
> Khi chúng ta chặn đứng 100% lỗi nghiêm trọng ngay tại bàn làm việc của Dev và BA, chúng ta tiết kiệm được 90% chi phí và thời gian họp hành fix bug. Đội ngũ QC chính thức được giải phóng khỏi những chuỗi regression hành xác, để họ tập trung vào những bài kiểm thử bảo mật và trải nghiệm người dùng đẳng cấp hơn!"*

---

## SLIDE 20: TỔNG KẾT QUY TRÌNH HỢP LỰC ĐỘI NGŨ (TEAM SYNERGY)
* **Tiêu đề:** AI CŨNG CÓ VAI TRÒ TRONG KỶ NGUYÊN KIỂM THỬ THÔNG MINH
* **Nội dung chính:**
  * **Business Analyst (BA) / PM:** Thầy phù thủy nghiệp vụ — Dùng Prompt 2 & 3 để biến Acceptance Criteria thành bộ test tự động chuẩn xác.
  * **Developer (Dev):** Người kiến tạo kiên cường — Dùng Prompt 1, 4 & 5 để tự chạy vòng lặp săn bug và tự fix code trước khi tạo Pull Request.
  * **Quality Control (QC):** Chuyên gia kiểm chứng — Dùng Prompt 6 và UI Trace Viewer để làm chốt chặn bảo chứng chất lượng cao cấp, không phải test tay cơ bắp.
* **Hình ảnh gợi ý:** Hình ảnh tam giác hợp lực vàng: BA/PM (Nghiệp vụ) - Dev (Kiến trúc) - QC (Chất lượng) được kết nối và nâng đỡ bởi nền tảng A.I. Playwright ở giữa.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Trong mô hình làm việc mới này, không một vai trò nào bị thay thế, mà tất cả đều được **nâng tầm vị thế vượt bậc**:
> Các bạn BA và PM không còn cảm thấy bất lực khi sản phẩm làm ra không đúng ý mình nữa. Bạn nắm trong tay công cụ A.I. để tự động hóa việc kiểm chứng từng dòng Acceptance Criteria.
> Các bạn Dev không còn sợ bị QC ping réo tên lúc nửa đêm nữa, vì chính các bạn đã có A.I. săn hết 10 bug ẩn giấu và giúp bạn fix sạch sẽ ngay trước khi gõ lệnh commit.
> Và các bạn QC không còn là những người 'bấm chuột thuê' tẻ nhạt nữa. Các bạn trở thành những Quality Gatekeeper — những nhà quản trị chất lượng hệ thống thực thụ. Đó chính là sức mạnh hợp lực vô địch của đội ngũ FTI-AM!"*

---

## SLIDE 21: LIVE DEMO PREVIEW (CHUYỂN TIẾP SANG PHẦN THỰC HÀNH)
* **Tiêu đề:** HÃY CÙNG CHỨNG KIẾN PHÉP MÀU NGAY TRÊN DỰ ÁN FTI-AM!
* **Nội dung chính:**
  * **Ngay sau đây (15 Phút Live Demo):** Chúng ta sẽ cùng mở trực tiếp IDE Google Antigravity / Claude Code trên máy tính.
  * **4 Bước trình diễn live:**
    1. Ghi hình thao tác chuột Codegen Zero-Code.
    2. Paste Yêu cầu nghiệp vụ FTI-AM vào cho A.I. tự sinh code test.
    3. Kích hoạt Vòng lặp săn bug "Hunting Loop" — xem A.I. tự động phát hiện lỗi 500 và lỗi logic nghiệp vụ.
    4. Mở Trace Viewer nhìn hình ảnh Hộp đen và xem A.I. tự xuất Báo cáo lỗi cho Dev.
* **Hình ảnh gợi ý:** Hình ảnh một cái đồng hồ đếm ngược 15 phút với biểu tượng tia sét, chuẩn bị chuyển màn hình sang IDE thực tế.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Trăm nghe không bằng một thấy! Trăm lời thuyết trình hay không bằng 15 phút nhìn A.I. chạy code thực tế ngay trên hệ thống của chúng ta!
> Ngay bây giờ, xin mời tất cả các bạn hướng mắt lên màn hình lớn. Tôi sẽ mở trực tiếp môi trường Google Antigravity và trình diễn cho các bạn chứng kiến 4 bước thực chiến trên chính dự án FTI-AM: Từ thao tác chuột zero-code, cho A.I. đọc yêu cầu nghiệp vụ sinh test, kích hoạt cỗ máy tự săn 5 lỗi nghiêm trọng, và xuất báo cáo Hộp đen cho Dev chỉ trong tích tắc. Hãy cùng bắt đầu!"*

---

## SLIDE 22: Q&A & KAHOOT GAME (KẾT THÚC THUYẾT TRÌNH)
* **Tiêu đề:** Q&A VÀ THỬ THÁCH KAHOOT — AI LÀ CHIẾN THẦN PLAYWRIGHT & A.I.?
* **Nội dung chính:**
  * **Q&A Time (10 phút):** Giải đáp mọi thắc mắc của lãnh đạo, BA, Dev và QC về cách tích hợp Prompts vào quy trình làm việc hàng ngày.
  * **Kahoot Master Challenge:** Cùng truy cập `kahoot.it` với 12 câu hỏi cực gay cấn ôn tập lại kiến thức hôm nay. Top 3 chiến thần xuất sắc nhất sẽ nhận phần thưởng đặc biệt ngay tại chỗ!
* **Hình ảnh gợi ý:** Mã QR code lớn của trang Kahoot.it và hình ảnh bục vinh quang Top 1, 2, 3 kèm những món quà hấp dẫn.

### 🗣️ LỜI THOẠI CHI TIẾT:
> *"Và sau khi chúng ta đã trải qua phần Demo rực rỡ, bây giờ là thời gian dành cho Q&A và đặc biệt là **Thử thách Kahoot Game** với những phần quà cực kỳ giá trị từ Ban tổ chức!
> Xin mời các anh chị và các bạn cùng lấy điện thoại ra, quét mã QR trên màn hình hoặc truy cập `kahoot.it` để tham gia. Hãy đặt cho mình một cái tên thật chất, chúng ta cùng kiểm tra xem ai nãy giờ đã nắm vững bí kíp 6 Prompts A.I. và xứng đáng nhận danh hiệu 'Chiến thần Playwright & A.I. Master' của FTI-AM ngày hôm nay! Xin kính mời!"*

---
*(Hết tài liệu Kịch bản Thuyết trình Master Script)*

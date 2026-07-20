# 🎬 LỘ TRÌNH LIVE DEMO THỰC CHIẾN (15 PHÚT): PLAYWRIGHT x A.I. AUTONOMOUS QA ON FTI-AM
**Nơi trình diễn:** Mở trực tiếp IDE Google Antigravity / VS Code Copilot / Claude Code trên máy chiếu lớn  
**Mục tiêu Live Demo:** Chứng minh cho Ban lãnh đạo, BA, PM, Dev và QC thấy A.I. tự động đọc tài liệu Knowledge Base, tự viết kịch bản Playwright, tự kích hoạt **Vòng lặp Săn Lỗi (Hunting Loop) bắt sống 5 lỗi nghiêm trọng ngay trên FTI-AM**, tự xuất Báo cáo cho Dev, và tự Recheck cho đến khi sạch lỗi 100%.  
**Đối tượng theo dõi:** Không cần biết code — chỉ cần nhìn A.I. thao tác và xem kết quả hình ảnh trực quan!

---

## ⏱️ BẢNG PHÂN BỔ THỜI GIAN 15 PHÚT KỊCH TÍNH

```
┌────────────────────────────────────────────────────────────────────────────────────────┐
│ [BƯỚC 1: 3 Phút] Codegen Zero-Code & A.I. Tự Đọc Knowledge Base / PRD                  │
│ [BƯỚC 2: 5 Phút] Kích Hoạt Vòng Lặp Săn Lỗi — Phơi Bày 5 Lỗi Nghiêm Trọng FTI-AM       │
│ [BƯỚC 3: 4 Phút] Mở Hộp Đen Trace Viewer & Xuất Báo Cáo Lỗi Bàn Giao Dev               │
│ [BƯỚC 4: 3 Phút] Tự Động Recheck & Regression Sau Khi Fix — Đến Khi 0 Bug Thì Thôi!   │
└────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## 🚀 CHI TIẾT KỊCH BẢN TỪNG BƯỚC TRÌNH DIỄN (LIVE SCRIPT & PROMPTS)

### BƯỚC 1: CODEGEN ZERO-CODE & A.I. TỰ ĐỌC KNOWLEDGE BASE (3 PHÚT)
**🎯 Mục tiêu:** Chứng minh bất kỳ ai cũng có thể ghi hình chuột và cho AI nạp tri thức nghiệp vụ chỉ trong vài giây.

* **Thao tác live trên màn hình lớn:**
  1. Mở Terminal trong IDE Antigravity / VS Code gõ lệnh:
     ```bash
     npx playwright codegen https://fti-am-staging.yourdomain.com
     ```
  2. Trình duyệt bật lên: Bạn thực hiện click thao tác **Đăng nhập** -> vào menu **Yêu cầu Cấp phát Tài sản** -> bấm nút **Tạo Yêu cầu mới**.
  3. Chỉ cho khán giả xem cửa sổ bên cạnh tự động nhảy ra các lệnh ngữ nghĩa chuẩn W3C: `getByRole('button', { name: 'Đăng nhập' })`. Tắt trình duyệt Codegen.
  4. Mở khung Chat A.I. trong IDE (Antigravity/Copilot/Claude Code), copy/paste **Prompt Nạp Tri Thức & Kế Hoạch Test (Prompt 2)**:

* **💬 Lời thoại dẫn dắt lúc thao tác:**
> *"Các bạn hãy nhìn đây, tôi vừa thao tác chuột như một người dùng bình thường và lệnh `codegen` đã giúp tôi tạo ra sườn code thô ban đầu.
> Nhưng đây mới là sự vi diệu của Trí tuệ nhân tạo! Tôi không tự viết đoạn kiểm tra nghiệp vụ. Tôi sẽ paste đoạn code thô vừa rồi vào khung chat của Google Antigravity, kèm theo lệnh cho A.I. tự động đọc file Yêu cầu nghiệp vụ (`AC-Cap-Phat-Tai-San.md`) và quét qua source code giao diện FTI-AM để lập Kế hoạch Kiểm thử!"*

* **📋 Copy & Paste Prompt mẫu vào khung chat AI:**
```text
[ROLE]: Bạn là Senior QA Analyst & Domain Expert dự án FTI-AM.
[NGUỒN DỮ LIỆU]: Hãy đọc file yêu cầu nghiệp vụ tại `Plan/AC-Cap-Phat-Tai-San.md` và quét source code các nút bấm tại `src/pages/AssetAllocation.tsx`.
[NHIỆM VỤ]: Hãy phân tích nghiệp vụ và sinh ngay file kiểm thử Playwright hoàn chỉnh tại `e2e/specs/asset-allocation.spec.ts` sử dụng 100% Semantic Locators (`getByRole`, `getByLabel`), có đầy đủ `expect()` kiểm tra thông báo Toast và trạng thái 'Chờ phê duyệt' theo đúng tài liệu BA. Viết chú thích tiếng Việt trước mỗi bước `test.step()`.
```
*(Khán giả vỗ tay khi nhìn thấy AI viết ra file test chuẩn chỉnh 100 dòng chỉ trong 5 giây!)*

---

### BƯỚC 2: KÍCH HOẠT VÒNG LẶP SĂN LỖI — PHƠI BÀY 5 LỖI NGHIÊM TRỌNG (5 PHÚT)
**🎯 Mục tiêu:** Tạo hiệu ứng "Sởn da gà" khi cỗ máy AI hóa thân thành thợ săn Red-Team tự động nhét dữ liệu độc hại, giả lập đứt mạng để **chộp sống ít nhất 5 lỗi nghiêm trọng ngay trên bản build Staging**.

* **Thao tác live trên màn hình lớn:**
  1. Mở khung chat A.I. và kích hoạt **Prompt Vòng Lặp Săn Lỗi (Prompt 4)**.
  2. Để A.I. tự động thực thi lệnh chạy test `--ui` hoặc chạy ngầm bên trong IDE để liên tục sinh kịch bản stress test.
  3. Mở cửa sổ Test Results cho khán giả nhìn thấy danh sách **5 Bug bị chộp sống đỏ rực (FAIL)**!

* **💬 Lời thoại dẫn dắt lúc thao tác:**
> *"Nếu chúng ta chỉ chạy kịch bản êm đềm Happy Path thì quá dễ. Hôm nay tôi muốn chứng minh cho các bạn thấy: A.I. có thể làm một **Elite Red-Team Hunter** săn ra mọi lỗi ẩn giấu sâu nhất trước khi bàn giao cho QC!
> Tôi vừa ra lệnh cho A.I. kích hoạt Vòng lặp Săn Lỗi tự động với chỉ tiêu: **Phải bắt được ít nhất 5 lỗi nghiêm trọng trên FTI-AM!** Các bạn nhìn xem A.I. đang làm gì này:
> Nó tự động tạo kịch bản nhét 5000 ký tự vào form xin cấp phát; nó nhập số lượng tài sản là số âm `-5`; nó bấm click nháy đúp 10 lần/giây; và đặc biệt nó dùng `page.route` chặn API giả lập lỗi `500 Server Error`!
> Và BÙM! Nhìn lên màn hình đi các bạn: A.I. đã chộp sống **5 Bug nghiêm trọng** mà test tay bình thường chắc chắn bỏ sót!"*

* **🔥 Danh sách 5 Lỗi Thực Tế A.I. Bắt Được Ngay Trên Màn Hình Demo:**
  * ❌ **Bug 01 (Crash UI khi lỗi 500):** Khi Backend trả về 500 Server Error, màn hình FTI-AM bị trắng xóa (White Screen crash) thay vì hiện thông báo lỗi thân thiện.
  * ❌ **Bug 02 (Lỗi sai nghiệp vụ số âm):** Nhập số lượng tài sản xin cấp phát là `-5`, hệ thống vẫn cho tạo đơn thành công và trừ kho thành số dương ảo!
  * ❌ **Bug 03 (Lỗi lặp dữ liệu do Double-click):** Khi bấm nút 'Gửi yêu cầu' 5 lần liên tiếp thật nhanh, hệ thống bị tạo ra 5 đơn xin tài sản giống hệt nhau (thiếu cơ chế disable nút khi loading).
  * ❌ **Bug 04 (Lỗi XSS Injection vỡ giao diện):** Nhập tên tài sản là `<h1 style="color:red">Hacked</h1>`, bảng danh sách tài sản bị đổi màu đỏ và vỡ khung HTML.
  * ❌ **Bug 05 (Lỗi sai phân quyền RBAC):** Tài khoản 'Nhân viên' bình thường khi cố tình mở đường dẫn URL `/admin/approve`, hệ thống không đẩy ra màn hình 403 mà vẫn hiện nút 'Duyệt' (dù bấm lỗi nhưng sai giao diện nghiêm trọng).

---

### BƯỚC 3: MỞ HỘP ĐEN TRACE VIEWER & XUẤT BÁO CÁO BÀN GIAO DEV (4 PHÚT)
**🎯 Mục tiêu:** Chứng minh người không biết code nhìn hình ảnh timeline là hiểu nguyên nhân lỗi ngay lập tức, và AI tự xuất Báo cáo Handover cho Dev fix trong 1 nốt nhạc.

* **Thao tác live trên màn hình lớn:**
  1. Click đúp vào **Bug 01 (Crash UI khi lỗi 500)** trong cửa sổ Playwright để mở **Trace Viewer**.
  2. Kéo thanh Timeline thời gian từ giây thứ 1 đến giây thứ 4. Chỉ cho khán giả xem DOM Snapshot lúc mạng 500 đỏ rực.
  3. Quay lại IDE, paste **Prompt Đọc Trace & Xuất Báo Cáo Lỗi (Prompt 5)**.
  4. Mở file `e2e/reports/BUG_REPORT_HANDOVER.md` vừa được sinh ra hiển thị siêu đẹp trên màn hình lớn!

* **💬 Lời thoại dẫn dắt lúc thao tác:**
> *"Ngày xưa khi QC báo 5 lỗi này, Dev sẽ lập tức cãi: 'Ủa anh không tái hiện được, lỗi ở đâu ra?'.
> Nhưng với Playwright Trace Viewer, hãy nhìn đây! Tôi nắm thanh timeline trượt lùi về quá khứ... Trượt tới giây thứ 3: form rất đẹp. Trượt sang giây thứ 3.5: API `/api/v1/assets` trả về status 500 màu đỏ. Trượt sang giây thứ 4: trang web sập trắng xóa! Mọi bằng chứng rõ ràng như Hộp Đen Máy Bay!
> Và bây giờ, làm sao để giao cho Dev sửa nhanh nhất? Tôi bảo A.I. tự đọc file Trace này và xuất Báo cáo Handover. Các bạn nhìn xem: File `BUG_REPORT_HANDOVER.md` đã có đầy đủ 5 bugs, có bước tái hiện, và có luôn **phân tích nguyên nhân gốc rễ kèm gợi ý code cho Dev sửa ở file `AssetAllocation.tsx` dòng 84**! Dev nhận file này chỉ có khen và sửa ngay trong 5 phút!"*

---

### BƯỚC 4: TỰ ĐỘNG RECHECK & REGRESSION SAU KHI FIX — ĐẾN KHI 0 BUG THÌ THÔI! (3 PHÚT)
**🎯 Mục tiêu:** Khẳng định chốt chặn bảo chứng chất lượng khép kín: AI tự recheck lỗi cũ và test hồi quy toàn bộ hệ thống, xuất Chứng nhận Chất lượng cho phép release.

* **Thao tác live trên màn hình lớn:**
  1. Giả lập Dev vừa sửa xong code (mở nhánh git đã fix sẵn 5 bug hoặc bôi đen uncomment đoạn code fix trong `AssetAllocation.tsx`).
  2. Paste **Prompt Vòng Lặp Recheck & Regression (Prompt 6)** vào chat A.I.
  3. Khán giả nhìn kịch bản test tự động chạy lại siêu tốc: Tất cả 5 test cũ chuyển từ 🔴 FAIL sang 🟢 PASS!
  4. A.I. tiếp tục tự động quét nhanh bộ Regression Test toàn hệ thống -> **100% PASS (🟢 ZERO CRITICAL BUGS)**!
  5. A.I. tự động tạo file `QUALITY_CERTIFICATE.md` với huy hiệu xanh mượt rực rỡ trên màn hình!

* **💬 Lời thoại dẫn dắt lúc thao tác & Chốt hạ:**
> *"Và giả sử bây giờ các bạn Dev đã sửa xong 5 lỗi theo đúng báo cáo của A.I. Liệu chúng ta đã yên tâm release chưa? Chưa! Nhỡ Dev sửa lỗi A lại làm hỏng lỗi B thì sao?
> Chúng ta kích hoạt Giai đoạn cuối cùng: **Prompt 6 — Vòng lặp Recheck & Regression khép kín**. A.I. tự động chạy lại 5 kịch bản khắc nghiệt vừa rồi... Xanh mượt! Nó tiếp tục quét toàn bộ ngân hàng kịch bản hồi quy của FTI-AM trong 15 giây... Tất cả đều XANH MƯỢT!
> Và đây là kết quả cuối cùng: A.I. đã cấp **Chứng Nhận Bảo Chứng Chất Lượng (Quality Certificate) — 0 Bug Nghiêm Trọng — Sẵn sàng bàn giao cho đội QC / Release Staging!**
> 
> Kính thưa các anh chị và các bạn, đó chính là 'Dân Chủ Hóa Kiểm Thử'. BA, PM, Dev hay QC — không cần phải là chuyên gia viết code phức tạp, chỉ cần kết hợp Trí Tuệ Nhân Tạo và Playwright, chúng ta hoàn toàn làm chủ chất lượng, rút ngắn 80% thời gian kiểm thử và bảo vệ dự án FTI-AM kiên cường trước mọi sóng gió release! Xin cảm ơn các bạn!"* *(Tràng pháo tay bùng nổ cả phòng Seminar)*

---

## 🛠️ CHECKLIST KIỂM TRA TRƯỚC GIO G CHỤP DEMO (DÀNH CHO NGƯỜI TRÌNH DIỄN)
- [ ] Đã cài đặt sẵn extension **Playwright Test for VSCode** và cấu hình trong IDE Google Antigravity / Claude Code.
- [ ] Đã kiểm tra đường dẫn URL trang Staging hoặc Localhost của FTI-AM hoạt động ổn định.
- [ ] Đã lưu sẵn 3 đoạn Prompts mẫu (Prompt 2, Prompt 4, Prompt 6) vào một file ghi chú riêng để lúc trình diễn chỉ cần copy-paste cực nhanh, không phải gõ tay.
- [ ] Đã chuẩn bị sẵn 1 nhánh Git hoặc 1 file giả lập lỗi (Mock status 500) để đảm bảo 100% lúc chạy Prompt 4 ra đúng 5 lỗi kịch tính như kịch bản!

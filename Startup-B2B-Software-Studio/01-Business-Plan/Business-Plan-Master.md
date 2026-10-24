# 🏢 BẢN KẾ HOẠCH KINH DOANH MASTER: BOUTIQUE B2B SOFTWARE STUDIO
### Chiến Lược Khởi Sự, Triển Khai & Vận Hành Doanh Nghiệp Phần Mềm Quản Trị SME
> **Ban Điều Hành:**  
> - **Senior CEO & Strategic Advisor:** Coach Anh  
> - **Co-Founder & Chief Technology Officer (The Builder):** `tibe2109`  
> - **Co-Founder & Head of Business Development (The Hustler):** [Tuyển chọn đối tác liên danh]  
> **Tài liệu tham chiếu:** [`00-HQ-Mission-Control.md`](file:///d:/Solution/Person-develop/Startup-B2B-Software-Studio/00-HQ-Mission-Control.md)

---

## 🎯 PHẦN 1: TỔNG QUAN CHIẾN LƯỢC & ĐỊNH VỊ THỊ TRƯỜNG

### 1.1. Bối Cảnh Thị Trường Doanh Nghiệp Vừa & Nhỏ (SME)
Hầu hết các kỹ sư phần mềm giỏi khi tách ra mở "Software House" đều gặp thất bại sau 12–18 tháng vì rơi vào 4 cái bẫy:
1. **Bẫy "Nhận Mọi Thể Loại" (Generalist Trap):** Hôm nay làm app hẹn hò, ngày mai làm web bán hàng, ngày kia làm landing page. Hậu quả: Không tích lũy được tài sản công nghệ dùng lại (Reusable Assets), mỗi dự án đều phải đập đi xây lại từ đầu, chi phí sản xuất phình to.
2. **Bẫy "Bán Giờ Công" (Man-Month/Hourly Rate Trap):** Định giá theo ngày công/giờ công khiến khách hàng luôn coi công ty là "đơn vị làm thuê gia công rẻ rúng", liên tục ép giá và so sánh với freelancer.
3. **Bẫy "Scope Creep" (Phình Phạm Vi Dự Án):** Doanh nghiệp SME không biết họ thực sự cần gì, ký hợp đồng trọn gói (Fixed-Price) rồi liên tục đổi ý, đòi sửa tính năng vô hạn khiến dự án kéo dài 6-9 tháng, lỗ nặng và vắt kiệt sức đội ngũ dev.
4. **Bẫy "Chết Trên Đống Công Nợ" (Cashflow Paralysis):** Khách hàng dây dưa nghiệm thu đợt cuối (30-50%), trong khi chi phí server, lương nhân sự vẫn phải chi đều hàng tháng.

### 1.2. Định Vị Khác Biệt: "Boutique B2B Operations Software Studio"
Thay vì là một "xưởng gia công phần mềm", chúng ta định vị là **Boutique Tech Studio may đo giải pháp Quản trị Vận hành & Tự động hóa Kinh doanh** cho phân khúc khách hàng mục tiêu:
- **Khách hàng mục tiêu:** Doanh nghiệp vừa và nhỏ (SME), chuỗi bán lẻ, xưởng sản xuất, công ty phân phối B2B có từ 10 - 150 nhân sự.
- **Hiện trạng khách hàng:** Đang quản lý bằng Excel/Google Sheets rời rạc gây thất thoát dữ liệu; hoặc đã dùng phần mềm đóng gói (như Misa, KiotViet, Odoo) nhưng bị "chật chội" vì không thể tùy biến theo quy trình đặc thù của doanh nghiệp.
- **Tuyên ngôn giá trị độc nhất (UVP):**  
  > *"Chúng tôi không bán tính năng phần mềm. Chúng tôi loại bỏ 80% tác vụ thủ công lặp lại, chặn đứng 100% rò rỉ dữ liệu kho - tài chính và bàn giao hệ thống may đo chuẩn xác trong 4–8 tuần với chi phí chỉ bằng 1/3 việc tự nuôi đội ngũ IT in-house."*

---

## 📦 PHẦN 2: DANH MỤC GIẢI PHÁP & CẤU TRÚC SẢN PHẨM 3 TẦNG

Để xóa bỏ hoàn toàn rủi ro làm không công và tạo dòng tiền định kỳ (Recurring Revenue), toàn bộ dịch vụ được đóng gói thành **3 Tầng Sản Phẩm Chuẩn Hóa**:

```
CẤU TRÚC DỊCH VỤ 3 TẦNG (VALUE LADDER)
├── TẦNG 1: DISCOVERY & BLUEPRINT SPRINT (Tư vấn & Thiết kế kiến trúc có thu phí)
│   └── 15 – 30 Triệu VNĐ | Thời gian: 7 – 10 ngày | Deliverable: SRS, Wireframe, Data Schema
├── TẦNG 2: MODULAR BUSINESS ENGINE BUILD (Triển khai hệ thống may đo lõi)
│   └── 60 – 180 Triệu VNĐ | Thời gian: 4 – 8 tuần | Dựa trên 70% Reusable Core + 30% Custom
└── TẦNG 3: MANAGED EVOLUTION & RETAINER SLA (Vận hành, bảo trì & tối ưu định kỳ)
    └── 8 – 20 Triệu VNĐ / tháng | Đảm bảo uptime, backup, tối ưu tính năng nhỏ & bảo mật
```

### 2.1. Tầng 1: `Discovery & Blueprint Sprint` (Lá Chắn Chống Rủi Ro)
- **Quy tắc vàng:** **TUYỆT ĐỐI CẤM** viết tài liệu đặc tả, vẽ luồng hệ thống hoặc tư vấn sâu miễn phí trước khi khách ký hợp đồng.
- **Nội dung gói:**
  - Khảo sát sâu 3 buổi với CEO/Trưởng bộ phận vận hành để "bắt bệnh" quy trình.
  - Xây dựng bản thiết kế quy trình số hóa chuẩn (To-Be Process Flow).
  - Bản vẽ giao diện mẫu tương tác (Clickable Wireframe / UI Mockup trên Figma).
  - Bản đặc tả chức năng (SRS) và Kiến trúc Cơ sở dữ liệu (Database Schema).
- **Giá trị kinh doanh:** Doanh nghiệp dù không làm tiếp với chúng ta vẫn sở hữu một bản thiết kế chuẩn xác để tự triển khai. Nếu làm tiếp Tầng 2, chúng ta **khấu trừ 50% chi phí này** vào hợp đồng chính.

### 2.2. Tầng 2: `Modular Business Engine Build` (Giải Pháp Lõi May Đo)
Tập trung vào 4 dòng bài toán thực chiến mà doanh nghiệp sẵn sàng chi tiền ngay lập tức:
1. **Hệ thống Quản Trị Kho Vận & Phân Phối Đa Kênh (Omnichannel Inventory & Order Hub):** Đồng bộ tồn kho thời gian thực, quản lý hạn dùng/lô hàng, tự động cảnh báo mức tồn kho an toàn, tích hợp sàn TMĐT/đơn vị vận chuyển (GHN, GHTK, Viettel Post).
2. **Hệ thống Tự Động Hóa Bán Hàng B2B & Quản Trị Công Nợ (B2B CRM & Debt Tracker):** Quản lý phễu khách hàng doanh nghiệp, theo dõi hạn mức tín dụng/công nợ của từng đại lý, tự động xuất hóa đơn và nhắc nợ đa kênh (Zalo ZNS, SMS, Email).
3. **Internal Operation & Workflow Automation (Cổng Vận Hành Nội Bộ & Phê Duyệt):** Số hóa phiếu đề xuất, quy trình duyệt chi nhiều cấp, tính hoa hồng động cho nhân viên kinh doanh, quản lý tài sản nội bộ.
4. **Executive Real-time Dashboard & AI Insights:** Trung tâm chỉ huy số cho Ban Giám đốc với báo cáo trực quan P&L, dòng tiền, tốc độ quay vòng hàng tồn kho, tự động gửi báo cáo tóm tắt hàng ngày về Telegram/Zalo của CEO.

### 2.3. Tầng 3: `Managed Evolution & Retainer SLA` (Dòng Tiền Đều MRR)
- **Bản chất:** Sau khi bàn giao, phần mềm không bao giờ "đứng yên". Doanh nghiệp luôn cần chỉnh sửa báo cáo thuế, thêm quyền nhân viên, sao lưu dữ liệu, bảo mật server.
- **Gói Retainer:** Thu phí cố định hàng tháng (8 - 15tr/tháng) bao gồm:
  - Giám sát hệ thống 24/7, cam kết Uptime 99.9%.
  - Sao lưu dữ liệu đa vùng hàng ngày (Automated Backup & Disaster Recovery).
  - 10 - 20 giờ làm việc/tháng để tinh chỉnh báo cáo, UI nhỏ hoặc đào tạo nhân sự mới.
  - *Hiệu quả tài chính:* Chỉ cần có **10 khách hàng Retainer**, studio đã có **100 triệu VNĐ/tháng** dòng tiền thụ động cố định để trang trải toàn bộ chi phí vận hành cơ bản!

---

## ⚙️ PHẦN 3: DÂY CHUYỀN SẢN XUẤT AI-DRIVEN & VŨ KHÍ TÁI SỬ DỤNG

```
DÂY CHUYỀN SẢN XUẤT PHẦN MỀM CHUẨN HÓA (AI-DRIVEN DELIVERY PIPELINE)
[Khách Hàng Ký HĐ] 
   └── 1. Spec First: Tạo Schema & API Spec chuẩn (Prisma/OpenAPI)
   └── 2. Reusable Modular Core: Lắp ghép Auth, Multi-tenant, RBAC, Storage, Queue
   └── 3. Vibe Coding & AI Scaffolding: Sinh 70% Boilerplate CRUD & UI bằng AI
   └── 4. Playwright Automated Quality Gate: Chạy 100% E2E Test & Regression
   └── 5. Instant Deployment: CI/CD Docker hóa lên Cloud (Coolify / Hetzner / AWS)
```

### 3.1. Chiến Lược "Single-Stack"
Studio chuẩn hóa 1 bộ công nghệ duy nhất để đạt tốc độ tối đa:
- **Backend:** Node.js (NestJS / TypeScript) đồng nhất toàn hệ thống.
- **Frontend:** Next.js (React 19) + Tailwind CSS + Shadcn UI (Giao diện tinh gọn, chuẩn corporate B2B, phản hồi nhanh).
- **Database:** PostgreSQL (Hỗ trợ JSONB linh hoạt, Transaction ACID an toàn tuyệt đối cho tài chính).
- **ORM / Data Access:** Prisma ORM hoặc Drizzle (Type-safe từ DB lên UI).
- **Hạ tầng & Triển khai:** Docker Container + Coolify trên VPS Hetzner/DigitalOcean (Chi phí chỉ 20-50$/tháng nhưng chịu tải mượt mà cho hàng trăm nhân viên SME).

### 3.2. Vũ Khí Bí Mật: "Boutique Enterprise Starter-Kit" (Reusable Core)
Xem đặc tả kỹ thuật chi tiết tại:  
👉 [`02-Engineering-Architecture/Enterprise-Starter-Kit-Spec.md`](file:///d:/Solution/Person-develop/Startup-B2B-Software-Studio/02-Engineering-Architecture/Enterprise-Starter-Kit-Spec.md)

### 3.3. Dây Chuyền AI-Driven & Kiểm Thử Tự Động Playwright
- **Spec-to-Code:** Sử dụng AI để sinh mã các bảng dữ liệu, DTO, Service CRUD từ Database Schema đã thống nhất.
- **Lá chắn chất lượng Playwright E2E:** Tận dụng chuyên môn sâu về Playwright AI Automation để viết sẵn các bộ kiểm thử luồng nghiệp vụ quan trọng (Tạo đơn -> Xuất kho -> Ghi nợ -> Thu tiền).
  - Không bao giờ để khách hàng làm "tester bất đắc dĩ".
  - Trước mỗi buổi demo, toàn bộ test suite phải xanh 100%. Đây là thứ tạo nên uy tín vượt trội so với các nhóm dev làm ẩu.

---

## 🤝 PHẦN 4: LIÊN DANH "THE BUILDER & THE HUSTLER" & GO-TO-MARKET

Xem chi tiết quy chế liên danh tại:  
👉 [`04-Go-To-Market-Sales/Builder-Hustler-Alliance.md`](file:///d:/Solution/Person-develop/Startup-B2B-Software-Studio/04-Go-To-Market-Sales/Builder-Hustler-Alliance.md)

| Tiêu Chí | The Builder (Em - CTO / Head of Solution) | The Hustler (Co-founder / Head of Business) |
| :--- | :--- | :--- |
| **Tính cách** | Hướng nội (INFP/INTJ), sâu sắc, trung thực, logic | Hướng ngoại (ENTJ/ESTP), nhạy bén, đàm phán, kết nối |
| **Trách nhiệm** | Lắng nghe nỗi đau kỹ thuật, thiết kế giải pháp, dựng demo, quản trị dây chuyền dev, đảm bảo hệ thống chạy mượt | Đi tìm khách hàng, uống café/nhậu ngoại giao, pitching, chốt giá, quản trị quan hệ, đòi công nợ |
| **Cơ chế phân chia** | **50% - 60% Doanh thu** (Phụ trách chi phí sản xuất & kỹ thuật) | **40% - 50% Doanh thu** (Hưởng hoa hồng kinh doanh & đối ngoại) |
| **Ý nghĩa** | Được bảo vệ không gian tĩnh lặng để xây dựng công nghệ đỉnh cao | Có sản phẩm chất lượng vượt trội để tự tin "chinh chiến" thị trường |

---

## 💰 PHẦN 5: ĐỊNH GIÁ THEO GIÁ TRỊ & QUẢN TRỊ DÒNG TIỀN THÉP

Xem chi tiết cơ chế tại:  
👉 [`01-Business-Plan/Value-Pricing-Playbook.md`](file:///d:/Solution/Person-develop/Startup-B2B-Software-Studio/01-Business-Plan/Value-Pricing-Playbook.md)

### Nguyên Tắc Thanh Toán 4 Mốc Vàng (Chặn Đứng Bùng Tiền)
**TUYỆT ĐỐI KHÔNG BẮT ĐẦU CODE KHI CHƯA CÓ TIỀN VÀO TÀI KHOẢN:**

| Mốc | Tỷ Lệ | Điều Kiện Kích Hoạt | Biện Pháp Bảo Vệ Bản Quyền |
| :---: | :---: | :--- | :--- |
| **Mốc 1** | **40%** | Ngay khi ký hợp đồng & thống nhất SRS | Giữ chi phí cơ bản, cam kết lịch trình |
| **Mốc 2** | **30%** | Demo hoàn tất các tính năng cốt lõi (Core UAT) | Chạy thử nghiệm trên Staging Server nội bộ của Studio |
| **Mốc 3** | **20%** | Triển khai Go-Live cho nhân sự khách hàng dùng thực tế | Khách vận hành thực tế nhưng dữ liệu và server do Studio quản trị quyền Root |
| **Mốc 4** | **10%** | Nghiệm thu cuối cùng sau 30 ngày vận hành ổn định | Bàn giao Source Code / Root Access / Chuyển giao toàn quyền |

---

## 📊 PHẦN 6: KẾ HOẠCH TÀI CHÍNH NĂM 1 (P10 / P50 / P90)

```
DỰ TOÁN TÀI CHÍNH NĂM THỨ NHẤT (NĂM 1)
---------------------------------------------------------------------------------
Chỉ Số Tài Chính               | Kịch Bản P10 (Tối thiểu) | Kịch Bản P50 (Khả dĩ) | Kịch Bản P90 (Bứt phá)
---------------------------------------------------------------------------------
Số lượng Dự Án Tầng 1 (Blueprint)| 4 dự án (60tr)           | 8 dự án (160tr)       | 12 dự án (300tr)
Số lượng Dự Án Tầng 2 (Custom)   | 2 dự án (180tr)          | 5 dự án (500tr)       | 8 dự án (960tr)
Khách hàng Tầng 3 (Retainer SLA) | 2 khách (150tr/năm)      | 5 khách (450tr/năm)   | 8 khách (800tr/năm)
---------------------------------------------------------------------------------
TỔNG DOANH THU (REVENUE)         | 390.000.000 VNĐ          | 1.110.000.000 VNĐ     | 2.060.000.000 VNĐ
Chi phí vận hành & Tooling       | 60.000.000 VNĐ           | 90.000.000 VNĐ        | 150.000.000 VNĐ
Phí chia sẻ Hustler / Outsource | 150.000.000 VNĐ          | 450.000.000 VNĐ       | 850.000.000 VNĐ
---------------------------------------------------------------------------------
LỢI NHUẬN RÒNG FOUNDER (THE BUILDER)| ~180.000.000 VNĐ       | ~570.000.000 VNĐ      | ~1.060.000.000 VNĐ
(Thu nhập bình quân hàng tháng) | (15 tr/tháng)            | (47.5 tr/tháng)       | (88.3 tr/tháng)
---------------------------------------------------------------------------------
```

---

## 🗺️ PHẦN 7: LỘ TRÌNH THỰC THI 3 GIAI ĐOẠN

Xem lộ trình 36 tháng chi tiết tại:  
👉 [`06-Roadmap-Milestones/36-Month-Execution-Roadmap.md`](file:///d:/Solution/Person-develop/Startup-B2B-Software-Studio/06-Roadmap-Milestones/36-Month-Execution-Roadmap.md)

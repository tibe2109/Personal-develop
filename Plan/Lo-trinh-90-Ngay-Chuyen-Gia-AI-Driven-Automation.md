# 🎓 GIÁO TRÌNH 90 NGÀY: CHINH PHỤC VỊ THẾ CHUYÊN GIA AI-DRIVEN AUTOMATION
> **Hệ Thống Đào Tạo & Thực Chiến Cao Cấp (Academic Rigor & Battle-Tested Engineering)**  
> **Người hướng dẫn:** Giáo sư AI / Coach Anh (Senior AI Systems Architect & Doctoral Fellow)  
> **Nghiên cứu sinh / Kỹ sư trưởng:** Hoàng Anh (`tibe2109` — 7 năm IT thực chiến)  
> **Tôn chỉ:** *"First Principles & Proof-of-Work Supremacy" — Hiểu bản chất từ gốc rễ toán học/hệ thống, chứng minh năng lực bằng phần mềm chạy thực tế trên Production.*

---

## 🏛️ I. ĐỊNH NGHĨA CHÂN DUNG CHUYÊN GIA (TARGET STATE)

Một **Chuyên gia AI-Driven Automation** đẳng cấp quốc tế KHÔNG PHẢI là người biết gõ prompt nhờ AI viết vài đoạn mã vụn vặt. Họ là **Kiến trúc sư hệ thống tự động hóa thế hệ mới (Agentic Systems Architect)**, sở hữu 6 trụ cột năng lực cốt lõi:

```
                      ┌──────────────────────────────────────────────┐
                      │   AI-DRIVEN AUTOMATION ARCHITECT (TARGET)    │
                      └──────────────────────┬───────────────────────┘
                                             │
      ┌──────────────────┬───────────────────┼───────────────────┬──────────────────┐
      ▼                  ▼                   ▼                   ▼                  ▼
┌───────────┐      ┌───────────┐       ┌───────────┐       ┌───────────┐      ┌───────────┐
│ 1. Context│      │ 2. Tool & │       │ 3. Agentic│       │ 4. Quality│      │ 5. Evals  │
│Engineering│      │ MCP Inter.│       │ Workflows │       │ Automation│      │ & Metrics │
└───────────┘      └───────────┘       └───────────┘       └───────────┘      └───────────┘
```

1. **Context & Token Engineering:** Nắm vững cơ chế Attention, Tokenomics, In-context Learning, Deterministic Guardrails (Pydantic / JSON Schema).
2. **Tool Use & MCP Architecture:** Làm chủ Model Context Protocol (MCP), xây dựng hạ tầng kết nối AI với Browser, Database, OS và Internal APIs.
3. **Agentic Workflows & Multi-Agent Loops:** Thiết kế các vòng lặp tự trị (Planning, Execution, Critique, Self-Correction) hoạt động ổn định và tin cậy.
4. **Industrial Quality & Playwright Automation:** Tự động hóa kiểm thử từ tài liệu yêu cầu (URD) đến kịch bản E2E Playwright chuẩn Page Object Model, tự phục hồi lỗi (Self-Healing).
5. **Production CI/CD Quality Gates:** Đưa AI trở thành rào chắn chất lượng tự động trong Git pipeline (Review PR, phát hiện regression bugs).
6. **Evals & Benchmark Rigor:** Đánh giá hệ thống tự động hóa bằng bộ dữ liệu chuẩn (Golden Datasets), đo lường độ trễ, chi phí và tỷ lệ ảo giác (Hallucination Rate).

---

## 🗓️ II. LỘ TRÌNH 3 CHẶNG (90 NGÀY / 12 TUẦN)

```
┌────────────────────────────────────────────────────────────────────────────────────────┐
│ CHẶNG 1 (NGÀY 1 - 30): FOUNDATION & INDUSTRIAL TESTING AUTOMATION                       │
│ ➔ Mục tiêu: Làm chủ First Principles, Tool Use & Xây dựng Framework Playwright AI QA   │
├────────────────────────────────────────────────────────────────────────────────────────┤
│ CHẶNG 2 (NGÀY 31 - 60): ENTERPRISE MCP & ADVANCED AGENTIC SYSTEM DESIGN                │
│ ➔ Mục tiêu: Xây dựng Custom MCP Servers, Multi-Agent Loops & Tích hợp CI/CD Doanh nghiệp│
├────────────────────────────────────────────────────────────────────────────────────────┤
│ CHẶNG 3 (NGÀY 61 - 90): PRODUCTION EVALS, PROOF-OF-WORK PORTFOLIO & COMMERCIALIZATION  │
│ ➔ Mục tiêu: Evals Benchmark, Đóng gói Open-Source, Authority LinkedIn & Offer 35-40tr  │
└────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### 🔹 CHẶNG 1: FOUNDATION & INDUSTRIAL TESTING AUTOMATION (NGÀY 1 – 30)
*Mục tiêu: Xóa bỏ tư duy prompt tùy tiện; thiết lập nền tảng kỹ thuật chính xác tuyệt đối; xây dựng vũ khí Playwright AI phục vụ trực tiếp dự án FTI-AM.*

#### Tuần 1 (Ngày 1 - 7): First Principles của Large Language Models & Deterministic Control
- **Lý thuyết bản chất:**
  - Kiến trúc Transformer, cơ chế Next-Token Prediction, Temperature, Top-p. Vì sao LLM có tính ngẫu nhiên (Stochastic) và cách triệt tiêu ảo giác trong tự động hóa.
  - Context Window Management: Kỹ thuật nén ngữ cảnh (Context Compression), Token Budgeting và Prompt Caching.
  - Structured Outputs: Buộc LLM phản hồi chính xác 100% theo JSON Schema, Zod, Pydantic.
- **Thực chiến (Hands-on):**
  - Xây dựng module trích xuất logic nghiệp vụ từ file tài liệu thô thành Data Contract JSON có validation schema nghiêm ngặt.
- **Sản phẩm bàn giao (Deliverable):** Bộ parser tài liệu đặc tả nghiệp vụ không thể gãy format.

#### Tuần 2 (Ngày 8 - 14): Function Calling, Tool Use & Giao thức Trình duyệt
- **Lý thuyết bản chất:**
  - Nguyên lý hoạt động của Function Calling (OpenAI / Gemini / Anthropic spec).
  - Vòng lặp: Prompt ➔ Model Request Tool ➔ Client Executes Tool ➔ Model Interprets Result.
  - Trình duyệt không đầu (Headless Browser) & Kiến trúc Playwright: DevTools Protocol (CDP), Accessibility Tree (AOM) vs DOM Tree.
- **Thực chiến (Hands-on):**
  - Viết AI Tool Agent có khả năng nhận một câu lệnh tự nhiên (ví dụ: *"Đăng nhập tài khoản X và kiểm tra thông báo"*) và tự động kích hoạt Playwright thao tác trên trang web.
- **Sản phẩm bàn giao (Deliverable):** Kịch bản browser automation điều khiển bằng Natural Language.

#### Tuần 3 (Ngày 15 - 21): Dự Án Cốt Lõi 1 — `AI-URD-To-Industrial-Automation` (Phase 1)
- **Lý thuyết bản chất:**
  - Quy chuẩn thiết kế Page Object Model (POM) cấp doanh nghiệp: Tách bạch giữa Locators, Actions và Assertions.
  - Kỹ thuật Dynamic Selector Generation: Ưu tiên Accessibility Role, Data-Test-ID, aria-label thay vì XPath giòn dễ vỡ.
- **Thực chiến (Hands-on):**
  - Đưa 1 bản tài liệu URD thật của dự án FTI-AM vào pipeline: AI tự động phân tích ma trận ca kiểm thử (Test Matrix) ➔ Sinh toàn bộ source code Playwright TypeScript theo đúng chuẩn POM của dự án.
- **Sản phẩm bàn giao (Deliverable):** Bộ test suite Playwright E2E hoàn chỉnh chạy xanh (Green Pass) 100% trên môi trường dev/staging.

#### Tuần 4 (Ngày 22 - 30): Self-Healing Test Automation Loops
- **Lý thuyết bản chất:**
  - Closed-Loop Feedback: Cơ chế quan sát lỗi (Runtime Error Observation) ➔ Phân tích Trace / Screenshot / DOM Snapshot ➔ Tự chữa lành kịch bản test (Self-Healing).
- **Thực chiến (Hands-on):**
  - Giả lập việc giao diện thay đổi (đổi ID, đổi vị trí nút bấm). Xây dựng vòng lặp AI tự động bắt exception, quét lại Accessibility Tree, đề xuất locator mới và cập nhật file test mà không cần can thiệp thủ công.
- **Sản phẩm bàn giao (Deliverable):** Framework Playwright có khả năng tự vá lỗi locator khi UI thay đổi.

---

### 🔹 CHẶNG 2: ENTERPRISE MCP & AGENTIC WORKFLOW DESIGN (NGÀY 31 – 60)
*Mục tiêu: Nâng tầm từ Script Automation lên Kiến trúc Đa tác tử (Multi-Agent Architecture) và chuẩn công nghiệp Model Context Protocol (MCP).*

#### Tuần 5 (Ngày 31 - 37): Model Context Protocol (MCP) Chuẩn Quốc Tế
- **Lý thuyết bản chất:**
  - Giao thức MCP của Anthropic: Client - Host - Server architecture.
  - Resources, Tools, Prompts trong MCP. Vì sao MCP trở thành chuẩn kết nối toàn cầu giữa AI và hệ sinh thái phần mềm.
- **Thực chiến (Hands-on):**
  - Tự lập trình 1 Custom MCP Server (bằng Node.js hoặc Python) cung cấp công cụ tương tác trực tiếp với Database PostgreSQL/MySQL hoặc hệ thống vé Jira/FTI.
- **Sản phẩm bàn giao (Deliverable):** Custom MCP Server chạy độc lập, tích hợp mượt mà vào Claude Code / Antigravity.

#### Tuần 6 (Ngày 38 - 44): Thiết Kế Agentic Workflows & Multi-Agent Orchestration
- **Lý thuyết bản chất:**
  - Các mẫu thiết kế Agentic kinh điển: ReAct (Reasoning + Acting), Reflection (Tự phản tỉnh), Plan-and-Solve, Multi-Agent Collaboration.
  - Quản lý trạng thái (State Management) và Working Memory trên đĩa (Planning-with-files).
- **Thực chiến (Hands-on):**
  - Xây dựng một quy trình phối hợp 3 tác tử:
    1. *Architect Agent:* Đọc yêu cầu và lập kế hoạch kiểm thử chi tiết.
    2. *Coder Agent:* Viết mã nguồn kịch bản test.
    3. *Reviewer Agent:* Kiểm tra code quality, bảo mật và chuẩn POM.
- **Sản phẩm bàn giao (Deliverable):** Multi-Agent CLI tool tự động hóa quy trình QA từ đầu đến cuối.

#### Tuần 7 (Ngày 45 - 51): Dự Án Cốt Lõi 2 — AI SDLC Quality Gates & CI/CD Pipeline
- **Lý thuyết bản chất:**
  - Đưa AI vào chu trình CI/CD: Automated Code Review, Security Vulnerability Scanning, Flaky Test Detection.
  - GitHub Actions / GitLab CI pipeline triggers và webhook handlers.
- **Thực chiến (Hands-on):**
  - Thiết lập GitHub Action: Mỗi khi có Pull Request mới, AI tự động kích hoạt Playwright chạy regression test, tổng hợp kết quả và post bình luận báo cáo chi tiết kèm ảnh chụp màn hình lỗi lên PR.
- **Sản phẩm bàn giao (Deliverable):** Pipeline CI/CD hoàn chỉnh có AI làm lính gác cổng chất lượng.

#### Tuần 8 (Ngày 52 - 60): Enterprise Workflow Automation cho Khởi Nghiệp B2B Studio
- **Lý thuyết bản chất:**
  - Kiến trúc tự động hóa quy trình nghiệp vụ (Business Process Automation - BPA) cho doanh nghiệp vừa và nhỏ (SME).
  - Tích hợp AI Agent với n8n, Webhook, Cloudflare Workers và Transactional Services (Stripe, Google Workspace, CRM).
- **Thực chiến (Hands-on):**
  - Xây dựng 1 giải pháp B2B mẫu: Hệ thống tự động thẩm định và trích xuất hợp đồng/hóa đơn PDF, kiểm tra tính hợp lệ và tự động đồng bộ lên hệ thống kế toán.
- **Sản phẩm bàn giao (Deliverable):** Sản phẩm Demo hoàn chỉnh cho danh mục dịch vụ của B2B Software Studio.

---

### 🔹 CHẶNG 3: PRODUCTION EVALS, PORTFOLIO ASSETIZATION & AUTHORITY (NGÀY 61 – 90)
*Mục tiêu: Đóng gói thành tựu thành tài sản thực chứng (Proof-of-Work), xây dựng uy tín cá nhân và bứt phá mức thu nhập 35-40 triệu/tháng.*

#### Tuần 9 (Ngày 61 - 67): LLM Evals, Benchmarking & Ground Truth
- **Lý thuyết bản chất:**
  - Vì sao "nhìn có vẻ chạy được" (Vibe check) là cạm bẫy chết người của dân nghiệp dư.
  - Xây dựng bộ đánh giá định lượng (Quantitative Evals): Precision, Recall, Semantic Similarity, Assertion Accuracy.
  - Xây dựng Golden Dataset gồm 50-100 ca thử thách khó nhất.
- **Thực chiến (Hands-on):**
  - Chạy benchmark đánh giá tỷ lệ thành công của hệ thống AI Test Generator trên Golden Dataset; tối ưu tỷ lệ đạt từ 70% lên > 95%.
- **Sản phẩm bàn giao (Deliverable):** Bảng báo cáo Benchmark số liệu chuẩn mực quốc tế (Eval Scorecard).

#### Tuần 10 (Ngày 68 - 74): Tối Ưu Hóa Chi Phí, Độ Trễ & Resiliency
- **Lý thuyết bản chất:**
  - Chiến lược định tuyến mô hình (Model Routing): Dùng mô hình siêu tốc/rẻ (Flash / Haiku) cho 80% tác vụ lọc/phân loại, dành mô hình mạnh (Pro / Sonnet) cho 20% tư duy sâu.
  - Exponential Backoff, Rate-limit handling, Fallback providers.
- **Thực chiến (Hands-on):**
  - Tối ưu hóa hệ thống automation giảm 60% chi phí token và giảm 50% thời gian thực thi (Latency).
- **Sản phẩm bàn giao (Deliverable):** Production Architecture tối ưu chi phí & sẵn sàng mở rộng quy mô.

#### Tuần 11 (Ngày 75 - 82): Đóng Gói Proof-of-Work & Open-Source Authority
- **Lý thuyết bản chất:**
  - Nghệ thuật biến kinh nghiệm thực chiến thành nam châm thu hút cơ hội (Inbound Magnetic Assets).
  - Cấu trúc 1 GitHub Repository chuẩn quốc tế: Clean Architecture, Documentation, Architecture Diagram, CI Badge, Demo GIF.
- **Thực chiến (Hands-on):**
  - Đóng gói toàn bộ framework `Industrial-Playwright-AI-Engine` thành open-source repo sạch đẹp.
  - Viết 1 bài Technical Case Study sâu sắc trên LinkedIn phân tích: *"Làm thế nào tôi tự động hóa 80% quy trình kiểm thử E2E bằng Playwright & AI Agent"*.
- **Sản phẩm bàn giao (Deliverable):** 1 GitHub Repo chuẩn sao + 1 Bài phân tích chuyên môn thu hút Tech Leads/Headhunters.

#### Tuần 12 (Ngày 83 - 90): Diễn Tập Phỏng Vấn, Đàm Phán Lương & Bứt Phá Vị Thế
- **Lý thuyết bản chất:**
  - Định giá theo giá trị mang lại (Value-Based Pricing): Cách chứng minh giải pháp tự động hóa giúp doanh nghiệp tiết kiệm 300-500 triệu/năm.
  - Phỏng vấn bằng Live Demo và Architecture Diagram thay vì giải thuật hàn lâm.
- **Thực chiến (Hands-on):**
  - Diễn tập phỏng vấn kỹ thuật vị trí Senior AI Tech Lead / Automation Architect (bằng tiếng Anh và tiếng Việt theo chuẩn STAR).
  - Hoàn thiện CV và hồ sơ ứng tuyển vào các công ty Global hoặc các dự án B2B Enterprise.
- **Sản phẩm bàn giao (Deliverable):** Bộ hồ sơ ứng tuyển hoàn hảo đè bẹp bằng cấp + Tự tin bước vào mức lương 35-40tr/tháng.

---

## ⚡ III. GIAO THỨC HUẤN LUYỆN HÀNG NGÀY (DAILY RITUAL: 45 - 60 PHÚT)

Mỗi ngày, hai thầy trò chúng ta sẽ duy trì kỷ luật thép qua **Khung Huấn Luyện 4 Bước (The 4-Step Fellowship)**:

```
┌────────────────────────────────────────────────────────────────────────┐
│ BƯỚC 1 (5 PHÚT): FIRST PRINCIPLES CHECK ➔ Khảo sát câu hỏi bản chất    │
│ BƯỚC 2 (15 PHÚT): DEEP ARCHITECTURE LECTURE ➔ Phân tích cơ chế sâu    │
│ BƯỚC 3 (25 PHÚT): HANDS-ON COMBAT ➔ Viết mã, chạy test, sửa lỗi thật   │
│ BƯỚC 4 (5 PHÚT): PROOF-OF-WORK AUDIT ➔ Đánh giá kết quả & giao nhiệm vụ│
└────────────────────────────────────────────────────────────────────────┘
```

- **Nguyên tắc bảo vệ hệ thần kinh:** Mỗi ngày chỉ chinh phục **đúng 1 khái niệm bản chất** và **1 nhiệm vụ vi mô (Micro-action)**. Tuyệt đối không nhồi nhét lý thuyết suông để tránh làm Amygdala bị quá tải.
- **Lá chắn thực chiến:** Mọi dòng code học được đều phải nhắm vào mục tiêu ứng dụng ngay cho công việc tại FTI-AM hoặc làm giàu thêm B2B Software Studio.

---

## 🎯 IV. LỜI TUYÊN THỆ CỦA GIÁO SƯ AI

> *"Hoàng Anh, tôi không ở đây để dạy bạn những chiêu trò mẹo vặt của kẻ lướt sóng AI. Tôi ở đây để cùng bạn rèn giũa bản lĩnh của một Kiến trúc sư tự động hóa chân chính. 7 năm kinh nghiệm thực chiến trong bùn lầy dự án của bạn chính là mảnh đất màu mỡ nhất mà không một tấm bằng đại học lý thuyết nào sánh bằng. Hãy trao cho tôi 45-60 phút tập trung mỗi ngày, và sau 90 ngày, cả ngành công nghệ sẽ phải nhìn bạn bằng con mắt hoàn toàn khác!"*

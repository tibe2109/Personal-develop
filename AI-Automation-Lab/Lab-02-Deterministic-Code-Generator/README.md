# 🔬 LAB 02: TỪ DATA CONTRACT ĐẾN MÃ NGUỒN TẤT ĐỊNH — TOKENOMICS & COMPILATION ARCHITECTURE
> **Giáo trình:** 90 Ngày Chuyên Gia AI-Driven Automation  
> **Chủ đề:** Tokenomics, Quản trị Cửa sổ Ngữ cảnh (Context Budgeting) & Kiến trúc Biên dịch 2 Pha (Reasoning vs Synthesis)  
> **Giảng viên:** Giáo sư AI / Coach Anh (Senior AI Systems Architect)  
> **Nghiên cứu sinh / Kỹ sư trưởng:** Hoàng Anh (`tibe2109` — 7 năm IT thực chiến)  

---

## 🏛️ I. NGUYÊN LÝ ĐỆ NHẤT (FIRST PRINCIPLES)

### 1.1. Ảo tưởng "One-Prompt Code Generation" của Dân Nghiệp Dư
Đa số lập trình viên hiện nay dùng AI bằng cách: Copy toàn bộ tài liệu URD hoặc paste cả file code 1.000 dòng vào ChatGPT/Claude và ra lệnh:
> *"Hãy đọc file này và viết kịch bản Playwright TypeScript hoàn chỉnh chuẩn POM cho tôi."*

Cách làm này thất bại 100% trong môi trường Enterprise vì 3 tử huyệt thần kinh/hệ thống:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ TỬ HUYỆT 1: CONTEXT POISONING & TOKEN BLOAT                                 │
│ ➔ HTML DOM chứa 80% thẻ rác (SVG, Style, class ngẫu nhiên Tailwind).        │
│ ➔ Tốn hàng chục ngàn token, chi phí tăng vọt, tốc độ suy luận giảm 5 - 10x.  │
├─────────────────────────────────────────────────────────────────────────────┤
│ TỬ HUYỆT 2: HIỆN TƯỢNG "LOST IN THE MIDDLE" (LIU ET AL., 2023)              │
│ ➔ Cơ chế Attention của Transformer tập trung mạnh vào đầu và cuối prompt.  │
│ ➔ Các logic rẽ nhánh, edge cases nằm ở giữa tài liệu URD bị mô hình bỏ quên!│
├─────────────────────────────────────────────────────────────────────────────┤
│ TỬ HUYỆT 3: CÚ PHÁP PHI TẤT ĐỊNH (STOCHASTIC CODE SYNTAX)                   │
│ ➔ Yêu cầu LLM sinh trực tiếp code dẫn đến sai lệch import, đặt tên hàm lúc  │
│    thì camelCase, lúc thì snake_case, thiếu types, sai interface Page Object│
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## ⚙️ II. KIẾN TRÚC 2 PHA CỦA KIẾN TRÚC SƯ HỆ THỐNG (TWO-PHASE ARCHITECTURE)

Một **AI Automation Architect** không bao giờ để AI "tự do sáng tác code". Chúng ta phân tách quy trình làm 2 pha độc lập:

```
                  ┌──────────────────────────────────────────────┐
                  │          TÀI LIỆU NGHIỆP VỤ / URD            │
                  └──────────────────────┬───────────────────────┘
                                         │
                                         ▼
     ┌───────────────────────────────────────────────────────────────────────┐
     │ PHA 1: SUY LUẬN NGỮ NGHĨA (PROBABILISTIC REASONING PHASE)             │
     │ - LLM đóng vai trò Domain Reasoner.                                   │
     │ - Rút trích User Intent, Flow, Data Input, Verification Points.       │
     │ - Khóa chặt đầu ra bằng JSON Schema (Đã hoàn thiện ở Lab 01).        │
     └───────────────────────────────────┬───────────────────────────────────┘
                                         │
                                         ▼
                          [TEST SPEC DATA CONTRACT (JSON)]
                                         │
                                         ▼
     ┌───────────────────────────────────────────────────────────────────────┐
     │ PHA 2: BIÊN DỊCH MÃ NGUỒN TẤT ĐỊNH (DETERMINISTIC SYNTHESIS PHASE)    │
     │ - Local AST Engine / Code Generator (Viết bằng JS/TS/Python).        │
     │ - Không dùng AI sinh code trực tiếp!                                  │
     │ - Ánh xạ Data Contract vào Design Pattern: Page Object Model (POM).   │
     │ - Sinh file Page Class (.ts) và Test Spec (.spec.ts) chuẩn 100%.      │
     │ - Tỷ lệ lỗi cú pháp = 0%. Tỷ lệ thiếu Assertion = 0%.                 │
     └───────────────────────────────────────────────────────────────────────┘
```

---

## 📐 III. TOKENOMICS & KỸ THUẬT NÉN NGỮ CẢNH (CONTEXT PRUNING)

### 3.1. Accessibility Tree (AOM) vs DOM Tree
- Một trang web có DOM Tree nặng khoảng 200 KB (~50.000 tokens).
- Nhưng cây Trợ năng (**Accessibility Tree** - AOM) của Playwright chỉ chứa các `role`, `name`, `aria-*`, nặng chưa đến 5 KB (~1.200 tokens).
- **Hệ quả:** Nén **40 lần** kích thước context, loại bỏ toàn bộ HTML rác, giúp LLM nhìn đúng vào bản chất giao diện mà người dùng tương tác!

### 3.2. Semantic Chunking cho URD
- Không bao giờ ném tài liệu URD 50 trang vào một prompt duy nhất.
- Băm nhỏ (Chunk) theo từng **Use Case / Feature Matrix**.
- Mỗi Feature được xử lý độc lập, sinh ra một Test Suite độc lập.

---

## 🛠️ IV. THỰC THI LAB 02: BỘ BIÊN DỊCH DETERMINISTIC SYNTHESIS ENGINE

File thực thi: [`code-generator-engine.js`](file:///media/hoanganh/disk1_vol1/Solution/Personal-develop/AI-Automation-Lab/Lab-02-Deterministic-Code-Generator/code-generator-engine.js)

### Quy trình hoạt động của Engine:
1. **Input:** Nhận Data Contract JSON hợp lệ từ Lab 01.
2. **Page Object Generator:** Tự động nhận diện các hành động trên trang, gom nhóm locators và sinh ra các method nghiệp vụ (Business Actions) trong class POM.
3. **Test Spec Generator:** Sinh kịch bản kiểm thử Playwright TypeScript hoàn chỉnh với:
   - Cấu trúc `test.describe()` và `test()`.
   - Setup fixture `beforeEach()`.
   - Bọc từng thao tác trong `await test.step()`.
   - Assertion chuẩn xác (`expect(locator).toContainText()`, `expect(locator).toBeVisible()`).
4. **Output:** Tự động ghi ra các file TypeScript sẵn sàng chạy với Playwright Runner.

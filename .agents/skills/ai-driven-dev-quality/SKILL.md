---
name: ai-driven-dev-quality
description: Hướng dẫn chuyên sâu & Quy trình Vibe Coding chất lượng cao với AI (Gemini, Claude, GPT). Giúp lập trình viên kiểm soát lỗi, ép AI tuân thủ strict rules, tự động hóa phát triển phần mềm chuẩn xác theo mô tả yêu cầu (Spec).
version: 1.0.0
---

# 🚀 AI-DRIVEN DEVELOPMENT & QUALITY CONTROL (VIBE CODING PRO)

Tài liệu hướng dẫn quy tắc vàng khi làm việc với AI (LLMs) trong phát triển phần mềm, giúp tránh tình trạng AI "chế code" (hallucination), vi phạm business rules, hoặc sinh bug hệ thống.

---

## 🎯 1. NGUYÊN TẮC CỐT LÕI (CORE PRINCIPLES OF VIBE CODING)

1. **AI là Thợ gõ - Bạn là Kiến trúc sư (Human in the Loop):** Không giao khoán 100% logic cho AI mà không có quy định ranh giới (Guardrails).
2. **Context is King (Ngบริ cảnh là Vua):** AI sai rule thường do thiếu context về Data Model, Schema, hoặc Business Constraints.
3. **Phân rã Atomic (Chia để trị):** Không yêu cầu AI viết cả chức năng lớn trong 1 prompt. Chia thành từng module nhỏ, chạy test từng phần (TDD Driven).

---

## 🛡️ 2. QUY TRÌNH 4 BƯỚC ÉP AI VIẾT CODE CHUẨN XÁC

### Bước 1: Chuẩn bị Master Prompt (Spec & Rules Context)
Trước khi bắt AI viết code, cấp cho AI bộ khung **"Rule Boundary"**:
```markdown
[ROLE]: Bạn là Senior Developer chuyên về [Ngôn ngữ/Framework].
[CONTEXT]: Dự án [Tên dự án]. Cấu trúc DB và Schema như sau: [Paste Schema/Types].
[BUSINESS RULES STRICT]:
1. Rule 1: ...
2. Rule 2: ...
[REQUEST]: Hãy viết hàm/component xử lý [Tên chức năng].
[CONSTRAINT]: Tuyệt đối không thay đổi các API signature có sẵn. Viết unit test đi kèm.
```

### Bước 2: Tách biệt Prompt thiết kế & Prompt thực thi
- **Lần 1 (Design Review):** Yêu cầu AI đưa ra *Giải pháp kỹ thuật (Technical Plan)* và *Edge Cases* trước khi viết code.
- **Lần 2 (Implementation):** Khi giải pháp đúng 100%, mới cho AI sinh code.

### Bước 3: Kiểm soát Lỗi với Gemini vs Claude
* **Khi dùng Gemini:** Gemini rất mạnh về tốc độ và tổng hợp nhưng hay bỏ sót các rule nhỏ nếu prompt dài. 
  * *Mẹo:* Luôn thêm câu lệnh: `"Hãy kiểm tra lại từng business rule trên và xác nhận xem code của bạn đã đáp ứng đủ 100% chưa trước khi trả lời."`
* **Khi dùng Claude:** Claude làm việc về logic và refactor tỉ mỉ hơn. 
  * *Mẹo:* Đưa đoạn code Gemini vừa sinh cho Claude review: `"Hãy audit đoạn code này xem có vi phạm edge cases hay business rules nào dưới đây không?"`

### Bước 4: Tự động hóa Test & Code Verification
- Sử dụng **Playwright / Jest / Pytest** viết kịch bản test tự động.
- Cho AI tự đọc log lỗi khi test fail để tự sửa (Self-Healing Code Loop).

---

## 🛠️ 3. CHECKLIST KIỂM TRÁI CHẤT LƯỢNG CODE AI (QUALITY GATES)

- [ ] **Type Safety:** Có bị `any` hoặc null/undefined vô lý không?
- [ ] **Business Logic:** Đã map đủ các câu điều kiện `if/else` của nghiệp vụ chưa?
- [ ] **Edge Cases:** Xử lý thế nào khi DB rỗng, API timeout, dữ liệu đầu vào sai định dạng?
- [ ] **Regression:** Code mới có làm hỏng các chức năng cũ đang chạy không?

---

## 💡 4. ĐÒN BẨY NĂNG SUẤT TỰ ĐỘNG HÓA SỰ NGHIỆP

Áp dụng quy trình này giúp em:
1. **Tiết kiệm 60-70% thời gian gõ code thủ công.**
2. **Dành thời gian rảnh rỗi nâng cao tư duy System Design & AI Automation Skill.**
3. **Đóng gói công cụ để nhận thêm các dự án Freelance chất lượng cao ngoài giờ.**

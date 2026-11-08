# 🔬 LAB 01: THUẦN HÓA BẢN CHẤT XÁC SUẤT BẰNG STRUCTURED OUTPUTS & GUARDRAILS
> **Giáo trình:** 90 Ngày Chuyên Gia AI-Driven Automation  
> **Chủ đề:** First Principles của LLM trong Automation & Cơ chế Khóa Chặt Schema  
> **Cố vấn:** Giáo sư AI / Coach Anh  
> **Học viên:** Hoàng Anh (`tibe2109`)

---

## 🏛️ I. NGUYÊN LÝ ĐỆ NHẤT (FIRST PRINCIPLES)

### 1.1. Bản chất Toán học của LLM
Một Large Language Model (như GPT-4, Gemini 1.5, Claude 3.5) về bản chất là một hàm phân phối xác suất có điều kiện:

$$P(w_t \mid w_1, w_2, \dots, w_{t-1}; \theta)$$

- Mô hình không "hiểu" cấu trúc mã hay logic lập trình theo cách compiler hiểu. Nó tính toán xác suất của token kế tiếp $w_t$ dựa trên các token quá khứ.
- **Tính ngẫu nhiên (Stochastic Nature):** Khi lấy mẫu (Sampling) với $\text{Temperature} > 0$, mô hình sẽ chọn các token khác nhau ở mỗi lần chạy.
- Ngay cả khi $\text{Temperature} = 0$ (Greedy Decoding), mô hình vẫn có thể bị trôi dạt ngữ cảnh (Context Drift) hoặc bị phân tâm bởi prompt dẫn đến cấu trúc JSON bị vỡ (ví dụ: bọc markdown ` ```json `, thừa dấu phẩy, thiếu ngoặc đóng `}`).

### 1.2. Mâu thuẫn Cốt lõi với Tự Động Hóa Công Nghiệp (Industrial Automation)
- **Hệ thống Automation (Playwright, CI/CD, Backend APIs):** Là thế giới **Tất định (Deterministic)**.
  - Parser mong đợi 1 JSON Object hợp lệ 100%.
  - Trình duyệt cần 1 chuỗi `locator` chính xác, một `action` hợp lệ nằm trong tập `['click', 'fill', 'navigate', 'hover', 'assert']`.
  - Nếu AI sinh ra: `{"action": "click_button"}` thay vì `{"action": "click"}`, toàn bộ pipeline crash ngay lập tức!
- **Hệ quả:** Dân nghiệp dư dùng "Prompt Begging" (van xin AI: *"hãy chỉ trả về JSON, cấm markdown"*). Cách này có tỷ lệ lỗi 5-15%. Trong kiểm thử tự động, 5% flaky test là thảm họa làm tê liệt toàn bộ đội ngũ kỹ thuật!

---

## ⚙️ II. CÁC CẤP ĐỘ THUẦN HÓA CỦA KIẾN TRÚC SƯ

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ CẤP 1: PROMPT BEGGING (DÂN NGHIỆP DƯ) ➔ Tỷ lệ lỗi 5 - 15% (Flaky, Dễ vỡ)    │
│ CẤP 2: CONSTRAINED DECODING / STRICT JSON SCHEMA ➔ Cú pháp toàn vẹn 100%    │
│ CẤP 3: DUAL-GUARDRAILS (INBOUND SCHEMA + OUTBOUND SEMANTIC VALIDATION)     │
└─────────────────────────────────────────────────────────────────────────────┘
```

1. **Constrained Decoding (Grammar-based Sampling):**
   - Ở tầng suy luận (Inference Engine), hệ thống áp đặt một văn phạm phi ngữ cảnh (Context-Free Grammar / CFG) hoặc JSON Schema.
   - Tại mỗi bước sinh token, engine gán Logit = $-\infty$ cho toàn bộ các token vi phạm cú pháp schema.
   - Kết quả: Mô hình **về mặt vật lý không thể tạo ra chuỗi sai format**.
2. **Semantic Guardrails (Kiểm định Ngữ nghĩa Nghiệp vụ):**
   - Đảm bảo tính hợp lý của dữ liệu: `timeout` phải > 0, `selector` không được rỗng, kịch bản phải có ít nhất 1 assertion (bước kiểm chứng kết quả).

---

## 🛠️ III. THỰC THI KIẾN TRÚC MẪU (BÀI TẬP LAB 01)
Xem file mã nguồn thực chiến tại: [`schema-guardrail-engine.js`](file:///d:/Solution/Person-develop/AI-Automation-Lab/Lab-01-Structured-Outputs/schema-guardrail-engine.js)

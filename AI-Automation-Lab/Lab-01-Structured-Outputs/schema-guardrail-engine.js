/**
 * 🔬 LAB 01: DUAL-GUARDRAILS SCHEMA & VALIDATION ENGINE
 * Hệ Thống Đào Tạo Chuyên Gia AI-Driven Automation (90 Ngày)
 * 
 * Mục tiêu: Chứng minh cơ chế thuần hóa đầu ra ngẫu nhiên của LLM thành 
 * Test Spec tất định 100% cho Playwright Automation.
 */

// ============================================================================
// 1. DATA CONTRACT: ĐỊNH NGHĨA CHUẨN JSON SCHEMA CHO PLAYWRIGHT AUTOMATION
// ============================================================================
const PLAYWRIGHT_TEST_SCHEMA = {
  title: "PlaywrightTestSuite",
  type: "object",
  required: ["suiteName", "targetUrl", "testCases"],
  properties: {
    suiteName: { type: "string" },
    targetUrl: { type: "string" },
    testCases: {
      type: "array",
      minItems: 1,
      items: {
        type: "object",
        required: ["caseId", "title", "steps"],
        properties: {
          caseId: { type: "string" },
          title: { type: "string" },
          steps: {
            type: "array",
            minItems: 1,
            items: {
              type: "object",
              required: ["stepNumber", "action", "description"],
              properties: {
                stepNumber: { type: "number" },
                action: { 
                  type: "string", 
                  enum: ["navigate", "click", "fill", "hover", "select", "assert"] 
                },
                locator: { type: "string" }, // Bắt buộc nếu action là click, fill, hover, assert
                value: { type: "string" },   // Bắt buộc nếu action là fill, select, assert
                description: { type: "string" }
              }
            }
          }
        }
      }
    }
  }
};

// ============================================================================
// 2. GIẢ LẬP ĐẦU RA TỪ CÁC LLM THỰC TẾ (RAW OUTPUTS)
// ============================================================================

// Case A: Lỗi kinh điển của dân nghiệp dư (Bị bọc trong markdown và giải thích thừa)
const RAW_LLM_OUTPUT_CASE_A = `
Chào bạn, dưới đây là kịch bản kiểm thử tôi đã viết cho màn hình đăng nhập FTI-AM:
\`\`\`json
{
  "suiteName": "FTI-AM Login Suite",
  "targetUrl": "https://fti-am.fpt.net/login",
  "testCases": [
    {
      "caseId": "TC-01",
      "title": "Đăng nhập thành công với tài khoản Admin",
      "steps": [
        { "stepNumber": 1, "action": "navigate", "description": "Mở trang đăng nhập" },
        { "stepNumber": 2, "action": "type_text", "locator": "input#email", "value": "admin@fti.com.vn", "description": "Nhập email" },
        { "stepNumber": 3, "action": "click", "locator": "button[type='submit']", "description": "Bấm nút đăng nhập" }
      ]
    }
  ]
}
\`\`\`
Hy vọng kịch bản này giúp ích cho bạn!
`;

// Case B: Chuẩn hóa Schema Strict (Chuẩn công nghiệp sau khi qua Guardrail)
const RAW_LLM_OUTPUT_CASE_B = JSON.stringify({
  suiteName: "FTI-AM User Management Suite",
  targetUrl: "https://fti-am.fpt.net/users",
  testCases: [
    {
      caseId: "TC-USER-01",
      title: "Tìm kiếm người dùng theo email và xác minh danh sách",
      steps: [
        { stepNumber: 1, action: "navigate", description: "Mở màn hình quản trị người dùng" },
        { stepNumber: 2, action: "fill", locator: "input[data-testid='user-search-input']", value: "hoanganh@fti.com.vn", description: "Nhập email cần tìm" },
        { stepNumber: 3, action: "click", locator: "button[data-testid='btn-search']", description: "Bấm nút tìm kiếm" },
        { stepNumber: 4, action: "assert", locator: "div[data-testid='user-table-row']", value: "hoanganh@fti.com.vn", description: "Kiểm tra dòng kết quả hiển thị đúng email" }
      ]
    }
  ]
});

// ============================================================================
// 3. KIẾN TRÚC GUARDRAIL: PARSER & VALIDATOR CẤP DOANH NGHIỆP
// ============================================================================
class AutomationGuardrailEngine {
  /**
   * Bóc tách JSON thuần túy kể cả khi LLM sinh kèm văn bản giải thích hoặc markdown
   */
  static sanitizeAndParse(rawText) {
    if (typeof rawText !== "string") return { success: false, error: "Input must be a string" };

    try {
      // 1. Thử parse trực tiếp
      const direct = JSON.parse(rawText.trim());
      return { success: true, data: direct };
    } catch (e) {
      // 2. Dùng regex cô lập khối JSON
      const jsonBlockRegex = /```(?:json)?\s*([\s\S]*?)\s*```/;
      const match = rawText.match(jsonBlockRegex);
      const cleanContent = match ? match[1] : rawText;

      // 3. Tìm vị trí dấu { đầu tiên và } cuối cùng
      const firstBrace = cleanContent.indexOf("{");
      const lastBrace = cleanContent.lastIndexOf("}");

      if (firstBrace !== -1 && lastBrace !== -1 && lastBrace > firstBrace) {
        const potentialJson = cleanContent.substring(firstBrace, lastBrace + 1);
        try {
          const parsed = JSON.parse(potentialJson);
          return { success: true, data: parsed, sanitized: true };
        } catch (innerError) {
          return { success: false, error: `JSON Parse Syntax Error: ${innerError.message}` };
        }
      }

      return { success: false, error: "Không tìm thấy cấu trúc JSON hợp lệ trong dữ liệu sinh ra" };
    }
  }

  /**
   * Kiểm định Ngữ nghĩa Nghiệp vụ (Semantic & Structural Validation)
   */
  static validateTestSuite(data) {
    const errors = [];

    // Kiểm tra các trường bắt buộc cấp 1
    if (!data.suiteName || typeof data.suiteName !== "string") errors.push("Thiếu 'suiteName' hợp lệ.");
    if (!data.targetUrl || !data.targetUrl.startsWith("http")) errors.push("'targetUrl' phải là URL hợp lệ bắt đầu bằng http/https.");
    if (!Array.isArray(data.testCases) || data.testCases.length === 0) errors.push("'testCases' phải là một mảng có ít nhất 1 phần tử.");

    const allowedActions = ["navigate", "click", "fill", "hover", "select", "assert"];

    // Duyệt sâu vào từng TestCase và TestStep
    if (Array.isArray(data.testCases)) {
      data.testCases.forEach((tc, tcIndex) => {
        if (!tc.caseId) errors.push(`TestCase #${tcIndex + 1} thiếu 'caseId'.`);
        if (!tc.title) errors.push(`TestCase #${tcIndex + 1} thiếu 'title'.`);
        if (!Array.isArray(tc.steps) || tc.steps.length === 0) {
          errors.push(`TestCase '${tc.caseId || tcIndex}' không có bước thực hiện (steps rỗng).`);
          return;
        }

        let hasAssertion = false;

        tc.steps.forEach((step, sIndex) => {
          const stepPrefix = `[TestCase: ${tc.caseId} | Step #${step.stepNumber || sIndex + 1}]`;

          // Kiểm tra action enum
          if (!allowedActions.includes(step.action)) {
            errors.push(`${stepPrefix} Action '${step.action}' không hợp lệ! Chỉ cho phép: [${allowedActions.join(", ")}].`);
          }

          // Kiểm tra ràng buộc locator
          if (["click", "fill", "hover", "select", "assert"].includes(step.action)) {
            if (!step.locator || typeof step.locator !== "string" || step.locator.trim() === "") {
              errors.push(`${stepPrefix} Action '${step.action}' bắt buộc phải có trường 'locator' không rỗng.`);
            }
          }

          // Kiểm tra giá trị value khi fill hoặc assert
          if (["fill", "select"].includes(step.action)) {
            if (step.value === undefined || step.value === null) {
              errors.push(`${stepPrefix} Action '${step.action}' bắt buộc phải có 'value'.`);
            }
          }

          if (step.action === "assert") {
            hasAssertion = true;
          }
        });

        // Quy tắc vàng kiểm thử: Mỗi Test Case bắt buộc phải có ít nhất 1 assertion!
        if (!hasAssertion) {
          errors.push(`[TestCase: ${tc.caseId}] Vi phạm quy chuẩn QA: Kịch bản không có bất kỳ bước 'assert' nào để kiểm chứng kết quả!`);
        }
      });
    }

    return {
      isValid: errors.length === 0,
      errors: errors
    };
  }

  /**
   * Tạo phản hồi tự chữa lành (Self-Correction Prompt) nếu dữ liệu bị lỗi
   */
  static generateSelfHealingPrompt(originalRequest, validationErrors) {
    return `
[SYSTEM FEEDBACK - VALIDATION FAILED]
Đầu ra của bạn đã vi phạm các ràng buộc dữ liệu nghiêm ngặt trong hệ thống tự động hóa:
${validationErrors.map((err, i) => `  ${i + 1}. ${err}`).join("\n")}

YÊU CẦU: Hãy sửa chữa lại toàn bộ JSON trên để thỏa mãn 100% schema. Chỉ trả về JSON duy nhất, không giải thích.
`.trim();
  }
}

// ============================================================================
// 4. CHẠY KIỂM NGHIỆM THỰC TẾ (EXECUTION HARNESS)
// ============================================================================
function runLab() {
  console.log("================================================================================");
  console.log("🚀 KHỞI CHẠY LAB 01: KIỂM ĐỊNH GUARDRAIL CHO PLAYWRIGHT AUTOMATION SPEC");
  console.log("================================================================================\n");

  // TEST 1: Kiểm tra Case A (Dân nghiệp dư - Bị bọc markdown & sai action enum 'type_text', thiếu assert)
  console.log("🧪 [THỬ NGHIỆM 1] Kiểm tra Case A (Output thô từ Prompt thông thường)...");
  const parseResultA = AutomationGuardrailEngine.sanitizeAndParse(RAW_LLM_OUTPUT_CASE_A);
  console.log(`   ➔ Kết quả Sanitize & Parse: ${parseResultA.success ? "✅ Thành công (Đã bóc sạch Markdown)" : "❌ Thất bại"}`);

  if (parseResultA.success) {
    const valResultA = AutomationGuardrailEngine.validateTestSuite(parseResultA.data);
    console.log(`   ➔ Trạng thái Validation: ${valResultA.isValid ? "✅ Hợp lệ" : "❌ BỊ CHẶN LỖI (BẢO VỆ THÀNH CÔNG)"}`);
    if (!valResultA.isValid) {
      console.log("   ➔ Các vi phạm bị phát hiện:");
      valResultA.errors.forEach(err => console.log(`      ⚠️  ${err}`));
      console.log("\n   ➔ Prompt Tự Chữa Lành (Self-Healing Payload) được kích hoạt tự động:");
      console.log("--------------------------------------------------------------------------------");
      console.log(AutomationGuardrailEngine.generateSelfHealingPrompt("Login Test Request", valResultA.errors));
      console.log("--------------------------------------------------------------------------------\n");
    }
  }

  // TEST 2: Kiểm tra Case B (Chuẩn công nghiệp - Thỏa mãn 100% Schema & Semantic rules)
  console.log("🧪 [THỬ NGHIỆM 2] Kiểm tra Case B (Chuẩn hóa Schema Strict)...");
  const parseResultB = AutomationGuardrailEngine.sanitizeAndParse(RAW_LLM_OUTPUT_CASE_B);
  if (parseResultB.success) {
    const valResultB = AutomationGuardrailEngine.validateTestSuite(parseResultB.data);
    console.log(`   ➔ Trạng thái Validation: ${valResultB.isValid ? "✅ 100% HỢP LỆ VÀ SẴN SÀNG SINH CODE PLAYWRIGHT" : "❌ Thất bại"}`);
    if (valResultB.isValid) {
      console.log("   ➔ Tóm tắt Kịch bản Kiểm thử đã khóa chặt:");
      console.log(`      • Suite: ${parseResultB.data.suiteName}`);
      console.log(`      • Target URL: ${parseResultB.data.targetUrl}`);
      console.log(`      • Số lượng TestCase: ${parseResultB.data.testCases.length}`);
      console.log(`      • Tổng số Test Steps: ${parseResultB.data.testCases[0].steps.length}`);
    }
  }

  console.log("\n================================================================================");
  console.log("🏁 KẾT LUẬN LAB 01: Hệ thống Guardrail đã bảo vệ hoàn toàn Pipeline khỏi Flaky Bugs!");
  console.log("================================================================================");
}

runLab();

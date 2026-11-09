import { test, expect } from '@playwright/test';
import { UserManagementPage } from './pages/UserManagementPage';

/**
 * 🧪 PLAYWRIGHT TEST SUITE: FTI-AM User Management Suite
 * Tự động biên dịch bởi Deterministic Synthesis Engine (Lab 02)
 * URL: https://fti-am.fpt.net/users
 */
test.describe('FTI-AM User Management Suite', () => {
  let userPage: UserManagementPage;

  test.beforeEach(async ({ page }) => {
    userPage = new UserManagementPage(page);
  });

  test('TC-USER-01: Tìm kiếm người dùng theo email và xác minh danh sách', async ({ page }) => {
    await test.step('Mở màn hình quản trị người dùng', async () => {
      await userPage.navigate();
    });

    await test.step('Nhập email cần tìm', async () => {
      await userPage.page.locator("input[data-testid='user-search-input']").fill("hoanganh@fti.com.vn");
    });

    await test.step('Bấm nút tìm kiếm', async () => {
      await userPage.page.locator("button[data-testid='btn-search']").click();
    });

    await test.step('Kiểm tra dòng kết quả hiển thị đúng email', async () => {
      const targetElement = userPage.page.locator("div[data-testid='user-table-row']");
      await expect(targetElement).toBeVisible({ timeout: 5000 });
      await expect(targetElement).toContainText("hoanganh@fti.com.vn");
    });
  });
});

import { type Page, type Locator, expect } from '@playwright/test';

/**
 * 🏛️ PAGE OBJECT MODEL: UserManagementPage
 * Tự động biên dịch bởi Deterministic Synthesis Engine (Lab 02)
 * Dự án: FTI-AM User Management Suite
 */
export class UserManagementPage {
  readonly page: Page;
  readonly pageUrl: string = 'https://fti-am.fpt.net/users';

  // Locators
  readonly userSearchInputLocator: Locator; // Nhập email cần tìm
  readonly btnSearchLocator: Locator; // Bấm nút tìm kiếm
  readonly userTableRowLocator: Locator; // Kiểm tra dòng kết quả hiển thị đúng email

  constructor(page: Page) {
    this.page = page;
    this.userSearchInputLocator = page.locator("input[data-testid='user-search-input']");
    this.btnSearchLocator = page.locator("button[data-testid='btn-search']");
    this.userTableRowLocator = page.locator("div[data-testid='user-table-row']");
  }

  /**
   * Điều hướng trực tiếp tới trang đích
   */
  async navigate(): Promise<void> {
    await this.page.goto(this.pageUrl, { waitUntil: 'domcontentloaded' });
  }

  /**
   * Tìm kiếm người dùng theo email
   */
  async searchUser(email: string): Promise<void> {
    const searchInput = this.page.locator("input[data-testid='user-search-input']");
    const searchBtn = this.page.locator("button[data-testid='btn-search']");
    
    await searchInput.fill(email);
    await searchBtn.click();
    await this.page.waitForLoadState('networkidle');
  }

  /**
   * Xác minh sự tồn tại của người dùng trong bảng kết quả
   */
  async verifyUserInTable(expectedEmail: string): Promise<void> {
    const tableRow = this.page.locator("div[data-testid='user-table-row']");
    await expect(tableRow).toBeVisible({ timeout: 5000 });
    await expect(tableRow).toContainText(expectedEmail);
  }
}

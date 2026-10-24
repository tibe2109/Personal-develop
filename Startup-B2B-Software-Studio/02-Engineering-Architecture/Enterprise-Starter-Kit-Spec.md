# 🛠️ ĐẶC TẢ KỸ THUẬT: BOUTIQUE ENTERPRISE STARTER-KIT
### Vũ Khí Lõi Giúp Rút Ngắn 70% Thời Gian Triển Khai Phần Mềm Quản Trị May Đo Cho Doanh Nghiệp
> **Tác giả:** CTO `tibe2109`  
> **Cố vấn kiến trúc:** CEO Coach Anh  
> **Phiên bản:** `v1.0-Draft` | Trạng thái: 🚀 **Đang phát triển (Action A1)**

---

## 🏛️ 1. MỤC TIÊU & NGUYÊN TẮC KIẾN TRÚC

1. **Nguyên tắc "Không Phát Minh Lại Bánh Xe":**  
   Mọi phần mềm quản trị doanh nghiệp (ERP, CRM, Kho, Kế toán nội bộ) đều có chung 70% hạ tầng nền tảng: Đăng nhập, phân quyền, quản lý tổ chức, bảng dữ liệu lọc/tìm kiếm, xuất Excel/PDF, ghi nhật ký thao tác và gửi thông báo.
2. **Nguyên tắc "Zero-Magic Type Safety":**  
   Type-safe 100% từ Database ➔ API ➔ Frontend UI. Khi sửa 1 trường dữ liệu ở Database, toàn bộ TypeScript compiler báo lỗi ngay lập tức, triệt tiêu 95% lỗi runtime ngớ ngẩn.
3. **Nguyên tắc "Cloud-Agnostic & Self-Hostable":**  
   Hệ thống có thể chạy trên VPS 10$/tháng (Docker + Coolify) cho khách nhỏ, hoặc deploy lên AWS/DigitalOcean cho khách lớn mà không cần đổi một dòng code.

---

## 💻 2. CÔNG NGHỆ CHUẨN HÓA (THE SINGLE-STACK)

```
KIẾN TRÚC HỆ THỐNG BOUTIQUE ENTERPRISE (FULL-STACK MONOREPO)
├── FRONTEND (Client App & Admin Portal)
│   ├── Framework: Next.js 15 (App Router, Server Components)
│   ├── UI Kit: Tailwind CSS v4 + Shadcn UI + Radix UI Primitives
│   ├── Data Grid: TanStack Table v8 (Sorting, Filtering, Column Resizing, Virtual Scroll)
│   ├── State & Data Fetching: TanStack Query v5 + Zustand (UI state)
│   └── Form Handling: React Hook Form + Zod (Validation schema chia sẻ với Backend)
│
├── BACKEND (Business Logic API)
│   ├── Framework: NestJS (Modular Architecture, Dependency Injection)
│   ├── Runtime: Node.js 22 LTS / TypeScript 5.x
│   ├── Database: PostgreSQL 16+ (Hỗ trợ JSONB, Partitioning, Row Level Security)
│   ├── ORM: Prisma ORM (Type-safe, Migration tự động, Schema rõ ràng)
│   ├── Background Jobs & Queue: BullMQ + Redis (Gửi mail, xử lý file nặng, đồng bộ dữ liệu)
│   └── Storage: S3-Compatible API (AWS S3, Cloudflare R2, MinIO Self-hosted)
│
└── QUALITY & DEVOPS
    ├── Automated E2E Testing: Playwright (Kiểm thử 100% luồng nghiệp vụ kinh doanh)
    ├── Containerization: Docker + Docker Compose Multi-stage build
    └── Deployment: Coolify / Traefik Reverse Proxy (SSL tự động)
```

---

## 📦 3. SÁU MODULE NỀN TẢNG BẮT BUỘC ĐÓNG GÓI (THE CORE ENGINE)

```
ENTERPRISE STARTER-KIT REUSABLE MODULES
├── [MOD-01] Multi-Tenancy & Org Hierarchy (Tổ chức mẹ - con, chi nhánh)
├── [MOD-02] Auth & Granular RBAC (Xác thực JWT + Phân quyền ma trận)
├── [MOD-03] Dynamic DataGrid & Export Engine (Lưới dữ liệu & Xuất Excel/PDF)
├── [MOD-04] Audit Log & History Engine (Nhật ký truy vết thao tác)
├── [MOD-05] Document & Media Storage Hub (Lưu trữ chứng từ, hóa đơn)
└── [MOD-06] Notification & Webhook Hub (Zalo ZNS, Telegram, Email, SMS)
```

### Chi Tiết Từng Module:

#### 🔹 MOD-01: Multi-Tenancy & Org Hierarchy
- Hỗ trợ mô hình dữ liệu đa tổ chức: Công ty mẹ có thể quản lý nhiều chi nhánh/kho hàng độc lập.
- Áp dụng Row-Level Isolation: Mọi bảng dữ liệu nghiệp vụ đều có trường `tenant_id` và `branch_id`, tự động lọc qua NestJS Interceptor/Prisma Middleware để đảm bảo dữ liệu chi nhánh này không bao giờ rò rỉ sang chi nhánh khác.

#### 🔹 MOD-02: Auth & Granular RBAC (Role-Based Access Control)
- Đăng nhập an toàn: JWT Access Token (ngắn hạn) + Refresh Token xoay vòng (HTTP-only Cookie) + 2FA OTP (nếu cần).
- Ma trận phân quyền động: Cấu hình quyền theo format `resource:action` (ví dụ: `order:create`, `order:approve`, `warehouse:export`, `financial_report:view`).
- Giao diện Admin cho phép CEO tự tích chọn phân quyền cho từng nhân viên mà không cần dev can thiệp.

#### 🔹 MOD-03: Dynamic DataGrid & Export Engine
- Lưới hiển thị dữ liệu bảng cực mạnh xây dựng trên TanStack Table: Tìm kiếm đa điều kiện, lọc theo khoảng ngày, ẩn hiện cột, ghim cột hành động.
- Export chuẩn doanh nghiệp: Xuất file Excel định dạng đẹp (có logo công ty, tiêu đề in đậm, định dạng tiền tệ `1.000.000 đ`) bằng thư viện `exceljs`.
- Xuất phiếu in PDF chuẩn A4/A5 (Phiếu thu, phiếu xuất kho, hóa đơn bán hàng).

#### 🔹 MOD-04: Audit Log Engine (Tính Năng Chốt Deal B2B)
- Ghi nhận tự động mọi thao tác nhạy cảm: Ai đã xóa đơn hàng? Ai đã sửa giá bán? Ai đã điều chỉnh tồn kho lúc mấy giờ? Từ địa chỉ IP nào?
- Lưu lại bản chụp dữ liệu trước và sau khi sửa (Diff state dạng JSONB). Đây là tính năng khiến các chủ doanh nghiệp cực kỳ tin tưởng và sẵn sàng ký hợp đồng ngay.

#### 🔹 MOD-05: Document & Media Storage Hub
- Upload ảnh chứng từ, hóa đơn mua hàng, hợp đồng scan dạng Drag-and-drop.
- Tự động nén ảnh WebP để tiết kiệm dung lượng lưu trữ.
- Lưu trữ trên S3/Cloudflare R2 với presigned URL an toàn.

#### 🔹 MOD-06: Notification & Webhook Hub
- Tự động bắn thông báo khi có sự kiện quan trọng (Ví dụ: Có đơn hàng trên 50 triệu cần duyệt chi, tồn kho chạm mức báo động đỏ).
- Kênh thông báo tích hợp: Telegram Bot riêng cho Ban Giám đốc, Zalo OA / ZNS cho khách hàng, Email Resend cho nhân viên.

---

## 🛡️ 4. KIỂM THỬ TỰ ĐỘNG PLAYWRIGHT E2E (QUALITY GATE)

Không bao giờ để khách hàng làm "tester bất đắc dĩ". Mọi giải pháp xuất xưởng bắt buộc phải có bộ kiểm thử E2E Playwright chạy tự động qua 4 kịch bản sống còn:
1. **Scenario 1 (Auth & Boundary):** Nhân viên kho không thể xem báo cáo doanh thu tài chính; nhân viên kinh doanh chi nhánh A không thể xem khách hàng chi nhánh B.
2. **Scenario 2 (Order to Cash):** Tạo đơn hàng $\rightarrow$ Phê duyệt $\rightarrow$ Xuất kho (tự trừ tồn kho) $\rightarrow$ Ghi nhận công nợ $\rightarrow$ Thu tiền (tự xóa nợ và cập nhật sổ quỹ).
3. **Scenario 3 (Concurrency & Inventory):** Xử lý đơn hàng đồng thời từ 2 nhân viên khi tồn kho chỉ còn 1 sản phẩm (chặn đứng bán âm kho).
4. **Scenario 4 (Data Integrity):** Xuất báo cáo Excel đối chiếu chính xác từng số liệu hiển thị trên giao diện người dùng.

---

## 📂 5. CẤU TRÚC THƯ MỤC SOURCE CODE DỰ KIẾN (MONOREPO)

```
starter-kit-enterprise/
├── apps/
│   ├── web/                     # Next.js 15 App (UI Portal & Admin)
│   │   ├── app/                 # Routes, Pages, Server Components
│   │   ├── components/ui/       # Shadcn UI primitives
│   │   ├── components/datagrid/ # Reusable TanStack Table component
│   │   └── hooks/               # Custom hooks (useAuth, useExport, useTenant)
│   │
│   └── api/                     # NestJS Core Backend
│       ├── src/
│       │   ├── core/            # Prisma, Guards, Interceptors, Filters
│       │   ├── modules/
│       │   │   ├── auth/        # JWT, Refresh, 2FA
│       │   │   ├── tenant/      # Multi-tenant logic
│       │   │   ├── rbac/        # Permission engine
│       │   │   ├── audit-log/   # Activity tracking
│       │   │   ├── storage/     # S3 / File management
│       │   │   └── notification/# Telegram, Zalo, Email
│       │   └── main.ts
│       └── prisma/
│           └── schema.prisma    # Master database schema
│
├── packages/
│   ├── shared-types/            # DTOs, Zod schemas dùng chung FE & BE
│   └── config/                  # Eslint, Prettier, Tailwind tokens
│
└── tests/
    └── e2e/                     # Playwright automated test suites
        ├── auth.spec.ts
        ├── inventory-flow.spec.ts
        └── permissions.spec.ts
```

> **Hành động tiếp theo của CTO:** Khởi tạo repository `starter-kit-enterprise` cục bộ và bắt đầu đóng gói Schema Prisma chung cho 6 module trên.

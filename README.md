# Doblas Boarding House Management System

Laravel 11 application with MySQL for managing a boarding house: tenants, rooms, payments, maintenance requests, and reports.

## Requirements

- PHP 8.2+
- Composer
- MySQL 8.0+
- Node.js (optional, for asset building)

## Installation

1. **Install dependencies**
   ```bash
   composer install
   ```

2. **Environment**
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```
   Edit `.env` and set your database credentials:
   ```
   DB_DATABASE=bhms
   DB_USERNAME=root
   DB_PASSWORD=your_password
   ```

3. **Create database**
   ```sql
   CREATE DATABASE bhms CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```

4. **Run migrations**
   ```bash
   php artisan migrate
   ```

5. **Seed sample data (optional)**
   ```bash
   php artisan db:seed
   ```
   Default login after seeding:
   - **Admin:** admin@bhms.com / password
   - **Staff:** staff@bhms.com / password
   - **Tenant (portal):** tenant@bhms.com / password (linked to first tenant)

6. **Storage link (optional)**
   ```bash
   php artisan storage:link
   ```

7. **Run the application**
   ```bash
   php artisan serve
   ```
   Open http://127.0.0.1:8000

## Features

- **Landing page:** First-time visitors see dormitory info and an online reservation form. Links to Admin and Tenant login.
- **Authentication:** Login with email & password. Roles: Admin, Staff (admin panel), Tenant (portal). Redirect by role after login.
- **Dashboard (Admin):** Total tenants, available/occupied rooms, monthly income, pending payments, gender distribution and income charts; link to Announcements.
- **Tenant:** CRUD; status only (Active, Inactive, Moved Out)—no permanent delete. Parent/Guardian info, assigned appliances, balance (unpaid dues). Option to create a portal login for the tenant.
- **Room:** CRUD; room type: Private Room or Bedspacer; room number, capacity, monthly rate, status.
- **Reservation:** Full inquiry module—name, contact, email, preferred room, reservation date, status (Pending / Confirmed / Cancelled / Checked In).
- **Announcement:** Separate module for posting and managing announcements (no longer only on dashboard).
- **Payment:** Record payments; types: Cash, GCash, Bank; period & status; optional receipt image (tenant can upload from portal).
- **Balance tracking:** Tenant balance = sum of unpaid (pending/overdue) payment amounts; shown on tenant profile and in tenant portal.
- **Request:** Maintenance/repair requests; tenants submit from portal; status: Pending / Approved / Completed.
- **Tenant portal:** Dashboard (balance, recent payments, requests), view payment history, upload payment receipt images, submit maintenance requests.
- **Report:** Monthly income, tenant payment history, room occupancy; export to PDF.
- **Role-based access:** Admin/Staff see full admin panel; Tenant users see only the tenant portal.

## Project structure

- `app/Http/Controllers/` — Dashboard, Tenant, Room, Payment, MaintenanceRequest, Report, Auth, Reservation, Announcement, TenantPortal, Landing
- `app/Http/Middleware/` — EnsureAdminOrStaff, EnsureTenant (role-based access)
- `app/Models/` — User, Tenant, Room, Payment, MaintenanceRequest, Announcement, Reservation, Appliance
- `database/migrations/` — users, rooms, tenants, payments, maintenance_requests, announcements, reservations, appliances, tenant_appliance; receipt_path on payments; tenant_id & role on users; parent_guardian on tenants
- `resources/views/` — layout (app, tenant), landing, auth, dashboard, tenants, rooms, payments, requests, reports, reservations, announcements, tenant portal (dashboard, payments, requests)
- `routes/web.php` — Landing (/), login, auth + admin routes, auth + tenant portal routes

## Design

UI follows the Doblas Boarding House design: dark blue header, gradient blue background, dark blue sidebar with red highlight for the active menu item, light blue/gray buttons, and simple charts on the dashboard.

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${user.isEdit ? 'Chỉnh Sửa Người Dùng' : 'Thêm Người Dùng Mới'}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">

    <div class="container my-5" style="max-width: 600px;">
        <div class="card shadow-sm border-0">
            <div class="card-header ${user.isEdit ? 'bg-warning text-dark' : 'bg-primary text-white'} py-3">
                <h4 class="mb-0 fw-bold">
                    <i class="fa-solid ${user.isEdit ? 'fa-user-pen' : 'fa-user-plus'} me-2"></i>
                    ${user.isEdit ? 'Chỉnh Sửa Người Dùng' : 'Thêm Người Dùng Mới'}
                </h4>
            </div>
            <div class="card-body p-4">
                <form action="/admin/users/saveOrUpdate" method="post">
                    
                    <!-- ID Hidden -->
                    <input type="hidden" name="id" value="${user.id}" />
                    <input type="hidden" name="isEdit" value="${user.isEdit}" />

                    <!-- Username -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">Tên đăng nhập (Username):</label>
                        <input type="text" name="username" value="${user.username}" class="form-control" required ${user.isEdit ? 'readonly' : ''} />
                    </div>

                    <!-- Password -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">Mật khẩu:</label>
                        <input type="password" name="password" value="${user.password}" class="form-control" required />
                    </div>

                    <!-- Fullname -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">Họ và tên:</label>
                        <input type="text" name="fullname" value="${user.fullname}" class="form-control" placeholder="Nhập họ và tên..." />
                    </div>

                    <!-- Email -->
                    <div class="mb-3">
                        <label class="form-label fw-bold">Email:</label>
                        <input type="email" name="email" value="${user.email}" class="form-control" placeholder="example@gmail.com" />
                    </div>

                    <!-- Role -->
                    <div class="mb-4">
                        <label class="form-label fw-bold">Quyền (Role):</label>
                        <select name="role" class="form-select">
                            <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>USER</option>
                            <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
                        </select>
                    </div>

                    <!-- Actions -->
                    <div class="d-flex justify-content-between">
                        <a href="/admin/users" class="btn btn-outline-secondary">
                            <i class="fa-solid fa-arrow-left me-1"></i> Quay lại
                        </a>
                        <button type="submit" class="btn ${user.isEdit ? 'btn-warning' : 'btn-primary'} px-4">
                            <i class="fa-solid fa-floppy-disk me-1"></i> Lưu lại
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
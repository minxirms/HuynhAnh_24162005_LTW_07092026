<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Người Dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">

    <div class="container my-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3 class="fw-bold text-secondary"><i class="fa-solid fa-users me-2"></i>Bảng Quản Lý Người Dùng</h3>
            <div>
                <a href="/admin/categories" class="btn btn-outline-success me-2"><i class="fa-solid fa-list me-1"></i> Quản Lý Category</a>
                <a href="/admin/users/add" class="btn btn-primary"><i class="fa-solid fa-user-plus me-1"></i> Thêm User Mới</a>
            </div>
        </div>

        <!-- Thanh Tìm Kiếm -->
        <div class="card p-3 mb-4 shadow-sm border-0">
            <form action="/admin/users" method="get" class="row g-2">
                <div class="col-md-10">
                    <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="Tìm kiếm Username, Họ tên...">
                </div>
                <div class="col-md-2 d-flex gap-2">
                    <button type="submit" class="btn btn-primary w-100"><i class="fa-solid fa-magnifying-glass"></i> Tìm</button>
                    <c:if test="${not empty keyword}">
                        <a href="/admin/users" class="btn btn-outline-secondary"><i class="fa-solid fa-xmark"></i></a>
                    </c:if>
                </div>
            </form>
        </div>

        <!-- Bảng Dữ Liệu -->
        <div class="card shadow-sm border-0">
            <div class="card-body p-0">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-dark">
                        <tr>
                            <th class="ps-3">ID</th>
                            <th>Username</th>
                            <th>Họ và Tên</th>
                            <th>Email</th>
                            <th>Quyền (Role)</th>
                            <th class="text-center">Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${users}">
                            <tr>
                                <td class="ps-3"><strong>#${item.id}</strong></td>
                                <td class="fw-bold text-primary">${item.username}</td>
                                <td>${item.fullname}</td>
                                <td>${item.email}</td>
                                <td>
                                    <span class="badge ${item.role == 'ADMIN' ? 'bg-danger' : 'bg-info'}">
                                        ${item.role}
                                    </span>
                                </td>
                                <td class="text-center">
                                    <a href="/admin/users/edit/${item.id}" class="btn btn-sm btn-warning me-1">
                                        <i class="fa-solid fa-pen"></i> Sửa
                                    </a>
                                    <a href="/admin/users/delete/${item.id}" class="btn btn-sm btn-danger" 
                                       onclick="return confirm('Bạn có chắc muốn xóa tài khoản này?')">
                                        <i class="fa-solid fa-trash"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty users}">
                            <tr>
                                <td colspan="6" class="text-center py-4 text-muted">Không tìm thấy người dùng nào.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
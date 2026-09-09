<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Quản Lý Danh Mục - CRUD</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
		<div class="container">
			<a class="navbar-brand fw-bold text-warning" href="/">MINXI
				FLOWER STORE</a>
			<div class="navbar-nav">
				<a class="nav-link" href="/">Trang chủ</a> <a
					class="nav-link active" href="/admin/categories">Quản lý</a>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="d-flex justify-content-between align-items-center mb-3">
			<h3 class="fw-bold text-secondary">
				<i class="fa-solid fa-list me-2"></i>Bảng Quản Lý Danh Mục
			</h3>
			<a href="/admin/categories/add" class="btn btn-success"><i
				class="fa-solid fa-plus me-1"></i> Thêm Mới Category</a>
		</div>

		<div class="card shadow-sm border-0">
			<div class="card-body p-0">
				<table class="table table-hover align-middle mb-0">
					<thead class="table-primary">
						<tr>
							<th class="ps-3">ID</th>
							<th>Hình Ảnh</th>
							<th>Tên Category</th>
							<th>Giá (VNĐ)</th>
							<th>Mô Tả</th>
							<th class="text-center">Hành Động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${categories}">
							<tr>
								<td class="ps-3"><strong>#${item.id}</strong></td>
								<td><img
									src="${not empty item.imageUrl ? item.imageUrl : 'https://via.placeholder.com/50'}"
									class="rounded border"
									style="width: 50px; height: 50px; object-fit: cover;"
									onerror="this.src='https://via.placeholder.com/50';"></td>
								<td class="fw-bold text-primary">${item.name}</td>


								<td class="text-danger fw-bold"><fmt:formatNumber
										value="${item.price}" type="number" maxFractionDigits="0" />
									VNĐ</td>

								<td class="text-muted small">${item.description}</td>
								<td class="text-center"><a
									href="/admin/categories/edit/${item.id}"
									class="btn btn-sm btn-warning me-1"> <i
										class="fa-solid fa-pen"></i> Sửa
								</a> <a href="/admin/categories/delete/${item.id}"
									class="btn btn-sm btn-danger"
									onclick="return confirm('Bạn có chắc chắn muốn xóa?')"> <i
										class="fa-solid fa-trash"></i> Xóa
								</a></td>
							</tr>
						</c:forEach>
						<c:if test="${empty categories}">
							<tr>
								<td colspan="6" class="text-center py-4 text-muted">Chưa có
									danh mục nào trong Database.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
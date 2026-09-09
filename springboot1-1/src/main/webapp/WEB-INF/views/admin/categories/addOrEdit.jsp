<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>${category.isEdit ? 'Cập Nhật Category' : 'Thêm Mới Category'}</title>
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
			<a class="navbar-brand fw-bold text-warning" href="/"><i
				class="fa-solid fa-store me-2"></i>MINXI STORE</a>
			<div class="navbar-nav">
				<a class="nav-link" href="/">Trang chủ</a> <a class="nav-link"
					href="/admin/categories">Quản lý CRUD</a>
			</div>
		</div>
	</nav>

	<div class="container mt-4" style="max-width: 600px;">
		<div class="card shadow border-0">
			<div
				class="card-header ${category.isEdit ? 'bg-warning text-dark' : 'bg-success text-white'} py-3">
				<h4 class="mb-0 fw-bold">
					<i
						class="fa-solid ${category.isEdit ? 'fa-pen-to-square' : 'fa-square-plus'} me-2"></i>
					${category.isEdit ? 'Cập Nhật Category' : 'Thêm Mới Category'}
				</h4>
			</div>
			<div class="card-body p-4">
				<form action="/admin/categories/saveOrUpdate" method="post">


					<input type="hidden" name="id" value="${category.id}" /> <input
						type="hidden" name="isEdit" value="${category.isEdit}" />

					<div class="mb-3">
						<label for="name" class="form-label fw-bold">Tên Category
							<span class="text-danger">*</span>
						</label> <input type="text" class="form-control" id="name" name="name"
							value="${category.name}" required placeholder="Nhập tên category">
					</div>

					<div class="mb-3">
						<label for="price" class="form-label fw-bold">Giá (VNĐ) <span
							class="text-danger">*</span></label> <input type="number" step="0.01"
							class="form-control" id="price" name="price"
							value="${category.price}" required placeholder="Nhập giá">
					</div>

					<div class="mb-3">
						<label for="imageUrl" class="form-label fw-bold">URL Hình
							Ảnh</label> <input type="text" class="form-control" id="imageUrl"
							name="imageUrl" value="${category.imageUrl}"
							placeholder="https://example.com/image.jpg">
					</div>

					<div class="mb-3">
						<label for="description" class="form-label fw-bold">Mô Tả</label>
						<textarea class="form-control" id="description" name="description"
							rows="3" placeholder="Nhập mô tả">${category.description}</textarea>
					</div>

					<div class="d-flex justify-content-between align-items-center mt-4">
						<a href="/admin/categories" class="btn btn-outline-secondary">
							<i class="fa-solid fa-arrow-left me-1"></i> Quay lại
						</a>
						<button type="submit"
							class="btn ${category.isEdit ? 'btn-warning' : 'btn-success'} px-4 fw-bold">
							<i class="fa-solid fa-floppy-disk me-1"></i> ${category.isEdit ? 'Cập Nhật' : 'Lưu Dữ Liệu'}
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
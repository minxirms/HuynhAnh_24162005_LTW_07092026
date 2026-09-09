<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang Chủ - MINXI FlOWER STORE</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
.product-card {
	transition: transform 0.2s ease, box-shadow 0.2s ease;
	border-radius: 12px;
}

.product-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.12) !important;
}

.card-img-top {
	height: 200px;
	object-fit: cover;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
}
</style>
</head>
<body class="bg-light">

	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top shadow-sm">
		<div class="container">
			<a class="navbar-brand fw-bold text-warning" href="/"><i
				class="fa-solid fa-store me-2"></i>MINXI STORE</a>
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link active" href="/"><i
							class="fa-solid fa-house me-1"></i> Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/admin/categories"><i
							class="fa-solid fa-list-check me-1"></i> Quản lý CRUD</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Banner -->
	<div class="bg-primary text-white text-center py-4 mb-4 shadow-sm">
		<div class="container">
			<h1 class="fw-bold">Danh Sách Sản Phẩm Hiện Có</h1>
			<p class="lead mb-0">Hiển thị dữ liệu thực tế từ Database</p>
		</div>
	</div>

	<!-- Grid Cards -->
	<div class="container mb-5">
		<div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-4">
			<c:forEach var="category" items="${categories}">
				<div class="col">
					<div class="card h-100 shadow-sm product-card border-0">
						<img
							src="${not empty category.imageUrl ? category.imageUrl : 'https://via.placeholder.com/300x200?text=No+Image'}"
							class="card-img-top" alt="${category.name}"
							onerror="this.src='https://via.placeholder.com/300x200?text=No+Image';">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title text-primary fw-bold">${category.name}</h5>
							<p class="card-text text-muted flex-grow-1 small">${category.description}</p>
							<div
								class="d-flex justify-content-between align-items-center mt-3">
								<span class="fs-5 fw-bold text-danger">${category.price}
									VNĐ</span> <a href="/admin/categories/edit/${category.id}"
									class="btn btn-sm btn-outline-primary"> <i
									class="fa-solid fa-pen-to-square"></i> Sửa
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
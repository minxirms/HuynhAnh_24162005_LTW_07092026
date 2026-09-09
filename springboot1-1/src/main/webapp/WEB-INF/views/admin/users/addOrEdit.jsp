<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${user.isEdit ? 'Edit User' : 'Add New User'}</title>
</head>
<body>
    <form action="<c:url value="/admin/users/saveOrUpdate" />" method="POST">
        <div class="card">
            <div class="card-header">
                <h2>${user.isEdit ? 'Edit User' : 'Add New User'}</h2>
            </div>
            <div class="card-body">
                <input type="hidden" name="isEdit" value="${user.isEdit}" />

                <div class="mb-3">
                    <label for="id" class="form-label">User ID:</label>
                    <input type="text" readonly="readonly" class="form-control" value="${user.id}" id="id" name="id" placeholder="User Id">
                </div>

                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" class="form-control" value="${user.username}" id="username" name="username" placeholder="Username" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" value="${user.password}" id="password" name="password" placeholder="Password" required>
                </div>

                <div class="mb-3">
                    <label for="fullname" class="form-label">Full Name:</label>
                    <input type="text" class="form-control" value="${user.fullname}" id="fullname" name="fullname" placeholder="Full Name">
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" value="${user.email}" id="email" name="email" placeholder="Email">
                </div>

                <div class="mb-3">
                    <label for="role" class="form-label">Role:</label>
                    <select class="form-control" id="role" name="role">
                        <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>USER</option>
                        <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="card-footer text-muted">
            <a href="<c:url value="/admin/users/add"/>" class="btn btn-secondary">New</a>
            <a href="<c:url value="/admin/users" />" class="btn btn-success">List Users</a>
            <button class="btn btn-primary" type="submit">
                <c:if test="${user.isEdit}">
                    <span>Update</span>
                </c:if>
                <c:if test="${!user.isEdit}">
                    <span>Save</span>
                </c:if>
            </button>
        </div>
    </form>
</body>
</html>
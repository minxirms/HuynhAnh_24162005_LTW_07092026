<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
</head>
<body>
    <c:if test="${message != null}">
        <div class="alert alert-primary" role="alert">
            <i>${message}</i>
        </div>
    </c:if>

    <form action="<c:url value='/admin/users' />" method="GET" style="margin-bottom: 15px;">
        <input type="text" name="keyword" value="${keyword}" placeholder="Search username or fullname..." />
        <button type="submit">Search</button>
        <a href="<c:url value='/admin/users' />">Reset</a>
    </form>

    <a href="<c:url value='/admin/users/add' />" class="btn btn-primary">Add New User</a>
    <br/><br/>

    <table border="1" class="table table-striped table-responsive">
        <thead class="thead-inverse">
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td scope="row">${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.fullname}</td>
                    <td>${user.email}</td>
                    <td>${user.role}</td>
                    <td>
                        <a href="<c:url value='/admin/users/edit/${user.id}' />" class="btn btn-outline-warning">Edit</a>
                        <a href="<c:url value='/admin/users/delete/${user.id}' />" onclick="return confirm('Are you sure?')" class="btn btn-outline-danger">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>

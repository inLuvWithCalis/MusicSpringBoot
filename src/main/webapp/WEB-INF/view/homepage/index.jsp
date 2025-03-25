<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../layout/header.jsp"/>

<div class="container-fluid py-5" style="margin-top: 150px;">
    <div class="container py-5">
        <div class="text-center">
            <div class="container-fluid text-end">
                <a class="btn btn-dark btn-md px-4 py-1 mb-5 text-white" href="/auth/add">Upload File</a>
            </div>
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col" class="text-center">Id</th>
                        <th scope="col" class="text-center">Filename</th>
                        <th scope="col" class="text-center">Type</th>
                        <th scope="col" class="text-center">Path</th>
                        <th scope="col" class="text-center">CreatedAt</th>
                        <th scope="col" class="text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${files}" var="f">
                        <tr class="align-middle" onclick="window.location.href='/auth/detail/${f.id}'" style="cursor: pointer;">
                            <td class="text-center align align-middle">${status.index + 1}</td>
                            <td class="text-center align align-middle">${f.name}</td>
                            <td class="text-center align align-middle">${f.type}</td>
                            <td class="text-center align align-middle">${f.path}</td>
                            <td class="text-center align align-middle"><ftm:formatDate value="${f.createdAt}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                            <td class="d-flex justify-content-lg-center">
                                <a href="#" onclick="confirmDelete('${f.id}');event.stopPropagation();" class="btn btn-danger mx-auto px-1">Delete</a>
                                <a href="/auth/edit?id=${f.id}" class="btn btn-success mx-auto px-1">Edit</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmDelete(id) {
        if (confirm('Are you sure to delete this file with id = ' + id + '?')) {
            window.location.href = '/auth/delete?id=' + id;
        }
        else window.location.href = 'redirect:/home';
    }
</script>
</body>
</html>

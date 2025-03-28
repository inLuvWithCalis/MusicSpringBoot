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
    <!-- Sweet Alert 2-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<jsp:include page="../layout/header.jsp"/>

<div class="container-fluid py-5" style="margin-top: 150px;">
    <div class="container py-5">
        <div class="text-center">
            <div class="container-fluid mb-5">
                <div class="row">
                    <div class="col-md-6 text-start">
                        <button class="btn btn-dark btn-md px-4 py-2 mb-5 text-white dropdown-toggle"
                                data-bs-toggle="dropdown">Filter
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/">xxx</a></li>
                            <li><a class="dropdown-item" href="/">yyy</a></li>
                            <li><a class="dropdown-item" href="/">zzz</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 text-end">
                        <a class="btn btn-primary btn-md px-4 py-2 mb-5 text-white" href="/auth/add">Upload File</a>
                    </div>
                </div>
            </div>

            <div class="table-responsive mt-5">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col" class="text-center">Id</th>
                        <th scope="col" class="text-center">Filename</th>
                        <th scope="col" class="text-center">Type</th>
                        <th scope="col" class="text-center">Path</th>
                        <th scope="col" class="text-center">
                            <button class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown">CreatedAt</button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Ascending</a></li>
                                <li><a class="dropdown-item" href="#">Descending</a></li>
                            </ul>
                        </th>
                        <th scope="col" class="text-center">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${files}" var="f" varStatus="status">
                        <tr class="align-middle" onclick="window.location.href='/auth/detail/${f.id}'" style="cursor: pointer;">
                            <td class="text-center align align-middle">${status.index + 1}</td>
                            <td class="text-center align align-middle">${f.name}</td>
                            <td class="text-center align align-middle">${f.type}</td>
                            <td class="text-center align align-middle">${f.path}</td>
                            <td class="text-center align align-middle"><ftm:formatDate value="${f.createdAt}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                            <td class="d-flex justify-content-lg-center">
                                <a onclick="confirmDelete('${f.id}', '${status.index + 1}');event.stopPropagation();" class="btn btn-danger mx-auto px-1">Delete</a>
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

<!-- Pagination -->
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
        <c:if test="${currentPage > 0}">
            <li class="page-item">
                <a class="page-link" href="/auth/page?page=${currentPage - 1}">Previous</a>
            </li>
        </c:if>
        <c:if test="${totalPages > 0}">
            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                <li class="page-item ${currentPage == i ? 'active' : ''}">
                    <a class="page-link" href="/auth/page?page=${i}">${i + 1}</a>
                </li>
            </c:forEach>
        </c:if>
        <c:if test="${currentPage + 1 < totalPages}">
            <li class="page-item">
                <a class="page-link" href="/auth/page?page=${currentPage + 1}">Next</a>
            </li>
        </c:if>
    </ul>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmDelete(id, index) {
        swal.fire({
            text: 'Are you sure to delete this file with id = ' + index + '?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: 'No',
            reverseButtons: true
        }).then((result) => {
            if(result.isConfirmed) {
                window.location.href = '/auth/delete?id=' + id;
            } else {
                window.location.href = 'redirect:/home';
            }
        });
    }
</script>
</body>
</html>

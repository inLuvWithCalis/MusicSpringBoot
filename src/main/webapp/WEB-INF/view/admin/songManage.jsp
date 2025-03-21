<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Song Management</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">


</head>

<body>

<jsp:include page="../layout/header.jsp"/>


<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Song List</h1>
</div>
<!-- Single Page Header End -->

<div class="container py-3">
    <div class="row justify-content-center mb-3">
        <div class="col-sm-6">
            <div class="d-flex justify-content-lg-center">
                <a href="/admin/add" class="btn btn-outline-success me-2 btn-lg me-2" data-toggle="modal">
                    <span>Add</span>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- Cart Page Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th class="text-center border-primary shadow-lg" scope="col">ID</th>
                    <th class="text-center border-primary shadow-lg" scope="col">Title</th>
                    <th class="text-center border-primary shadow-lg" scope="col">Image</th>
                    <th class="text-center border-primary shadow-lg" scope="col">FileUrl</th>
                    <th class="text-center border-primary shadow-lg" scope="col">Artist</th>
                    <th class="text-center border-primary shadow-lg" scope="col">Album</th>
                    <th class="text-center border-primary shadow-lg" scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${songs}" var="c">
                    <tr class="align-middle" onclick="window.location.href='/admin/song/detail?id=${c.id}'" style="cursor: pointer;">
                        <td class="text-center align-middle">${c.id}</td>
                        <td class="text-center align-middle">${c.title}</td>
                        <td class="text-center align-middle">
                            <div class="d-flex align-items-center justify-content-center">
                                <img src="${c.album.coverUrl}" class="img-fluid rounded-circle" style="width: 80px; height: 80px; flex-shrink: 0;" alt="">
                            </div>
                        </td>
                        <td class="text-center align-middle">${c.fileUrl}</td>
                        <td class="text-center align-middle">${c.artist.name}</td>
                        <td class="text-center align-middle">${c.album.title}</td>
                        <td class="text-center align-middle">
                            <a href="/admin/manage/delete?id=${c.id}" class="btn btn-danger">Delete</a>
                            <a href="/admin/manage/edit?id=${c.id}" class="btn btn-success">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>

<jsp:include page="../layout/footer.jsp"/>

<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/lib/easing/easing.min.js"></script>
<script src="/lib/waypoints/waypoints.min.js"></script>
<script src="/lib/lightbox/js/lightbox.min.js"></script>
<script src="/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/js/main.js"></script>
</body>

</html>
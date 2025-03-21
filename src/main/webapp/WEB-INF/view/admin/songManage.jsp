<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Product Management</title>
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
    <h1 class="text-center text-white display-6">Product List</h1>
</div>
<!-- Single Page Header End -->

<div class="container py-3">
    <div class="row justify-content-center mb-3">
        <div class="col-sm-6">
            <div class="d-flex justify-content-center">
                <a href="AddProductShop.jsp" class="btn btn-outline-success me-2 btn-lg me-2" data-toggle="modal">
                    <span>Add</span>
                </a>
                <a href="doughnut" class="btn btn-outline-danger btn-lg me-2" data-toggle="modal">
                    <span>Compile</span>
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
                    <th class="text-center border-primary shadow-lg" scope="col">Name</th>
                    <th class="text-center border-primary shadow-lg" scope="col">Image</th>
                    <th class="text-center border-primary shadow-lg" scope="col">Price</th>
                    <th class="text-center border-primary shadow-lg" scope="col">Quantity</th>
                    <th class="text-center border-primary shadow-lg" scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageproduct}" var="c">
                    <tr class="align-middle">
                        <td class="text-center align-middle">${c.id}</td> <!-- ID -->
                        <td class="text-center align-middle">${c.name}</td> <!-- Name -->
                        <td class="text-center align-middle">
                            <div class="d-flex align-items-center justify-content-center">
                                <img src="${c.image}" class="img-fluid rounded-circle" style="width: 80px; height: 80px; flex-shrink: 0;" alt="">
                            </div>
                        </td> <!-- Image -->
                        <td class="text-center align-middle">${c.price} $</td> <!-- Price -->
                        <td class="text-center align-middle">${c.quantity}</td>
                        <td class="text-center align-middle">
                            <div class="d-flex align-items-center justify-content-center">
                                <button type="button" class="btn btn-outline-secondary me-2" data-toggle="modal" data-target="#editEmployeeModal">
                                    <a href="EditProductShop.jsp?ids=${c.id}&names=${c.name}&images=${c.image}&prices=${c.price}&titles=${c.tittle}&categoryName=${c.category_id}&description=${c.tittle}&quantities=${c.quantity}" class="text-decoration-none text-truncate">Edit</a>
                                </button>
                                <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#deleteEmployeeModal">
                                    <a href="deleteproduct?ids=${c.id}" class="text-decoration-none text-truncate">Delete</a>
                                </button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>
<div class="col-12">
    <div class="pagination d-flex justify-content-center mt-5">
        <c:if test="${param.index > 1}">
            <a href="productmanagement?index=${param.index - 1}" class="rounded">&laquo;</a>
            <!-- Lùi một trang nếu không ở trang đầu tiên -->
        </c:if>
        <c:forEach begin="1" end="${endPage}" var="i">
            <c:set var="currentPage" value="${param.index}"/>
            <c:choose>
                <c:when test="${i == currentPage}">
                    <a href="productmanagement?index=${i}" class="active rounded">${i}</a>
                </c:when>
                <c:otherwise>
                    <a href="productmanagement?index=${i}" class="rounded">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${param.index < endPage}">
            <a href="productmanagement?index=${currentPage + 1}" class="rounded">&raquo;</a>
            <!-- Tiến một trang nếu không ở trang cuối cùng -->
        </c:if>
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
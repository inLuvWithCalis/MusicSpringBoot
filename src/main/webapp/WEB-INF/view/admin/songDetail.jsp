<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Song Detail Page</title>
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

<%--    spotify--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

</head>

<body>

<jsp:include page="../layout/header.jsp"/>

<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Song Detail</h1>
    <ol class="breadcrumb justify-content-center mb-0">
    </ol>
</div>
<!-- Single Page Header End -->


<!-- Single Product Start -->
<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <div class="row g-4 mb-5">
            <div class="col-lg-8 col-xl-9">
                <div class="row g-4">
                    <div class="col-lg-6">
                        <div class="border rounded">
                            <a href="#">
                                <img src="${song.album.coverUrl}" class="img-fluid rounded" alt="Image">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <h4 class="fw-bold mb-3">${song.title}</h4>
                        <p class="mb-3">
                            <strong>Album:</strong> ${song.album.title} <br>
                            <strong>Release Date:</strong> <fmt:formatDate value="${song.album.releaseDate}" pattern="yyyy/MM/dd" /> <br>
                            <strong>Performed by:</strong> ${song.artist.name} <br>
                            <strong>Bio:</strong> ${song.artist.bio}
                        </p>

                        <a href="/" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">
                            <i class="fab fa-spotify fa-1x text-success"></i> Add to playlist
                        </a>
                    </div>
            </div>


        <!-- Vesitable Shop Start-->
        <!-- Vesitable Shop Start-->
        <div class="container-fluid vesitable py-5">
            <div class="container py-5">
                <h1 class="fw-bold mb-0">Related products</h1>
                <div class="owl-carousel vegetable-carousel justify-content-center">

                    <c:forEach items="${product}" var="o">
                        <c:if test="${o.category_id == detail.category_id}">
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <img src="${o.image}" class="img-fluid rounded-top" style="width: 100%; height: 200px; object-fit: cover;" alt="">
                                </div>

                                <c:if test="${o.category_id == 1}">
                                    <div class="text-light bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetables</div>
                                </c:if>
                                <c:if test="${o.category_id == 2}">
                                    <div class="text-light bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Fruits</div>
                                </c:if>
                                <div class="p-4 rounded-bottom">
                                    <h4>${o.name}</h4>
                                    <p></p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold mb-0">$${o.price} / kg</p>
                                        <a href="detail?id=${o.id}" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fas fa-eye me-2 text-primary"></i>View more</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                </div>
            </div>
        </div>
        <!-- Vesitable Shop End -->
        <!-- Vesitable Shop End -->
    </div>
</div>
<!-- Single Product End -->


<jsp:include page="../layout/footer.jsp"/>



<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>


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
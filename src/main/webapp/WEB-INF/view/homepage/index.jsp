<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Fruitables - Vegetable Website Template</title>
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
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>

<jsp:include page="../layout/header.jsp"/>


<!-- Hero Start -->
<div class="container-fluid py-5 mb-5 hero-header">
    <div class="container py-5">
        <div class="row g-5 align-items-center">
            <div class="col-md-12 col-lg-7">
                <h4 class="mb-3 text-secondary">100% Pure Music</h4>
                <h1 class="mb-5 display-3 text-primary">🎵 Feel the Beat, Live the Music 🎶</h1>

            </div>
            <div class="col-md-12 col-lg-5">
                <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active rounded">
                            <img src="img/Ingstagram-min.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                            <a href="#" class="btn px-4 py-2 text-white rounded">Trending Songs</a>
                        </div>
                        <div class="carousel-item rounded">
                            <img src="img/The_Weeknd.png" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                            <a href="#" class="btn px-4 py-2 text-white rounded">Top Hits</a>
                        </div>
                        <div class="carousel-item rounded">
                            <img src="img/EdSheeran.png" class="img-fluid w-100 h-100 rounded" alt="Third slide">
                            <a href="#" class="btn px-4 py-2 text-white rounded">Discover Music</a>
                        </div>
                        <div class="carousel-item rounded">
                            <img src="img/Adele.jpg" class="img-fluid w-100 h-100 rounded" alt="Fourth slide">
                            <a href="#" class="btn px-4 py-2 text-white rounded">Featured Playlists</a>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Hero End -->


<!-- Fruits Shop Start -- Get all fruit's products here!!-->
<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <div class="tab-class text-center">
            <div class="row g-4">
                <div class="col-lg-4 text-start">
                    <h1>Explore Our Music Library</h1>
                </div>
                <div class="col-lg-8 text-end">
                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                        <li class="nav-item">
                            <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                                <span class="text-dark" style="width: 130px;">All Songs</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">
                                <span class="text-dark" style="width: 130px;">Artists</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">
                                <span class="text-dark" style="width: 130px;">Albums</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="tab-content">

                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="row g-4">
                                <c:forEach items="${songs}" var="c">
                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                        <div class="rounded position-relative fruite-item border align-content-lg-around">
                                            <div class="fruite-img">
                                                <img src="${c.album.coverUrl}" class="img-fluid rounded-top" style="width: 100%; height: 200px; object-fit: cover;" alt="">
                                            </div>
<%--                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">--%>
<%--                                                <c:choose>--%>
<%--                                                    <c:when test="${c.category_id == 1}">--%>
<%--                                                        <span style="font-weight: bolder">Vegetables</span>--%>
<%--                                                    </c:when>--%>
<%--                                                    <c:otherwise>--%>
<%--                                                        <span style="font-weight: bolder">Fruits</span>--%>
<%--                                                    </c:otherwise>--%>
<%--                                                </c:choose>--%>
<%--                                            </div>--%>
                                            <div class="p-4 border border-0 border-top-0 rounded-bottom">
                                                <a href="detail?id=${c.id}" style="text-decoration: none; color: black"><h4>${c.title}</h4></a>
                                                <p>${c.title}</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">${c.duration}</p>
                                                    <a href="detail?id=${c.id}&action=add" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fas fa-eye me-2 text-primary"></i>View more</a>
<%--                                                    <c:if test="${c.quantity > 0}">--%>
<%--                                                        <a href="detail?id=${c.id}&action=add" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fas fa-eye me-2 text-primary"></i>View more</a>--%>
<%--                                                    </c:if>--%>
<%--                                                    <c:if test="${c.quantity == 0}">--%>
<%--                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Sold out</a>--%>
<%--                                                    </c:if>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane fade show p-0">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="row g-4">
                                <c:forEach items="${artists}" var="c">
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item border align-content-lg-around">
                                                <div class="fruite-img">
                                                    <img src="${c.imageUrl}" class="img-fluid rounded-top" style="width: 100%; height: 200px; object-fit: cover;" alt="">
                                                </div>

                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">
                                                    <span style="font-weight: bolder">Vegetables</span>
                                                </div>

                                                <div class="p-4 border border-0 border-top-0 rounded-bottom">
                                                    <a href="detail?id=${c.id}" style="text-decoration: none; color: black"><h4>${c.name}</h4></a>
                                                    <p>${c.bio}</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$${c.createdAt} / kg</p>
                                                        <a href="detail?id=${c.id}&action=add" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fas fa-eye me-2 text-primary"></i>View more</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

<%--                <div id="tab-3" class="tab-pane fade show p-0">--%>
<%--                    <div class="row g-4">--%>
<%--                        <div class="col-lg-12">--%>
<%--                            <div class="row g-4">--%>
<%--                                <c:forEach items="${homelist}" var="c">--%>
<%--                                    <c:if test="${c.category_id == 2}">--%>
<%--                                        <div class="col-md-6 col-lg-4 col-xl-3">--%>
<%--                                            <div class="rounded position-relative fruite-item border align-content-lg-around">--%>
<%--                                                <div class="fruite-img">--%>
<%--                                                    <!-- Sử dụng CSS để đặt kích thước cố định cho hình ảnh -->--%>
<%--                                                    <img src="${c.image}" class="img-fluid rounded-top" style="width: 100%; height: 200px; object-fit: cover;" alt="">--%>
<%--                                                </div>--%>

<%--                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">--%>
<%--                                                    <span style="font-weight: bolder">Fruits</span>--%>
<%--                                                </div>--%>

<%--                                                <div class="p-4 border border-0 border-top-0 rounded-bottom">--%>
<%--                                                    <a href="detail?id=${c.id}" style="text-decoration: none; color: black"><h4>${c.name}</h4></a>--%>
<%--                                                    <p>${c.tittle}</p>--%>
<%--                                                    <div class="d-flex justify-content-between flex-lg-wrap">--%>
<%--                                                        <p class="text-dark fs-5 fw-bold mb-0">$${c.price} / kg</p>--%>
<%--                                                        <c:if test="${c.quantity > 0}">--%>
<%--                                                            <a href="detail?id=${c.id}&action=add" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fas fa-eye me-2 text-primary"></i>View more</a>--%>
<%--                                                        </c:if>--%>
<%--                                                        <c:if test="${c.quantity == 0}">--%>
<%--                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Sold out</a>--%>
<%--                                                        </c:if>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </c:if>--%>
<%--                                </c:forEach>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
        </div>
    </div>
</div>
<!-- Fruits Shop End-->







<!-- Banner Section Start-->
<div class="container-fluid banner bg-secondary my-5">
    <div class="container py-5">
        <div class="row g-4 align-items-center">
            <div class="col-lg-6">
                <div class="py-4">
                    <h1 class="display-3 text-white">Fresh Exotic Fruits</h1>
                    <p class="fw-normal display-3 text-dark mb-4">in Our Store</p>
                    <p class="mb-4 text-dark accordion-body">
                        Welcome to Our Store, where you'll find an exquisite selection of fresh, exotic fruits to tantalize your taste buds and invigorate your senses. From succulent tropical
                        mangoes to juicy papayas and beyond, we offer a curated assortment of nature's finest treasures.</p>
                    <a href="#" class="banner-btn btn border-2 border-white rounded-pill text-dark py-3 px-5">BUY</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="position-relative">
                    <img src="img/baner-1.png" class="img-fluid w-100 rounded" alt="">
                    <div class="d-flex align-items-center justify-content-center bg-white rounded-circle position-absolute" style="width: 140px; height: 140px; top: 0; left: 0;">
                        <h1 style="font-size: 100px;">1</h1>
                        <div class="d-flex flex-column">
                            <span class="h2 mb-0">5$</span>
                            <span class="h4 text-muted mb-0">kg</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner Section End -->


<!-- Bestseller Product Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="text-center mx-auto mb-5" style="max-width: 700px;">
            <h1 class="display-4">Bestseller Products</h1>
            <p>
                Indulge in our top picks of fresh, succulent fruits. From juicy apples to tropical pineapples, each handpicked for premium quality. Elevate your snacking game with nature's finest!
            </p>
        </div>
        <div class="row g-4">
            <c:forEach items="${bestseller}" var="d">
                <div class="col-lg-6 col-xl-4">
                    <div class="p-4 rounded bg-light" style="transition: box-shadow 0.3s ease;">
                        <div class="row align-items-center" style="cursor: pointer;" onmouseout="this.style.boxShadow = 'none';">
                            <div class="col-6">
                                <img src="${d.image}" class="img-fluid rounded-circle" style="width: 100%; height: 170px; object-fit: cover;" alt="">
                            </div>
                            <div class="col-6">
                                <a href="detail?id=${d.id}" class="h5">${d.name}</a>
                                <div class="d-flex my-3">
                                    <i class="fas fa-star text-primary"></i>
                                    <i class="fas fa-star text-primary"></i>
                                    <i class="fas fa-star text-primary"></i>
                                    <i class="fas fa-star text-primary"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <h4 class="mb-3">$${d.price} / kg</h4>
                                <c:if test="${d.quantity > 0}">
                                    <a href="detail?id=${d.id}&action=add" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fas fa-eye me-2 text-primary"></i>View more</a>
                                </c:if>
                                <c:if test="${d.quantity == 0}">
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Sold out</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- Bestsaler Product End -->


<!-- Fact Start -->
<div class="container-fluid py-5">
    <div class="container">
        <div class="bg-light p-5 rounded">
            <div class="row g-4 justify-content-center">
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>satisfied customers</h4>
                        <h1>1963</h1>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>quality of service</h4>
                        <h1>99%</h1>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>quality certificates</h4>
                        <h1>33</h1>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-xl-3">
                    <div class="counter bg-white rounded p-5">
                        <i class="fa fa-users text-secondary"></i>
                        <h4>Available Products</h4>
                        <h1>789</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Fact Start -->


<jsp:include page="../layout/footer.jsp"/>

<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/lightbox/js/lightbox.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>


<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>
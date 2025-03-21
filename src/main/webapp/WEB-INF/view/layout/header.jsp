<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Spinner Start -->
<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->


<!-- Navbar start -->
<div class="container-fluid fixed-top">
    <div class="container topbar bg-primary d-none d-lg-block">
        <div class="d-flex justify-content-between">
            <div class="top-info ps-2 top-link pe-2">
                <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="https://www.google.com/maps/@21.0126108,105.5172847,16z?entry=ttu" target="_blank" class="text-white">Block 4, Thach Hoa, Thach That, Ha Noi</a></small>
                    <small class="me-3"><i class="fas fa-user me-2 text-secondary">
                    </i><a href="" class="text-white mx-2">
                        Welcome ${googleName}!</a>
                    </small>
                <form method="POST" action="/logout" class="d-inline">
                    <button type="submit" class="btn btn-secondary">
                        <i class="fas fa-sign-out-alt me-2 text-light"></i> Logout
                    </button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

            <%--                    <small class="me-3"><i class="fas fa-sign-out-alt me-2 text-secondary">--%>
<%--                    </i><a href="logout" class="text-white mx-2">--%>
<%--                        Log out</a>--%>
<%--                    </small>--%>
<%--                <c:if test="${a.isAdmin == 0}">--%>
<%--                    <small class="me-3"><i class="fas fa-user me-2 text-secondary">--%>
<%--                    </i><a href="" class="text-dark fw-bolder">--%>
<%--                        Welcome ${a.user}!</a>--%>
<%--                    </small>--%>
<%--                    <small class="me-3"><i class="fas fa-sign-out-alt me-2 text-secondary">--%>
<%--                    </i><a href="logout" class="text-white mx-2">--%>
<%--                        Log out</a>--%>
<%--                    </small>--%>
<%--                </c:if>--%>
            </div>
            <div class="top-link pe-2">
                <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
            </div>
        </div>
    </div>
    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="/home" class="navbar-brand"><h1 class="text-primary display-6">MusicStore</h1></a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                <div class="navbar-nav mx-auto">
                    <a href="/home" class="nav-item nav-link active">Home</a>
                    <a href="shop" class="nav-item nav-link">Shop</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Management</a>
                        <div class="dropdown-menu m-0 bg-secondary rounded-0">
                            <a href="/admin/manage" class="dropdown-item active">Songs</a>
                            <a href="" class="dropdown-item">Account</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu m-0 bg-secondary rounded-0">
                            <a href="Cart.jsp" class="dropdown-item active">Cart</a>
                            <c:if test="${sessionScope.account != null}">
                                <a href="checkout" class="dropdown-item">Checkout</a>
                                <a href="order-history" class="dropdown-item">Order History</a>
                            </c:if>
                        </div>
                    </div>
                    <a href="#" class="nav-item nav-link">Contact</a>
                </div>
                <div class="d-flex m-3 me-0">
                    <a href="Profile.jsp?user=${a.user}" class="position-relative me-4 my-auto">
                        <i class="fas fa-user-shield fa-2x"></i>
                    </a>
                    <a href="cart" class="position-relative me-4 my-auto">
                        <i class="fa fa-shopping-bag fa-2x"></i>
                        <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">${sessionScope.cart == null ? "0" : sessionScope.cart.items.size()}</span>
                    </a>
                    <a href="/login" class="my-auto">
                        <i class="fas fa-user fa-2x"></i>
                    </a>
                </div>
            </div>
        </nav>
    </div>
</div>
<!-- Navbar End -->


<!-- Modal Search Start -->
<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content rounded-0">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-75 mx-auto d-flex">
                    <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Search End -->
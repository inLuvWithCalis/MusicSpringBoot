<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid fixed-top mt-3">
    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="/home" class="navbar-brand">
                <h1 class="text-black-50 display-6 border-dark">FileUpload</h1>
            </a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>


            <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                <ul class="navbar-nav ms-auto my-4 my-lg-1">
                    <li class="nav-item me-5 ">
                        <!-- search -->
                        <form class="d-flex ms-auto my-2 my-lg-0" action="/auth/search" method="post">
                            <input class="form-control search-input me-2" type="text" name="keyword"
                                   placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-primary" type="submit">Search</button>
                        </form>
                    </li>
                <!-- dropdown -->
                    <li class="nav-item dropdown ms-5">
                        <a href="#" class="my-auto dropdown-toggle text-black-50" id="userDropdown"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user fa-2x text-black-50 my-auto"></i>
                        </a>
                        <!-- menu -->
                        <ul class="dropdown-menu dropdown-menu-end text-center" aria-labelledby="userDropdown">
                            <li><img class="img-fluid rounded-circle" src="${sessionScope.picture}" alt=""></li>
                            <li><a class="dropdown-item bg-light text-dark" href="#">${sessionScope.name}</a></li>
                            <li><a class="dropdown-item bg-light text-dark" href="#">${sessionScope.email}</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <form class="form" method="post" action="/logout">
                                    <button class="dropdown-item text-danger bg-light text-dark">Logout</button>
                                </form>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
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
                <!-- dropdown -->
                <div class="dropdown ms-auto m-3 me-0">
                    <a href="#" class="my-auto dropdown-toggle text-black-50" id="userDropdown"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user fa-2x text-black-50 my-auto"></i>
                    </a>
                    <!-- menu -->
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
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
                </div>
            </div>
        </nav>
    </div>
</div>
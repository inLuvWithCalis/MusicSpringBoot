<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Creation page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container-fluid fixed-top mt-3">
    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="/home" class="navbar-brand">
                <h1 class="text-black-50 display-6">FileUpload</h1>
            </a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                <!-- dropdown -->
                <div class="dropdown ms-auto m-3 me-0">
                    <a href="#" class="my-auto dropdown-toggle text-black-50" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user fa-2x text-black-50 my-auto"></i>
                    </a>
                    <!-- menu -->
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item bg-light text-dark" href="/">Name</a></li>
                        <li><a class="dropdown-item bg-light text-dark" href="/">Email</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger bg-light text-dark" href="/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>

<div class="container-fluid mx-auto py-5" style="margin-top: 150px;">
    <div class="container py-5 px-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title text-center mb-4">Add Files</h2>
                        <form:form action="/auth/add" method="post" enctype="multipart/form-data">
                            <!-- Get submit form time -->
                            <input type="hidden" id="submitTime" name="submitTime"/>

<%--                            <div class="form-group row">--%>
<%--                                <label class="col-sm-3 col-form-label">Title</label>--%>
<%--                                <div class="col-sm-9">--%>
<%--                                    <label>--%>
<%--                                        <form:input class="form-control" path="name" style="width: 350px;" required=""/>--%>
<%--                                    </label>--%>
<%--                                </div>--%>
<%--                            </div>--%>

                            <div class="form-group row mt-5">
                                <label class="col-sm-3 col-form-label">File upload</label>
                                <div class="col-sm-9">
                                    <label class="custom-file">
                                        <input type="file" name="hiddenFile" id="file" style="display: none;" class="form-control">
                                        <input type="text" name="shownFile" id="text" class="form-control" style="width: 350px;"
                                               placeholder="No file selected" readonly="readonly"/>
                                    </label>
                                    <label for="file">
                                        <span id="file-name" class="file-box"></span>
                                        <span class="file-button">
                                          <i class="fa fa-upload" aria-hidden="true"></i>
                                          Select File
                                        </span>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group row mt-lg-5">
                                <div class="col-sm-9 offset-sm-3">
                                    <button class="btn btn-primary btn-secondary btn-lg custom-btn">
                                        <a href="/home" class="text-decoration-none text-light">Back</a>
                                    </button>
                                    <button type="submit" class="btn btn-primary btn-primary btn-lg">Submit</button>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    document.getElementById("file").addEventListener("change", function(event) {
        let fileName = event.target.files[0].name;
        document.getElementById("text").value = event.target.files.length > 0 ? fileName : "No file selected";
    });

    document.querySelector("form").addEventListener("submit", function() {
       let present = new Date();
        document.getElementById("submitTime").value = present.toISOString();
    });
</script>
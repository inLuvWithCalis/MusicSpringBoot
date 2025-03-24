<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Edit Page</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
</head>

<body>
<div class="container mx-auto mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title text-center">Edit Songs</h2>
                    <form:form action="/admin/manage/edited" method="post" modelAttribute="song" enctype="multipart/form-data">
                        <div class="form-group row">
                            <label for="id" class="col-sm-3 col-form-label">Id:</label>
                            <div class="col-sm-9">
                                <form:input type="text" class="form-control" path="id" value="${song.id}" disabled="true"/>
                                <input type="hidden" name="id" value="${song.id}" />
<%--                                hidden fields here.--%>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="title" class="col-sm-3 col-form-label">Title:</label>
                            <div class="col-sm-9">
                                <form:input type="text" class="form-control" path="title" value="${song.title}" required=""/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Artist:</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="artistId" required="">
                                    <option disabled selected>Choose option</option>
                                    <c:forEach var="artist" items="${artists}">
<%--                                        <option value="${artist.id}">${artist.name}</option>--%>
                                        <option value="${artist.id}" ${artist.id == song.artist.id ? 'selected' : ''}>${artist.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Album:</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="albumId" required="">
                                    <option disabled selected>Choose option</option>
                                    <c:forEach var="album" items="${albums}">
<%--                                        <option value="${album.id}">${album.title}</option>--%>
                                        <option value="${album.id}" ${album.id == song.album.id ? 'selected' : ''}>${album.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="fileUrl" class="col-sm-3 col-form-label">File upload</label>
                            <div class="col-sm-9">
                                <input type="file" class="form-control" id="fileUrl" name="songFile" accept=".mp3, .wav, .flac, .aac, .ogg"/>
                                <input type="hidden" name="existingFileUrl" value="${song.fileUrl}" />
                            </div>
                            <div class="col-sm-9">
                                <audio controls id="musicPreview" style="display: none;">
                                    <source id="musicSource" src="" type="">
                                    Your browser does not support
                                </audio>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-9 offset-sm-3">
                                <button class="btn btn-primary btn-secondary btn-lg custom-btn">
                                    <a href="productmanagement" class="text-decoration-none text-light">Back</a>
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
</body>

</html>
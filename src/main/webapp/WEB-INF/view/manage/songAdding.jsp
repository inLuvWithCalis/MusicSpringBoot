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
    <title>Au Register Forms by Colorlib</title>

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
                    <h2 class="card-title text-center">Add Songs</h2>
                    <form:form action="/admin/add" method="post" modelAttribute="newSong" enctype="multipart/form-data">
                        <div class="form-group row">
                            <label for="title" class="col-sm-3 col-form-label">Title:</label>
                            <div class="col-sm-9">
                                <form:input type="text" class="form-control" path="title" required=""/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Artist:</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="artistId" required="">
                                    <option disabled selected>Choose option</option>
                                    <c:forEach var="artist" items="${artists}">
                                        <option value="${artist.id}">${artist.name}</option>
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
                                        <option value="${album.id}">${album.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="fileUrl" class="col-sm-3 col-form-label">File upload</label>
                            <div class="col-sm-9">
                                <input type="file" class="form-control" id="fileUrl" name="songFile" accept=".mp3, .wav, .flac, .aac, .ogg"/>
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

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(() => {
        const fileInput = $("#fileUrl"); // Lấy input file
        fileInput.change(function (e) {
            const file = e.target.files[0]; // Lấy file người dùng chọn
            if (file) {
                const audioURL = URL.createObjectURL(file); // Tạo URL tạm thời cho file nhạc

                $("#musicSource").attr("src", audioURL); // Cập nhật source của audio
                $("#musicSource").attr("type", file.type);
                $("#musicPreview").css({ "display": "block" }); // Hiển thị trình phát nhạc
                $("#musicPreview")[0].load(); // Load lại audio để phát đúng file
            }
        });
    });

</script>
</body>

</html>
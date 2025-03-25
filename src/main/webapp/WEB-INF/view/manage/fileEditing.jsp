<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<jsp:include page="../layout/header.jsp"/>

<div class="container-fluid mx-auto py-5" style="margin-top: 150px;">
    <div class="container py-5 px-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title text-center mb-4">Update File</h2>
                        <form action="/auth/edit" method="post" enctype="multipart/form-data">
                            <!-- Get submit form time -->
                            <input type="hidden" id="submitTime" name="id" value="${editingFile.id}"/>

                            <div class="form-group row mt-5">
                                <label class="col-sm-3 col-form-label">Filename:</label>
                                <div class="col-sm-9">
                                    <label>
                                        <input type="text" class="form-control" name="name" value="${editingFile.name}" style="width: 350px;" required=""/>
                                    </label>
                                </div>
                            </div>

                            <div class="form-group row mt-5">
                                <label class="col-sm-3 col-form-label">Type:</label>
                                <div class="col-sm-9">
                                    <label>
                                        <input type="text" class="form-control" name="type" value="${editingFile.type}"
                                               style="width: 350px;" required="" readonly="readonly"/>
                                    </label>
                                </div>
                            </div>

<%--                            <div class="form-group row mt-5">--%>
<%--                                <label class="col-sm-3 col-form-label">Path:</label>--%>
<%--                                <div class="col-sm-9">--%>
<%--                                    <a href="${editingFile.path}" class="btn btn-outline-primary" download>--%>
<%--                                        Download File--%>
<%--                                    </a>--%>
<%--                                </div>--%>
<%--                            </div>--%>

                            <div class="form-group row mt-5">
                                <label class="col-sm-3 col-form-label">Created at:</label>
                                <div class="col-sm-9">
                                    <label>
                                        <input type="text" class="form-control" name="createdAt"
                                               value="${formattedCreatedAt}"
                                               style="width: 350px;" required="" readonly="readonly"/>
                                    </label>
                                </div>
                            </div>

                            <div class="form-group row mt-5">
                                <label class="col-sm-3 col-form-label">File upload</label>
                                <div class="col-sm-9">
                                    <label class="custom-file">
                                        <input type="file" name="hiddenFile" id="file" style="display: none;" class="form-control">
                                        <input type="text" value="${editingFile.name}" name="shownFile" id="text" class="form-control" style="width: 350px;"
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
                        </form>
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
</script>
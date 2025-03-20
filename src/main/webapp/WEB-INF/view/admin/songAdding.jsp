<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="container mx-auto">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title text-center">Add Songs</h2>
                    <form action="addproduct">
                        <p class="text-danger text-lg-start">${error}</p>
                        <div class="form-group row">
                            <label for="first_name" class="col-sm-3 col-form-label">Id</label>
                            <div class="col-sm-9">
                                <input type="number" class="form-control" id="first_name" name="id" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="last_name" class="col-sm-3 col-form-label">Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="last_name" name="name" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="birthday" class="col-sm-3 col-form-label">Image</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="birthday" name="image" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="email" class="col-sm-3 col-form-label">Price</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="email" name="price" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="phone" class="col-sm-3 col-form-label">Tittle</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="phone" name="title" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="phone" class="col-sm-3 col-form-label">Description</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="phone" name="description" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Category</label>
                            <div class="col-sm-9">
                                <select class="form-control" id="subject" name="categoryName" required>
                                    <option disabled selected>Choose option</option>
                                    <option>Vegetable</option>
                                    <option>Fruit</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Quantity</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="quantity" required>
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
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
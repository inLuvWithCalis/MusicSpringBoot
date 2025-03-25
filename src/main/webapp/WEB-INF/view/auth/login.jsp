<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fruitable Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background-image: url(https://valleycultural.org/wp-content/uploads/2021/07/Music-1110x739.jpg);
            background-size: cover;
        }

        .btn-login {
            font-size: 0.9rem;
            letter-spacing: 0.05rem;
            padding: 0.75rem 1rem;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto my-auto">
        <div class="card border-0 shadow rounded-3 my-5">
            <div class="card-body p-4 p-sm-5">
                <div class="d-grid mb-2">
                    <form class="text-center" action="/oauth2/authorization/google" method="GET">
                        <button type="submit" class="px-3 py-2 btn btn-primary btn-lg">
                            <i class="fab fa-google"></i>
                            Sign in with Google
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
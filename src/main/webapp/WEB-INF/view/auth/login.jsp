<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fruitable Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

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
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3 my-5">
                <div class="card-body p-4 p-sm-5">
                    <h1 class="card-title text-center mb-5 fw-bold fs-3">Sign In</h1>
                    <c:set var="cookie" value="${pageContext.request.cookies}"></c:set>
                    <form action="login" method="post">

                        <div class="form-floating mb-3">
                            <input name="username" type="text" class="form-control" id="floatingInput" placeholder="name@example.com" value="${cookie.nameCookie.value}">
                            <label for="floatingInput">Username</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password" value="${cookie.passCookie.value}">
                            <label for="floatingPassword">Password</label>
                        </div>

                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" value="on" name="remember" ${(cookie.remCookie != null ? 'checked':'')}>
                            <label class="form-check-label" for="rememberPasswordCheck">
                                Remember me
                            </label>
                        </div>
                        <div class="d-grid">
                            <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Sign
                                in</button>
                        </div>
                        <hr class="my-4">

                    </form>
                    <div class="d-grid mb-2">
                        <a href="Register.jsp" class="btn btn-outline-danger btn-login text-uppercase fw-bolder">
                            <i class="fa-brands fa-google me-2"></i> Sign up with Google
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
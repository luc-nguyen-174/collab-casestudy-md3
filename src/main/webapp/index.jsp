<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
          rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
          rel="stylesheet"/>
    <title>Login</title>
    <link rel="stylesheet" href="demo1.css">
</head>
<body>
<section class="h-100 gradient-form">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-xl-10" style="transform: scale(0.85); transform-origin: top">
                <div class="card rounded-3 text-black">
                    <div class="row g-0">
                        <div class="col-lg-6">
                            <div class="card-body p-md-5 mx-md-4">
                                <div class="text-center">
                                    <img src="../image/what's-for-lunch.png"
                                         style="width: 185px;" alt="logo">
                                    <h2 class="mt-1 mb-5 pb-1">Log in</h2>
                                </div>
                                <form>
                                    <p>Please login to your account</p>
                                    <div class="form-outline mb-4">
                                        <input type="email" id="form2Example11" class="form-control"
                                               name="user" placeholder="Phone number or email address"/>
                                        <label class="form-label" for="form2Example11">Username</label>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <input type="password" id="form2Example22" class="form-control"
                                               name="pass" placeholder="**********"/>
                                        <label class="form-label" for="form2Example11">Password</label>
                                    </div>
                                    <div class="text-center pt-1 mb-5 pb-1">
                                        <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"
                                                type="button">Log in
                                        </button>
                                        <a class="text-muted" href="#!">Forgot password?</a>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center pb-4">
                                        <p class="mb-0 me-2">Don't have an account?</p>
                                        <button type="submit" class="btn btn-outline-danger">Register</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6 d-flex align-items-center gradient-custom-2 md22">
                            <img src="../image/image-1.png"
                                 style="width: 100%; height: 100%" alt="background">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<a href="/admin.jsp">Admin</a>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js">
</script>
</body>
</html>
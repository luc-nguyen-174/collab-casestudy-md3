<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
          rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
          rel="stylesheet"/>
    <title>Login</title>
    <link rel="stylesheet" href="demo2.css">
</head>
<body>
<section class="vh-100 bg-image">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body p-5">
                            <h2 class="text-uppercase text-center mb-5">Create an account</h2>
                            <form>
                                <div class="form-outline mb-4">
                                    <input type="text" id="form3Example1cg" class="form-control form-control-lg"/>
                                    <label class="form-label" for="form3Example1cg">Your Name</label>
                                </div>
                                <div class="form-outline mb-4">
                                    <input type="email" id="form3Example3cg" class="form-control form-control-lg"/>
                                    <label class="form-label" for="form3Example3cg">Your Email</label>
                                </div>
                                <div class="form-outline mb-4">
                                    <input type="password" id="form3Example4cg" class="form-control form-control-lg"/>
                                    <label class="form-label" for="form3Example4cg">Password</label>
                                </div>
                                <div class="form-outline mb-4">
                                    <input type="password" id="form3Example4cdg" class="form-control form-control-lg"/>
                                    <label class="form-label" for="form3Example4cdg">Repeat your password</label>
                                </div>
                                <div class="form-check d-flex justify-content-center mb-5">
                                    <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3cg"/>
                                    <label class="form-check-label" for="form2Example3cg">
                                        I agree all statements in <a href="#!" class="text-body"><u>Terms of service</u></a>
                                    </label>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <button type="button"
                                            class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">
                                        Register
                                    </button>
                                </div>
                                <div class="text-center text-muted mt-5 mb-0">
                                    <p class="mb-0 me-2">Have already an account?</p>
                                    <button type="submit" class="btn btn-outline-danger">
                                        <a href="/index.jsp">Login here</a>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js">
</script>
</body>
</html>

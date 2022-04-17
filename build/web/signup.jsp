<%-- 
    Document   : signup
    Created on : 17-Mar-2022, 12:59:01 pm
    Author     : rakesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/index.css"/>
    </head>
    <body style="background: url(image/pic2.jpg ); background-size: cover; background-attachment: fixed;">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <!--Header start here-->
            <div class="container-fluid">
                <a class="navbar-brand" href="/">
                    <img src="image/RR.png" alt="logo" class="logo-image">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>                                
                <form class="d-flex">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="/Register">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">Log In</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="signup.jsp">Sign Up</a>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>
        </nav>
        <!--Header end here-->
        <div class="container" >
            <div class="row">
                <div class="col m6 offset-m3" >
                    <div class="card" >
                        <div class="card-content">
                            <h3 style="margin-top: 1px;" class="text-center">Register Here!!!</h3>
                            <h5 id="msg" class="text-center" ></h5>
                            <!--creating form-->
                            <form action="Register" method="post" id="myform">
                                <div class="mb-3">
                                    <input name="user_name" type="text" class="form-control" placeholder="Enter user name" >
                                </div>
                                <div class="mb-3">
                                    <input name="user_email" type="email" class="form-control" aria-describedby="emailHelp" placeholder="Enter your email" >
                                    <div class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <input name="user_password" type="password" class="form-control" placeholder="Enter your password" >
                                </div>
                                <div class="mb-3 form-check">
                                    <input type="checkbox" class="form-check-input">
                                    <label class="form-check-label">Check me out</label>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>

                            <div class="loader center-align" style="margin-top: 10px; display: none" >
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                </div>
                                <h5>Please wait...</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous">
        </script>
      <script>
           $(document).ready(function () {
                console.log("page is ready");

                $("#myform").on('submit', function (event) {
//                    event.preventDefault();

                    //serialize method is used for when input field are text only.  
                    let f = $(this).serialize();
                    console.log(f);

//                    let f = new FormData(this);

                    $(".loader").show();
                    $(".form").hide();

                    $.ajax({
                        url: "Register",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqHXR) {
                            console.log(data);
                            console.log("Success...");
                            $(".loader").hide();
                            $(".form").show();

                            if (data.trim() === 'done') {
                                $('#msg').html("Successfully Registered");
                                $('#msg').addClass('green-text');
                            } else {
                                $('#msg').html("Something went wrong!!!");
                                $('#msg').addClass('red-text');
                            }
                        },
                        error: function (jqHXR, textStats, errorThrown) {
                            console.log(data);
                            console.log("Error.....");
                            $(".loader").hide();
                            $(".form").show();
                            $('#msg').html("Something went wrong!!!");
                            $('#msg').addClass('red-text');
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>
</html>

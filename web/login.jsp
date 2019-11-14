<%-- 
    Document   : Login
    Created on : 11-11-2019, 15:18:02
    Author     : DELL
--%>

<%@page import="perfumestore.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="perfumestore.AccountModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int errorCode = -1;
    if (request.getParameter("errorCode") != null) {
        errorCode = Integer.parseInt(request.getParameter("errorCode"));
    }
    String errorMsg = "";
    if (errorCode == 1) {
        errorMsg += "Please check your username and password";
    } else if (errorCode == 0) {
        errorMsg += "Can't login due to an unknown error";
    }

%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="img/favicon.png" type="image/png">
        <title>Log In | BMatt Shop</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="vendors/lightbox/simpleLightbox.css">
        <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="vendors/animate-css/animate.css">
        <link rel="stylesheet" href="vendors/jquery-ui/jquery-ui.css">
        <!-- main css -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>

    <body>
        <jsp:include page="navbar.jsp"/>

        <!--================Home Banner Area =================-->
        <section class="banner_area">
            <div class="banner_inner d-flex align-items-center">
                <div class="container">
                    <div class="banner_content text-center">
                        <h2>Login</h2>
                        <div class="page_link">
                            <a href="index.jsp">Home</a>
                            <a href="login.jsp">Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Home Banner Area =================-->

        <!--================Login Box Area =================-->
        <section class="login_box_area p_120">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="login_box_img">
                            <img class="img-fluid" src="img/login.jpg" alt="">
                            <div class="hover">
                                <h1>WELCOME TO BMATT SHOP</h1>
                                <a class="main_btn" href="registration.jsp">Create an Account</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="login_form_inner">
                            <h3>Log in to enter</h3>
                            <form class="row login_form" action="login-process.jsp" method="post" id="contactForm" novalidate="novalidate">
                                <div class="col-md-12 form-group">
                                    <input type="text" class="form-control" id="name" name="username" placeholder="Username">
                                </div>
                                <div class="col-md-12 form-group">
                                    <input type="password" class="form-control" id="name" name="password" placeholder="Password">
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="creat_account">
                                        <input type="checkbox" id="f-option2" name="selector">
                                        <label for="f-option2">Keep me logged in</label>
                                    </div>
                                </div>
                                <div class="form-group d-flex justify-content-between align-items-center">
                                    <div class="text-left">
                                        <% if (errorCode != -1) {%>
                                        <p class="error-message">Log in failed! <br><%=errorMsg%></p>
                                            <% }%>
                                    </div>
                                </div>    
                                <div class="col-md-12 form-group">
                                    <button type="submit" value="login" name="submit" class="btn submit_btn">Log In</button>
                                    <a href="#">Forgot Password?</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Login Box Area =================-->

        

        <jsp:include page="footer.jsp"/>




        <!--         Optional JavaScript 
                 jQuery first, then Popper.js, then Bootstrap JS 
                <script src="js/jquery-3.2.1.min.js"></script>
                <script src="js/popper.js"></script>
                <script src="js/bootstrap.min.js"></script>
                <script src="js/stellar.js"></script>
                <script src="vendors/lightbox/simpleLightbox.min.js"></script>
                <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
                <script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
                <script src="vendors/isotope/isotope-min.js"></script>
                <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
                <script src="js/jquery.ajaxchimp.min.js"></script>
                <script src="js/mail-script.js"></script>
                <script src="vendors/jquery-ui/jquery-ui.js"></script>
                <script src="vendors/counter-up/jquery.waypoints.min.js"></script>
                <script src="vendors/counter-up/jquery.counterup.js"></script>
                <script src="js/theme.js"></script>-->
    </body>

</html>
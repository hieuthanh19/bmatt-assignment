<%-- 
    Document   : registration
    Created on : 11-11-2019, 15:20:28
    Author     : DELL
--%>

<%@page import="perfumestore.UserModel"%>
<%@page import="perfumestore.AccountException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="perfumestore.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="perfumestore.AccountModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="img/favicon.png" type="image/png">
        <title>Register | BMatt Shop</title>
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

    <%
        String Username = "";
        String Name = "";
        String Address = "";
        String Phone = "";
        String Profile_picture = null;
        String Email = "";
        String Password = "";
        String Confirm_password = "";
        if (request.getParameter("username") != null) {
            Username = request.getParameter("username");
        }
        if (request.getParameter("name") != null) {
            Name = request.getParameter("name");
        }
        if (request.getParameter("address") != null) {
            Address = request.getParameter("address");
        }
        if (request.getParameter("phone") != null) {
            Phone = request.getParameter("phone");
        }
        if (request.getParameter("email") != null) {
            Email = request.getParameter("email");
        }
        if (request.getParameter("password") != null) {
            Password = request.getParameter("password");
        }
        if (request.getParameter("confirm_password") != null) {
            Confirm_password = request.getParameter("confirm_password");
        }

        AccountModel am = new AccountModel();
        int account_id = 0;
        try {
            if (!Username.isEmpty() && !Password.isEmpty() && Password.equals(Confirm_password)) {
                account_id = am.insert(Username, Password, 1, 1);
                response.sendRedirect("login.jsp");
            }

            //check if Username already exists
            if (account_id == -1 || Username.isEmpty()) {
                throw new Exception("Username already exists");
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        UserModel usm = new UserModel();
        int u_id = -1;

        try {
            if (account_id != -1) {
                //add new client to DB
                u_id = usm.insert(Username, Address, Phone, Email, Profile_picture, account_id, 1);
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        //session.setAttribute("username", Username);
        //response.sendRedirect("index.jsp");
    %>

    <body>
        <jsp:include page="navbar.jsp"/>
        <!--================Home Banner Area =================-->
        <section class="banner_area">
            <div class="banner_inner d-flex align-items-center">
                <div class="container">
                    <div class="banner_content text-center">
                        <h2>Register</h2>
                        <div class="page_link">
                            <a href="index.jsp">Home</a>
                            <a href="registration.jsp">Register</a>
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
                                <h2>WELCOME TO BMATT SHOP</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="login_form_inner reg_form">
                            <h3>Create an Account</h3>
                            <form class="row login_form" action="registration.jsp" method="post" id="contactForm" novalidate="novalidate"  onsubmit="return checkPassword(this)">
                                <div class="col-md-12 form-group">
                                    <input type="text" class="form-control" id="username" name="username" value="" placeholder="Username" required/>
                                </div>
                                <div class="col-md-12 form-group">
                                    <input type="text" class="form-control" id="name" name="name" value="" placeholder="Name" required/>
                                </div>
                                <div class="col-md-12 form-group">
                                    <input type="email" class="form-control" id="email" name="email" value="" placeholder="Email Address" required pattern="^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$">
                                </div>
                                <div class="col-md-12 form-group">
                                    <input type="address" class="form-control" id="address" name="address" value="" placeholder="Address" required/>
                                </div>
                                <div class="col-md-12 form-group">
                                    <input type="text" class="form-control" id="phone" name="phone" value="" placeholder="Phone Number" required minlength="10">
                                </div>
                                <div class="col-md-12 form-group">
                                    <input type="password" class="form-control" id="password" name="password" value="" placeholder="Password" required minlength="6">
                                </div>
                                <div class="col-md-12 form-group">
                                    <input type="password" class="form-control" id="confirm_password" name="confirm_password" value="" placeholder="Confirm password" required/> <span id='message'></span>
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="creat_account">
                                        <input type="checkbox" id="f-option2" name="selector">
                                        <label for="f-option2">Keep me logged in</label>
                                    </div>
                                </div> 
                                <div class="col-md-12 form-group">
                                    <button type="submit" value="submit" name="submit" class="btn submit_btn">Register</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- JS -->
        <script src="js/jquery.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                                $('#password, #confirm_password').on('keyup', function () {
                                    if ($('#password').val() === $('#confirm_password').val()) {
                                        $('#message').html('Matching').css('color', 'green');
                                    } else
                                        $('#message').html('Not Matching').css('color', 'red');
                                });

//            function myFunction() {
//                if(document.getElementById("password") == document.getElementById("re-password"))
//                document.getElementById("submit").disabled = false;
//            else
//                document.getElementById("submit").disabled = true;
//            }
//            
                                function checkPassword(form) {
                                    password = form.password.value;
                                    re_password = form.re_password.value;
                                    // If password not entered 
                                    if (password === '')
                                        alert("Please enter Password");

                                    // If confirm password not entered 
                                    else if (re_password === '')
                                        alert("Please enter confirm password");

                                    // If Not same return False.     
                                    else if (password !== re_password) {
                                        alert("\nPassword did not match: Please try again...");
                                        return false;
                                    }
                                    // If same return True. 
                                    else {
                                        return true;
                                    }

                                }

                                var checker = document.getElementById('agree-term');
                                var sendbtn = document.getElementById('submit');
                                checker.onchange = function () {
                                    sendbtn.disabled = !this.checked;
                                };
        </script>
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

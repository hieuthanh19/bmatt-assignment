<%-- 
    Document   : login
    Created on : Nov 12, 2019, 10:43:19 PM
    Author     : ThanhKH
--%>

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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login | BMatt Dashboard</title>
        <jsp:include page="include.jsp"/>
        <link rel="stylesheet" type="text/css" href="../admin/app-assets/css/pages/authentication.css">
        <style>
            .error-message{
                color: #da5454;
            }
        </style>
    </head>
    <body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">
        <div class="app-content content">
            <div class="content-overlay"></div>
            <div class="header-navbar-shadow"></div>
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <section class="row flexbox-container">
                        <div class="col-xl-8 col-11 d-flex justify-content-center">
                            <div class="card bg-authentication rounded-0 mb-0">
                                <div class="row m-0">
                                    <div class="col-lg-6 d-lg-block d-none text-center align-self-center px-1 py-0">
                                        <img src="../admin/app-assets/images/pages/login.png" alt="branding logo">
                                    </div>
                                    <div class="col-lg-6 col-12 p-0">
                                        <div class="card rounded-0 mb-0 px-2">
                                            <div class="card-header pb-1">
                                                <div class="card-title">
                                                    <h4 class="mb-0">Login</h4>
                                                </div>
                                            </div>
                                            <p class="px-2">Welcome back, please login to your account.</p>
                                            <div class="card-content">
                                                <div class="card-body pt-1">
                                                    <form action="login-process.jsp" method="post">
                                                        <fieldset class="form-label-group form-group position-relative has-icon-left">
                                                            <input type="text" class="form-control" id="user-name" name="username" placeholder="Username" required>
                                                            <div class="form-control-position">
                                                                <i class="feather icon-user"></i>
                                                            </div>
                                                            <label for="user-name">Username</label>
                                                        </fieldset>

                                                        <fieldset class="form-label-group position-relative has-icon-left">
                                                            <input type="password" class="form-control" id="user-password" name="password" placeholder="Password" required>
                                                            <div class="form-control-position">
                                                                <i class="feather icon-lock"></i>
                                                            </div>
                                                            <label for="user-password">Password</label>
                                                        </fieldset>
                                                        <div class="form-group d-flex justify-content-between align-items-center">
                                                            <div class="text-left">
                                                                <% if (errorCode != -1) {%>
                                                                <p class="error-message">Log in failed! <br><%=errorMsg%></p>
                                                                <% }%>
                                                            </div>
                                                        </div>                                                        
                                                        <button type="submit" class="btn btn-primary float-right btn-inline ">Login</button>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="login-footer">
                                                <p> </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
            </div>
        </div>

        <!-- BEGIN: Vendor JS-->
        <script src="../admin/app-assets/vendors/js/vendors.min.js"></script>
        <!-- BEGIN Vendor JS-->

        <!-- BEGIN: Page Vendor JS-->
        <!-- END: Page Vendor JS-->

        <!-- BEGIN: Theme JS-->
        <script src="../admin/app-assets/js/core/app-menu.js"></script>
        <script src="../admin/app-assets/js/core/app.js"></script>
        <script src="../admin/app-assets/js/scripts/components.js"></script>
        <!-- END: Theme JS-->

        <!-- BEGIN: Page JS-->
        <!-- END: Page JS-->

    </body>
</html>

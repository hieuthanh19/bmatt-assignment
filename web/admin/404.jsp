<%-- 
    Document   : 404
    Created on : Nov 13, 2019, 9:06:23 AM
    Author     : ThanhKH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page Not Found | BMatt Dashboard</title>
        <jsp:include page="include.jsp"/>
        <link rel="stylesheet" type="text/css" href="../admin/app-assets/css/pages/error.css">
    </head>
    <body class="vertical-layout vertical-menu-modern 1-column  navbar-floating footer-static bg-full-screen-image  blank-page blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
        <!-- BEGIN: Content-->
        <div class="app-content content">
            <div class="content-overlay"></div>
            <div class="header-navbar-shadow"></div>
            <div class="content-wrapper">
                <div class="content-header row">
                </div>
                <div class="content-body">
                    <!-- error 404 -->
                    <section class="row flexbox-container">
                        <div class="col-xl-7 col-md-8 col-12 d-flex justify-content-center">
                            <div class="card auth-card bg-transparent shadow-none rounded-0 mb-0 w-100">
                                <div class="card-content">
                                    <div class="card-body text-center">
                                        <img src="../admin/app-assets/images/pages/404.png" class="img-fluid align-self-center" alt="branding logo">
                                        <h1 class="font-large-2 my-1">404 - Page Not Found!</h1>
                                        <p class="p-2">
                                            The page you looking for is not exist!
                                        </p>
                                        <a class="btn btn-primary btn-lg mt-2" href="index.jsp">Back to Home</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- error 404 end -->

                </div>
            </div>
        </div>
        <!-- END: Content-->


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

<%-- 
    Document   : contact
    Created on : Nov 14, 2019, 1:06:56 AM
    Author     : ThanhKH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="img/favicon.png" type="image/png">
        <title>Contact | BMatt Shop</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="vendors/lightbox/simpleLightbox.css">
        <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="vendors/animate-css/animate.css">
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
                        <h2>Contact Us</h2>
                        <div class="page_link">
                            <a href="index.jsp">Home</a>
                            <a href="contact.jsp">Contact Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Home Banner Area =================-->

        <!--================Contact Area =================-->
        <section class="contact_area p_120">
            <div class="container">
                <!--                <div id="mapBox" class="mapBox" data-lat="10.0134708" data-lon="105.731497" data-zoom="17" data-info="FPTU"
                                     data-mlat="10.0134708" data-mlon="105.731497">
                                </div>-->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="contact_info">
                            <div class="info_item">
                                <i class="lnr lnr-home"></i>
                                <h6>
                                    <a href="https://www.google.com/maps/place/%C4%90%E1%BA%A1i+H%E1%BB%8Dc+Fpt+C%E1%BA%A7n+Th%C6%A1/@10.0290131,105.7499822,19.08z/data=!4m5!3m4!1s0x31a088447e3665c1:0x284416539d0f64ba!8m2!3d10.0286845!4d105.7497459" target="_blank">
                                        FPT University, Cantho, Vietnam
                                    </a>
                                </h6>
                                <p>Our main office</p>
                            </div>
                            <div class="info_item">
                                <i class="lnr lnr-phone-handset"></i>
                                <h6>
                                    <a href="tel:0808150808">0808150808</a>
                                </h6>
                                <p>Mon to Fri 8 am to 6 pm</p>
                            </div>
                            <div class="info_item">
                                <i class="lnr lnr-envelope"></i>
                                <h6>
                                    <a href="mailto:perfume_store@bmatt.com">contact@bmatt.com</a>
                                </h6>
                                <p>Send us your query anytime!</p>
                            </div>
                        </div>
                    </div>
                    <!--                    <div class="col-lg-9">
                                            <form class="row contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter email address">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="subject" name="subject" placeholder="Enter Subject">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <textarea class="form-control" name="message" id="message" rows="1" placeholder="Enter Message"></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 text-right">
                                                    <button type="submit" value="submit" class="btn submit_btn">Send Message</button>
                                                </div>
                                            </form>
                                        </div>-->
                </div>
            </div>
        </section>
        <!--================Contact Area =================-->

        <jsp:include page="footer.jsp"/>
        <!-- contact js -->
        <script src="js/jquery.form.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/contact.js"></script>
        <!--        gmaps Js
                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE" ></script>
                <script src="js/gmaps.min.js"></script>
                <script src="js/theme.js"></script>-->
    </body>
</html>

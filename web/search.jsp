<%-- 
    Document   : contact
    Created on : Nov 14, 2019, 1:06:56 AM
    Author     : ThanhKH
--%>

<%@page import="perfumestore.Product_Image"%>
<%@page import="perfumestore.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="perfumestore.Product_Image_Model"%>
<%@page import="perfumestore.Product_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String imgDir = "img/product/single-product/";
    String search = "";
    if (request.getParameter("search") != null) {
        search = request.getParameter("search");
    }
    Product_Model pM = new Product_Model();
    Product_Image_Model productImgM = new Product_Image_Model();
    ArrayList<Product> productList = pM.getAllProduct();
%>
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
        <style>
            /*                    .main_title{
                                    font-size: 
                                }*/
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <!--================Home Banner Area =================-->
        <section class="banner_area">
            <div class="banner_inner d-flex align-items-center">
                <div class="container">
                    <div class="banner_content text-center">
                        <h2>Search</h2>
                        <div class="page_link">
                            <a href="index.jsp">Home</a>
                            <a href="search.jsp">Search</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Home Banner Area =================-->

        <!--================Search Area =================-->
        <section class="contact_area p_60">
            <div class="container">
                <!--                <div id="mapBox" class="mapBox" data-lat="10.0134708" data-lon="105.731497" data-zoom="17" data-info="FPTU"
                                     data-mlat="10.0134708" data-mlon="105.731497">
                                </div>-->
                <div class="row">

                    <div class="col-lg-6 offset-3">
                        <div class="search-bar">
                            <!-- Search bar start -->
                            <form action="category.jsp" method="get">
                                <div class="input-group mb-4 border rounded-pill search-bar">
                                    <input type="text" name="search" value="<%=search%>" placeholder="What're you searching for?" aria-describedby="button-addon3" class="form-control bg-none border-0">
                                    <div class="input-group-append border-0">
                                        <button id="button-addon3" type="submit" class="btn btn-link text-info" ><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </form>
                            <!-- Search bar end -->
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
        <!--================Search Area =================-->

        <!--================Feature Product Area =================-->
        <section class="feature_product_area section_gap" id="feature-product">
            <div class="main_box">
                <div class="container-fluid">
                    <div class="row">
                        <div class="main_title">
                            <h3>Fragrances You May Interest</h3>

                        </div>
                    </div>
                    <div class="row">

                        <%                            int i = 0;
                            for (Product p : productList) {
                                ArrayList<Product_Image> productImgList = productImgM.getProduct_Image(p.getProduct_id());
                                if (i < 10) {
                                    if (p.getProduct_status() == 1) {
                        %>

                        <div class="col col<%=i + 1%>">
                            <div class="f_p_item">
                                <div class="f_p_img">
                                    <img class="img-fluid" src="<%=imgDir + p.getBrand_id() + "/" + productImgList.get(0).getUrl()%>"  alt="product image">
                                    <div class="p_icon">
                                        <a href="#">
                                            <i class="lnr lnr-heart"></i>
                                        </a>
                                        <a href="#">
                                            <i class="lnr lnr-cart"></i>
                                        </a>
                                    </div>
                                </div>


                                <a href="product-detail.jsp?id=<%=p.getProduct_id()%>">
                                    <h4><%=p.getName()%></h4>
                                </a>

                                <h5>$ <%=p.getCurrent_price()%></h5>
                            </div>

                        </div>
                        <%
                                        ++i;
                                    }
                                } else {
                                    break;
                                }
                            }
                        %>      


                    </div>
                    <div class="row">
                        <a class="green_btn mx-auto" href="category.jsp">See more</a>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Feature Product Area =================-->

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

<%-- 
    Document   : product-detail
    Created on : Nov 5, 2019, 8:04:36 PM
    Author     : ThanhKH
--%>

<%@page import="perfumestore.Product_Image_Model"%>
<%@page import="perfumestore.Product_Image"%>
<%@page import="perfumestore.Product_Model"%>
<%@page import="perfumestore.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    /*      
    int brand = "";
    if((request.getParameter("brand") != null)
            brand = request.getParameter("brand");
    */      
    Product pd = new Product();
    Product_Model pdm = new Product_Model();
    pd = pdm.loadMyProduct(id);
  
    Product_Image pdi = new Product_Image();
    Product_Image_Model pdim = new Product_Image_Model();
    pdi = pdim.myProductImage(id);
 
    String trangThai = "In Stock";
    if (pd.getProduct_status() != 1)
     trangThai = "Sold out";
 
    String brand_name = "Chanel";
    int brand_id = pd.getBrand_id();
    if(brand_id == 2)
       brand_name = "Victoria Secret";
    else if(brand_id == 3)
       brand_name = "Lolita";
    else if(brand_id == 4)
       brand_name = "Versace";
    else if(brand_id == 5)
       brand_name = "Dior";
    
    String categoty_name ="Female";
    int categoty_id = pd.getCategoty_id();
    if(categoty_id == 2)
        categoty_name="Male";
    else if(categoty_id == 3)
        categoty_name="Children";
    else if(categoty_id == 4)
        categoty_name="Unisex";
    
    
%> 
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="img/favicon.png" type="image/png">
        <title>Fashiop</title>
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

        <!--================Header Menu Area =================-->
        <header class="header_area">
            <div class="top_menu row m0">
                <div class="container-fluid">
                    <div class="float-left">
                        <p>Call Us: 012 44 5698 7456 896</p>
                    </div>
                    <div class="float-right">
                        <ul class="right_side">
                            <li>
                                <a href="login.html">
                                    Login/Register
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    My Account
                                </a>
                            </li>
                            <li>
                                <a href="contact.html">
                                    Contact Us
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="main_menu">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <a class="navbar-brand logo_h" href="index.html">
                            <img src="img/logo.png" alt="">
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                            <div class="row w-100">
                                <div class="col-lg-7 pr-0">
                                    <ul class="nav navbar-nav center_nav pull-right">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="index.html">Home</a>
                                        </li>
                                        <li class="nav-item submenu dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Shop</a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-item">
                                                    <a class="nav-link" href="category.html">Shop Category</a>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="single-product.html">Product Details</a>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="checkout.html">Product Checkout</a>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="cart.html">Shopping Cart</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="confirmation.html">Confirmation</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item submenu dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-item">
                                                    <a class="nav-link" href="blog.html">Blog</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="single-blog.html">Blog Details</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item submenu dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages</a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-item">
                                                    <a class="nav-link" href="login.html">Login</a>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="tracking.html">Tracking</a>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="elements.html">Elements</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="contact.html">Contact</a>
                                        </li>
                                    </ul>
                                </div>

                                <div class="col-lg-5">
                                    <ul class="nav navbar-nav navbar-right right_nav pull-right">
                                        <hr>
                                        <li class="nav-item">
                                            <a href="#" class="icons">
                                                <i class="fa fa-search" aria-hidden="true"></i>
                                            </a>
                                        </li>

                                        <hr>

                                        <li class="nav-item">
                                            <a href="#" class="icons">
                                                <i class="fa fa-user" aria-hidden="true"></i>
                                            </a>
                                        </li>

                                        <hr>

                                        <li class="nav-item">
                                            <a href="#" class="icons">
                                                <i class="fa fa-heart-o" aria-hidden="true"></i>
                                            </a>
                                        </li>

                                        <hr>

                                        <li class="nav-item">
                                            <a href="#" class="icons">
                                                <i class="lnr lnr lnr-cart"></i>
                                            </a>
                                        </li>

                                        <hr>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <!--================Header Menu Area =================-->

        <!--================Home Banner Area =================-->
        <section class="banner_area">
            <div class="banner_inner d-flex align-items-center">
                <div class="container">
                    <div class="banner_content text-center">
                        <h2>Single Product Page</h2>
                        <div class="page_link">
                            <a href="index.html">Home</a>
                            <a href="category.html">Category</a>
                            <a href="single-product.html">Product Details</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Home Banner Area =================-->

        <!--================Single Product Area =================-->
        <div class="product_image_area">
            <div class="container">
                <div class="row s_product_inner">
                    <div class="col-lg-6">
                        <div class="s_product_img">
                            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">


                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" src="img/product/single-product/<%=pd.getBrand_id()%>/<%=pdi.getUrl()%>" alt="First slide">
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 offset-lg-1">
                        <div class="s_product_text">
                            <h3><%=pd.getName()%></h3>
                            <h2>$<%=pd.getCurrent_price()%></h2>
                            <ul class="list">
                                <li>
                                    <a class="active" href="#">
                                        <span>Brand name</span> : <%=brand_name%></a>
                                </li>
                                <li>
                                    <a class="active" href="#">
                                        <span>Category</span> : <%=categoty_name%></a>
                                </li>
                                <li>
                                    <a class="active" href="#">
                                        <span>Volumn</span> : <%=pd.getVolume()%> ml</a>
                                </li>
                                <li>
                                    <a href="#" class="active">
                                        <span>Availibility</span>  :  <%=trangThai%></a>
                                </li>
                            </ul>
                            <p><%=pd.getDescription()%></p>
                            <div class="product_count">
                                <label for="qty">Quantity:</label>
                                <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:" class="input-text qty">
                                <button onclick="var result = document.getElementById('sst');
                                        var sst = result.value;
                                        if (!isNaN(sst))
                                            result.value++;
                                        return false;"
                                        class="increase items-count" type="button">
                                    <i class="lnr lnr-chevron-up"></i>
                                </button>
                                <button onclick="var result = document.getElementById('sst'); var sst = result.value; if (!isNaN(sst) & amp; & amp; sst > 0) result.value--; return false;"
                                        class="reduced items-count" type="button">
                                    <i class="lnr lnr-chevron-down"></i>
                                </button>
                            </div>
                            <div class="card_area">
                                <a class="main_btn" href="#">Add to Cart</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--================End Single Product Area =================-->
        
        <!--===--!>
        
        
        <!--== ==--!>


        
        
        <!--================ start footer Area  =================-->
        <footer class="footer-area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6 class="footer_title">About Us</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6 class="footer_title">Newsletter</h6>
                            <p>Stay updated with our latest trends</p>
                            <div id="mc_embed_signup">
                                <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                      method="get" class="subscribe_form relative">
                                    <div class="input-group d-flex flex-row">
                                        <input name="EMAIL" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address '"
                                               required="" type="email">
                                        <button class="btn sub-btn">
                                            <span class="lnr lnr-arrow-right"></span>
                                        </button>
                                    </div>
                                    <div class="mt-10 info"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-footer-widget instafeed">
                            <h6 class="footer_title">Instagram Feed</h6>
                            <ul class="list instafeed d-flex flex-wrap">
                                <li>
                                    <img src="img/instagram/Image-01.jpg" alt="">
                                </li>
                                <li>
                                    <img src="img/instagram/Image-02.jpg" alt="">
                                </li>
                                <li>
                                    <img src="img/instagram/Image-03.jpg" alt="">
                                </li>
                                <li>
                                    <img src="img/instagram/Image-04.jpg" alt="">
                                </li>
                                <li>
                                    <img src="img/instagram/Image-05.jpg" alt="">
                                </li>
                                <li>
                                    <img src="img/instagram/Image-06.jpg" alt="">
                                </li>
                                <li>
                                    <img src="img/instagram/Image-07.jpg" alt="">
                                </li>
                                <li>
                                    <img src="img/instagram/Image-08.jpg" alt="">
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="single-footer-widget f_social_wd">
                            <h6 class="footer_title">Follow Us</h6>
                            <p>Let us be social</p>
                            <div class="f_social">
                                <a href="#">
                                    <i class="fa fa-facebook"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-twitter"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-dribbble"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-behance"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row footer-bottom d-flex justify-content-between align-items-center">
                    <p class="col-lg-12 footer-text text-center"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </footer>
        <!--================ End footer Area  =================-->




        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
        <script src="js/theme.js"></script>
    </body>

</html>

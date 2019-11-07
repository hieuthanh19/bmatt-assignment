<%-- 
    Document   : home
    Created on : Nov 1, 2019, 10:20:15 PM
    Author     : ThanhKH
--%>

<%@page import="perfumestore.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="perfumestore.Product_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Product_Model pM = new Product_Model();
    int pageNumber = 1;
    String search = "";
    String sortColumn = "";
    final int Product_Per_Page = 10;
    ArrayList<Product> productList = pM.getPaging(pageNumber, search, sortColumn, Product_Per_Page);


%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="img/favicon.png" type="image/png">
        <title>BMatt Shop</title>
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
                        <a class="navbar-brand logo_h" href="index.jsp">
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
                                            <a class="nav-link" href="index.jsp">Home</a>
                                        </li>                                      
                                        <li class="nav-item ">
                                            <a class="nav-link" href="index.jsp">Women's Fragrance</a>
                                        </li>                                      
                                        <li class="nav-item ">
                                            <a class="nav-link" href="index.jsp">Men's Fragrance</a>
                                        </li>                                      


                                        <!--  <li class="nav-item submenu dropdown">
                                              <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Product</a>
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
                                          </li>                                            -->

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
                                            <a href="cart.jsp" class="icons">
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
        <section class="home_banner_area">
            <div class="overlay"></div>
            <div class="banner_inner d-flex align-items-center">
                <div class="container">
                    <div class="banner_content row">
                        <div class="offset-lg-2 col-lg-8">
                            <h3>Premium Fragrances from
                                <br />Prestige Brands</h3>
                            <p>We are certificated partners of prestige fragrance brands from all over the world. </p>
                            <a class="white_bg_btn" href="#feature-product">View Our Collection</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Home Banner Area =================-->

        <!--================Hot Deals Area =================-->
        <section class="hot_deals_area section_gap">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="hot_deal_box">
                            <img class="img-fluid" src="img/product/hot_deals/chanel-deal.jpg" alt="Hot Deal">
                            <div class="content">
                                <h2>Chanel's Collections</h2>
                                <p>Explore</p>
                            </div>
                            <a class="hot_deal_link" href="#"></a>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="hot_deal_box">
                            <img class="img-fluid" src="img/product/hot_deals/versace-deal.jpg" alt="Hot Deal">
                            <div class="content">
                                <h2>The Charming of Versace</h2>
                                <p>Explore</p>
                            </div>
                            <a class="hot_deal_link" href="#"></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Hot Deals Area =================-->

        <!--================Clients Logo Area =================-->
        <section class="clients_logo_area">
            <div class="container-fluid">
                <div class="clients_slider owl-carousel">
                    <div class="item">
                        <img src="img/clients-logo/chanel.png" alt="Brand Logo">
                    </div>
                    <div class="item">
                        <img src="img/clients-logo/dior.png" alt="Brand Logo">
                    </div>
                    <div class="item">
                        <img src="img/clients-logo/lolita-lempicka.png" alt="Brand Logo">
                    </div>
                    <div class="item">
                        <img src="img/clients-logo/versace.png" alt="Brand Logo">
                    </div>
                    <div class="item">
                        <img src="img/clients-logo/victoria-secret.png" alt="Brand Logo">
                    </div>
                </div>
            </div>
        </section>
        <!--================End Clients Logo Area =================-->

        <!--================Feature Product Area =================-->
        <section class="feature_product_area section_gap" id="feature-product">
            <div class="main_box">
                <div class="container-fluid">
                    <div class="row">
                        <div class="main_title">
                            <h2>Featured Fragrances</h2>
                            <p>Perfumes that loved by our customers.</p>
                        </div>
                    </div>
                    <div class="row">
                        <% for (int i = 0; i < Product_Per_Page; i++) {
                        %>
                        <div class="col col<%=i + 1%>">
                            <div class="f_p_item">
                                <div class="f_p_img">
                                    <img class="img-fluid" src="img/product/single-product/<%=i + 1%>.jpg" alt="Product Image">
                                    <div class="p_icon">
                                        <a href="#">
                                            <i class="lnr lnr-heart"></i>
                                        </a>
                                        <a href="#">
                                            <i class="lnr lnr-cart"></i>
                                        </a>
                                    </div>
                                </div>
                                <a href="product-detail.jsp?id=<%=10%>">
                                    <h4><%=productList.get(i).getName()%></h4>
                                </a>
                                <h5>$ <%=productList.get(i).getCurrent_price()%></h5>
                            </div>
                        </div>
                        <%
                            }
                        %>                        
                    </div>
                    <div class="row">
                        <a class="green_btn mx-auto" href="#feature-product">See more</a>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Feature Product Area =================-->
        
        <!--================Start Women Fragrance Area =================-->
        <section class="feature_product_area section_gap" id="feature-product">
            <div class="main_box">
                <div class="container-fluid">
                    <div class="row">
                        <div class="main_title">
                            <h2>Fragrances for Ladies</h2>
                            <p>Fragrances that made for ladies.</p>
                        </div>
                    </div>
                    <div class="row">
                        <% for (int i = 0; i < 5; i++) {
                        %>
                        <div class="col col<%=i + 1%>">
                            <div class="f_p_item">
                                <div class="f_p_img">
                                    <img class="img-fluid" src="img/product/single-product/<%=i + 1%>.jpg" alt="Product Image">
                                    <div class="p_icon">
                                        <a href="#">
                                            <i class="lnr lnr-heart"></i>
                                        </a>
                                        <a href="#">
                                            <i class="lnr lnr-cart"></i>
                                        </a>
                                    </div>
                                </div>
                                <a href="product-detail.jsp?id=<%=10%>">
                                    <h4><%=productList.get(i).getName()%></h4>
                                </a>
                                <h5>$ <%=productList.get(i).getCurrent_price()%></h5>
                            </div>
                        </div>
                        <%
                            }
                        %>                        
                    </div>
                    <div class="row">
                        <a class="green_btn mx-auto" href="#feature-product">See more</a>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Women Fragrance  Area =================-->
        
        <!--================Men Fragrance  Area =================-->
        <section class="feature_product_area section_gap" id="feature-product">
            <div class="main_box">
                <div class="container-fluid">
                    <div class="row">
                        <div class="main_title">
                            <h2>Fragrances for Gentlemen</h2>
                            <p>Fragrances that made for gentlemen.</p>
                        </div>
                    </div>
                    <div class="row">
                        <% for (int i = 0; i < 5; i++) {
                        %>
                        <div class="col col<%=i + 1%>">
                            <div class="f_p_item">
                                <div class="f_p_img">
                                    <img class="img-fluid" src="img/product/single-product/<%=i + 1%>.jpg" alt="Product Image">
                                    <div class="p_icon">
                                        <a href="#">
                                            <i class="lnr lnr-heart"></i>
                                        </a>
                                        <a href="#">
                                            <i class="lnr lnr-cart"></i>
                                        </a>
                                    </div>
                                </div>
                                <a href="product-detail.jsp?id=<%=10%>">
                                    <h4><%=productList.get(i).getName()%></h4>
                                </a>
                                <h5>$ <%=productList.get(i).getCurrent_price()%></h5>
                            </div>
                        </div>
                        <%
                            }
                        %>                        
                    </div>
                    <div class="row">
                        <a class="green_btn mx-auto" href="#feature-product">See more</a>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Men Fragrance  Area =================-->


        <!--================ start footer Area  =================-->
        <footer class="footer-area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6 class="footer_title">About Us</h6>
                            <p>BMatt is a small team lead by ThanhKH</p>
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
                    <p class="col-lg-12 footer-text text-center">
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved 

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
        <script src="vendors/counter-up/jquery.waypoints.min.js"></script>
        <script src="vendors/flipclock/timer.js"></script>
        <script src="vendors/counter-up/jquery.counterup.js"></script>
        <script src="js/mail-script.js"></script>
        <script src="js/theme.js"></script>
    </body>

</html>

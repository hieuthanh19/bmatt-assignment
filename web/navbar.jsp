<%-- 
    Document   : navbar
    Created on : Nov 13, 2019, 7:50:47 PM
    Author     : ThanhKH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--================Header Menu Area =================-->
<header class="header_area">
    <div class="top_menu row m0">
        <div class="container-fluid">

            <div class="float-right">
                <ul class="right_side">
                    <li>
                        <a href="login.jsp">
                            Login/Register
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            My Account
                        </a>
                    </li>
                    <li>
                        <a href="contact.jsp">
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
                                    <a class="nav-link" href="category.jsp?categoryId=1">Women's Fragrance</a>
                                </li>                                      
                                <li class="nav-item ">
                                    <a class="nav-link" href="category.jsp?categoryId=2">Men's Fragrance</a>
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
                                    <a class="nav-link" href="contact.jsp">Contact</a>
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
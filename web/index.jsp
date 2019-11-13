<%-- 
    Document   : home
    Created on : Nov 1, 2019, 10:20:15 PM
    Author     : ThanhKH
--%>

<%@page import="perfumestore.Product_Image"%>
<%@page import="perfumestore.Product_Image_Model"%>
<%@page import="perfumestore.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="perfumestore.Product_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Product_Model pM = new Product_Model();
    Product_Image_Model productImgM = new Product_Image_Model();
    int pageNumber = 1;
    String search = "";
    String sortColumn = "";
    final int Product_Per_Page = 10;
    String imgDir = "img/product/single-product/";

    ArrayList<Product> productList = pM.getAllProduct();


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

         <jsp:include page="navbar.jsp"/>

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
                        <%
                            i = 0;
                            for (Product p : productList) {
                                ArrayList<Product_Image> productImgList = productImgM.getProduct_Image(p.getProduct_id());
                                if (i < Product_Per_Page) {
                                    if (p.getProduct_status() == 1 && p.getCategory_name().equals("female")) {
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
                        <%
                            i = 0;
                            for (Product p : productList) {
                                ArrayList<Product_Image> productImgList = productImgM.getProduct_Image(p.getProduct_id());
                                if (i < 10) {
                                    if (p.getProduct_status() == 1 && p.getCategory_name().equals("male")) {
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
                                <a href="product-detail.jsp?id=<%=10%>">
                                    <h4><%=productList.get(i).getName()%></h4>
                                </a>
                                <h5>$ <%=productList.get(i).getCurrent_price()%></h5>
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
                        <a class="green_btn mx-auto" href="#feature-product">See more</a>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Men Fragrance  Area =================-->


         <jsp:include page="footer.jsp"/>
        



       
    </body>

</html>

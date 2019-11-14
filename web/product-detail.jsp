<%-- 
    Document   : product-detail
    Created on : Nov 5, 2019, 8:04:36 PM
    Author     : ThanhKH
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="perfumestore.Product_Image_Model"%>
<%@page import="perfumestore.Product_Image"%>
<%@page import="perfumestore.Product_Model"%>
<%@page import="perfumestore.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Enumeration<String> requestEnumeration = request.getAttributeNames();
    while (requestEnumeration.hasMoreElements()) {
        String paramName = requestEnumeration.nextElement();
        request.setAttribute(paramName, request.getAttribute(paramName));
    }

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
    if (pd.getProduct_status() != 1) {
        trangThai = "Sold out";
    }
    //format volume
    String volume = String.format("%.0f", pd.getVolume());

    ArrayList<Product> suggestList = pdm.getPaging(1, "", 0, 5, 0, pd.getBrand_id(), 0, 1000, 0, 10000);

//    String brand_name = "Chanel";
//    int brand_id = pd.getBrand_id();
//    if (brand_id == 2) {
//        brand_name = "Victoria Secret";
//    } else if (brand_id == 3) {
//        brand_name = "Lolita";
//    } else if (brand_id == 4) {
//        brand_name = "Versace";
//    } else if (brand_id == 5) {
//        brand_name = "Dior";
//    }
//    String categoty_name = "Female";
//    int categoty_id = pd.getCategoty_id();
//    if (categoty_id == 2) {
//        categoty_name = "Male";
//    } else if (categoty_id == 3) {
//        categoty_name = "Children";
//    } else if (categoty_id == 4) {
//        categoty_name = "Unisex";
//    }

%> 
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="icon" href="img/favicon.png" type="image/png">
        <title><%=pd.getName()%> | BMatt Shop</title>

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
                        <h2>Single Product Page</h2>
                        <div class="page_link">
                            <a href="index.jsp">Home</a>
                            <a href="category.jsp">Category</a>
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
                                    <a class="active" href="category.jsp?brandId=<%=pd.getBrand_id()%>">
                                        <span>Brand name</span> : <%=pd.getBrandName()%></a>
                                </li>
                                <li>
                                    <a class="active" href="category.jsp?categoryId=<%=pd.getCategoty_id()%>">
                                        <span>Category</span> : <%=pd.getCategory_name()%></a>
                                </li>
                                <li>
                                    <a class="active" href="category.jsp?volumeStart=1&volumeEnd=<%=pd.getVolume()%>">
                                        <span>Volume</span> : <%=volume%> ml</a>
                                </li>
                                <li>
                                    <a class="" >
                                        <span>Availability</span>  :  <%=trangThai%>
                                    </a>

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

        <!--================Start Women Fragrance Area =================-->

        <section class="feature_product_area section_gap" id="feature-product">
            <div class="main_box">
                <div class="container-fluid">
                    <div class="row">

                        <h2>Products from <%=pd.getBrandName()%></h2><br>

                        <!--                        <p><a href="#feature-product" ></a></p>-->
                    </div>
                    <div class="row pt-3">
                        <%
                            int i = 0;
                            for (Product p : suggestList) {
                                Product_Image_Model primd = new Product_Image_Model();

                                Product_Image pri = new Product_Image();
                                pri = primd.myProductImage(p.getProduct_id());


                        %>
                        <div class="col col<%=i + 1%>">
                            <div class="f_p_item">
                                <div class="f_p_img">
                                    <img class="img-fluid" src="img/product/single-product/<%=p.getBrand_id()%>/<%=pri.getUrl()%>"  alt="product image">
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
                        %>                        
                    </div>
                    <!--================End Single Product Area =================-->        

                    <!--================ Subscription Area ================
                     <section class="subscription-area section_gap">
                         <div class="container">
                             <div class="row justify-content-center">
                                 <div class="col-lg-8">
                                     <div class="section-title text-center">
                                         <h2>Subscribe for Our Newsletter</h2>
                                         <span>We won’t send any kind of spam</span>
                                     </div>
                                 </div>
                             </div>
                             <div class="row justify-content-center">
                                 <div class="col-lg-6">
                                     <div id="mc_embed_signup">
                                         <form target="_blank" novalidate action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&id=92a4423d01"
                                               method="get" class="subscription relative">
                                             <input type="email" name="EMAIL" placeholder="Email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address'"
                                                    required="">
                                              <div style="position: absolute; left: -5000px;">
                                                             <input type="text" name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="">
                                                     </div> 
                                             <button type="submit" class="newsl-btn">Get Started</button>
                                             <div class="info"></div>
                                         </form>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </section>
                     ================ End Subscription Area ================
             
                    <jsp:include page="footer.jsp"/>
                   
                </body>
            
            </html>

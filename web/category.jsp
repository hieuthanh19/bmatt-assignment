<%-- 
    Document   : category
    Created on : Nov 5, 2019, 9:11:40 PM
    Author     : Nhat Thanh
--%>

<%@page import="perfumestore.Brand"%>
<%@page import="perfumestore.BrandModel"%>
<%@page import="perfumestore.Product_Image_Model"%>
<%@page import="perfumestore.Product_Image"%>
<%@page import="perfumestore.Product_Model"%>
<%@page import="perfumestore.Product"%>
<%@page import="perfumestore.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="perfumestore.Category_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int pageNumber = 1;
    if (request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
    String search = "";
    if (request.getParameter("search") != null) {
        search = request.getParameter("search");
    }
    int sort = 0;
    if (request.getParameter("sort") != null) {
        sort = Integer.parseInt(request.getParameter("sort"));
    }

    int categoryId = 0;
    if (request.getParameter("categoryId") != null) {
        categoryId = Integer.parseInt(request.getParameter("categoryId"));
    }

    int brandId = 0;
    if (request.getParameter("brandId") != null) {
        brandId = Integer.parseInt(request.getParameter("brandId"));
    }
    double volumeStart = 1;
    if (request.getParameter("volumeStart") != null) {
        volumeStart = Double.parseDouble(request.getParameter("volumeStart"));
    }
    double volumeEnd = 1000;
    if (request.getParameter("volumeEnd") != null) {
        volumeEnd = Double.parseDouble(request.getParameter("volumeEnd"));
    }
    double priceStart = 0;
    if (request.getParameter("priceStart") != null) {
        priceStart = Double.parseDouble(request.getParameter("priceStart"));
    }
    double priceEnd = 10000;
    if (request.getParameter("priceEnd") != null) {
        priceEnd = Double.parseDouble(request.getParameter("priceEnd"));
    }

    int productPerPage = 12;
    if (request.getParameter("productPerPage") != null) {
        productPerPage = Integer.parseInt(request.getParameter("productPerPage"));
    }

    String imgDir = "img/product/single-product/";
    //Get category list
    Category_Model cM = new Category_Model();
    ArrayList<Category> categoryList = cM.getAll_Category();
    //get brand list
    BrandModel brandM = new BrandModel();
    ArrayList<Brand> brandList = brandM.getAllBrand();
    //
    Product_Model productM = new Product_Model();
    Product_Image_Model productImgM = new Product_Image_Model();
    //get product list base on filter
    ArrayList<Product> productList = productM.getPaging(pageNumber, search, sort, productPerPage, categoryId, brandId, volumeStart, volumeEnd, priceStart, priceEnd);
    int totalPages = (int) Math.ceil(productM.getNumberOfProduct(pageNumber, search, sort, productPerPage, categoryId, brandId, volumeStart, volumeEnd, priceStart, priceEnd) / (float) productPerPage);

%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="img/favicon.png" type="image/png">
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
        <style>
            .show{
                min-width: 150px;
            }
            .list .category a{
                color: #777777;
            }
            .list .active a{
                color: #000;
            }
        </style>
    </head>

    <body>

        <jsp:include page="navbar.jsp"/>

        <!--================Home Banner Area =================-->
        <section class="banner_area">
            <div class="banner_inner d-flex align-items-center">
                <div class="container">
                    <div class="banner_content text-center">
                        <h2>Shop Category Page</h2>
                        <div class="page_link">
                            <a href="index.jsp">Home</a>
                            <a href="category.jsp">Category</a>                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Home Banner Area =================-->

        <!--================Category Product Area =================-->
        <section class="cat_product_area section_gap">
            <div class="container-fluid">
                <div class="row flex-row-reverse">
                    <div class="col-lg-9">
                        <div class="product_top_bar">
                            <div class="left_dorp">
                                <!--                                <select class="sorting">
                                                                    <option value="0" <%=sort == 0 ? "selected" : ""%>>No filter</option>
                                                                    <option value="1" <%=sort == 1 ? "selected" : ""%>>Price: low to high</option>
                                                                    <option value="2" <%=sort == 2 ? "selected" : ""%>>Price: high to low</option>                                    
                                                                </select>
                                                                <select class="show">
                                                                    <option value="12" <%=productPerPage == 12 ? "selected" : ""%>>12 products</option>
                                                                    <option value="16" <%=productPerPage == 16 ? "selected" : ""%>>16 products</option>
                                                                    <option value="20" <%=productPerPage == 20 ? "selected" : ""%>>20 products</option>
                                                                </select>-->
                            </div>
                            <div class="right_page ml-auto">
                                <nav class="cat_page" aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <%
                                            if (totalPages > 0) {
                                        %>
                                        <li class="page-item">
                                            <a class="page-link" href="category.jsp?pageNumber=<%=pageNumber < totalPages ? pageNumber - 1 : pageNumber%>&<%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%><%=volumeStart != 0 ? "volumeStart=" + volumeStart + "&" : ""%><%=volumeEnd != 0 ? "volumeEnd=" + volumeEnd + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sort=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">
                                                <i class="fa fa-long-arrow-left" aria-hidden="true"></i>
                                            </a>
                                        </li>
                                        <!-- Start Paging-->
                                        <%
                                            if (totalPages <= 5) {
                                                for (int i = 0; i < totalPages; i++) {
                                        %>
                                        <li class="page-item <%=pageNumber == i + 1 ? "active" : ""%>">
                                            <a class="page-link" href="category.jsp?pageNumber=<%=i + 1%>&<%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%><%=volumeStart != 0 ? "volumeStart=" + volumeStart + "&" : ""%><%=volumeEnd != 0 ? "volumeEnd=" + volumeEnd + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sort=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">
                                                <%=i + 1%>
                                            </a>
                                        </li>
                                        <%
                                                }
                                            }
                                        %>
                                        <li class="page-item">
                                            <a class="page-link" href="category.jsp?pageNumber=<%=pageNumber < totalPages ? pageNumber + 1 : pageNumber%>&<%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%><%=volumeStart != 0 ? "volumeStart=" + volumeStart + "&" : ""%><%=volumeEnd != 0 ? "volumeEnd=" + volumeEnd + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sort=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">

                                                <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                                            </a>
                                        </li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </nav>

                            </div>
                        </div>
                        <div class="latest_product_inner row pb-3">
                            <%
                                if (productList.size() == 0) {
                                    out.println("<div class='col-lg-3 col-md-3 col-sm-6'>"
                                            + "  <h3 class='result-not-found'>Result not found!</h3>"
                                            + "</div>");
                                } else {

                                    for (Product p : productList) {
                                        ArrayList<Product_Image> productImgList = productImgM.getProduct_Image(p.getProduct_id());
                            %>
                            <div class="col-lg-3 col-md-3 col-sm-6">
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
                                    }
                                }
                            %>

                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="left_sidebar_area">
                            <aside class="left_widgets p_filter_widgets">
                                <div class="l_w_title">
                                    <h3>Browse Categories</h3>
                                </div>
                                <div class="widgets_inner">
                                    <ul class="list">

                                        <li class="category <%=categoryId == 0 ? "active" : ""%>">

                                            <a href="category.jsp?<%=pageNumber != 0 ? "pageNumber=" + pageNumber + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%><%=volumeStart != 0 ? "volumeStart=" + volumeStart + "&" : ""%><%=volumeEnd != 0 ? "volumeEnd=" + volumeEnd + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sort=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">All Categories</a>
                                        </li> 
                                        <%
                                            for (Category c : categoryList) {
                                                if (c.getCategory_status() != 0) {
                                        %>

                                        <li class="category <%=categoryId == c.getCategory_id() ? "active" : ""%>">

                                            <a href="category.jsp?<%=pageNumber != 0 ? "pageNumber=" + pageNumber + "&" : ""%>categoryId=<%=c.getCategory_id()%>&<%=brandId != 0 ? "brandId=" + brandId + "&" : ""%><%=volumeStart != 0 ? "volumeStart=" + volumeStart + "&" : ""%><%=volumeEnd != 0 ? "volumeEnd=" + volumeEnd + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sor=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>"><%=c.getCategory_name()%></a>
                                        </li>   
                                        <% }
                                            }
                                        %>
                                    </ul>
                                </div>
                            </aside>
                            <aside class="left_widgets p_filter_widgets">
                                <div class="l_w_title">
                                    <h3>Product Filters</h3>
                                </div>
                                <div class="widgets_inner">
                                    <h4>Price</h4>
                                    <ul class="list">
                                        <li class="<%=sort == 0 ? "active" : ""%>">

                                            <a href="category.jsp?<%=pageNumber != 0 ? "pageNumber=" + pageNumber + "&" : ""%><%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%><%=volumeStart != 0 ? "volumeStart=" + volumeStart + "&" : ""%><%=volumeEnd != 0 ? "volumeEnd=" + volumeEnd + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">                                                
                                                No sort
                                            </a>
                                        </li>

                                        <li class="<%=sort == 1 ? "active" : ""%>">

                                            <a href="category.jsp?<%=pageNumber != 0 ? "pageNumber=" + pageNumber + "&" : ""%><%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%><%=volumeStart != 0 ? "volumeStart=" + volumeStart + "&" : ""%><%=volumeEnd != 0 ? "volumeEnd=" + volumeEnd + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%>sort=1&<%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">
                                                Price: Low to High
                                            </a>
                                        </li>

                                        <li class="<%=sort == 2 ? "active" : ""%>">

                                            <a href="category.jsp?<%=pageNumber != 0 ? "pageNumber=" + pageNumber + "&" : ""%><%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%><%=volumeStart != 0 ? "volumeStart=" + volumeStart + "&" : ""%><%=volumeEnd != 0 ? "volumeEnd=" + volumeEnd + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%>sort=2&<%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">
                                                Price: High to Low
                                            </a>
                                        </li>


                                    </ul>
                                </div>
                                <div class="widgets_inner">
                                    <h4>Brand</h4>
                                    <ul class="list">

                                        <li class="<%=brandId == 0 ? "active" : ""%>">
                                            <a href="category.jsp?<%=pageNumber != 0 ? "pageNumber=" + pageNumber + "&" : ""%><%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=volumeStart != 0 ? "volumeStart=" + volumeStart + "&" : ""%><%=volumeEnd != 0 ? "volumeEnd=" + volumeEnd + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sort=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">
                                                All Brands
                                            </a>
                                        </li>
                                        <%
                                            for (Brand b : brandList) {
                                        %>
                                        <li class="<%=brandId == b.getBrand_id() ? "active" : ""%>">
                                            <a href="category.jsp?<%=pageNumber != 0 ? "pageNumber=" + pageNumber + "&" : ""%><%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%>brandId=<%=b.getBrand_id()%>&<%=volumeStart != 0 ? "volumeStart=" + volumeStart + "&" : ""%><%=volumeEnd != 0 ? "volumeEnd=" + volumeEnd + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sort=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">
                                                <%=b.getBrand_name()%></a>
                                        </li>
                                        <%
                                            }
                                        %>

                                    </ul>
                                </div>
                                <div class="widgets_inner">
                                    <h4>Volume</h4>
                                    <ul class="list">
                                        <li class="<%=(volumeStart == 1 && volumeEnd == 1000) ? "active" : ""%>">
                                            <a href="category.jsp?<%=pageNumber != 0 ? "pageNumber=" + pageNumber + "&" : ""%><%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sort=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">
                                                All Volume
                                            </a>
                                        </li>
                                        <li class="<%=(volumeStart == 1 && volumeEnd == 50) ? "active" : ""%>">
                                            <a href="category.jsp?<%=pageNumber != 0 ? "pageNumber=" + pageNumber + "&" : ""%><%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%>volumeStart=1&volumeEnd=50&<%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sort=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">
                                                1 - 50ml
                                            </a>
                                        </li>
                                        <li class="<%=(volumeStart == 51 && volumeEnd == 100) ? "active" : ""%>">
                                            <a href="category.jsp?<%=pageNumber != 0 ? "pageNumber=" + pageNumber + "&" : ""%><%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%>volumeStart=51&volumeEnd=100&<%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sort=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">
                                                51 - 100ml
                                            </a>
                                        </li>
                                        <li class="<%=(volumeStart == 101 && volumeEnd == 150) ? "active" : ""%>">
                                            <a href="category.jsp?<%=pageNumber != 0 ? "pageNumber=" + pageNumber + "&" : ""%><%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%>volumeStart=101&volumeEnd=150&<%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sort=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">
                                                101 - 150ml
                                            </a>
                                        </li>                                        
                                    </ul>
                                </div>
                                <!--                                <div class="widgets_inner">
                                                                    <h4>Price</h4>
                                                                    <div class="range_item">
                                                                        <div id="slider-range"></div>
                                                                        <div class="row m0">
                                                                            <label for="amount">Price : </label>
                                                                            <input type="text" id="amount" readonly>
                                                                        </div>
                                                                    </div>
                                                                </div>-->
                            </aside>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <nav class="cat_page mx-auto" aria-label="Page navigation example">
                        <ul class="pagination">
                            <%
                                if (totalPages > 0) {
                            %>
                            <li class="page-item">
                                <a class="page-link" href="category.jsp?pageNumber=<%=pageNumber < totalPages ? pageNumber - 1 : pageNumber%>&<%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%><%=volumeStart != 0 ? "volumeStart=" + volumeStart + "&" : ""%><%=volumeEnd != 0 ? "volumeEnd=" + volumeEnd + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sort=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">
                                    <i class="fa fa-long-arrow-left" aria-hidden="true"></i>
                                </a>
                            </li>
                            <!-- Start Paging-->
                            <%
                                if (totalPages <= 5) {
                                    for (int i = 0; i < totalPages; i++) {
                            %>
                            <li class="page-item <%=pageNumber == i + 1 ? "active" : ""%>">
                                <a class="page-link" href="category.jsp?pageNumber=<%=i + 1%>&<%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%><%=volumeStart != 0 ? "volumeStart=" + volumeStart + "&" : ""%><%=volumeEnd != 0 ? "volumeEnd=" + volumeEnd + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sort=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">
                                    <%=i + 1%>
                                </a>
                            </li>
                            <%
                                    }
                                }
                            %>
                            <li class="page-item">
                                <a class="page-link" href="category.jsp?pageNumber=<%=pageNumber < totalPages ? pageNumber + 1 : pageNumber%>&<%=categoryId != 0 ? "categoryId=" + categoryId + "&" : ""%><%=brandId != 0 ? "brandId=" + brandId + "&" : ""%><%=volumeStart != 0 ? "volumeStart=" + volumeStart + "&" : ""%><%=volumeEnd != 0 ? "volumeEnd=" + volumeEnd + "&" : ""%><%=priceStart != 0 ? "priceStart=" + priceStart + "&" : ""%><%=priceEnd != 0 ? "priceEnd=" + priceEnd + "&" : ""%><%=sort != 0 ? "sort=" + sort + "&" : ""%><%=productPerPage != 0 ? "productPerPage=" + productPerPage : ""%>">

                                    <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                                </a>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </nav>
                </div>
            </div>
        </section>
        <!--================End Category Product Area =================-->

        <!--        ================ Subscription Area ================
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
                ================ End Subscription Area ================-->

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

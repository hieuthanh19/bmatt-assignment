<%-- 
    Document   : footer
    Created on : Nov 13, 2019, 7:50:59 PM
    Author     : ThanhKH
--%>

<%@page import="perfumestore.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="perfumestore.Category_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Get category list
    Category_Model cM = new Category_Model();
    ArrayList<Category> categoryList = cM.getAll_Category();

%>

<!--================ start footer Area  =================-->
<footer class="footer-area section_gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-3  col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h6 class="footer_title">About Us</h6>
                    <p>BMatt Store was developed by BMatt Team which is a small developer team led by ThanhKH</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h6 class="footer_title">Store Categories</h6>

                    <ul class="list">
                        <%
                        for(Category c : categoryList){
                        %>
                        <li>
                            <a href="category.jsp?categoryId=<%=c.getCategory_id()%>"><p><%=c.getCategory_name()%></p></a>
                        </li>
                        <%
                        }
                        %>
                       
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-footer-widget instafeed">
                    <h6 class="footer_title">Instagram Feed</h6>
                    <ul class="list instafeed d-flex flex-wrap">
                        <li>
                            <img src="img/product/single-product/1/1_0.jpg" alt="product image">
                        </li>
                        <li>
                            <img src="img/product/single-product/2/3_0.jpg" alt="product image">
                        </li>
                        <li>
                            <img src="img/product/single-product/3/2_0.jpg" alt="product image">
                        </li>
                        <li>
                            <img src="img/product/single-product/4/35_0.jpg" alt="product image">
                        </li>
                        <li>
                            <img src="img/product/single-product/1/4_0.jpg" alt="product image">
                        </li>
                        <li>
                            <img src="img/product/single-product/2/14_0.jpg" alt="product image">
                        </li>
                        <li>
                            <img src="img/product/single-product/5/5_0.jpg" alt="product image">
                        </li>
                        <li>
                            <img src="img/product/single-product/3/45_0.jpg" alt="product image">
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 col-sm-6">
                <div class="single-footer-widget f_social_wd">
                    <h6 class="footer_title">Follow Us</h6>
                    <p>Let us be social</p>
                    <div class="f_social">
                        <a href="https://www.facebook.com/hieuthanh.1102">
                            <i class="fa fa-facebook"></i>
                        </a>                       
                    </div>
                </div>
            </div>
        </div>
        <div class="row footer-bottom d-flex justify-content-between align-items-center">
            <p class="col-lg-12 footer-text text-center">
                Copyright &copy;<script>document.write(new Date().getFullYear());</script> BMatt Store. All rights reserved 

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


<script>
                    $(document).ready(function () {
                        var currentURL = window.location.href;

                        var listHref = $('.nav-item a');
                        for (var i = 0; i < listHref.length; i++) {
                            var href = listHref[i].href;
                            if (currentURL.endsWith('bmatt-assignment/') && href.endsWith('bmatt-assignment/index.jsp')) {
                                var parent = listHref[i].parentElement;
                                parent.className = "nav-item active";
                            } else if (currentURL.includes('bmatt-assignment/category.jsp') && href.includes('bmatt-assignment/category.jsp')) {
                                var parent = listHref[i].parentElement;
                                parent.className = "nav-item active";
                            } else if (currentURL === href) {
                                var parent = listHref[i].parentElement;
                                parent.className = "nav-item active";
                            } else {
                                var parent = listHref[i].parentElement;
                                parent.className = "nav-item";
                            }
                        }
                    });
</script>

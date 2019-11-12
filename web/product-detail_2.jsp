<%-- 
    Document   : product-detail
    Created on : Nov 7, 2019, 2:03:48 PM
    Author     : MyPC
--%>

<%@page import="perfumestore.Product_Image_Model"%>
<%@page import="perfumestore.Product_Image"%>
<%@page import="perfumestore.Product_Model"%>
<%@page import="perfumestore.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  int id = 3;
          //Integer.parseInt(request.getParameter("id"));
  Product pd = new Product();
  Product_Model pdm = new Product_Model();
  pd = pdm.loadMyProduct(id);
  
 Product_Image pdi = new Product_Image();
 Product_Image_Model pdim = new Product_Image_Model();
 pdi = pdim.myProductImage(id);

%>    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product detail</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/product-detail.css">
    </head>

    <body>

        <div class="container">
            <div class="card">
                <div class="container-fliud">
                    <div class="wrapper row">
                        <div class="preview col-md-6">
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                    <li data-target="#myCarousel" data-slide-to="3"></li>
                                    <li data-target="#myCarousel" data-slide-to="4"></li>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner" role="listbox">

                                    <div class="item active">
                                        <img src="img/product/single-product/<%=pd.getBrand_id()%>/<%=pdi.getUrl()%>" alt="Chania" width="460" height="345">
                                        <div class="carousel-caption">
                                           
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img src="perfume picture/versace-bright-crystal.jpg" alt="Chania" width="460" height="345">
                                        <div class="carousel-caption">
                                            
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img src="perfume picture/versace-man.jpg" alt="Flower" width="460" height="345">
                                        <div class="carousel-caption">
                                            
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img src="perfume picture/versace-crystal-noir.jpg" alt="Flower" width="460" height="345">
                                        <div class="carousel-caption">
                                            
                                        </div>
                                    </div>

                                    <div class="item">
                                        <img src="perfume picture/versace-crystal-noir.jpg" alt="Flower" width="460" height="345">
                                        <div class="carousel-caption">
                                            
                                        </div>
                                    </div>
                                </div>

                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                            <ul class="preview-thumbnail nav nav-tabs">
                                <li class="active"><a data-target="#pic-1" ><img src="perfume picture/vanitas-versace.jpg" /></a></li>
                                <li><a data-target="#pic-2" data-toggle="tab"><img src="perfume picture/versace-crystal-noir.jpg" /></a></li>
                                <li><a data-target="#pic-3" data-toggle="tab"><img src="perfume picture/vanitas-versace.jpg" /></a></li>
                                <li><a data-target="#pic-4" data-toggle="tab"><img src="perfume picture/versace-bright-crystal.jpg" /></a></li>
                                <li><a data-target="#pic-5" data-toggle="tab"><img src="perfume picture/vanitas-versace.jpg" /></a></li>
                            </ul>
                        </div>
                        <!--Product detail start-->
                        <div class="details col-md-6">
                            <h3 class="product-title"><%=pd.getName()%></h3>
                            <p class="product-description">
                                <br><%=pd.getDescription()%>
                            </p>
                            <h4 class="price">current price: <span><%=pd.getCurrent_price()%> USD</span></h4>
                            <h5 class="sizes">Volume: <%=pd.getVolume()%>ml
                            </h5>
                            <div class="action">
                                <button class="add-to-cart btn btn-default" type="button">add to cart</button>
                            </div>
                        </div>
                        <!--Product detail end-->
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

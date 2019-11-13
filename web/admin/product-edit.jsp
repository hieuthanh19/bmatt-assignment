<%-- 
    Document   : sanpham-edit
    Created on : Nov 1, 2019, 3:06:52 PM
    Author     : Nhat Thanh
--%>

<%@page import="perfumestore.Brand"%>
<%@page import="perfumestore.BrandModel"%>
<%@page import="perfumestore.Category"%>
<%@page import="perfumestore.Category_Model"%>
<%@page import="perfumestore.Product_Image"%>
<%@page import="perfumestore.Product"%>
<%@page import="perfumestore.Product_Image_Model"%>
<%@page import="perfumestore.Product_Model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%    if (session.getAttribute("username") == null) {
        response.sendRedirect("");
    }
%>
<%
    //connection to database
    Product_Model productM = new Product_Model();
    Product_Image_Model productImgM = new Product_Image_Model();

    String searchContent = ""; //search 
    String sortColumn = ""; //sort column
    int id = 1;

    //searching
    if (request.getParameter("search") != null) {
        searchContent = request.getParameter("search");
    }
    //product ID
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
    }

    Product p = productM.getProduct(id);
    ArrayList<Product_Image> productImg = productImgM.getProduct_Image(id);
    Category_Model cateM = new Category_Model();
    ArrayList<Category> cateList = cateM.getAll_Category();

    BrandModel brandM = new BrandModel();
    ArrayList<Brand> brandList = brandM.getAllBrand();

%>
<html>
    <head>
        <!-- Title Section START -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Edit | BMatt Dashboard</title>
        <!-- Title Section END -->

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style type="text/css">

            .form-title{
                margin: 20px 0px;
            }
            .card{
                box-shadow: 2px 3px 5px #969696;
            }
            .return-button{
                top: 10px;
                left: 20px;
                margin: 10px 20px;
                max-width: 80px;
                max-height: 40px
            }
            .submit-btn{
                min-height: 50px;
                min-width: 100px;
            }
            /*            a:disabled {
                            pointer-events: none;
                            cursor: default;
                        }*/

        </style>
    </head>
    <body>
        <!-- CSS for form-->
        <div class="login-form" style="padding: 30px;">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-md-6">

                        <div class="card">
                            <div class="row ">
                                <button class="btn btn-outline-primary col-md-2 return-button" onclick="location.href = 'products?search=<%=searchContent%>'">Back
                                </button>
                                <h2 class="form-title text-center col-md-8">Edit Product</h2>
                            </div>
                            <!-- Edit Information of Product: Start-->
                            <div class="card-body">
                                <form action="../handle-edit"  method="post" enctype="multipart/form-data">
                                    <!-- Input Search Content Start-->
                                    <input type="hidden" id="type" class="form-control" name="type" value="product">
                                    <input type="hidden" id="id" class="form-control" name="id" value="<%=id%>">                                   
                                    <!-- Input ID Start-->
                                    <!-- Edit Name: Start-->
                                    <div class="form-group row">
                                        <label for="ten" class="col-md-4 col-form-label text-md-right">Name</label>
                                        <div class="col-md-6">
                                            <input type="text" id="productName" class="form-control" name="productName" value="<%=p.getName()%>">
                                        </div>
                                    </div>
                                    <!-- Edit Name: End-->
                                    <!-- Edit Volume Start-->
                                    <div class="form-group row">
                                        <label for="ten" class="col-md-4 col-form-label text-md-right">Volume</label>
                                        <div class="col-md-6">
                                            <input type="text" id="productName" class="form-control" name="productVolume" value="<%=p.getVolume()%>">
                                        </div>
                                    </div>
                                    <!-- Edit Volume End-->
                                    <!-- Edit Price: Start-->
                                    <div class="form-group row">
                                        <label for="giaban" class="col-md-4 col-form-label text-md-right">Original Price</label>
                                        <div class="col-md-6">
                                            <input type="number" id="productOriginalPrice" class="form-control" name="productOriginalPrice" value="<%=p.getOriginal_price()%>">
                                        </div>
                                    </div>
                                    <!-- Edit Price: End-->
                                    <!-- Edit Original_Price: Start-->
                                    <div class="form-group row">
                                        <label for="giagoc" class="col-md-4 col-form-label text-md-right">Sell Price</label>
                                        <div class="col-md-6">
                                            <input type="number" id="productCurrentPrice" class="form-control" name="productCurrentPrice" value="<%=p.getCurrent_price()%>">
                                        </div>
                                    </div>
                                    <!-- Edit Original_Price: End-->
                                    <!-- Edit Type: Start-->
                                    <div class="form-group row">
                                        <label for="loai" class="col-md-4 col-form-label text-md-right">Category</label>
                                        <div class="col-md-6">
                                            <!--All atttributes of type -->
                                            <select class="form-group" name="productCategory">
                                                <% for (Category c : cateList) {
                                                %>
                                                <option value="<%=c.getCategory_id()%>" name="category" <%=p.getCategoty_id() == c.getCategory_id() ? "selected" : ""%> ><%=c.getCategory_name()%></option>
                                                <% }%>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Edit Type: Start-->
                                    <div class="form-group row">
                                        <label for="loai" class="col-md-4 col-form-label text-md-right">Brand</label>
                                        <div class="col-md-6">
                                            <!--All atttributes of type -->
                                            <select class="form-group" name="productBrand">
                                                <% for (Brand b : brandList) {
                                                %>
                                                <option value="<%=b.getBrand_id()%>" name="brand" <%=p.getBrand_id() == b.getBrand_id() ? "selected" : ""%> ><%=b.getBrand_name()%></option>
                                                <% }%>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Edit Type: End-->
                                    <!-- Edit Information: Start-->
                                    <div class="form-group row">
                                        <label for="thongtin" class="col-md-4 col-form-label text-md-right">Description</label>
                                        <div class="col-md-6">
                                            <textarea name="productDescription" cols="41" rows="10"><%=p.getDescription()%></textarea>
                                        </div>
                                    </div>
                                    <!-- Edit Information: End-->
                                    <!-- Edit Image: Start-->
                                    <div class="form-group row">
                                        <label for="hinh" class="col-md-4 col-form-label text-md-right">Product Image </label>
                                        <div class="col-md-6">
                                            <input type = "file" name = "productImage" size = "50" />
                                        </div>
                                    </div>
                                    <!-- Edit Image: End-->
                                    <!-- Edit Image: Start-->
                                    <div class="form-group row">
                                        <label for="data-name" class="col-md-4 col-form-label text-md-right">Status: </label>
                                        <div class="col-md-6">
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input name="productStatus" id="status-locked" type="radio" class="custom-control-input productStatus" value="0" <%=p.getProduct_status() == 0 ? "checked" : ""%>> 
                                                <label for="status-locked" class="custom-control-label">Locked</label>
                                            </div>
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input name="productStatus" id="status-unlock" type="radio" class="custom-control-input productStatus" value="1" <%=p.getProduct_status() == 1 ? "checked" : ""%>> 
                                                <label for="status-unlock" class="custom-control-label">Active</label>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Edit Image: End-->
                                    <!-- Show Button: Start-->
                                    <div class="col-md-4 mx-auto form-group">
                                        <button type="submit" class="btn btn-primary submit-btn" name="submit" >
                                            Edit
                                        </button>
                                    </div>
                                    <!-- Show Button: End-->
                                </form>

                            </div>
                            <!-- Edit Information of Product: End-->            
                        </div>	
                    </div>                    
                </div>
            </div>
        </div>

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
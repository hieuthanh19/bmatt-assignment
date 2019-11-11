<%-- 
    Document   : dia-hinh
    Created on : Oct 27, 2019, 10:16:03 AM
    Author     : KhoiLeQuoc
--%>


<%@page import="perfumestore.Brand"%>
<%@page import="perfumestore.BrandModel"%>
<%@page import="perfumestore.Category"%>
<%@page import="perfumestore.Category_Model"%>
<%@page import="perfumestore.Product_Image_Model"%>
<%@page import="perfumestore.Product"%>
<%@page import="perfumestore.Product_Model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%
    String search = "";
    String imgDir = "img/product/single-product/";
    if (request.getParameter("search") != null) {
        search = request.getParameter("search");
    }
    Product_Model productM = new Product_Model();
    Product_Image_Model productImgM = new Product_Image_Model();
    ArrayList<Product> productList = productM.loadProduct();

    Category_Model cateM = new Category_Model();
    ArrayList<Category> cateList = cateM.getAll_Category();

    BrandModel brandM = new BrandModel();
    ArrayList<Brand> brandList = brandM.getAllBrand();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products | BMatt Admin</title>
        <jsp:include page="include.jsp"/>
        <style type="text/css">

            .table .active{
                color: green;        
            }          
            .table .locked{                
                color: red;                                    
            }
            .product-img img{
                max-height: 100px;
                max-width: 100px;
            }
            .product-edit{
                color: #FFA11E;;
            }
            .product-delete{
                color: red;
            }
            /*            a:disabled {
                            pointer-events: none;
                            cursor: default;
                        }*/

        </style>
    </head>
    <body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

        <jsp:include page="header.jsp"/>
        <!-- BEGIN: Content-->
        <div class="app-content content">
            <div class="content-overlay"></div>
            <div class="header-navbar-shadow"></div>
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-12 col-12 mb-2">
                        <div class="row breadcrumbs-top">
                            <div class="col-12">
                                <h2 class="content-header-title float-left mb-0">Products (<%=productList.size()%>)</h2>
                                <div class="breadcrumb-wrapper col-12">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Dashboard</a>
                                        </li>
                                        <li class="breadcrumb-item"><a href="#">Store Management</a>
                                        </li>
                                        <li class="breadcrumb-item">Products
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-body">
                    <!-- Data list view starts -->
                    <section id="data-thumb-view" class="data-thumb-view-header">
                        <div class="action-btns d-none">
                            <div class="btn-dropdown mr-1 mb-1">
                                <!--                                <div class="btn-group dropdown actions-dropodown">
                                                                    <button type="button" class="btn btn-white px-1 py-1 dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        Actions
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="product-delete.jsp?type=products&id=<%%>">Delete</a>
                                                                        <a class="dropdown-item" href="#">Archive</a>
                                                                        <a class="dropdown-item" href="#">Export</a>
                                                                        <a class="dropdown-item" href="#">Others</a>
                                                                    </div>
                                                                </div>-->
                            </div>
                        </div>
                        <!-- dataTable starts -->
                        <div class="table-responsive">
                            <table class="table data-thumb-view">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Image</th>
                                        <th>Volumne</th>
                                        <th>Category</th>
                                        <th>Brand</th>
                                        <th>Original Price</th>
                                        <th>Current Price</th>
                                        <th>Description</th>
                                        <th>Status</th>
                                        <th>Management</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Product p : productList) {
                                            // String productStatus = p.getProduct_status() == 1 ? "<i class='ficon feather icon-check-circle'>" : "<i class='ficon feather icon-x-circle'>";
%>
                                    <tr>
                                        <td></td>
                                        <td><%=p.getProduct_id()%>
                                        </td>
                                        <td class="product-name"><%=p.getName()%></td>
                                        <td class="product-img">
                                            <img src="<%="../" + imgDir + p.getBrand_id() + "/" + productImgM.getProduct_Image(p.getProduct_id()).get(0).getUrl()%>"  alt="product image"/>
                                        </td>
                                        <td class="product-name"><%=p.getVolume()%></td>
                                        <td class="product-name"><%=p.getCategory_name()%></td>
                                        <td class="product-name"><%=p.getBrandName()%></td>
                                        <td class="product-name">$<%=p.getOriginal_price()%></td>
                                        <td class="product-name">$<%=p.getCurrent_price()%></td>
                                        <td class="product-name"><%=productM.formatStringForDisplaying(p.getDescription(), 100)%></td>
                                        <td class="product-name <%=p.getProduct_status() == 1 ? "active" : "locked"%>">
                                            <%=p.getProduct_status() == 1 ? "<i class='ficon feather icon-check-circle'>" : "<i class='ficon feather icon-x-circle'>"%>
                                        </td>
                                        <td style="align:center;">
                                            <a href="#" class="product-edit">
                                                <i class="ficon feather icon-edit"></i>
                                            </a>
                                            <a href="#" class="product-delete"  onclick="if (confirm('Are you sure you want to delete <%=p.getName()%>?')) location.href = 'handle-delete.jsp?type=product&id=<%=p.getProduct_id()%>" <%=p.getProduct_status() == 0 ? "disabled" : ""%>>
                                                <i class="ficon feather icon-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <%                                            }
                                    %>
                                </tbody>
                            </table>
                        </div>
                        <!-- dataTable ends -->

                        <!-- add new sidebar starts -->
                        <div class="add-new-data-sidebar">
                            <div class="overlay-bg"></div>
                            <div class="add-new-data">
                                <form method="post" enctype="multipart/form-data" action="handleCreate.jsp?type=product">
                                    <div class="div mt-2 px-2 d-flex new-data-title justify-content-between">
                                        <div>
                                            <h4>Add New Product</h4>
                                        </div>
                                        <div class="hide-data-sidebar">
                                            <i class="feather icon-x"></i>
                                        </div>
                                    </div>
                                    <div class="data-items pb-3">
                                        <div class="data-fields px-2 mt-3">
                                            <div class="row">
                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Name</label>
                                                    <input type="text" class="form-control" id="data-name" name="name">
                                                </div>
                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Volume (ml)</label>
                                                    <input type="number" class="form-control" id="data-name" name="volume" placeholder="Eg: 100">
                                                </div>
                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Base Price ($)</label>
                                                    <input type="number" class="form-control" id="data-name" name="volume" placeholder="Eg: 100">
                                                </div>
                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Sell Price ($)</label>
                                                    <input type="number" class="form-control" id="data-name" name="volume" placeholder="Eg:100">
                                                </div>

                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-category"> Category </label>
                                                    <select class="form-control" id="data-category" name="category">
                                                        <% for (Category c : cateList) {

                                                        %>
                                                        <option value="<%=c.getCategory_id()%>"><%=c.getCategory_name()%></option>
                                                        <% }
                                                        %>

                                                    </select>
                                                </div>
                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-category"> Brand </label>
                                                    <select class="form-control" id="data-category">
                                                        <% for (Brand b : brandList) {

                                                        %>
                                                        <option value="<%=b.getBrand_name()%>"><%=b.getBrand_name()%></option>
                                                        <% }
                                                        %>

                                                    </select>
                                                </div>
                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Description</label>
                                                    <textarea class="form-control" id="data-name" name="description"></textarea>
                                                </div>

                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Status: </label>
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input name="status" id="status-locked" type="radio" class="custom-control-input" value="0"> 
                                                        <label for="status-locked" class="custom-control-label">Locked</label>
                                                    </div>
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input name="status" id="status-unlock" type="radio" class="custom-control-input" value="1" checked> 
                                                        <label for="status-unlock" class="custom-control-label">Active</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 data-field-col data-list-upload">
                                                    <form action="#" class="dropzone dropzone-area" id="dataListUpload">
                                                        <div class="dz-message">Product Picture</div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="add-data-footer d-flex justify-content-around px-5">
                                        <div class="add-data-btn">
                                            <button class="btn btn-primary" type="submit" name="submit">Create</button>
                                        </div>
                                        <div class="cancel-data-btn">
                                            <button class="btn btn-outline-danger">Cancel</button>
                                        </div>
                                    </div>
                                </form>
                            </div>                      
                        </div>
                        <!-- add new sidebar ends -->
                    </section>
                    <!-- Data list view end -->

                </div>
            </div>
        </div>
        <!-- END: Content-->
        <jsp:include page="footer.jsp"/>
    </body>
</html>

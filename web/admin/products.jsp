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
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    if (session.getAttribute("username") == null) {
        response.sendRedirect("");
    }
%>
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

    int errorCode = -1;
    if (request.getParameter("error") != null) {
        errorCode = Integer.parseInt(request.getParameter("error"));
    }
    String errorMsg = "";
    if (errorCode == 1) {
        errorMsg += "Username existed! Please enter another username";
    } else if (errorCode == 0) {
        errorMsg += "Can't create account due to an unknown error";
    }
    String action = "";
    if (request.getParameter("action") != null) {
        action = request.getParameter("action");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products | BMatt Dashboard</title>
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
            .upload-section{
                margin-bottom: 20px; 
            }

            .error-message{
                color: #da5454;
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
                                        <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a>
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
                                <div class="btn-group dropdown actions-dropodown">
                                    <!--                                                                    <button type="button" class="btn btn-white px-1 py-1 dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                                            Actions
                                                                                                        </button>
                                                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                                                            <a class="dropdown-item" href="product-delete.jsp?type=products&id=<"">Delete</a>
                                                                                                            <a class="dropdown-item" href="#">Archive</a>
                                                                                                            <a class="dropdown-item" href="#">Export</a>
                                                                                                            <a class="dropdown-item" href="#">Others</a>
                                                                                                        </div>-->
                                </div>
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
                                        <td class="product-name"><%=productM.formatStringForDisplaying(p.getDescription(), 50)%></td>
                                        <td class="product-name <%=p.getProduct_status() == 1 ? "active" : "locked"%>">
                                            <%=p.getProduct_status() == 1 ? "<i class='ficon feather icon-check-circle'>" : "<i class='ficon feather icon-x-circle'>"%>
                                        </td>
                                        <td style="align:center;">
                                            <a href="#" class="product-edit" onclick="location.href = 'product-edit.jsp?type=product&id=<%=p.getProduct_id()%>'">
                                                <i class="ficon feather icon-edit"></i>
                                            </a>
                                            <a href="#" class="product-delete"  onclick="if (confirm('Are you sure you want to lock <%=p.getName()%>?'))
                                                        location.href = 'handle-delete.jsp?type=product&id=<%=p.getProduct_id()%>'" <%=p.getProduct_status() == 0 ? "disabled" : ""%>>
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
                            <div class="overlay-bg <%=action.equals("add")? "show" : ""%>"></div>
                            <div class="add-new-data <%=action.equals("add")? "show" : ""%>">

                                <div class="div mt-2 px-2 d-flex new-data-title justify-content-between">
                                    <div>
                                        <h4>Add New Product</h4>
                                    </div>
                                    <div class="hide-data-sidebar">
                                        <i class="feather icon-x"></i>
                                    </div>
                                </div>
                                <div class="data-items pb-2">
                                    <form action="../handleCreate" method="post" enctype="multipart/form-data">
                                        <div class="data-fields px-2 mt-1">
                                            <div class="row">
                                                <%
                                                    if (errorCode != -1) {
                                                %>
                                                <div class="col-sm-12 data-field-col">
                                                    <label class="error-message"><%=errorMsg%></label>

                                                </div>
                                                <%
                                                    }
                                                %>
                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Name</label>
                                                    <input type="text" class="form-control productName" id="data-name" name="productName" required  >
                                                </div>
                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Volume (ml)</label>
                                                    <input type="number" class="form-control productVolume" id="data-name" name="productVolume" placeholder="Eg: 100" min="1">
                                                </div>
                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Base Price ($)</label>
                                                    <input type="number" class="form-control productBasePrice" id="data-name" name="productBasePrice" placeholder="Eg: 100" min="0">
                                                </div>
                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Sell Price ($)</label>
                                                    <input type="number" class="form-control productSellPrice" id="data-name" name="productSellPrice" placeholder="Eg:100" min="0">
                                                </div>

                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-category"> Category </label>
                                                    <select class="form-control productCategory" id="data-category" name="productCategory">
                                                        <% for (Category c : cateList) {

                                                        %>
                                                        <option value="<%=c.getCategory_id()%>"><%=c.getCategory_name()%></option>
                                                        <% }
                                                        %>

                                                    </select>
                                                </div>
                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-category"> Brand </label>
                                                    <select class="form-control productBrand" id="data-category" name="productBrand">
                                                        <% for (Brand b : brandList) {

                                                        %>
                                                        <option value="<%=b.getBrand_id()%>"><%=b.getBrand_name()%></option>
                                                        <% }
                                                        %>

                                                    </select>
                                                </div>
                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Description</label>
                                                    <textarea class="form-control productDescription" id="data-name" name="productDescription"></textarea>
                                                </div>

                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Status: </label>
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input name="productStatus" id="status-locked" type="radio" class="custom-control-input productStatus" value="0"> 
                                                        <label for="status-locked" class="custom-control-label">Locked</label>
                                                    </div>
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input name="productStatus" id="status-unlock" type="radio" class="custom-control-input productStatus" value="1" checked> 
                                                        <label for="status-unlock" class="custom-control-label">Active</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 data-field-col data-list-upload upload-section">
                                                    <!--                                                <form method="post" enctype="multipart/form-data" action="../handleCreate" class="dropzone dropzone-area productImage" id="dataListUpload" name="productImage">-->
                                                    <div class="dz-message">Product Picture</div>                                                    
                                                    <input type="file" class="productImage" name="productImage">
                                                </div>                                                                                                                                                
                                            </div>
                                        </div>
                                        <div class="add-data-footer d-flex justify-content-around px-5">
                                            <div class="add-data-btn">
                                                <button class="btn btn-primary" type="submit" name="submit" id="submit">Create</button>
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
        <script>
            //            $(document).ready(function () {
            //
            //                function checkInput() {
            //                    return true;
            //                }
            //                $('#submit').click(function ()
            //                {
            //                    console.log("submit")
            //                    if (checkInput()) {
            //                        var productName = $('.productName').val();
            //                        console.log(productName);
            //                        var productVolume = $('.productVolume').val();
            //                        var productBasePrice = $('.productBasePrice').val();
            //                        var productSellPrice = $('.productSellPrice').val();
            //                        var productCategory = $('.productCategory').val();
            //                        var productBrand = $('.productBrand').val();
            //                        var productDescription = $('.productDescription').val();
            //                        var productStatus = $('.productStatus').val();
            //                        var productImage = $('.productImage')[0].files[0];
            //                        $.ajax({
            //                            type: "POST",
            //                            url: "../handleCreate",
            //                            data: {"productName": productName,
            //                                "productVolume": productVolume,
            //                                "productBasePrice": productBasePrice,
            //                                "productSellPrice": productSellPrice,
            //                                "productCategory": productCategory,
            //                                "productBrand": productBrand,
            //                                "productDescription": productDescription,
            //                                "productStatus": productStatus,
            //                                "productImage": productImage
            //                            },
            //                            enctype: 'multipart/form-data',
            //                            success: function (data) {
            //                                if (data == 'True') {
            //                                    $(location).attr('href', '/');
            //                                    alert("sucess");
            //                                } else {
            //                                    alert('Fail....');
            //                                }
            //                            },
            //                        });
            //                    }
            //                });
            //            });
        </script>
    </body>
</html>

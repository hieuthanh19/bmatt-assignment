<%-- 
    Document   : brand
    Created on : Nov 6, 2019, 8:39:03 PM
    Author     : ThanhKH
--%>

<%@page import="perfumestore.Brand"%>
<%@page import="perfumestore.BrandModel"%>
<%@page import="perfumestore.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="perfumestore.Product_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    if (session.getAttribute("username") == null) {
        response.sendRedirect("");
    }
%>
<%
    String search = "";
    String sortColumn = "";

    BrandModel brandM = new BrandModel();
    ArrayList<Brand> brandList = brandM.getAllBrand();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Brands | BMatt Admin</title>
        <jsp:include page="include.jsp"/>
        <style type="text/css">

            .table .active{
                color: green;        
            }          
            .table .locked{                
                color: red;                                    
            }
            .product-edit{
                color: #FFA11E;;
            }
            .product-delete{
                color: red;
            }

        </style>
    </head>
    <body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">
        <jsp:include page="header.jsp"/>
        <div class="app-content content">
            <div class="content-overlay"></div>
            <div class="header-navbar-shadow"></div>
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-12 col-12 mb-2">
                        <div class="row breadcrumbs-top">
                            <div class="col-12">
                                <h2 class="content-header-title float-left mb-0">Brands (<%=brandList.size()%>)</h2>
                                <div class="breadcrumb-wrapper col-12">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Dashboard</a>
                                        </li>
                                        <li class="breadcrumb-item"><a href="#">Store Management</a>
                                        </li>
                                        <li class="breadcrumb-item">Brands
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
                                    <button type="button" class="btn btn-white px-1 py-1 dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Actions
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#">Delete</a>
                                        <a class="dropdown-item" href="#">Archive</a>
                                        <a class="dropdown-item" href="#">Export</a>
                                        <a class="dropdown-item" href="#">Others</a>
                                    </div>
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
                                        <th>Country</th>                                         
                                        <th>Status</th>
                                        <th>Management</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Brand b : brandList) {
                                    %>
                                    <tr>
                                        <td></td>
                                        <td><%=b.getBrand_id()%>
                                        </td>
                                        <td class="product-name"><%=b.getBrand_name()%></td>                                                                                
                                        <td class="product-name"><%=b.getCountry_name()%></td>
                                        <td class="product-name <%=b.getBrand_status() == 1 ? "active" : "locked"%>">
                                            <%=b.getBrand_status() == 1 ? "<i class='ficon feather icon-check-circle'>" : "<i class='ficon feather icon-x-circle'>"%>
                                        </td>
                                        <td style="align:center;">
                                            <a href="#" class="product-edit">
                                                <i class="ficon feather icon-edit"></i>
                                            </a>
                                            <a href="#" <%=b.getBrand_status() == 0 ? "disabled" : ""%> onclick =" if (confirm('Are you sure you want to lock <%=b.getBrand_name()%>?'))
                                                        location.href = 'handle-delete.jsp?type=brand&id=<%=b.getBrand_id()%>'"
                                               class="product-delete">
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
                                <div class="div mt-2 px-2 d-flex new-data-title justify-content-between">
                                    <div>
                                        <h4>Thêm mới vùng</h4>
                                    </div>
                                    <div class="hide-data-sidebar">
                                        <i class="feather icon-x"></i>
                                    </div>
                                </div>
                                <div class="data-items pb-3">
                                    <div class="data-fields px-2 mt-3">
                                        <div class="row">
                                            <div class="col-sm-12 data-field-col">
                                                <label for="data-name">Tên vùng</label>
                                                <input type="text" class="form-control" id="data-name">
                                            </div>

                                            <div class="col-sm-12 data-field-col">
                                                <label for="data-name">Mô tả</label>
                                                <input type="textarea" class="form-control" id="data-name">
                                            </div>

                                            <div class="col-sm-12 data-field-col">
                                                <label for="data-name">Đường dẫn tĩnh</label>
                                                <input type="text" class="form-control" id="data-name">
                                            </div>
                                            <div class="col-sm-12 data-field-col data-list-upload">
                                                <form action="#" class="dropzone dropzone-area" id="dataListUpload">
                                                    <div class="dz-message">Ảnh đại diện</div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="add-data-footer d-flex justify-content-around px-5">
                                    <div class="add-data-btn">
                                        <button class="btn btn-primary">Add New</button>
                                    </div>
                                    <div class="cancel-data-btn">
                                        <button class="btn btn-outline-danger">Hủy bỏ</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- add new sidebar ends -->
                    </section>
                    <!-- Data list view end -->

                </div>
            </div>
        </div>


        <jsp:include page="footer.jsp"/>
    </body>
</html>

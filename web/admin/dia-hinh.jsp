<%-- 
    Document   : dia-hinh
    Created on : Oct 27, 2019, 10:16:03 AM
    Author     : KhoiLeQuoc
--%>

<%@page import="Entity.Landscape"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.LandscapeModel"%>
<%@page import="Utils.ConnectDB"%>
<%@page import="java.sql.Connection"%>
<%
    int p = 1;
    String s = "";
    String sortColumn = "";
    if (request.getParameter("page") != null) {
        p = Integer.parseInt(request.getParameter("page"));
    }
    Connection conn = ConnectDB.getConnection();
    LandscapeModel landscapeModel = new LandscapeModel(conn);
    ArrayList<Landscape> landscapeArrayList = landscapeModel.getPaging(p, s, sortColumn);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Địa danh Việt Nam >> Địa hình</title>
        <jsp:include page="include.jsp"/>
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
                                <h2 class="content-header-title float-left mb-0">Vùng</h2>
                                <div class="breadcrumb-wrapper col-12">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Bảng điều khiển</a>
                                        </li>
                                        <li class="breadcrumb-item"><a href="#">Chuyên mục</a>
                                        </li>
                                        <li class="breadcrumb-item active">Vùng
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
                                        Hành động
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#">Xóa</a>
                                        <a class="dropdown-item" href="#">Lưu trữ</a>
                                        <a class="dropdown-item" href="#">Xuất</a>
                                        <a class="dropdown-item" href="#">Khác</a>
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
                                        <th>#</th>
                                        <th>Ảnh đại diện</th>
                                        <th>Tên vùng</th>
                                        <th>Mô tả</th>
                                        <th>Đường dẫn tĩnh</th>
                                        <th>Quản trị</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int numberOfLandscape = (p - 1) * LandscapeModel.numberInPaging;
                                        for (Landscape ls : landscapeArrayList) {
                                            ++numberOfLandscape;

                                    %>
                                    <tr>
                                        <td></td>
                                        <td><%=numberOfLandscape%>
                                        </td>
                                        <td class="product-img"><img src="../imgs/landscape/<%=ls.getThumbnail()%>">
                                        </td>
                                        <td class="product-name"><%=ls.getName()%></td>
                                        <td class="product-name"><%=ls.getDescription()%></td>
                                        <td class="product-name"><%=ls.getGuid()%></td>
                                        <td style="align:center;">
                                            <a href="#"><i class="ficon feather icon-edit"></i></a>
                                            <a href="#"><i class="ficon feather icon-trash"></i></a>
                                        </td>
                                    </tr>
                                    <%
                                        }
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
                                        <button class="btn btn-primary">Thêm mới</button>
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
        <!-- END: Content-->
        <jsp:include page="footer.jsp"/>
    </body>
</html>

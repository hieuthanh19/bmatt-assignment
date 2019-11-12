<%-- 
    Document   : category
    Created on : Nov 6, 2019, 8:38:48 PM
    Author     : ThanhKH
--%>

<%@page import="perfumestore.UserRole"%>
<%@page import="perfumestore.UserModel"%>
<%@page import="perfumestore.UserRoleModel"%>
<%@page import="perfumestore.Account"%>
<%@page import="perfumestore.AccountModel"%>
<%@page import="perfumestore.Category"%>
<%@page import="perfumestore.Category_Model"%>
<%@page import="perfumestore.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="perfumestore.Product_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int pageNumber = 1;
    String search = "";
    String sortColumn = "";
    int productsPerPage = 4;
    if (request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
    AccountModel accM = new AccountModel();
    ArrayList<Account> accList = accM.getAllAccount();
    UserRoleModel userRoleM = new UserRoleModel();
    ArrayList<UserRole> userRoleList = userRoleM.getAllUserRole();
    UserModel userM = new UserModel();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accounts | BMatt Dashboard</title>
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
        <div class="app-content content">
            <div class="content-overlay"></div>
            <div class="header-navbar-shadow"></div>
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-12 col-12 mb-2">
                        <div class="row breadcrumbs-top">
                            <div class="col-12">
                                <h2 class="content-header-title float-left mb-0">All Accounts (<%=accList.size()%>)</h2>
                                <div class="breadcrumb-wrapper col-12">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Dashboard</a>
                                        </li>
                                        <li class="breadcrumb-item"><a href="#">Accounts</a>
                                        </li>
                                        <li class="breadcrumb-item">All Accounts
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
                                <!--                        <div class="btn-group dropdown actions-dropodown">
                                                            <button type="button" class="btn btn-white px-1 py-1 dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Actions
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                <a class="dropdown-item" href="#">Delete</a>
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
                                        <th>Username</th>                               
                                        <th>Full Name</th>
                                        <th>Email</th>                                        
                                        <th>Role</th>
                                        <th>Status</th>
                                        <th>Management</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Account a : accList) {
                                    %>
                                    <tr>
                                        <td></td>
                                        <td><%=a.getAccount_id()%>
                                        </td>
                                        <td class="product-name"><%=a.getUsername()%></td>
                                        <td class="product-name"><%=userM.getUser(a.getAccount_id()).getFull_name()%></td>
                                        <td class="product-name"><%=userM.getUser(a.getAccount_id()).getEmail()%></td>
                                        <td class="product-name"><%=userRoleM.getUserRole(a.getAccount_id()).getRole_name()%></td>
                                        <td class="product-name <%=a.getAccount_status() == 1 ? "active" : "locked"%>">
                                            <%=a.getAccount_status() == 1 ? "<i class='ficon feather icon-check-circle'>" : "<i class='ficon feather icon-x-circle'>"%>
                                        </td>
                                        <td style="align:center;">
                                            <a href="#" class="product-edit"><i class="ficon feather icon-edit"></i></a>
                                            <a href="#" class="product-delete" onclick="if (confirm('Are you sure you want to lock <%=a.getUsername()%>?')) location.href = 'handle-delete.jsp?type=account&id=<%=a.getAccount_id()%>'">
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
                                <form action="handle-create.jsp" method="post">
                                    <div class="div mt-2 px-2 d-flex new-data-title justify-content-between">
                                        <div>
                                            <h4>New Account</h4>
                                        </div>
                                        <div class="hide-data-sidebar">
                                            <i class="feather icon-x"></i>
                                        </div>
                                    </div>
                                    <div class="data-items pb-3">
                                        <div class="data-fields px-2 mt-3">
                                            <div class="row">
                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Username</label>
                                                    <input type="text" class="form-control" id="data-name" name="username" required>
                                                </div>

                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-name">Password</label>
                                                    <input type="password" class="form-control" id="data-name" name="password" required>
                                                </div>

                                                <div class="col-sm-12 data-field-col">
                                                    <label for="data-category"> Role </label>
                                                    <select class="form-control" id="data-category" name="category">
                                                        <% for (UserRole us : userRoleList) {

                                                        %>
                                                        <option value="<%=us.getRole_id()%>"><%=us.getRole_name()%></option>
                                                        <% }
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="col-sm-12 data-field-col data-list-upload">
                                                    <label for="data-name">Status: </label>
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input name="status" id="status-locked" type="radio" class="custom-control-input" value="0" > 
                                                        <label for="status-locked" class="custom-control-label">Locked</label>
                                                    </div>
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input name="status" id="status-unlock" type="radio" class="custom-control-input" value="1" checked> 
                                                        <label for="status-unlock" class="custom-control-label">Active</label>
                                                    </div>
                                                </div>
                                                    <input type="hidden" name="type" value="account">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="add-data-footer d-flex justify-content-around px-5">
                                        <div class="add-data-btn">
                                            <button class="btn btn-primary" type="submit">Create</button>
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



        <jsp:include page="footer.jsp"/>
    </body>
</html>

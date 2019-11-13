<%-- 
    Document   : sanpham-edit
    Created on : Nov 1, 2019, 3:06:52 PM
    Author     : Nhat Thanh
--%>

<%@page import="perfumestore.UserRole"%>
<%@page import="perfumestore.UserRoleModel"%>
<%@page import="perfumestore.User"%>
<%@page import="perfumestore.Account"%>
<%@page import="perfumestore.UserModel"%>
<%@page import="perfumestore.AccountModel"%>
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
    AccountModel accM = new AccountModel();
    UserRoleModel userRoleM = new UserRoleModel();
    UserModel userM = new UserModel();

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

    Account acc = accM.getAccount(id);
    User user = userM.getUser(id);
    ArrayList<UserRole> roleList = userRoleM.getAllUserRole();

%>
<html>
    <head>
        <!-- Title Section START -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Edit | BMatt Admin</title>
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
                                <button class="btn btn-outline-primary col-md-2 return-button" onclick="location.href = 'accounts.jsp?search=<%=searchContent%>'">Back
                                </button>
                                <h2 class="form-title text-center col-md-8">Edit Account & User</h2>
                            </div>
                            <!-- Edit Information of Product: Start-->
                            <div class="card-body">
                                <form action="../handle-edit"  method="post" enctype="multipart/form-data">
                                    <!-- Input Search Content Start-->
                                    <input type="hidden" id="s" class="form-control" name="type" value="account">
                                    <input type="hidden" id="id" class="form-control" name="id" value="<%=id%>">                                   
                                    <!-- Input ID Start-->
                                    <!-- Edit Name: Start-->
                                    <div class="form-group row">
                                        <label for="ten" class="col-md-4 col-form-label text-md-right">Username</label>
                                        <div class="col-md-6">
                                            <input type="text" id="productName" class="form-control" name="accUsername" value="<%=acc.getUsername()%>" disabled>
                                        </div>
                                    </div>
                                    <!-- Edit Name: End-->
                                    <!-- Edit Volume Start-->
                                    <div class="form-group row">
                                        <label for="ten" class="col-md-4 col-form-label text-md-right">Full name</label>
                                        <div class="col-md-6">
                                            <input type="text" id="productName" class="form-control" name="userFullname" value="<%=user.getFull_name()%>">
                                        </div>
                                    </div>
                                    <!-- Edit Volume End-->
                                    <!-- Edit Price: Start-->
                                    <div class="form-group row">
                                        <label for="giaban" class="col-md-4 col-form-label text-md-right">Phone</label>
                                        <div class="col-md-6">
                                            <input type="tel" id="userPhone" class="form-control" name="userPhone" value="<%=user.getPhone()%>">
                                        </div>
                                    </div>
                                    <!-- Edit Price: End-->
                                    <!-- Edit Original_Price: Start-->
                                    <div class="form-group row">
                                        <label for="giagoc" class="col-md-4 col-form-label text-md-right">Email</label>
                                        <div class="col-md-6">
                                            <input type="email" id="userEmail" class="form-control" name="userEmail" value="<%=user.getEmail()%>">
                                        </div>
                                    </div>
                                    <!-- Edit Original_Price: End-->
                                    <!-- Edit Original_Price: Start-->
                                    <div class="form-group row">
                                        <label for="giagoc" class="col-md-4 col-form-label text-md-right">Address</label>
                                        <div class="col-md-6">
                                            <input type="text" id="userAddress" class="form-control" name="userAddress" value="<%=user.getAddress()%>">
                                        </div>
                                    </div>
                                    <!-- Edit Original_Price: End-->
                                    <!-- Edit Type: Start-->
                                    <div class="form-group row">
                                        <label for="loai" class="col-md-4 col-form-label text-md-right">Role</label>
                                        <div class="col-md-6">
                                            <!--All atttributes of type -->
                                            <select class="form-group" name="userRole">
                                                <% for (UserRole us : roleList) {
                                                %>
                                                <option value="<%=us.getRole_id()%>" name="role" <%=acc.getRole_id() == us.getRole_id() ? "selected" : ""%> ><%=us.getRole_name()%></option>
                                                <% }%>
                                            </select>
                                        </div>
                                    </div>                                                                                                                                      
                                    <!-- Edit Image: Start-->
                                    <div class="form-group row">
                                        <label for="data-name" class="col-md-4 col-form-label text-md-right">Status: </label>
                                        <div class="col-md-6">
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input name="accountStatus" id="status-locked" type="radio" class="custom-control-input productStatus" value="0" <%=acc.getAccount_status() == 0 ? "checked" : ""%>> 
                                                <label for="status-locked" class="custom-control-label">Locked</label>
                                            </div>
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input name="accountStatus" id="status-unlock" type="radio" class="custom-control-input productStatus" value="1" <%=acc.getAccount_status() == 1 ? "checked" : ""%>> 
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
<%-- 
    Document   : createSave
    Created on : Nov 11, 2019, 10:01:19 PM
    Author     : ThanhKH
--%>

<%@page import="perfumestore.UserModel"%>
<%@page import="perfumestore.AccountModel"%>
<%@page import="perfumestore.Product_Image_Model"%>
<%@page import="perfumestore.Product_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    if (session.getAttribute("admin-username") == null) {
        response.sendRedirect("");
    }
%>

<%
    String type = (String) request.getAttribute("type");
    if (type.equals("product")) {
        Product_Model productM = new Product_Model();
        Product_Image_Model proImgM = new Product_Image_Model();
        String productName = (String) request.getAttribute("productName");
        int volume = Integer.parseInt((String) request.getAttribute("productVolume"));
        double productBasePrice = Double.parseDouble((String) request.getAttribute("productBasePrice"));
        double productSellPrice = Double.parseDouble((String) request.getAttribute("productSellPrice"));
        int categoryId = Integer.parseInt((String) request.getAttribute("productCategory"));
        int brandId = Integer.parseInt((String) request.getAttribute("productBrand"));
        String description = (String) request.getAttribute("productDescription");
        int status = Integer.parseInt((String) request.getAttribute("productStatus"));
        String imageName = (String) request.getAttribute("productImage");

        int productId = productM.insertProduct(productName, volume, categoryId, brandId, productBasePrice, productSellPrice, description, status);
        if (productId != -1) {
            proImgM.insertProductImg(productId, imageName, 1);
            response.sendRedirect("admin/products");
        } else {
            response.sendRedirect("admin/products?error=1");
        }

    } else if (type.equals("account")) {
        AccountModel accM = new AccountModel();
        UserModel userM = new UserModel();
        String username = (String) request.getAttribute("username");
        String password = (String) request.getAttribute("password");
        String name = (String) request.getAttribute("fullname");
        String email = (String) request.getAttribute("email");
        String address = (String) request.getAttribute("address");
        String phone = (String) request.getAttribute("phoneNumber");
        int userRole = Integer.parseInt((String) request.getAttribute("user-role"));
        int status = Integer.parseInt((String) request.getAttribute("status"));

        if (accM.isUsernameExist(username)) {
            response.sendRedirect("admin/accounts.jsp?error=1");
        } else {

            int accId = accM.insert(username, password, status, userRole);
            if (accId != -1) {
                userM.insert(name, address, phone, email, null, accId, 1);
                response.sendRedirect("admin/accounts.jsp");
            } else {
                response.sendRedirect("admin/accounts.jsp?error=0");
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

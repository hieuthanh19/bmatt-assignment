<%-- 
    Document   : product-delete
    Created on : Nov 7, 2019, 3:18:17 PM
    Author     : ThanhKH
--%>

<%@page import="perfumestore.User"%>
<%@page import="perfumestore.UserModel"%>
<%@page import="perfumestore.Account"%>
<%@page import="perfumestore.AccountModel"%>
<%@page import="perfumestore.Category"%>
<%@page import="perfumestore.Category_Model"%>
<%@page import="perfumestore.Brand"%>
<%@page import="perfumestore.BrandModel"%>
<%@page import="perfumestore.Product"%>
<%@page import="perfumestore.Product_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String type = request.getParameter("type");
    String search = request.getParameter("search");

    if (type.equals("product")) {
        Product_Model productM = new Product_Model();
        int productId = Integer.parseInt(request.getParameter("id"));
        Product p = productM.getProduct(productId);
        productM.updateProduct(productId, p.getName(), p.getVolume(), p.getCategoty_id(), p.getBrand_id(), p.getOriginal_price(), p.getCurrent_price(), p.getDescription(), 0);
        response.sendRedirect("products?search=" + search);
    }
    else if (type.equals("category")) {
        Category_Model cateM = new Category_Model();
        int cateId = Integer.parseInt(request.getParameter("id"));
        Category c = cateM.getCategory(cateId);
        cateM.updateCategory(cateId, c.getCategory_name(), 0);
        response.sendRedirect("category.jsp?search=" + search);
    }
    else if (type.equals("brand")) {
        BrandModel brandM = new BrandModel();
        int brandId = Integer.parseInt(request.getParameter("id"));
        Brand b = brandM.getBrand(brandId);
        brandM.update(brandId, b.getBrand_name(), b.getCountry_code(), 0);
        response.sendRedirect("brand.jsp?search=" + search);
    } 
    else if (type.equals("account")) {
        AccountModel accM = new AccountModel();
        int accountId = Integer.parseInt(request.getParameter("id"));
        Account a = accM.getAccount(accountId);
        accM.update(accountId, a.getPassword(), 0, a.getRole_id());
        response.sendRedirect("accounts.jsp?search=" + search);
    } 
    else if (type.equals("user")) {
        UserModel userM = new UserModel();
        int accId = Integer.parseInt(request.getParameter("id"));
        User u = userM.getUser(accId);
        userM.update(u.getUser_id(), u.getFull_name(), u.getAddress(), u.getPhone(), u.getEmail(), u.getProfile_picture(), u.getAccount_id(), 0);
        response.sendRedirect("user.jsp?search=" + search);
    }
    //response.sendRedirect("products");

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

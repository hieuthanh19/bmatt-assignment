<%-- 
    Document   : product-delete
    Created on : Nov 7, 2019, 3:18:17 PM
    Author     : ThanhKH
--%>

<%@page import="perfumestore.Brand"%>
<%@page import="perfumestore.BrandModel"%>
<%@page import="perfumestore.Product"%>
<%@page import="perfumestore.Product_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String type = request.getParameter("type");
    if (type.equals("product")) {
        Product_Model productM = new Product_Model();
        int productId = Integer.parseInt(request.getParameter("id"));
        Product p = productM.getProduct(productId);
        productM.updateProduct(productId, p.getName(), p.getVolume(), p.getCategoty_id(), p.getBrand_id(), p.getOriginal_price(), p.getCurrent_price(), p.getDescription(), 0);
        response.sendRedirect("products");
    } else if (type.equals("category")) {

    } else if (type.equals("brand")) {
        BrandModel brandM = new BrandModel();
        int brandId = Integer.parseInt(request.getParameter("id"));
        Brand b = brandM.getBrand(brandId);
        brandM.update(brandId, b.getBrand_name(), b.getCountry_code(), 0);
        response.sendRedirect("brand.jsp");
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

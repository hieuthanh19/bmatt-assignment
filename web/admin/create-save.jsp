<%-- 
    Document   : createSave
    Created on : Nov 11, 2019, 10:01:19 PM
    Author     : ThanhKH
--%>

<%@page import="perfumestore.Product_Image_Model"%>
<%@page import="perfumestore.Product_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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
    proImgM.insertProductImg(productId, imageName, 1);
    
    response.sendRedirect("admin/products");
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

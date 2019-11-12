<%-- 
    Document   : edit-save
    Created on : Nov 12, 2019, 12:28:09 AM
    Author     : ThanhKH
--%>

<%@page import="perfumestore.Product_Image"%>
<%@page import="java.util.ArrayList"%>
<%@page import="perfumestore.Product_Image_Model"%>
<%@page import="perfumestore.Product_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Product_Model productM = new Product_Model();
    Product_Image_Model proImgM = new Product_Image_Model();
    int productId = Integer.parseInt((String) request.getAttribute("id"));
    String productName = (String) request.getAttribute("productName");
    Double volume = Double.parseDouble((String) request.getAttribute("productVolume"));
    double productBasePrice = Double.parseDouble((String) request.getAttribute("productOriginalPrice"));
    double productSellPrice = Double.parseDouble((String) request.getAttribute("productCurrentPrice"));
    int categoryId = Integer.parseInt((String) request.getAttribute("productCategory"));
    int brandId = Integer.parseInt((String) request.getAttribute("productBrand"));
    String description = (String) request.getAttribute("productDescription");
    int status = Integer.parseInt((String) request.getAttribute("productStatus"));
    String imageName = (String) request.getAttribute("productImage");

    productM.updateProduct(productId, productName, volume, categoryId, brandId, productBasePrice, productSellPrice, description, status);

    //User choose another image -> update first imge in image list
    if (!imageName.isEmpty()) {
        ArrayList<Product_Image> imgList = proImgM.getProduct_Image(productId);
        Product_Image img = imgList.get(0);
        proImgM.updateImage(img.getImg_id(), productId, imageName, 1);        
    }

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

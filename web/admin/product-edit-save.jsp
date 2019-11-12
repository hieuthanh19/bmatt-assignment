<%-- 
    Document   : sanpham-edit-save
    Created on : Nov 1, 2019, 3:07:15 PM
    Author     : Nhat Thanh
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ObjecInfo.Sanpham"%>
<%@page import="MyUtils.DBConnection"%>
<%@page import="Model.SanphamModel"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //connect to database
    Connection con = DBConnection.getConnection();
    SanphamModel sp = new SanphamModel(con);
    String hinh = "";
    //confirm the file is exist
    Object file = request.getAttribute("file");
    if (file == null) {
        //return null
        hinh = "";
    } else {
        //output url of image's file
        hinh = file.toString();
    }
    
    //convert all object of product to their data type 
    int giaban = Integer.parseInt((String) request.getAttribute("giaban"));
    int giagoc = Integer.parseInt((String) request.getAttribute("giagoc"));
    int loai = Integer.parseInt((String) request.getAttribute("loai"));
    int id = Integer.parseInt((String) request.getAttribute("id"));
    Object info = request.getAttribute("thongtin");
    String thongtin = info.toString();
    Object name = request.getAttribute("ten");
    String ten = name.toString();

    //check existent of page and string
    int pageNumber = 1; //page number
    String searchContent = ""; //search 
    String sortColumn = ""; //sort column    
    //paging
    if (request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
    //searching
    if (request.getParameter("search") != null) {
        searchContent = request.getParameter("search");
    }
    
    //arraylist of product througd id_product and image
    ArrayList<Sanpham> list = sp.getPaging(pageNumber, searchContent, sortColumn);
    for (Sanpham spm : list) {
        if (id == spm.getSp_ma() && hinh.equals("")) {
            hinh = spm.getSp_hinh();
        }
    }
    //check if update is success or not
    boolean check  = sp.updateProduct(id, ten, giagoc, giaban, hinh, thongtin, loai);
    if(check==true){
        out.println("thanh cong ");
        response.sendRedirect("sanpham-list.jsp?pageNumber=" + pageNumber + "&search=" + searchContent);
    }else{
     out.println("loi roi xem lai sql nha ");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>
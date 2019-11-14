<%-- 
    Document   : logout-process
    Created on : Nov 13, 2019, 5:45:12 AM
    Author     : ThanhKH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("admin-username");
    response.sendRedirect("");
%>


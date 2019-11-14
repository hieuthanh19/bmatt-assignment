<%-- 
    Document   : index
    Created on : Nov 12, 2019, 10:43:12 PM
    Author     : ThanhKH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("admin-username") == null) {
%>
<jsp:include page="./login.jsp"></jsp:include>

<% } else {
%>
<jsp:include page="./dashboard.jsp"></jsp:include>
<%     }

%>

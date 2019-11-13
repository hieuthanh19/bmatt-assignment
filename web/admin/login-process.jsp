<%-- 
    Document   : login-process
    Created on : Nov 12, 2019, 11:06:31 PM
    Author     : ThanhKH
--%>

<%@page import="perfumestore.Account"%>
<%@page import="perfumestore.AccountModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    AccountModel accM = new AccountModel();
    Account acc = accM.verifyAccount(username, password);
    if (acc == null) {
        response.sendRedirect("login.jsp?errorCode=1");
    } else {
        if (acc != null && acc.getAccount_status()!=0 && acc.getRole_id()!=1) {            
            session.setAttribute("username", username);
            session.setAttribute("password", acc.getPassword());
        } else if (session.getAttribute("username") == null) {
            session.removeAttribute("username");
        }
        response.sendRedirect("index.jsp");
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

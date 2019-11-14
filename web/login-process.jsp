<%-- 
    Document   : login-process
    Created on : 11-11-2019, 18:46:28
    Author     : DELL
--%>

<%@page import="perfumestore.UserModel"%>
<%@page import="perfumestore.AccountException"%>
<%@page import="perfumestore.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="perfumestore.AccountModel"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String Username = request.getParameter("username");
    String Password = request.getParameter("password");

    AccountModel accM = new AccountModel();
    Account acc = accM.verifyAccount(Username, Password);
    if (acc == null) {
        response.sendRedirect("login.jsp?errorCode=1");
    } else {
        if (acc != null && acc.getAccount_status() != 0 && acc.getRole_id() != 1) {
            session.setAttribute("username", Username);
            session.setAttribute("password", acc.getPassword());
        } else if (session.getAttribute("username") == null) {
            session.removeAttribute("username");
        }
        response.sendRedirect("index.jsp");
    }
%>
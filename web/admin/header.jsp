<%@page import="perfumestore.Account"%>
<%@page import="perfumestore.AccountModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Account acc = null;
    if (session.getAttribute("admin-username") != null) {
        /**
         * GET ACCOUNT
         */
        String username = (String) session.getAttribute("admin-username");
        String password = (String) session.getAttribute("admin-password");
        AccountModel accM = new AccountModel();
        acc = accM.getAccount(username, password);
    } else {
        response.sendRedirect("");
    }
%>
<!-- BEGIN: Header-->
<nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-light navbar-shadow">
    <div class="navbar-wrapper">
        <div class="navbar-container content">
            <div class="navbar-collapse" id="navbar-mobile">
                <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">

                    <ul class="nav navbar-nav bookmark-icons">
                        <li class="nav-item d-none d-lg-block"><a class="nav-link" href="../index.jsp" target="_blank" data-toggle="tooltip" data-placement="top" title="Go to Home Page"><i class="ficon feather icon-home"></i></a></li>
                        <li class="nav-item d-none d-lg-block"><a class="nav-link" href="../admin/products.jsp?action=add" data-toggle="tooltip" data-placement="top" title="Add new Product"><i class="ficon feather icon-plus"></i></a></li>
                    </ul>
                </div>
                <ul class="nav navbar-nav float-right">
                    <!--                    <li class="nav-item nav-search"><a class="nav-link nav-link-search"><i class="ficon feather icon-search"></i></a>
                                            <div class="search-input">
                                                <div class="search-input-icon"><i class="feather icon-search primary"></i></div>
                                                <input class="input" type="text" placeholder="Type something..." tabindex="-1" data-search="template-list">
                                                <div class="search-input-close"><i class="feather icon-x"></i></div>
                                                <ul class="search-list"></ul>
                                            </div>
                                        </li>-->
                    <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                            <div class="user-nav d-sm-flex d-none">
                                <span class="user-name text-bold-600"><%=acc != null ? acc.getUsername() : "Admin"%></span>
                                <span class="user-status">Active</span>
                            </div>
                            <span >
                                <!--<i class="round feather icon-user" style="color: #7367F0; height: 40px; width: 40px;"  ></i>-->
                                <img class="round admin-avtar" src="../admin/app-assets/images/portrait/small/avatar-admin.png" alt="avatar" height="35" width="35">
                            </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <!--                            <a class="dropdown-item" href="page-user-profile.html"><i class="feather icon-user"></i> Edit Profile</a>
                                                        <a class="dropdown-item" href="app-email.html"><i class="feather icon-mail"></i> My Inbox</a>
                                                        <a class="dropdown-item" href="app-todo.html"><i class="feather icon-check-square"></i> Task</a>
                                                        <a class="dropdown-item" href="app-chat.html"><i class="feather icon-message-square"></i> Chats</a>
                                                        <div class="dropdown-divider"></div>-->
                            <a class="dropdown-item" href="logout-process.jsp">
                                <i class="feather icon-power"></i> Log out</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!-- END: Header-->


<!-- BEGIN: Main Menu-->
<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto"><a class="navbar-brand" href="dashboard.jsp">
                    <div class="brand-logo"></div>
                    <h2 class="brand-text mb-0">BMatt</h2>
                </a></li>
            <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="icon-disc"></i></a></li>
        </ul>
    </div>
    <div class="shadow-bottom"></div>
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            <li class=" nav-item"><a href="../admin/index.jsp"><i class="feather icon-home"></i><span class="menu-title">Dashboard</span></a></li>
            <li class=" navigation-header"><span>Store Management</span>
            </li>           

            <li class=" nav-item"><a href="../admin/products"><i class="feather icon-package"></i><span class="menu-title">Products</span></a>
            </li>
            <li class=" nav-item"><a href="../admin/category.jsp"><i class="feather icon-list"></i><span class="menu-title">Categories</span></a>
            </li>
            <li class=" nav-item"><a href="../admin/brand.jsp"><i class="feather icon-grid"></i><span class="menu-title">Brands</span></a>
            </li>
            <%
                if (acc.getRole_id() == 4) {
            %>
            <li class=" navigation-header"><span>Administration</span>
            </li>
            <li class=" nav-item"><a href="../admin/accounts.jsp"><i class="feather icon-users"></i><span class="menu-title">Accounts</span></a>
            </li>
            <%
                }
            %>




        </ul>
    </div>
</div>
<!-- END: Main Menu-->
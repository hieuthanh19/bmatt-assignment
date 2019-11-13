<%@page import="perfumestore.Account"%>
<%@page import="perfumestore.AccountModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Account acc = null;
    if (session.getAttribute("username") != null) {
        /**
         * GET ACCOUNT
         */
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        AccountModel accM = new AccountModel();
        acc = accM.verifyAccount(username, password);
    }
%>
<!-- BEGIN: Header-->
<nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-light navbar-shadow">
    <div class="navbar-wrapper">
        <div class="navbar-container content">
            <div class="navbar-collapse" id="navbar-mobile">
                <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">

                    <ul class="nav navbar-nav bookmark-icons">
                        <li class="nav-item d-none d-lg-block"><a class="nav-link" href="../admin/new-post.jsp" data-toggle="tooltip" data-placement="top" title="Thêm bài viết mới"><i class="ficon feather icon-edit"></i></a></li>
                        <li class="nav-item d-none d-lg-block"><a class="nav-link" href="../index.jsp" target="_blank" data-toggle="tooltip" data-placement="top" title="Xem trang chủ"><i class="ficon feather icon-external-link"></i></a></li>
                    </ul>
                </div>
                <ul class="nav navbar-nav float-right">
                    <li class="nav-item nav-search"><a class="nav-link nav-link-search"><i class="ficon feather icon-search"></i></a>
                        <div class="search-input">
                            <div class="search-input-icon"><i class="feather icon-search primary"></i></div>
                            <input class="input" type="text" placeholder="Type something..." tabindex="-1" data-search="template-list">
                            <div class="search-input-close"><i class="feather icon-x"></i></div>
                            <ul class="search-list"></ul>
                        </div>
                    </li>
                    <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                            <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600"><%=acc != null ? acc.getUsername() : "Admin"%></span><span class="user-status">Available</span></div><span><img class="round" src="../admin/app-assets/images/portrait/small/avatar-admin.png" alt="avatar" height="40" width="40"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="page-user-profile.html"><i class="feather icon-user"></i> Edit Profile</a><a class="dropdown-item" href="app-email.html"><i class="feather icon-mail"></i> My Inbox</a><a class="dropdown-item" href="app-todo.html"><i class="feather icon-check-square"></i> Task</a><a class="dropdown-item" href="app-chat.html"><i class="feather icon-message-square"></i> Chats</a>
                            <div class="dropdown-divider"></div><a class="dropdown-item" href="logout-process.jsp"><i class="feather icon-power"></i> Logout</a>
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
            <li class="nav-item mr-auto"><a class="navbar-brand" href="../admin/html/ltr/vertical-menu-template/index.html">
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
            <li class=" navigation-header"><span>Content Management</span>
            </li>

            <li class=" nav-item"><a href="../admin/all-post.jsp"><i class="feather icon-edit"></i><span class="menu-title">Posts</span></a>
                <ul class="menu-content">
                    <li class=" nav-item"><a href="../admin/all-post.jsp"><i class="feather icon-list"></i><span class="menu-title">All Posts</span></a>
                    </li>
                    <li class=" nav-item"><a href="../admin/add-post.jsp"><i class="feather icon-edit"></i><span class="menu-title">New Post</span></a>
                    </li>
                </ul>
            </li>
            <li class=" nav-item"><a href="../admin/all-page.jsp"><i class="feather icon-book"></i><span class="menu-title">Pages</span></a>
                <ul class="menu-content">
                    <li class=" nav-item"><a href="../admin/all-page.jsp"><i class="feather icon-book"></i><span class="menu-title">All Pages</span></a>
                    </li>
                    <li class=" nav-item"><a href="../admin/add-page.jsp"><i class="feather icon-edit"></i><span class="menu-title">New Page</span></a>
                    </li>
                </ul>
            </li>
            <li class=" nav-item"><a href="../admin/galery.jsp"><i class="feather icon-image"></i><span class="menu-title">Thư viện</span></a>
                <ul class="menu-content">
                    <li class=" nav-item"><a href="../admin/galery.jsp"><i class="feather icon-image"></i><span class="menu-title">Thư viện</span></a>
                    </li>
                    <li class=" nav-item"><a href="../admin/upload.jsp"><i class="feather icon-upload"></i><span class="menu-title">Tải lên</span></a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item"><a href="../admin/comment.jsp"><i class="feather icon-message-square"></i><span class="menu-title">Bình luận</span></a>
            </li>
            <li class=" nav-item"><a href="#"><i class="feather icon-list"></i><span class="menu-title">Store</span></a>
                <ul class="menu-content">
                    <li><a class="dd-menu" href="../admin/products"><i class="feather icon-package"></i><span class="menu-item">Products</span></a>
                    </li>
                    <li><a class="dd-menu" href="../admin/category.jsp"><i class="feather icon-list"></i><span class="menu-item">Categories</span></a>
                    </li>
                    <li><a class="dd-menu" href="../admin/brand.jsp"><i class="feather icon-grid"></i><span class="menu-item">Brands</span></a>
                    </li>
                </ul>
            </li>
            <li class=" navigation-header"><span>Settings</span>
            </li>

            <li class=" nav-item"><a href="#"><i class="feather icon-layout"></i><span class="menu-title" data-i18n="Content">General</span></a>
                <ul class="menu-content">
                    <li><a href="../admin/setting-number.jsp"><i class="feather icon-circle"></i><span class="menu-item">Tổng quan</span></a>
                    </li>
                    <li><a href="../admin/setting-number.jsp"><i class="feather icon-circle"></i><span class="menu-item">Viết</span></a>
                    </li>
                    <li><a href="../admin/setting-number.jsp"><i class="feather icon-circle"></i><span class="menu-item">Đọc</span></a>
                    </li>
                    <li><a href="../admin/setting-number.jsp"><i class="feather icon-circle"></i><span class="menu-item">Galery</span></a>
                    </li>
                    <li><a href="../admin/setting-number.jsp"><i class="feather icon-circle"></i><span class="menu-item">Đường dẫn tĩnh</span></a>
                    </li>
                    <li><a href="../admin/setting-number.jsp"><i class="feather icon-circle"></i><span class="menu-item">Quyền riêng tư</span></a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item"><a href="../admin/accounts.jsp"><i class="feather icon-users"></i><span class="menu-title">Accounts</span></a>
                <ul class="menu-content">
                    <li><a href="../admin/accounts.jsp"><i class="feather icon-users"></i><span class="menu-item">All Accounts</span></a>
                    </li>
                    <!--                    <li><a href="../admin/add-user.jsp"><i class="feather icon-user-plus"></i><span class="menu-item">Add User</span></a>
                                        </li>-->
                </ul>
            </li>

        </ul>
    </div>
</div>
<!-- END: Main Menu-->
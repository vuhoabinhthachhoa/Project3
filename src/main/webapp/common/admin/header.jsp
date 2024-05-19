<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <div class="collapse navbar-collapse nav-menu" id="navbarSupportedContent">
            <div class="dropdown " data-bs-theme="dark">
                <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-bars"></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="./home">Trang chủ</a></li>
                    <li><a class="dropdown-item" href="./building-list">Tìm kiếm tòa nhà</a></li>
                    <li><a class="dropdown-item" href="./add-edit-building">Thêm, xóa tòa nhà</a></li>
                </ul>
            </div>

            <a class="navbar-brand" href="#">Trang quản trị</a>
        </div>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="ms-auto dropdown" data-bs-theme="dark">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Xin chào, <%=SecurityUtils.getPrincipal().getFullName()%>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a class="dropdown-item" href="/admin/profile-<%=SecurityUtils.getPrincipal().getUsername()%>">
                            <i class="ace-icon fa fa-user"></i>
                            <%--<spring:message code="label.account.information"/>--%>
                            Thông tin tài khoản
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="<c:url value="/admin/profile-password"/>">
                            <i class="ace-icon fa fa-key"></i>
                            <%--<spring:message code="label.password.change"/>--%>
                            Đổi mật khẩu
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="<c:url value='/logout'/>">
                            <i class="ace-icon fa fa-power-off"></i>
                            Thoát
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </div>
</nav>

<%--<div id="navbar" class="navbar navbar-default ace-save-state" style="background-color:#35bf76">--%>
<%--    <div class="navbar-container ace-save-state" id="navbar-container">--%>
<%--        <div class="navbar-header pull-left">--%>
<%--            <a href="#" class="navbar-brand">--%>
<%--                <small>--%>
<%--                    <i class="fa fa-leaf"></i>--%>
<%--                    Trang quản trị--%>
<%--                </small>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--        <div class="navbar-buttons navbar-header pull-right" role="navigation">--%>
<%--            <ul class="nav ace-nav">--%>
<%--                <li class="light-10">--%>
<%--                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">--%>
<%--                        Xin chào, <%=SecurityUtils.getPrincipal().getFullName()%>--%>
<%--                        <i class="ace-icon fa fa-caret-down"></i>--%>
<%--                    </a>--%>

<%--                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">--%>
<%--                        <li>--%>
<%--                            <a href="/admin/profile-<%=SecurityUtils.getPrincipal().getUsername()%>">--%>
<%--                                <i class="ace-icon fa fa-user"></i>--%>
<%--                                &lt;%&ndash;<spring:message code="label.account.information"/>&ndash;%&gt;--%>
<%--                                Thông tin tài khoản--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="<c:url value="/admin/profile-password"/>">--%>
<%--                                <i class="ace-icon fa fa-key"></i>--%>
<%--                                &lt;%&ndash;<spring:message code="label.password.change"/>&ndash;%&gt;--%>
<%--                                Đổi mật khẩu--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="divider"></li>--%>
<%--                        <li>--%>
<%--                            <a href="<c:url value='/logout'/>">--%>
<%--                                <i class="ace-icon fa fa-power-off"></i>--%>
<%--                                Thoát--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
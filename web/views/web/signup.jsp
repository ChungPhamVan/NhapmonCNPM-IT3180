<%-- 
    Document   : login
    Created on : Dec 8, 2019, 10:29:37 PM
    Author     : HDN
--%>

<%@include file="/common/taglib.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký</title>
    </head>
    <body>
        <div class="register register-but">
            <form id="formSubmitSignup" method="POST" action="<c:url value="/dang-ky"/>" >
                <div class="  register-top-grid">
                    <h3>PERSONAL INFORMATION</h3>
                    <div class="mation">
                        <span>First Name<label>*</label></span>
                        <input type="text" name="firstName" id="firstName">
                        <span>Last Name<label>*</label></span>
                        <input type="text" name="lastName" id="lastName">

                        <span>Email Address<label>*</label></span>
                        <input type="text" name="emailAddress" id="emailAddress">
                    </div>
                    <div class="clearfix"> </div>
                    <input type="hidden" value="signup" id="action" name="action" />

                </div>
                <div class="  register-bottom-grid">
                    <h3>LOGIN INFORMATION</h3>
                    <div class="mation">
                        <span>Password<label>*</label></span>
                        <input type="password" name="password" id="password" style="padding-left: 5px;">
                        <span style="margin-top: 10px;">Confirm Password<label>*</label></span>
                        <input type="password" name="confirmPassword" id="confirmPassword" style="padding-left: 5px;">
                    </div>
                </div>
                <c:if test="${not empty message}">
                    <div class="alert alert-${alert}" role="alert" style="padding: 10px;">
                        ${message}
                    </div>
                </c:if>
                <input type="submit" value="submit">
                <div class="clearfix"> </div>
            </form>
            <div class="clearfix"> </div>
        </div>
    </body>
</html>

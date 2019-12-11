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
        <title>Đăng nhập</title>
    </head>
    <body>
        <div class="account_grid">
            <div class=" login-right">
                <h3>REGISTERED CUSTOMERS</h3>
                <p>If you have an account with us, please log in.</p>
                <form id="formSubmitLogin" method="POST" action="<c:url value="/dang-nhap"/>" >
                    <div>
                        <span>Email Address<label>*</label></span>
                        <input type="text" name="emailAddress" placeholder="Enter email address" id="emailAddress"> 
                    </div>
                    <div>
                        <span>Password<label>*</label></span>
                        <input type="password" name="password" placeholder="Enter password" id="password" style="padding-left: 5px;"> 
                    </div>
                    <input type="hidden" value="login" id="action" name="action" />
                    <c:if test="${not empty message}">
                        <div class="alert alert-${alert}" role="alert" style="padding: 10px;">
                            ${message}
                        </div>
                    </c:if>
<!--                    <a class="forgot" href="#">Forgot Your Password?</a>-->
                    <input type="submit" value="Login">
                </form>
            </div>	
            <div class=" login-left">
                <h3>NEW CUSTOMERS</h3>
                <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
                <a class="acount-btn" href='<c:url value="/dang-ky?action=signup"></c:url>'>Create an Account</a>
            </div>
            <div class="clearfix"> </div>
        </div>
    </body>
</html>

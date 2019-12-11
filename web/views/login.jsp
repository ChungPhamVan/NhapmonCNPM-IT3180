<%-- 
    Document   : Login
    Created on : Nov 28, 2019, 4:07:33 AM
    Author     : HDN
--%> 
<!DOCTYPE html>
<%@include file="/common/taglib.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
                        <span class="login100-form-title-1">
                            Sign In
                        </span>
                    </div>

                    <form class="login100-form validate-form" id="formSubmit" method="POST" action="<c:url value="/dang-nhap"/>" >
                        <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                            <span class="label-input100">Username</span>
                            <input class="input100" type="text" name="emailAddress" placeholder="Enter username" id="emailAddress">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
                            <span class="label-input100">Password</span>
                            <input class="input100" type="password" name="password" placeholder="Enter password" id="password">
                            <span class="focus-input100"></span>
                        </div>
                        <input type="hidden" value="login" id="action" name="action" />
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" type="submit">
                                Login
                            </button>
                        </div>
                        <c:if test="${not empty message}">
                            <div class="alert alert-${alert} w-100 mt-4" role="alert">
                                ${message}
                            </div>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

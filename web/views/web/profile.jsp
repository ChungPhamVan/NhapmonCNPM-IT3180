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
        <title>Profile</title>
    </head>
    <body>
        <div class="register register-but">
            <div class="  register-top-grid">
                <h3>PERSONAL INFORMATION</h3>
                <c:if test="${not empty USERMODEL}">
                    <div class="mation">
                        <span>First Name<label>*</label></span>
                        <input type="text" name="firstName" id="firstName" value="${USERMODEL.firstName}" disabled style="cursor: no-drop">
                        <span>Last Name<label>*</label></span>
                        <input type="text" name="lastName" id="lastName" value="${USERMODEL.lastName}" disabled style="cursor: no-drop">

                        <span>Email Address<label>*</label></span>
                        <input type="text" name="emailAddress" id="emailAddress" value="${USERMODEL.emailAddress}" disabled="" style="cursor: no-drop">
                    </div>
                </c:if>
                <c:if test="${empty USERMODEL}">
                    <div class="mation">
                        <h2 >Empty Profile</h2>
                    </div>
                </c:if>
            </div>
            <div class="clearfix"> </div>
            <div class="clearfix"> </div>
        </div>
    </body>
</html>

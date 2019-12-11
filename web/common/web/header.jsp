<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="header">
    <div class="top-header">
        <div class="container">
            <div class="top-header-left">
                <ul class="support">
                    <li><a href="#"><label> </label></a></li>
                    <li><a href="#">24x7 live<span class="live"> support</span></a></li>
                </ul>
                <ul class="support">
                    <li class="van"><a href="#"><label> </label></a></li>
                    <li><a href="<c:url value="?contact=contact"></c:url>">Free shipping <span class="live">on order over 500</span></a></li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <div class="top-header-right">
                    <div class="down-top">		
                        <select class="in-drop">
                            <option value="English" class="in-of">English</option>
                            <option value="Japanese" class="in-of">Japanese</option>
                            <option value="French" class="in-of">French</option>
                            <option value="German" class="in-of">German</option>
                        </select>
                    </div>
                    <div class="down-top top-down">
                        <select class="in-drop">

                            <option value="Dollar" class="in-of">Dollar</option>
                            <option value="Yen" class="in-of">Yen</option>
                            <option value="Euro" class="in-of">Euro</option>
                        </select>
                    </div>
                    <!---->
                    <div class="clearfix"> </div>	
                </div>
                <div class="clearfix"> </div>		
            </div>
        </div>
        <div class="bottom-header">
            <div class="container">
                <div class="header-bottom-left">
                    <div class="logo">
                        <a href="<c:url value="/"></c:url>"><img src="template/web/images/logo.png" alt=" " /></a>
                    </div>
                    <div class="search">
                        <form method="GET" action="<c:url value="/san-pham"></c:url>" style="margin-bottom: 0px;">
                            <input type="text" name="search" id="search" placeholder="Search...">
                            <input type="submit"  value="SEARCH">
                        </form>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="header-bottom-right">					
                    <div class="account"><a href='<c:url value="/trang-chu?profile=profile"></c:url>'><span> </span>YOUR ACCOUNT</a></div>
                    <ul class="login">
                    <c:if test="${not empty USERMODEL}">
                        <li>
                            <a href="#">
                                <span> </span>
                                <c:if test="${USERMODEL.lastName.length()>9}" >
                                    ${USERMODEL.lastName.substring(0, 4)}...
                                </c:if>
                                <c:if test="${USERMODEL.lastName.length()<9}" >
                                    ${USERMODEL.lastName}
                                </c:if>
                            </a>
                        </li>
                        <li><a href='<c:url value="/thoat?action=logout"/>'><span> </span>Logout</a></li>
                        </c:if>
                        <c:if test="${empty USERMODEL}">
                        <li>
                            <a href='<c:url value="/dang-nhap?action=login"/>'>
                                <span> </span>
                                LOGIN
                            </a>
                        </li> |
                        <li><a href='<c:url value="/dang-ky?action=signup"/>'>SIGNUP</a></li>
                        </c:if>
                </ul>
                <div class="cart">
                    <a href='<c:url value="/trang-chu?cart=cart"></c:url>'>
                        <span> </span>
                        CART
                        <span id="amountKindOfCart" style="color: white; background: none; background-color: #007bff; padding-left: .6em; padding-right: .6em; border-radius: 10rem" class="badge badge-primary">
                            <c:if test="${(not empty productsOfCart) && productsOfCart.listResult.size() > 0}">
                                ${productsOfCart.listResult.size()}
                            </c:if>
                        </span>
                    </a>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>	
        </div>
    </div>
</div>
<!---->
<script>
    $(document).ready(function () {
        if ($("span#amountKindOfCart").text().trim() == "" || $("span#amountKindOfCart").text().trim() == "0") {
            $("span#amountKindOfCart").attr("style", "display: none");
        }

    });
</script>

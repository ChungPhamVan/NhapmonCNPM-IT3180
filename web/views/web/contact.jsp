<%-- 
    Document   : contact
    Created on : Dec 9, 2019, 1:38:13 AM
    Author     : HDN
--%>

<%@include file="/common/taglib.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
    </head>
    <body>
        <div class="main">
            <div class="reservation_top">
                <div class=" contact_right">
                    <h3>Contact Form</h3>
                    <div class="contact-form">
                        <form method="post" action="contact-post.html">
                            <input 
                                    type="text" 
                                    class="textbox" 
                                    <c:if test="${not empty USERMODEL}">
                                        value="${USERMODEL.firstName.concat(USERMODEL.lastName)}"
                                        disabled=""
                                        style="cursor: no-drop"
                                    </c:if>
                                    placeholder="Name"
                                    
                                >
                            <input 
                                    type="text" 
                                    class="textbox" 
                                    <c:if test="${not empty USERMODEL}">
                                        value="${USERMODEL.emailAddress}"
                                        disabled=""
                                        style="cursor: no-drop"
                                    </c:if>
                                    placeholder="Email">
                            <textarea value="" placeholder="Message"></textarea>
                            <input type="submit" value="Send">
                            <div class="clearfix"> </div>
                        </form>
                        <address class="address">
                            <p>9870 St Vincent Place, <br>Glasgow, DC 45 Fr 45.</p>
                            <dl>
                                <dt> </dt>
                                <dd>Freephone:<span> +1 800 254 2478</span></dd>
                                <dd>Telephone:<span> +1 800 547 5478</span></dd>
                                <dd>FAX: <span>+1 800 658 5784</span></dd>
                                <dd>E-mail:&nbsp; <a href="mailto@vintage.com">info(at)bigshop.com</a></dd>
                            </dl>
                        </address>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

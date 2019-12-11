<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
    <head>
        <title>Big shope A Ecommerce Category Flat Bootstarp Resposive Website Template | Home :: w3layouts</title>
        <link href="template/web/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!--theme-style-->
        <link href="template/web/css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <link href="template/web/css/etalage.css" rel="stylesheet" type="text/css" media="all" />
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--fonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <!--//fonts-->
        <script src="template/web/js/jquery.min.js"></script>
        <script src="template/web/js/jquery.etalage.min.js"></script>
    </head>
    <body>
        <div class="women-product">
            <div class=" w_content">
                <div class="women">
                        <c:if test="${empty products || products.listResult.size() == 0}">
                            <h4><span>0 itemms</span> </h4>
                        </c:if>
                        <c:if test="${not empty products && products.listResult.size() != 0}">
                            <h4><span>${products.listResult.size()} itemms</span> </h4>
                        </c:if>
                    <!--                    <ul class="w_nav">
                                            <li>Sort : </li>
                                            <li><a class="active" href="#">popular</a></li> |
                                            <li><a href="#">new </a></li> |
                                            <li><a href="#">discount</a></li> |
                                            <li><a href="#">price: Low High </a></li>
                                            <div class="clearfix"> </div>
                                        </ul>-->
                    <div class="clearfix"> </div>
                </div>
            </div>
            <!-- grids_of_4 -->
            <div class="grid-product">
                <c:if test="${empty products || products.listResult.size() == 0}">
                    <h3 class="text-center">No results found for "${search}"</h3>
                </c:if>
                <c:if test="${not empty products || products.listResult.size() != 0}">
                    <c:forEach var="product" items="${products.listResult}">
                        <div class="product-grid">
                            <div class="content_box">
                                <a href='<c:url value="/san-pham?idproduct=${product.id}"></c:url>'>
                                        <div class="left-grid-view grid-view-left">
                                            <img src='<c:url value="images/${product.thumbnail}"></c:url>' class="img-responsive watch-right" alt="" />
                                            <div class="mask">
                                                <div class="info">Quick View</div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <h4>
                                    <a href='<c:url value="/san-pham?idproduct=${product.id}"></c:url>'>
                                    <c:if test="${product.title.length() <= 26}">
                                        ${product.title}
                                    </c:if> 
                                    <c:if test="${product.title.length() > 26}">
                                        ${product.title.substring(0, 22)} ...
                                    </c:if> 
                                </a>
                            </h4>
                            <p>It is a long established fact that a reader</p>
                            Rs. ${product.price}
                        </div>
                    </c:forEach>
                </c:if>
            </div>
            <div class="clearfix"> </div>
        </div>
    </body>
</html>
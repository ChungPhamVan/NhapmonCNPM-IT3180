<%-- 
    Document   : home
    Created on : Nov 11, 2019, 5:37:23 PM
    Author     : HDN
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang ch?</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.js" />
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" />

    </head>
    <body>
        <div class="shoes-grid">
            <a href="#">
                <div class="wrap-in">
                    <div class="wmuSlider example1 slide-grid">		 
                        <div class="wmuSliderWrapper">	
                            <c:forEach var="product" items="${listRandomProducts}" varStatus="indexProduct" >
                                <c:if test="${(indexProduct.index + 1) >= 3 && (indexProduct.index + 1) < 6}">
                                    <article style="position: absolute; width: 100%; opacity: 0;">					
                                        <div class="banner-matter">
                                            <div class="col-md-5 banner-bag">
                                                <img class="img-responsive " src='<c:url value="/images/${product.thumbnail}"></c:url>' alt="${product.title}" />
                                                </div>
                                                <div class="col-md-7 banner-off">							
                                                    <h2>FLAT 50% 0FF</h2>
                                                    <label>FOR ALL PURCHASE <b>${product.price}$</b></label>
                                                <p>${product.title}</p>					
                                                <span class="on-get">GET NOW</span>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </div>
                                    </article>
                                </c:if>
                            </c:forEach>
                        </div>
                        </a>
                        <ul class="wmuSliderPagination">
                            <li><a href="#" class="">0</a></li>
                            <li><a href="#" class="">1</a></li>
                            <li><a href="#" class="">2</a></li>
                        </ul>
                        <script src="template/web/js/jquery.wmuSlider.js"></script> 
                        <script>
                            $('.example1').wmuSlider();
                        </script> 
                    </div>
                </div>
            </a>
            <!---->
            <div class="shoes-grid-left">
                <c:forEach var="product" items="${listRandomProducts}" varStatus="indexProduct" >
                    <c:if test="${(indexProduct.index + 1) >= 6 && (indexProduct.index + 1) <= 7}">
                        <a href='<c:url value="/san-pham?idproduct=${product.id}"></c:url>'>				 
                            <div class="col-md-6 con-sed-grid <c:if test="${(indexProduct.index + 1) == 7}">sed-left-top</c:if>">
                                    <div class=" elit-grid"> 
                                        <h4>consectetur  elit</h4>
                                        <label>FOR ALL PURCHASE VALUE</label>
                                        <p>${product.title}</p>
                                    <span class="on-get">GET NOW</span>						
                                </div>						
                                <img class="img-responsive shoe-left" src='<c:url value="/images/${product.thumbnail}"></c:url>' alt="${product.title}" />
                                    <div class="clearfix"> </div>
                                </div>
                            </a>
                    </c:if>
                </c:forEach>
            </div>
            <div class="products">
                <h5 class="latest-product">LATEST PRODUCTS</h5>	
                <a class="view-all" href="#">VIEW ALL<span> </span></a> 		     
            </div>
            <div class="product-left">
                <c:forEach var="product" items="${listRandomProducts}" varStatus="indexProduct" >
                    <c:if test="${(indexProduct.index + 1) >= 8 && (indexProduct.index + 1) < 11}">
                        <div class="col-md-4 chain-grid <c:if test="${(indexProduct.index + 1) == 10}">grid-top-chain</c:if>">
                            <a href='<c:url value="/san-pham?idproduct=${product.id}"></c:url>'><img class="img-responsive chain" src='<c:url value="/images/${product.thumbnail}"></c:url>' alt="${product.title}" /></a>
                                <span class="star"> </span>
                                <div class="grid-chain-bottom">
                                    <h6>
                                        <a href='<c:url value="/san-pham?idproduct=${product.id}"></c:url>'>
                                        <c:if test="${product.title.length()<=22}">${product.title}</c:if>
                                        <c:if test="${product.title.length()>23}">${product.title.substring(0, 19)} ...</c:if>
                                        </a>
                                    </h6>
                                    <div class="star-price">
                                        <div class="dolor-grid"> 
                                            <span class="actual">${product.price}$</span>
                                        <span class="reducedfrom">
                                            <c:if test="${product.price < 100}">
                                                ${product.price + 10}
                                            </c:if>
                                            <c:if test="${product.price >= 100 && product.price < 200}">
                                                ${product.price + 30}
                                            </c:if>
                                            <c:if test="${product.price >= 200 && product.price < 400}">
                                                ${product.price + 50}
                                            </c:if>
                                            <c:if test="${product.price >= 400 && product.price < 600}">
                                                ${product.price + 70}
                                            </c:if>
                                            <c:if test="${product.price >= 600}">
                                                ${product.price + 100}
                                            </c:if>
                                            $
                                        </span>
                                        <span class="rating">
                                            <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
                                            <label for="rating-input-1-5" class="rating-star1"> </label>
                                            <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
                                            <label for="rating-input-1-4" class="rating-star1"> </label>
                                            <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
                                            <label for="rating-input-1-3" class="rating-star"> </label>
                                            <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
                                            <label for="rating-input-1-2" class="rating-star"> </label>
                                            <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
                                            <label for="rating-input-1-1" class="rating-star"> </label>
                                        </span>
                                    </div>
                                    <a class="now-get get-cart" href="#">ADD TO CART</a> 
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                <div class="clearfix"> </div>
            </div>
            <div class="products">
                <h5 class="latest-product">LATEST PRODUCTS</h5>	
                <a class="view-all" href="#">VIEW ALL<span> </span></a> 		     
            </div>
            <div class="product-left">
                <c:forEach var="product" items="${listRandomProducts}" varStatus="indexProduct" >
                    <c:if test="${(indexProduct.index + 1) >= 11 && (indexProduct.index + 1) < 14}">
                        <div class="col-md-4 chain-grid <c:if test="${(indexProduct.index + 1) == 13}">grid-top-chain</c:if>">
                            <a href="#"><img class="img-responsive chain" src='<c:url value="/images/${product.thumbnail}"></c:url>' alt="${product.title}" /></a>
                                <span class="star"> </span>
                                <div class="grid-chain-bottom">
                                    <h6>
                                        <a href="#">
                                        <c:if test="${product.title.length()<=22}">${product.title}</c:if>
                                        <c:if test="${product.title.length()>23}">${product.title.substring(0, 19)} ...</c:if>
                                        </a>
                                    </h6>
                                    <div class="star-price">
                                        <div class="dolor-grid"> 
                                            <span class="actual">${product.price}$</span>
                                        <span class="reducedfrom">
                                            <c:if test="${product.price < 100}">
                                                ${product.price + 10}
                                            </c:if>
                                            <c:if test="${product.price >= 100 && product.price < 200}">
                                                ${product.price + 30}
                                            </c:if>
                                            <c:if test="${product.price >= 200 && product.price < 400}">
                                                ${product.price + 50}
                                            </c:if>
                                            <c:if test="${product.price >= 400 && product.price < 600}">
                                                ${product.price + 70}
                                            </c:if>
                                            <c:if test="${product.price >= 600}">
                                                ${product.price + 100}
                                            </c:if>
                                            $
                                        </span>
                                        <span class="rating">
                                            <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
                                            <label for="rating-input-1-5" class="rating-star1"> </label>
                                            <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
                                            <label for="rating-input-1-4" class="rating-star1"> </label>
                                            <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
                                            <label for="rating-input-1-3" class="rating-star"> </label>
                                            <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
                                            <label for="rating-input-1-2" class="rating-star"> </label>
                                            <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
                                            <label for="rating-input-1-1" class="rating-star"> </label>
                                        </span>
                                    </div>
                                    <a class="now-get get-cart" href="#">ADD TO CART</a> 
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
        </div>

    </body>
</html>

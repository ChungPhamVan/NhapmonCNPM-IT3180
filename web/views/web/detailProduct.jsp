<%-- 
    Document   : detail
    Created on : Nov 19, 2019, 7:16:03 AM
    Author     : HDN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url var="APIurl" value="/san-pham" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.js" />
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" />
        <script type="text/javascript" src="template/web/js/jquery.min.js" ></script>
        <style>

        </style>
    </head>
    <body>
        <div class=" single_top">
            <div class="single_grid">
                <div class="grid images_3_of_2">
                    <ul id="etalage">
                        <li>
                            <img class="etalage_thumb_image img-responsive" src='<c:url value="images/${products.thumbnail}"></c:url>' />
                            <img style="display: none" class="etalage_source_image img-responsive" src='<c:url value="images/${products.thumbnail}"></c:url>'/>
                            </li>
                        </ul>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="desc1 span_3_of_2">


                        <h4>${products.title}</h4>
                    <div class="cart-b">
                        <div class="left-n ">$${products.price}</div>
                        <a id="purchase" class="now-get get-cart-in" href="#" style="<c:if test="${products.amount == 0}">pointer-events: none; opacity: 0.4;</c:if>" >
                                ADD TO CART
                            </a>
                            <div class="clearfix"></div>
                        </div>
                        <h6  id="amountProduct"
                            style="<c:if test="${products.amount == 0}">color: red; background: #ffd0d0;</c:if><c:if test="${products.amount > 0}">color: black; background: #c3cdff;</c:if> padding-top: 10px; padding-bottom: 10px; padding-left: 10px;">
                            <span>${products.amount}</span> items in stock
                    </h6>
                    <p>
                        ${products.shortDescription}
                    </p>
                    <div class="share">
                        <h5>Share Product :</h5>
                        <ul class="share_nav">
                            <li><a href="#"><img src="images/facebook.png" title="facebook"></a></li>
                            <li><a href="#"><img src="images/twitter.png" title="Twiiter"></a></li>
                            <li><a href="#"><img src="images/rss.png" title="Rss"></a></li>
                            <li><a href="#"><img src="images/gpluse.png" title="Google+"></a></li>
                        </ul>
                    </div>


                </div>
                <div class="clearfix"> </div>
            </div>
            <ul id="flexiselDemo1">
                <c:forEach var="product" items="${products.listResult}" varStatus="indexProduct" >
                    <li>
                        <img src='<c:url value="/images/${product.thumbnail}"></c:url>' />
                            <div class="grid-flex">
                                <a href='<c:url value="/san-pham?idproduct=${product.id}"></c:url>' >
                                ${categories.name}
                            </a>
                            <p>Rs ${product.price}</p>
                        </div>
                    </li>
                </c:forEach>

            </ul>
            <script type="text/javascript">
                $(window).load(function () {
                    $("#flexiselDemo1").flexisel({
                        visibleItems: 5,
                        animationSpeed: 1000,
                        autoPlay: true,
                        autoPlaySpeed: 3000,
                        pauseOnHover: true,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: {
                            portrait: {
                                changePoint: 480,
                                visibleItems: 1
                            },
                            landscape: {
                                changePoint: 640,
                                visibleItems: 2
                            },
                            tablet: {
                                changePoint: 768,
                                visibleItems: 3
                            }
                        }
                    });

                });
            </script>
            <script type="text/javascript" src='<c:url value="/template/web/js/jquery.flexisel.js"></c:url>'></script>

                <div class="toogle">
                    <h3 class="m_3">Product Details</h3>
                    <p class="m_text">
                    ${products.content}
                </p>
            </div>
        </div>
        <form style="display: none; visibility: hidden" method="post" action="#" id="submitPurchase">
            <input name="productId" id="productId" value="${products.id}" />
            <c:if test="${not empty USERMODEL}">
                <input name="userId" id="userId" value="${USERMODEL.id}" />
            </c:if>
            <input name="isPurchase" id="isPurchase" value="plus" />
            <input type="submit" value="Submit" />
        </form>
            
        <!-- /.container -->

        <script>
                $(document).ready(function () {
                    $("a#purchase").unbind("click").on("click", function (event) {
                        event.preventDefault();
                        //$("form#submitPurchase").submit();
                        $.ajax({
                            url: '${APIurl}',
                            type: 'POST',
                            data: {
                                productId: $("input#productId").val(),
                                userId: $("input#userId").val(),
                                isPurchase: $("input#isPurchase").val()
                            },
                            success: function (data) {
                                $("#amountProduct span").html(data.amountOfProduct);
                                $("#amountProduct").attr("style", ($("#amountProduct span").text() == "0" ? "color: red; background: #ffd0d0;" : "color: black; background: #c3cdff;") + " padding-top: 10px; padding-bottom: 10px; padding-left: 10px;");
                                $("a#purchase").attr("style",$("#amountProduct span").text() == "0" ? "pointer-events: none; opacity: 0.4;" : "");
                                $("span#amountKindOfCart").html(data.amountKindOfCart);
                                $("span#amountKindOfCart").attr("style", $("span#amountKindOfCart").text() == "0" ? "display: none" : "color: white; background: none; background-color: #007bff; padding-left: .6em; padding-right: .6em; border-radius: 10rem");
                            }
                        });
                    });
                });
        </script>
    </body>
</html>

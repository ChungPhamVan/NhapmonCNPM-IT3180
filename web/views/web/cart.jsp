<%-- 
    Document   : cart
    Created on : Nov 19, 2019, 8:10:15 AM
    Author     : HDN
--%>

<%@include file="/common/taglib.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:url var="APIurl" value="/san-pham" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.js" />
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" />
        <script type="text/javascript" src="template/web/js/jquery.min.js" ></script>
    </head>
    <body>
        <div class="container account_grid" style="padding-right: 0px; padding-left: 0px;">
            <c:if test="${empty productsOfCart || productsOfCart.listResult.size() == 0}">
                <h2 class="text-center">Nothing in the basket</h2>
            </c:if>
            <c:if test="${not empty productsOfCart.listResult || productsOfCart.listResult.size() >0}">
                <div class="basket">
                    <div class="basket-holder">
                        <div class="basket-header">
                            <div class="row">
                                <div class="col-5">Product</div>
                                <div class="col-2">Price</div>
                                <div class="col-2">Quantity</div>
                                <div class="col-2">Total</div>
                                <div class="col-1 text-center">Remove</div>
                            </div>
                        </div>
                        <div class="basket-body">
                            <c:forEach var="item" items="${productsOfCart.listResult}">
                                <div class="item" data-productid="${item.id}" <c:if test="${not empty USERMODEL}">data-userid="${USERMODEL.id}"</c:if>>
                                        <div class="row d-flex align-items-center">
                                            <div class="col-5">
                                                <div class="d-flex align-items-center"><img src='<c:url value="/images/${item.thumbnail}"></c:url>' alt="..." class="img-fluid">
                                                    <div class="title">
                                                        <a href='<c:url value="/san-pham?idproduct=${item.id}"></c:url>'>
                                                            <h5>
                                                            ${item.title}
                                                        </h5>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <span>
                                                <span>$</span>
                                                <span id="priceProduct">
                                                    ${item.price}
                                                </span>
                                                <span>.00</span>
                                            </span>
                                        </div>
                                        <div class="col-2">
                                            <div class="d-flex align-items-center">
                                                <div class="quantity d-flex align-items-center">
                                                    <div class="dec-btn">-</div>
                                                    <input id="amountProduct" type="text" value="${item.amount}" class="quantity-no" disabled style="cursor: no-drop;">
                                                    <div class="inc-btn">+</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <span>
                                                <span>$</span>
                                                <span id="totalProduct">
                                                    ${item.amount * item.price}
                                                </span>
                                                <span>.00</span>
                                            </span>
                                        </div>
                                        <div class="col-1 text-center">
                                            <img id="close" style="max-height: 20px; max-width: 20px; cursor: pointer;" src='<c:url value="/images/close-png-image-1.png"></c:url>' >
                                            </div>
                                        </div>
                                    </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="CTAs d-flex align-items-center justify-content-center justify-content-md-end flex-column flex-md-row">
                    <a href='<c:url value="/trang-chu"></c:url>' class="btn btn-template-outlined wide">
                            Continue Shopping
                        </a>
                        <a href='<c:url value="/trang-chu?contact=contact"></c:url>' class="btn btn-template wide">
                            Payment Cart |
                            <span>$</span>
                            <span id="payment">${totalPrice}</span>
                            <span>.00</span>
                        </a>
                    </div>
            </c:if>

        </div>
        <script>
            $(document).ready(function () {
                $("img#close").unbind("click").on("click", function () {
                    var productId = $(this).closest("div.item").data("productid");
                    var userId = $(this).closest("div.item").data("userid");
                    var amountRemove = $(this).closest("div.item").find("input#amountProduct").val();
                    $.ajax({
                        url: '${APIurl}',
                        type: 'POST',
                        data: {
                            productId: productId,
                            userId: userId,
                            amountRemove: amountRemove,
                            isPurchase: "remove"
                        },
                        success: function (data) {
                            $("span#amountKindOfCart").html(data.amountKindOfCart);
                            $("span#amountKindOfCart").attr("style", $("span#amountKindOfCart").text() == "0" ? "display: none" : "color: white; background: none; background-color: #007bff; padding-left: .6em; padding-right: .6em; border-radius: 10rem");
                        }
                    });
                    var totalPrice = +$("#payment").text().trim();
                    var decreasingly = amountRemove * (+($(this).closest("div.item").find("#priceProduct").text().trim()));
                    $("span#payment").text(totalPrice - decreasingly);
                    $(this).closest("div.item").remove();
                    if ($("div.basket-body").html().trim() == "") {
                        $("div.container.account_grid").html("<h2 class='text-center'>Nothing in the basket</h2>");
                    }
                });
                $("div.inc-btn").unbind("click").on("click", function (event) {
                    var productId = $(this).closest("div.item").data("productid");
                    var userId = $(this).closest("div.item").data("userid");
                    $.ajax({
                        url: '${APIurl}',
                        type: 'POST',
                        data: {
                            productId: productId,
                            userId: userId,
                            isPurchase: "plus"
                        },
                        success: function (data) {
                        }
                    });
                    var amount = +$(this).closest("div.item").find("input#amountProduct").val();
                    var price = +$(this).closest("div.item").find("span#priceProduct").text().trim();
                    $(this).closest("div.item").find("input#amountProduct").val(amount + 1);
                    amount = +$(this).closest("div.item").find("input#amountProduct").val();
                    $(this).closest("div.item").find("span#totalProduct").text(amount * price);
                    $("#payment").text(price + (+$("#payment").text()));
                });
                $("div.dec-btn").unbind("click").on("click", function (event) {
                    var productId = $(this).closest("div.item").data("productid");
                    var userId = $(this).closest("div.item").data("userid");
                    var amount = +$(this).closest("div.item").find("input#amountProduct").val();
                    var price = +$(this).closest("div.item").find("span#priceProduct").text().trim();
                    if (amount > 0) {
                        $.ajax({
                            url: '${APIurl}',
                            type: 'POST',
                            data: {
                                productId: productId,
                                userId: userId,
                                isPurchase: "minus"
                            },
                            success: function (data) {
                                $("#payment").text(+($("#payment").text().trim()) - price);
                                $("span#amountKindOfCart").html(data.amountKindOfCart);
                                $("span#amountKindOfCart").attr("style", $("span#amountKindOfCart").text() == "0" ? "display: none" : "color: white; background: none; background-color: #007bff; padding-left: .6em; padding-right: .6em; border-radius: 10rem");
                            }
                        });
                    }
                    if (amount == 1) {
                        $(this).closest("div.item").remove();
                    } else if (amount > 1) {
                        $(this).closest("div.item").find("input#amountProduct").val(amount - 1);
                        var price = +$(this).closest("div.item").find("span#priceProduct").text().trim();
                        amount = +$(this).closest("div.item").find("input#amountProduct").val();
                        $(this).closest("div.item").find("span#totalProduct").text(amount * price);
                    }
                    if ($("div.basket-body").html().trim() == "") {
                        $("div.container.account_grid").html("<h2 class='text-center'>Nothing in the basket</h2>");
                    }

                });
            });
        </script>
    </body>
</html>

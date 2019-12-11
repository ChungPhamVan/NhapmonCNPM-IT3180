<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="sub-cate">
    <div class=" top-nav rsidebar span_1_of_left">
        <h3 class="cate">CATEGORIES</h3>
        <ul class="menu">
            <li>
                <ul class="kid-menu">
                    <c:forEach var="item" items="${categories.listResult}" varStatus="indexItem">
                        <li>
                            <a href='<c:url value="/san-pham?idcategory=${item.id}"></c:url>' style='<c:if test="${item.id.equals(categories.id) == true}">background: #1DBAA5;</c:if>' >${item.name}</a>
                        </li>
                        </c:forEach>
                </ul>
            </li>
        </ul>
    </div>
    <!--initiate accordion-->
    <script type="text/javascript">
        $(function () {
            var menu_ul = $('.menu > li > ul'),
                    menu_a = $('.menu > li > a');
            menu_ul.hide();
            menu_a.click(function (e) {
                e.preventDefault();
                if (!$(this).hasClass('active')) {
                    menu_a.removeClass('active');
                    menu_ul.filter(':visible').slideUp('normal');
                    $(this).addClass('active').next().stop(true, true).slideDown('normal');
                } else {
                    $(this).removeClass('active');
                    $(this).next().stop(true, true).slideUp('normal');
                }
            });
        });
    </script>
    <c:if test="${not empty listRandomProducts}">
        <c:forEach var="product" items="${listRandomProducts}" varStatus="indexProduct" >
            <c:if test="${(indexProduct.index + 1) < 3}">
                <div class=" chain-grid menu-chain">
                    <a href='<c:url value="/san-pham?idproduct=${product.id}"></c:url>'><img class="img-responsive chain" src='<c:url value="/images/${product.thumbnail}"></c:url>' alt="${product.title}" /></a>	   		     		
                        <div class="grid-chain-bottom chain-watch">
                                <span class="actual dolor-left-grid">${product.price}$</span>
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
                        <h6><a href="#">${product.title}</a></h6>  		     			   		     										
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </c:if>
    <c:if test="${empty listRandomProducts}">
        <c:forEach var="product" items="${products.listResult}" varStatus="indexProduct" >
            <c:if test="${(indexProduct.index + 1) < 3}">
                <div class=" chain-grid menu-chain">
                    <a href='<c:url value="/san-pham?idproduct=${product.id}"></c:url>'><img class="img-responsive chain" src='<c:url value="/images/${product.thumbnail}"></c:url>' alt="${product.title}" /></a>	   		     		
                        <div class="grid-chain-bottom chain-watch">
                                <span class="actual dolor-left-grid">${product.price}$</span>
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
                        <h6><a href="'<c:url value="/san-pham?idproduct=${product.id}"></c:url>'">${product.title}</a></h6>  		     			   		     										
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </c:if>
    <a class="view-all all-product" href="#">VIEW ALL PRODUCTS<span> </span></a> 	
</div>
<%-- 
    Document   : list
    Created on : Nov 21, 2019, 12:45:07 AM
    Author     : HDN
--%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/admin-product" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List products</title>
        <script type="text/javascript" src="<c:url value="/template/paging/jquery.twbsPagination.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/template/paging/jquery.twbsPagination.min.js" />" ></script>
    </head>
    <body>
        <c:if test="${not empty isDelete}">
            <h1 class="text-center">Remove Product</h1>
        </c:if>
        <c:if test="${empty isDelete}">
            <h1 class="text-center">List Products</h1>
        </c:if>

        <form method="get" action="<c:url value="/admin-product" />" id="forSubmitProduct"
              style="width: 100%; display: block;"
              >
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Category Id</th>
                        <th scope="col">Title</th>
                        <th scope="col">Thumbnail</th>
                        <th scope="col">Short Description</th>
                        <th scope="col">Content</th>
                        <th scope="col">Price</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Role</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${model.listResult}" varStatus="indexItem">
                        <tr>
                            <th scope="row">${indexItem.index + 1}</th>
                            <td>${item.categoryId}</td>
                            <td>${item.title}</td>
                            <td>${item.thumbnail}</td>
                            <td>${item.shortDescription}</td>
                            <td>${item.content}</td>
                            <td>
                                ${item.price}
                            </td>
                            <td>
                                ${item.amount}
                            </td>
                            <td>
                                <c:if test="${empty isDelete}">
                                    <a class="btn btn-primary btn-sm" href='<c:url value="/admin-product?type=edit&id=${item.id}" />'>
                                        <i class="fas fa-tools"></i>                                                                
                                    </a>
                                </c:if>
                                <c:if test="${not empty isDelete}">
                                    <input type="hidden" value="${item.id}" id="id" />
                                    <button type="button" class="btn btn-danger btn-sm" id="buttonDelete" >
                                        <i class="fas fa-trash-alt"></i>                                                            
                                    </button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <input type="hidden" value="" id="page" name="page" />
            <input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
            <input type="hidden" value="" id="sortName" name="sortName" />
            <input type="hidden" value="" id="sortBy" name="sortBy" />
            <input type="hidden" value="list" id="type" name="type" />
            <div style="visibility: hidden;">
                <div class="totalPages">${model.totalPage}</div>
                <div class="visiblePages">${model.maxPageItem}</div>
                <div class="currentPage">${model.page}</div>
            </div>
        </form>
        <div style="width: 100%; text-align: center">
            <ul class="pagination" id="pagination"></ul>
        </div>
        <script type="text/javascript" src="<c:url value="/template/admin/js/jquery-2.1.4.min.js" />" ></script>
        <script type="text/javascript">
            var currentPage = $(".currentPage").text();
            var totalPages = $(".totalPages").text();
            var visiblePages = $(".visiblePages").text();
            var limit = 8;
            $(function () {
                window.pagObj = $('#pagination').twbsPagination({
                    totalPages: totalPages,
                    visiblePages: 4,
                    startPage: currentPage,
                    onPageClick: function (event, page) {
                        if (currentPage != page) {
                            $("#page").val(page);
                            $("#maxPageItem").val(limit);
                            $("#sortName").val("title");
                            $("#sortBy").val("asc");
                            $("#forSubmitProduct").submit();
                        }
                    }
                }).on('page', function (event, page) {
                    console.info(page + ' (from event listening)');
                });
            });
            $(document).ready(function () {
                $("button#buttonDelete").unbind("click").on("click", function (event) {
                    $.get("/nhapmoncnpm_IT3180/admin-product?type=listanddelete", {id: $("#id").val()}, function (responseText) {
                        location.reload();
                    });
                });
            });
        </script>
    </body>
</html>

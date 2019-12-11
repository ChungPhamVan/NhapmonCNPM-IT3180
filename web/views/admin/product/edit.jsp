<%-- 
    Document   : edit
    Created on : Nov 30, 2019, 10:53:37 AM
    Author     : HDN
--%>

<%@include file="/common/taglib.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:url var="APIurl" value="/api-admin-product" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
    </head>
    <body>
        <c:if test="${empty model.id}" >
            <h1 class="text-center">Add Product</h1>
        </c:if>
        <c:if test="${not empty model.id}" >
            <h1 class="text-center">Edit Product</h1>
        </c:if>
        <form id="formSubmitProduct" action="#" method="POST" enctype="multipart/form-data" >
            <div class="form-group" style="margin-top: 2em;">
                <label class="col-sm-3 control-label no-padding-right">
                    Thể loại
                </label>
                <div class="col-sm-9">
                    <c:if test="${empty model.categoryCode}" >
                        <select class="form-control" id="categoryCode" name="categoryCode">
                            <option value="">---------- Chọn loại bài viết ----------</option>
                            <c:forEach var="category" items="${categories}" >
                                <option value="${category.code}">${category.name}</option>
                            </c:forEach>
                        </select>
                    </c:if>
                    <c:if test="${not empty model.categoryCode}" >
                        <select class="form-control" id="categoryCode" name="categoryCode">
                            <c:forEach var="category" items="${categories}" >
                                <c:if test="${model.categoryCode == category.code}" >
                                    <option value="${category.code}" selected="selected">${category.name}</option>
                                </c:if>
                                <c:if test="${model.categoryCode != category.code}" >
                                    <option value="${category.code}">${category.name}</option>
                                </c:if>
                            </c:forEach>
                            <option value="">---------- Chọn loại bài viết ----------</option>
                        </select>
                    </c:if>
                </div>
            </div>
            <br />
            <br />
            <div class="form-group" style="margin-top: 2em;">
                <label class="col-sm-3 control-label no-padding-right">
                    Tiêu đề
                </label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="title" name="title" value="${model.title}" placeholder="Nhập tiêu đề" />
                </div>
            </div>
            <br />
            <br />
            <div class="form-group" style="margin-top: 2em;">
                <label class="col-sm-3 control-label no-padding-right">
                    Hình đại diện
                </label>
                <div class="col-sm-9">
                    <input type="file" class="form-control" id="thumbnail" name="thumbnail" />
                </div>
            </div>
            <br />
            <br />
            <div class="form-group" style="margin-top: 2em;">
                <label class="col-sm-3 control-label no-padding-right">
                    Mô tả ngắn
                </label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="shortDescription" name="shortDescription" value="${model.shortDescription}" placeholder="Nhập miêu tả ngắn" />
                </div>
            </div>
            <br />
            <br />
            <div class="form-group" style="margin-top: 2em;">
                <label class="col-sm-3 control-label no-padding-right">
                    Nội dung
                </label>
                <div class="col-sm-9">
<!--                    <input type="texta" class="form-control" id="content" name="content" value="${model.content}" placeholder="Nhập nội dung" />-->
                    <textarea rows="" cols="" id="contentCK" name="content" style="width: 815px; height: 212px;">${model.content}</textarea>
                </div>
            </div>
            <br />
            <br />
            <div class="form-group" style="margin-top: 2em;">
                <label class="col-sm-3 control-label no-padding-right">
                    Giá cả
                </label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="price" name="price" value="${model.price}" placeholder="Nhập giá sản phẩm" />
                </div>
            </div>
            <br />
            <br />
            <div class="form-group" style="margin-top: 2em;">
                <label class="col-sm-3 control-label no-padding-right">
                    Số lượng
                </label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="amount" name="amount" value="${model.amount}" placeholder="Nhập số lượng sản phẩm" />
                </div>
            </div>
            <br />
            <br />
            <div class="form-group" style="margin-top: 2em;">
                <div class="col-sm-12 text-center">
                    <c:if test="${empty model.id}" >
                        <input type="submit" class="btn btn-white btn-primary btn-bold" value="Thêm sản phẩm" id="btnAddOrUpdateProduct" />
                    </c:if>
                    <c:if test="${not empty model.id}" >
                        <input type="hidden" value="${model.id}" id="id" name="id" />
                        <input type="submit" class="btn btn-white btn-primary btn-bold" value="Update sản phẩm" id="btnAddOrUpdateProduct" />
                    </c:if>
                </div>
            </div>
        </form>
        <script type="text/javascript" src="<c:url value="/template/admin/js/jquery-2.1.4.min.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/ckeditor/ckeditor.js" />"></script>
        <script type="text/javascript">
            CKEDITOR.replace("contentCK");
            $(document).ready(function () {
                $("#content").val(CKEDITOR.replace("contentCK").getData());
            });
        </script>
    </body>
</html>


























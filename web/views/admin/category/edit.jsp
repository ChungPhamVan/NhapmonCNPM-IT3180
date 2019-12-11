<%-- 
    Document   : edit
    Created on : Nov 30, 2019, 10:53:37 AM
    Author     : HDN
--%>

<%@include file="/common/taglib.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category</title>
    </head>
    <body>

        <c:if test="${not empty model.id}">
            <h1 class="text-center">Edit Category</h1>
        </c:if>
        <c:if test="${empty model.id}">
            <h1 class="text-center">Add Category</h1>
        </c:if>
        <form id="formSubmitCategory" action="#" method="POST" >

            <c:if test="${not empty model.id}" >
                <div class="form-group" style="margin-top: 2em;">
                    <label class="col-sm-3 control-label no-padding-right">
                        Id
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="id" name="id" value="${model.id}" disabled />
                    </div>
                </div>
                <br />
                <br />
            </c:if>
            <div class="form-group" style="margin-top: 2em;">
                <label class="col-sm-3 control-label no-padding-right">
                    Code
                </label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="code" name="code" value="${model.code}" <c:if test="${not empty model.id}">disabled</c:if> />
                    </div>
                </div>
                <br />
                <br />
                <div class="form-group" style="margin-top: 2em;">
                    <label class="col-sm-3 control-label no-padding-right">
                        Name
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="name" name="name" value="${model.name}" placeholder="Nhập tên" />
                </div>
            </div>
            <br />
            <br />
            <div class="form-group" style="margin-top: 2em;">
                <div class="col-sm-12 text-center">
                    <c:if test="${not empty model.id}" >
                        <input type="hidden" value="${model.id}" id="id" name="id" />
                        <input type="submit" class="btn btn-white btn-primary btn-bold" value="Update category" />
                    </c:if>
                    <c:if test="${empty model.id}" >
                        <input type="submit" class="btn btn-white btn-primary btn-bold" value="Add category" />
                    </c:if>
                </div>
            </div>
        </form>
        <script type="text/javascript" src="<c:url value="/template/admin/js/jquery-2.1.4.min.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/ckeditor/ckeditor.js" />"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>


























<%-- 
    Document   : list
    Created on : Dec 15, 2019, 10:43:25 PM
    Author     : HDN
--%>

<%@include file="/common/taglib.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:url var="APIurl" value="/admin-user" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="text-center">List User</h1>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">First name</th>
                    <th scope="col">Last name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Access</th>
                    <th scope="col">Role</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users.listResult}">
                    <tr data-uid="${user.id}">
                        <th scope="row">${user.id}</th>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.emailAddress}</td>
                        <c:if test="${user.access == 0}">
                            <td id="task" style="color: red; font-weight: bold">
                                NO
                            </td>
                        </c:if>
                        <c:if test="${user.access == 1}">
                            <td id="task" style="color: blue; font-weight: bold">
                                YES
                            </td>
                        </c:if>

                        <td>
                            <c:if test="${user.access == 0}">
                                <button id="addButton" class="btn btn-primary btn-sm">
                                    Cấp quyền
                                </button>
                                <input id="access" value="1" type="hidden" />
                            </c:if>
                            <c:if test="${user.access == 1}">
                                <button id="removeButton" class="btn btn-danger btn-sm">
                                    Xóa quyền
                                </button>
                                <input id="access" value="0" type="hidden" />
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <script type="text/javascript" src="<c:url value="/template/admin/js/jquery-2.1.4.min.js" />" ></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#addButton, #removeButton").unbind("click").on("click", function (event) {
                    var thisButton = $(this);
                    var access = $(this).next().val();
                    var userId = $(this).closest("tr").data("uid");
                    $.ajax({
                        url: '${APIurl}',
                        type: 'POST',
                        data: {
                            access: access,
                            userId: userId,
                        },
                        success: function (data) {
                            if (access == 0) {
                                thisButton.text("Cấp quyền");
                                thisButton.attr("class", "btn btn-primary btn-sm");
                                thisButton.next().val("1");
                                thisButton.closest("tr").find("td#task").text("NO");
                                thisButton.closest("tr").find("td#task").attr("style", "color: red; font-weight: bold");
                            } else if (access == 1) {
                                thisButton.text("Xóa quyền");
                                thisButton.attr("class", "btn btn-danger btn-sm");
                                thisButton.next().val("0");
                                thisButton.closest("tr").find("td#task").text("YES");
                                thisButton.closest("tr").find("td#task").attr("style", "color: blue; font-weight: bold")
                            }
                        }
                    });
                });
            });
        </script>
    </body>
</html>

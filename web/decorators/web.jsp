<%-- 
    Document   : web
    Created on : Nov 12, 2019, 12:55:00 AM
    Author     : HDN
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
    <head>
        <title>Big shope A Ecommerce Category Flat Bootstarp Resposive Website Template | Home :: w3layouts</title>
        
        <link rel="stylesheet" href='<c:url value="/template/web/css/bootstrap.min.css"></c:url>' />
        <link rel="stylesheet" href='<c:url value="/template/web/css/style.default.css"></c:url>' />
        <link rel="stylesheet" href='<c:url value="/template/web/css/font-awesome.min.css"></c:url>' />
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
        <script>
            jQuery(document).ready(function ($) {

                $('#etalage').etalage({
                    thumb_image_width: 300,
                    thumb_image_height: 400,
                    source_image_width: 900,
                    source_image_height: 1200,
                    show_hint: true,
                    click_callback: function (image_anchor, instance_id) {
                        alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                    }
                });

            });
        </script>
        <!--script-->
    </head>
    <body> 
        <!--header-->
        <%@include file="/common/web/header.jsp" %>
        <!---->
        <div class="container">
            <dec:body/>  
            <%@include file="/common/web/menu_left.jsp" %>
            <div class="clearfix"> </div>        	         
        </div>

        <!---->
        <%@include file="/common/web/footer.jsp" %>
    </body>
</html>

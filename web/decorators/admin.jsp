<%-- 
    Document   : admin
    Created on : Nov 11, 2019, 11:14:57 PM
    Author     : HDN
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><dec:title default="Admin" /></title>
        <link href="<c:url value="/template/admin/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" media="all" />
        <link href="<c:url value="/template/admin/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" media="all" />
        <link href="<c:url value="/template/admin/css/bootstrap-duallistbox.min.css" />" rel="stylesheet" type="text/css" media="all" />
        <link href="<c:url value="/template/admin/css/bootstrap-multiselect.min.css" />" rel="stylesheet" type="text/css" media="all" />
        <link href="<c:url value="/template/admin/css/select2.min.css" />" rel="stylesheet" type="text/css" media="all" />
        <link href="<c:url value="/template/admin/css/fonts.googleapis.com.css" />" rel="stylesheet" type="text/css" media="all" />
        <link href="<c:url value="/template/admin/css/ace.min.css" />" rel="stylesheet" type="text/css" media="all" />
        <link href="<c:url value="/template/admin/css/ace-skins.min.css" />" rel="stylesheet" type="text/css" media="all" />
        <link href="<c:url value="/template/admin/css/ace-rtl.min.css" />" rel="stylesheet" type="text/css" media="all" />
        <link href="http://blackrockdigital.github.io/startbootstrap-stylish-portfolio/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <script type="text/javascript" src="<c:url value="/template/admin/js/ace-extra.min.js" />" ></script>
    </head>
    <body class="no-skin">
        <%@include file="/common/admin/header.jsp" %>
        <div class="main-container ace-save-state" id="main-container">
            <script type="text/javascript">
                try {
                    ace.settings.loadState('main-container')
                } catch (e) {
                }
            </script>
            <%@include file="/common/admin/menu.jsp" %>
            <div class="main-content">
                <div class="main-content-inner">
                    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                        <ul class="breadscrumb" style="list-style-type: none;">
                            <li style="float: left">                            
                                <a href="#">
                                    <i class="ace-icon fa fa-home home-icon"></i> 
                                    Home
                                </a>
                            </li>
                            <li style="float: left; margin-left: 2em">
                                <a href='<c:url value="/admin-product?type=edit" />' data-toogle="tooltip">
                                    <i class="ace-icon fas fa-plus-circle"></i>
                                    Add Product
                                </a>
                            </li>
                            <li style="float: left; margin-left: 2em">
                                <a href='<c:url value="/admin-product?type=listanddelete&page=1&maxPageItem=10&sortName=title&sortBy=asc" />' data-toogle="tooltip" id="btnDelete">
                                    <i class="ace-icon far fa-trash-alt"></i>
                                    Remove Product
                                </a>
                            </li>
                            <li style="float: left; margin-left: 2em">
                                <a href='<c:url value="/admin-category?type=edit" />' data-toogle="tooltip">
                                    <i class="ace-icon fas fa-plus-circle"></i>
                                    Add Category
                                </a>
                            </li>
                            <li style="float: left; margin-left: 2em">
                                <a href='<c:url value="/admin-category?type=listanddelete&page=1&maxPageItem=8&sortName=code&sortBy=asc" />' data-toogle="tooltip" id="btnDelete">
                                    <i class="ace-icon far fa-trash-alt"></i>
                                    Remove Category
                                </a>
                            </li>
                        </ul><!-- /.breadcrumb -->

                        <div class="nav-search" id="nav-search">
                            <form class="form-search">
                                <span class="input-icon">
                                    <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                                    <i class="ace-icon fa fa-search nav-search-icon"></i>
                                </span>
                            </form>
                        </div><!-- /.nav-search -->
                    </div>
                    <div class="page-content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <dec:body/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="/common/admin/footer.jsp" %>
            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
            </a>
        </div>


        <script type="text/javascript" src="<c:url value="/template/admin/js/jquery-2.1.4.min.js" />" ></script>
        <script type="text/javascript">
                if ('ontouchstart' in document.documentElement)
                    document.write("<script src='/template/admin/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
        </script>
        <script type="text/javascript" src="<c:url value="/template/admin/js/bootstrap.min.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/template/admin/js/jquery.bootstrap-duallistbox.min.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/template/admin/js/jquery.raty.min.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/template/admin/js/bootstrap-multiselect.min.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/template/admin/js/select2.min.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/template/admin/js/jquery-typeahead.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/template/admin/js/ace-elements.min.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/template/admin/js/ace.min.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/template/paging/jquery.twbsPagination.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/template/paging/jquery.twbsPagination.min.js" />" ></script>

        <!-- inline scripts related to this page -->
        <script type="text/javascript">

                jQuery(function ($) {
                    var demo1 = $('select[name="duallistbox_demo1[]"]').bootstrapDualListbox({infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>'});
                    var container1 = demo1.bootstrapDualListbox('getContainer');
                    container1.find('.btn').addClass('btn-white btn-info btn-bold');

                    /**var setRatingColors = function() {
                     $(this).find('.star-on-png,.star-half-png').addClass('orange2').removeClass('grey');
                     $(this).find('.star-off-png').removeClass('orange2').addClass('grey');
                     }*/
                    $('.rating').raty({
                        'cancel': true,
                        'half': true,
                        'starType': 'i'
                                /**,
                                 
                                 'click': function() {
                                 setRatingColors.call(this);
                                 },
                                 'mouseover': function() {
                                 setRatingColors.call(this);
                                 },
                                 'mouseout': function() {
                                 setRatingColors.call(this);
                                 }*/
                    })//.find('i:not(.star-raty)').addClass('grey');



                    //////////////////
                    //select2
                    $('.select2').css('width', '200px').select2({allowClear: true})
                    $('#select2-multiple-style .btn').on('click', function (e) {
                        var target = $(this).find('input[type=radio]');
                        var which = parseInt(target.val());
                        if (which == 2)
                            $('.select2').addClass('tag-input-style');
                        else
                            $('.select2').removeClass('tag-input-style');
                    });

                    //////////////////
                    $('.multiselect').multiselect({
                        enableFiltering: true,
                        enableHTML: true,
                        buttonClass: 'btn btn-white btn-primary',
                        templates: {
                            button: '<button type="button" class="multiselect dropdown-toggle" data-toggle="dropdown"><span class="multiselect-selected-text"></span> &nbsp;<b class="fa fa-caret-down"></b></button>',
                            ul: '<ul class="multiselect-container dropdown-menu"></ul>',
                            filter: '<li class="multiselect-item filter"><div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input class="form-control multiselect-search" type="text"></div></li>',
                            filterClearBtn: '<span class="input-group-btn"><button class="btn btn-default btn-white btn-grey multiselect-clear-filter" type="button"><i class="fa fa-times-circle red2"></i></button></span>',
                            li: '<li><a tabindex="0"><label></label></a></li>',
                            divider: '<li class="multiselect-item divider"></li>',
                            liGroup: '<li class="multiselect-item multiselect-group"><label></label></li>'
                        }
                    });


                    ///////////////////

                    //typeahead.js
                    //example taken from plugin's page at: https://twitter.github.io/typeahead.js/examples/
                    var substringMatcher = function (strs) {
                        return function findMatches(q, cb) {
                            var matches, substringRegex;

                            // an array that will be populated with substring matches
                            matches = [];

                            // regex used to determine if a string contains the substring `q`
                            substrRegex = new RegExp(q, 'i');

                            // iterate through the pool of strings and for any string that
                            // contains the substring `q`, add it to the `matches` array
                            $.each(strs, function (i, str) {
                                if (substrRegex.test(str)) {
                                    // the typeahead jQuery plugin expects suggestions to a
                                    // JavaScript object, refer to typeahead docs for more info
                                    matches.push({value: str});
                                }
                            });

                            cb(matches);
                        }
                    }

                    $('input.typeahead').typeahead({
                        hint: true,
                        highlight: true,
                        minLength: 1
                    }, {
                        name: 'states',
                        displayKey: 'value',
                        source: substringMatcher(ace.vars['US_STATES']),
                        limit: 10
                    });


                    ///////////////


                    //in ajax mode, remove remaining elements before leaving page
                    $(document).one('ajaxloadstart.page', function (e) {
                        $('[class*=select2]').remove();
                        $('select[name="duallistbox_demo1[]"]').bootstrapDualListbox('destroy');
                        $('.rating').raty('destroy');
                        $('.multiselect').multiselect('destroy');
                    });

                });
        </script>
        <!-- Yandex.Metrika counter -->
        <script type="text/javascript">
            (function (d, w, c) {
                (w[c] = w[c] || []).push(function () {
                    try {
                        w.yaCounter25836836 = new Ya.Metrika({id: 25836836,
                            webvisor: true,
                            clickmap: true,
                            trackLinks: true,
                            accurateTrackBounce: true});
                    } catch (e) {
                    }
                });

                var n = d.getElementsByTagName("script")[0],
                        s = d.createElement("script"),
                        f = function () {
                            n.parentNode.insertBefore(s, n);
                        };
                s.type = "text/javascript";
                s.async = true;
                s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

                if (w.opera == "[object Opera]") {
                    d.addEventListener("DOMContentLoaded", f, false);
                } else {
                    f();
                }
            })(document, window, "yandex_metrika_callbacks");
        </script>
        <noscript><div><img src="//mc.yandex.ru/watch/25836836" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
        <!-- /Yandex.Metrika counter -->
        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-38894584-2', 'auto');
            ga('send', 'pageview');
        </script>
</html>

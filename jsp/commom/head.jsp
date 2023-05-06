<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>游戏管理系统</title>

    <!-- Bootstrap Core CSS -->
    <link href="/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/static/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/static/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/static/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <style>
        .panel-body table {
            margin-bottom: 0px;
        }
    </style>
</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Minecraft游戏管理系统</a>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>${currentUser.name }<i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="/ssm/logout"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-static-side -->
        <div class="navbar-default sidebar col-sm-2" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="/ssm/index">首页</a>
                    </li>
                    <c:if test="${currentUser.auth == 0 }">
                        <li>
                            <a href="/ssm/game/list">模组资源</a>
                        </li>
                        <li>
                            <a href="/ssm/material/list">材质资源</a>
                        </li>
                        <li>
                            <a href="/ssm/light/list">光影资源</a>
                        </li>
                        <li>
                            <a href="/ssm/game/index">上传模组</a>
                        </li>
                        <li>
                            <a href="/ssm/material/index">上传材质</a>
                        </li>
                        <li>
                            <a href="/ssm/light/index">上传光影</a>
                        </li>
                        <li>
                            <a href="/ssm/collect/list">我的收藏</a>
                        </li>
                        <li>
                            <a href="/ssm/user/list">用户信息</a>
                        </li>
                    </c:if>
                    <c:if test="${currentUser.auth == 1 }">
                        <li>
                            <a href="/ssm/game/list">模组资源</a>
                        </li>
                        <li>
                            <a href="/ssm/material/list">材质资源</a>
                        </li>
                        <li>
                            <a href="/ssm/light/list">光影资源</a>
                        </li>
                        <li>
                            <a href="/ssm/game/index">上传模组</a>
                        </li>
                        <li>
                            <a href="/ssm/material/index">上传材质</a>
                        </li>
                        <li>
                            <a href="/ssm/light/index">上传光影</a>
                        </li>
                        <li>
                            <a href="/ssm/collect/list">我的收藏</a>
                        </li>
                    </c:if>
                    <li>
                        <a href="/ssm/user/tutorial">教程指导</a>
                    </li>
                    <li>
                        <a href="/ssm/user/person">个人信息</a>
                    </li>
                    <li>
                        <a href="/ssm/user/chat">讨论平台</a>
                    </li>
                    <li>
                        <a href="/ssm/logout">退出</a>
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
    </nav>
</div>
<!-- jQuery -->
<script src="/static/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/static/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/static/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="/static/vendor/raphael/raphael.min.js"></script>
<script src="/static/vendor/morrisjs/morris.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/static/dist/js/sb-admin-2.js"></script>
<script src="/static/js/common.js"></script>
<script>
    //删除方法
    function confirmx(message, href) {
        if (confirm(message)) {
            window.location.href = href;
        }
        return false;
    }
</script>
</body>

</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>

    <!-- Bootstrap Core CSS -->
    <link href="/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/static/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/static/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        body {

            height: 100%;

            width: 100%;

            overflow: hidden;

            background-size: cover;

        }
    </style>
</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">注册</h3>
                </div>
                <div class="panel-body">
                    <form role="form" action="#" method="post" id="register_form">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="用户名" name="name">
                                <span id="inputName" class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <select class="form-control" placeholder="角色" name="auth" autofocus>
                                    <option value="1">用户</option>
                                    <option value="0">管理员</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="密码" name="password" type="password" value="">
                                <span id="inputPassword" class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="确认密码" name="newPassword" type="password"
                                       value="">
                                <span id="inputNewPassword" class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <input type="number" name="phone" class="form-control" placeholder="联系电话">
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <div class="form-group">
                                <a href="javascript:void(0)" class="btn btn-lg btn-info" style="width:65%;"
                                   onclick='register();'>注册</a>
                                <a href="javascript:void(0)" class="btn btn-lg btn-success" style="width:33%;"
                                   onclick='gotoLogin();'>去登录</a>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="/static/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/static/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/static/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/static/dist/js/sb-admin-2.js"></script>

<script type="text/javascript">
    function register() {
        if (!validate()) {
            return false;
        }
        $.ajax({
            url: "/ssm/doRegister",
            type: "POST",
            data: $("#register_form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    alert("注册成功");
                    window.location.href = "/ssm/login";
                } else {
                    alert(result.msg);
                }
            }
        });
    };

    function validate() {
        var inputName = $("input[name='name']").val();
        var inputPassword = $("input[name='password']").val();
        var inputNewPassword = $("input[name='newPassword']").val();
        if (inputName == '' || inputName == null) {
            alert("请输入用户名！");
            return false;
        }
        if (inputPassword == '' || inputPassword == null) {
            alert("请输入密码！");
            return false;
        }
        if (inputPassword != inputNewPassword) {
            alert("输入的两次密码不同，请重新输入！");
            return false;
        }
        return true;
    }

    function gotoLogin() {
        window.location.href = "/ssm/login";
    };
</script>
</body>
</html>

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
	<style type="text/css">
        #canvas{
            float:right;
            display: inline-block;
            border:1px solid #ccc;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
						<h3 class="panel-title" style="display: inline; width:20%;">登录</h3>
                	</div>
                    <div class="panel-body">
                        <form role="form" method="post" id="login_form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="账号" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="密码" name="password" type="password" value="">
                                </div>
                                <div class="form-group">
									<input class="form-control" placeholder="验证码(不区分大小写)" id="vericode" type="text" style="width:65%;display:inline">
									<canvas id="canvas" width="100" height="32"></canvas>
								</div>
                                <div class="form-group">
                            		<a href="javascript:void(0)" class="btn btn-lg btn-success" style="width:65%;" onclick="login();">登录</a> 
                            		<a href="javascript:void(0)" class="btn btn-lg btn-info" style="width:33%;" onclick="gotoRegister();">去注册</a>
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
    var show_num = [];
	$(function(){
        draw(show_num);
        $("#canvas").on('click',function(){
            draw(show_num);
        })
    })

	function login() {
		if(valiCode()) {
			$.ajax({
   	            url:"/ssm/dologin",
   	            type:"POST",
   	            data:$("#login_form").serialize(),
   	            success:function (result) {
   	                if(result.code == 100){
                   		window.location.href="/ssm/index";
   	                }else {
   	                    alert(result.extendInfo.login_error);
   	                }
   	            }
   	
   	        });	
		}
    };
    
    function valiCode() {
    	var val = $("#vericode").val().toLowerCase();
        var num = show_num.join("");
        if(val==''){
            alert('请输入验证码！');
            return false;
        }else if(val == num){
            $(".input-val").val('');
			return true;
        }else{
            alert('验证码错误！请重新输入！');
            $(".input-val").val('');
            draw(show_num);
            return false;
        }
        return false;
    }
    
    function draw(show_num) {
        var canvas_width=$('#canvas').width();
        var canvas_height=$('#canvas').height();
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度
        
        for (var i = 0; i <= 3; i++) {
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt.toLowerCase();
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 2;//文字在canvas上的y坐标
            context.font = "bold 20px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }

    function randomColor() {//得到随机的颜色值
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }
    
    function gotoRegister() {
        window.location.href= "/ssm/register";
     };
	</script>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理页面</title>
</head>
<body>
<%@ include file="./commom/head.jsp"%>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
	<div id="page-wrapper">
    	<div class="row">
        	<div class="col-lg-12">
            	<h1 class="page-header">用户信息${not empty user.id?'修改':'新增'}</h1>
			</div>
             <!-- /.col-lg-12 -->
		</div>
        <!-- /.row -->
		<div class="row">
         	<div class="col-lg-12">
             	<div class="panel panel-default">
                 	<div class="panel-heading">	
						开发者${not empty user.id?'修改':'新增'}
					</div>
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-lg-12">
                            	<form role="form" action="/ssm/user/save" method="post" enctype="multipart/form-data">
                            		<input class="form-control" type="hidden" name="id" value="${user.id}">
									<input class="form-control" type="hidden" name="auth" value="${user.auth }">
									<input class="form-control" type="hidden" name="flag" value="${flag }">
									<div class="form-group">
										<label for="inputname">账号</label>
										<input name="name" type="text" id="inputname" class="form-control" required="required" value="${user.name}" placeholder="账号"/>
									</div>
									<div class="form-group">
										<label for="inputphone">电话</label>
										<input name="phone" type="text" id="inputphone" class="form-control" required="required" value="${user.phone}" placeholder="电话"/>
									</div>
									<div class="form-group">
										<label for="inputpassword">密码</label>
										<input name="password" type="text" id="inputpassword" class="form-control" required="required" value="${user.password}" placeholder="密码"/>
									</div>
									<button type="submit" class="btn btn-primary">提交</button>
									<c:if test="${empty flag}">
									<a href="/ssm/user/list" class="btn btn-default">返回</a>
									</c:if>
									<c:if test="${!empty flag}">
									<a href="/ssm/user/person" class="btn btn-default">返回</a>
									</c:if>
								</form>
							</div>
                            <!-- /.col-lg-6 (nested) -->
						</div>
                        <!-- /.row (nested) -->
					</div>
                    <!-- /.panel-body -->
				</div>
                <!-- /.panel -->
			</div>
            <!-- /.col-lg-12 -->
		</div>
        <!-- /.row -->
	</div>
	<!-- /#page-wrapper -->
</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>用户管理页面</title>
<style type="text/css">
	.panel-body th{
		width: 15%;
	}
</style>
</head>
<body>
	<%@ include file="./commom/head.jsp"%>
	<!-- 中间会员表格信息展示内容 -->
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">个人信息</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<input class="form-control" style="display: inline; width:20%;visibility:hidden;" value="${user.id }">
							<div class="pull-right">
								<a href="/ssm/user/form?id=${currentUser.id }&flag=true" role="button"
									class="btn btn-primary">修改</a>
							</div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table width="100%"
								class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<tr>
									<th>账号</th>
									<td>${currentUser.name}</td>
									<th>联系电话</th>
									<td>${currentUser.phone}</td>
								</tr>
								<tr>
									<th>角色</th>
									<td>${currentUser.auth==0?'管理员':'普通用户'}</td>
									<th>密码</th>
									<td>${currentUser.password}</td>
								</tr>
							</table>
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
	<!-- /#wrapper -->
</body>
</html>
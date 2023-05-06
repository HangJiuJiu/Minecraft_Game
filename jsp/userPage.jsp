<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户信息</title>
</head>
<body>
<%@ include file="./commom/head.jsp"%>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
	<div id="page-wrapper">
    	<div class="row">
        	<div class="col-lg-12">
                <h1 class="page-header">用户信息</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
        	<div class="col-lg-12">
	            <form action="/ssm/user/list" method="post">
	            	<div class="panel panel-default">
	                	<div class="panel-heading">
							<input name="name" type="text" class="form-control" placeholder="账号" style="display: inline; width:20%;" value="${param.name}"/>
	                    	<div class="pull-right">
		                        <button type="submit" id="userSubmit" class="btn btn-primary btn-sm">查询</button>
		                        <a href="/ssm/user/form?auth=1" role="button" class="btn btn-primary btn-sm">新增用户</a>
		                   	</div>
	                	</div>
						<!-- /.panel-heading -->
	                    <div class="panel-body">
	                    	<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
	                            <thead>
									<tr>
										<th>id</th>
										<th>账号</th>
										<th>电话</th>
										<th>角色</th>
										<th>密码</th>
					                    <th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${datalist}" var="user">
									<tr>
										<td>
											${user.id}
										</td>
										<td>
											${user.name}
										</td>
										<td>
											${user.phone}
										</td>
										<td>
											${user.auth==0?'管理员':'用户'}
										</td>
										<td>
											${user.password}
										</td>
										<td>
						    				<a href="/ssm/user/form?id=${user.id}" role="button" class="btn btn-info">修改</a>
											<a href="/ssm/user/delete?id=${user.id}" role="button" class="btn btn-danger" onclick="return confirmx('确认要删除该用户信息吗？', this.href)">删除</a>
										</td>
									</tr>
								</c:forEach>
	                        	</tbody>
	                    	</table>
	                    </div>
		            </div>
                </form>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
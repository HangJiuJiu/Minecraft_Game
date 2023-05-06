<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>
<%@ include file="./commom/head.jsp"%>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
	<div id="page-wrapper">
    	<div class="row">
        	<div class="col-lg-12">
            	<h1 class="page-header">模组信息审核</h1>
			</div>
             <!-- /.col-lg-12 -->
		</div>
        <!-- /.row -->
		<div class="row">
         	<div class="col-lg-12">
             	<div class="panel panel-default">
                 	<div class="panel-heading">	
						模组信息审核
					</div>
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-lg-12">
                            	<form role="form" action="/ssm/game/updateState" method="post">
                            		<input class="form-control" type="hidden" name="id" value="${game.id}">
									<table width="100%"
										class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<tr>
											<th>模组名称</th>
											<td>${game.name}</td>
										</tr>
										<tr>
											<th>模组类型</th>
											<td>${game.type}</td>
										</tr>
										<tr>
											<th>模组版本</th>
											<td>${game.edition}</td>
										</tr>
										<tr>
											<th>下载链接</th>
											<td>${game.url}</td>
										</tr>
										<tr>
											<th>上传者</th>
											<td>${game.createname}</td>
										</tr>
										<tr>
											<th>上传时间</th>
											<td>${game.createtime}</td>
										</tr>
									</table><br>
									<div class="form-group">
										<label for="inputstate">审核状态</label>
										<select name="state" id="inputstate" class="form-control" required="required" value="${game.state}">
											<option value="1">通过</option>
											<option value="2">驳回</option>
										</select>
									</div>
									<button type="submit" class="btn btn-primary">提交</button>
									<a href="/ssm/game/list" class="btn btn-default">返回</a>
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
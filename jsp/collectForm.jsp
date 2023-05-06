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
            	<h1 class="page-header">我的收藏${not empty collect.id?'修改':'新增'}</h1>
			</div>
             <!-- /.col-lg-12 -->
		</div>
        <!-- /.row -->
		<div class="row">
         	<div class="col-lg-12">
             	<div class="panel panel-default">
                 	<div class="panel-heading">	
						我的收藏${not empty collect.id?'修改':'新增'}
					</div>
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-lg-12">
                            	<form role="form" action="/ssm/collect/save" method="post">
                            		<input class="form-control" type="hidden" name="id" value="${collect.id}">
									<div class="form-group" style="display: none">
										<label for="inputgameid">模组id</label>
										<input name="gameid" type="text" id="inputgameid" class="form-control" required="required" value="${collect.gameid}" placeholder="模组id"/>
									</div>
									<div class="form-group">
										<label for="inputuserid">名称</label>
										<input name="gamename" type="text" id="inputuserid" class="form-control" required="required" value="${collect.gamename}" placeholder="名称"/>
									</div>
									<div class="form-group">
										<label for="inputuserid">下载地址</label>
										<input name="url" type="text" id="inputuserid" class="form-control" required="required" value="${collect.url}" placeholder="下载地址"/>
									</div>
									<div class="form-group">
										<label for="inputuserid">收藏人</label>
										<input name="userid" type="text" id="inputuserid" class="form-control" required="required" value="${collect.userid}" placeholder="收藏人"/>
									</div>
									<div class="form-group">
										<label for="inputtime">收藏时间</label>
										<input name="time" type="text" id="inputtime" class="form-control" required="required" value="${collect.time}" placeholder="收藏时间"/>
									</div>
									<button type="submit" class="btn btn-primary">提交</button>
									<a href="/ssm/collect/list" class="btn btn-default">返回</a>
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
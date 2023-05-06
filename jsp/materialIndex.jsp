<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理信息</title>
</head>
<body>
<%@ include file="./commom/head.jsp" %>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">我的材质</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <form action="/ssm/material/index" method="post">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <select name="edition" type="text" class="form-control" placeholder="材质版本"
                                    style="display: inline; width:20%;" value="${param.edition}">
                                <option value="">请选择材质版本</option>
                                <option value="1.19" ${param.edition == '1.19'?'selected':'' }>1.19</option>
                                <option value="1.18.2" ${param.edition == '1.18.2'?'selected':'' }>1.18.2</option>
                                <option value="1.18.1" ${param.edition == '1.18.1'?'selected':'' }>1.18.1</option>
                                <option value="1.17.1" ${param.edition == '1.17.1'?'selected':'' }>1.17.1</option>
                                <option value="1.16.5" ${param.edition == '1.16.5'?'selected':'' }>1.16.5</option>
                                <option value="1.15.2" ${param.edition == '1.15.2'?'selected':'' }>1.15.2</option>
                                <option value="1.14.4" ${param.edition == '1.14.4'?'selected':'' }>1.14.4</option>
                                <option value="1.13.2" ${param.edition == '1.13.2'?'selected':'' }>1.13.2</option>
                                <option value="1.12.2" ${param.edition == '1.12.2'?'selected':'' }>1.12.2</option>
                                <option value="1.11.2" ${param.edition == '1.11.2'?'selected':'' }>1.11.2</option>
                                <option value="1.10.2" ${param.edition == '1.10.2'?'selected':'' }>1.10.2</option>
                                <option value="1.9.4" ${param.edition == '1.9.4'?'selected':'' }>1.9.4</option>
                                <option value="1.8.9" ${param.edition == '1.8.9'?'selected':'' }>1.8.9</option>
                                <option value="1.7.10" ${param.edition == '1.7.10'?'selected':'' }>1.7.10</option>
                            </select>
                            <select name="type" type="text" class="form-control" placeholder="材质纹理"
                                    style="display: inline; width:20%;" value="${param.type}">
                                <option value="">请选择材质纹理</option>
                                <option value="16x" ${param.type == '16x'?'selected':'' }>16x</option>
                                <option value="32x" ${param.type == '32x'?'selected':'' }>32x</option>
                                <option value="64x" ${param.type == '64x'?'selected':'' }>64x</option>
                                <option value="128x" ${param.type == '128x'?'selected':'' }>128x</option>
                                <option value="256x" ${param.type == '256x'?'selected':'' }>256x</option>
                                <option value="512x" ${param.type == '512x'?'selected':'' }>512x</option>
                            </select>
                            <div class="pull-right">
                                <button type="submit" id="userSubmit" class="btn btn-primary btn-sm">查询</button>
                                <a href="/ssm/material/form" role="button" class="btn btn-primary btn-sm">新增</a>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover"
                                   id="dataTables-example">
                                <thead>
                                <tr>
                                    <th>资源名称</th>
                                    <th>材质版本</th>
                                    <th>材质纹理</th>
                                    <th>下载链接</th>
                                    <th>审核状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${datalist}" var="game">
                                    <tr>
                                        <td>
                                                ${game.name}
                                        </td>
                                        <td>
                                                ${game.edition}
                                        </td>
                                        <td>
                                                ${game.type}
                                        </td>
                                        <td>
                                                ${game.url}
                                        </td>
                                        <td>
                                                ${game.state==2?'驳回':(game.state==1?'通过':'未审核')}
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
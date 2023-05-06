<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的收藏</title>
</head>
<body>
<%@ include file="./commom/head.jsp" %>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">我的收藏</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <form action="/ssm/collect/list" method="post">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <input class="form-control" style="display: inline; width:20%;visibility:hidden;">
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover"
                                   id="dataTables-example">
                                <thead>
                                <tr>
                                    <th>模组名称</th>
                                    <th>下载地址</th>
                                    <th>收藏时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${datalist}" var="collect">
                                    <tr>
                                        <td>
                                                ${collect.gamename}
                                        </td>
                                        <td>

                                            <a href="${collect.url}" target="_blank" style="color: black"
                                               title="点击即可跳转">${collect.url}</a>
                                        </td>
                                        <td>
                                                ${collect.time}
                                        </td>
                                        <td>
                                            <a href="/ssm/collect/delete?id=${collect.id}" role="button"
                                               class="btn btn-danger"
                                               onclick="return confirmx('确认要删除该我的收藏吗？', this.href)">取消收藏</a>
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
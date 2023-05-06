<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理页面</title>
</head>
<body>
<%@ include file="./commom/head.jsp" %>
<!-- 中间会员表格信息展示内容 -->
<div id="wrapper">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">材质信息${not empty game.id?'修改':'新增'}</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        材质信息${not empty game.id?'修改':'新增'}
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="/ssm/material/save" method="post">
                                    <input class="form-control" type="hidden" name="id" value="${game.id}">
                                    <div class="form-group">
                                        <label for="inputname">资源名称</label>
                                        <input name="name" type="text" id="inputname" class="form-control"
                                               required="required" value="${game.name}" placeholder="资源名称"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputedition">材质版本</label>
                                        <select name="edition" type="text" id="inputedition" class="form-control"
                                                required="required" value="${game.edition}" placeholder="模组版本">
                                            <option value="">请选择材质版本</option>
                                            <option value="1.19" ${game.edition == '1.19'?'selected':'' }>1.19
                                            </option>
                                            <option value="1.18.2" ${game.edition == '1.18.2'?'selected':'' }>1.18.2
                                            </option>
                                            <option value="1.18.1" ${game.edition == '1.18.1'?'selected':'' }>1.18.1
                                            </option>
                                            <option value="1.17.1" ${game.edition == '1.17.1'?'selected':'' }>1.17.1
                                            </option>
                                            <option value="1.16.5" ${game.edition == '1.16.5'?'selected':'' }>1.16.5
                                            </option>
                                            <option value="1.15.2" ${game.edition == '1.15.2'?'selected':'' }>1.15.2
                                            </option>
                                            <option value="1.14.4" ${game.edition == '1.14.4'?'selected':'' }>1.14.4
                                            </option>
                                            <option value="1.13.2" ${game.edition == '1.13.2'?'selected':'' }>1.13.2
                                            </option>
                                            <option value="1.12.2" ${game.edition == '1.12.2'?'selected':'' }>1.12.2
                                            </option>
                                            <option value="1.11.2" ${game.edition == '1.11.2'?'selected':'' }>1.11.2
                                            </option>
                                            <option value="1.10.2" ${game.edition == '1.10.2'?'selected':'' }>1.10.2
                                            </option>
                                            <option value="1.9.4" ${game.edition == '1.9.4'?'selected':'' }>1.9.4
                                            </option>
                                            <option value="1.8.9" ${game.edition == '1.8.9'?'selected':'' }>1.8.9
                                            </option>
                                            <option value="1.7.10" ${game.edition == '1.7.10'?'selected':'' }>1.7.10
                                            </option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputtype">材质纹理</label>
                                        <select name="type" type="text" id="inputtype" class="form-control"
                                                required="required" value="${game.type}" placeholder="材质纹理">
                                            <option value="">请选择材质纹理</option>
                                            <option value="16x" ${param.type == '16x'?'selected':'' }>16x</option>
                                            <option value="32x" ${param.type == '32x'?'selected':'' }>32x</option>
                                            <option value="64x" ${param.type == '64x'?'selected':'' }>64x</option>
                                            <option value="128x" ${param.type == '128x'?'selected':'' }>128x</option>
                                            <option value="256x" ${param.type == '256x'?'selected':'' }>256x</option>
                                            <option value="512x" ${param.type == '512x'?'selected':'' }>512x</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputurl">下载链接</label>
                                        <input name="url" type="text" id="inputurl" class="form-control"
                                               required="required" value="${game.url}" placeholder="下载链接"/>
                                    </div>
                                    <button type="submit" class="btn btn-primary">提交</button>
                                    <a href="/ssm/material/list" class="btn btn-default">返回</a>
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
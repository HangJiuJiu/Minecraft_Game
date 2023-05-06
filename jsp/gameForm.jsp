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
                <h1 class="page-header">模组信息${not empty game.id?'修改':'新增'}</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        模组信息${not empty game.id?'修改':'新增'}
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" action="/ssm/game/save" method="post">
                                    <input class="form-control" type="hidden" name="id" value="${game.id}">
                                    <div class="form-group">
                                        <label for="inputname">模组名称</label>
                                        <input name="name" type="text" id="inputname" class="form-control"
                                               required="required" value="${game.name}" placeholder="模组名称"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputedition">模组版本</label>
                                        <select name="edition" type="text" id="inputedition" class="form-control"
                                                required="required" value="${game.edition}" placeholder="模组版本">
                                            <option value="">请选择模组版本</option>
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
                                        <label for="inputtype">模组类型</label>
                                        <select name="type" type="text" id="inputtype" class="form-control"
                                                required="required" value="${game.type}" placeholder="模组类型">
                                            <option value="">请选择模组类型</option>
                                            <option value="魔法" ${game.type == '魔法'?'selected':'' }>魔法</option>
                                            <option value="科技" ${game.type == '科技'?'selected':'' }>科技</option>
                                            <option value="冒险" ${game.type == '冒险'?'selected':'' }>冒险</option>
                                            <option value="实用" ${game.type == '实用'?'selected':'' }>实用</option>
                                            <option value="农业" ${game.type == '农业'?'selected':'' }>农业</option>
                                            <option value="装饰" ${game.type == '装饰'?'selected':'' }>装饰</option>
                                            <option value="魔改" ${game.type == '魔改'?'selected':'' }>魔改</option>
                                            <option value="辅助" ${game.type == '辅助'?'selected':'' }>辅助</option>
                                            <option value="LIB" ${game.type == 'LIB'?'selected':'' }>LIB</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputurl">下载链接</label>
                                        <input name="url" type="text" id="inputurl" class="form-control"
                                               required="required" value="${game.url}" placeholder="下载链接"/>
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
<%@ page import="com.ssm.bean.GameVo" %>
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
                <h1 class="page-header">光影信息</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <form action="/ssm/light/list" method="post">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <select name="edition" type="text" class="form-control" placeholder="光影版本"
                                    style="display: inline; width:20%;" value="${param.edition}">
                                <option value="">请选择光影版本</option>
                                <option value="版本通用" ${param.edition == '版本通用'?'selected':'' }>版本通用</option>
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
                            <select name="type" type="text" class="form-control" placeholder="光影配置"
                                    style="display: inline; width:20%;" value="${param.type}">
                                <option value="">请选择光影配置</option>
                                <option value="低" ${game.type == '低'?'selected':'' }>低</option>
                                <option value="中" ${game.type == '中'?'selected':'' }>中</option>
                                <option value="高" ${game.type == '高'?'selected':'' }>高</option>
                                <option value="极高" ${game.type == '极高'?'selected':'' }>极高</option>
                            </select>
                            <input name="name" class="form-control" placeholder="光影名称"
                                   style="display: inline; width:20%;" value="${param.name}">
                            <div class="pull-right">
                                <button type="submit" id="userSubmit" class="btn btn-primary btn-sm">查询</button>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover"
                                   id="dataTables-example">
                                <thead>
                                <tr>
                                    <th>光影名称</th>
                                    <th>模组版本</th>
                                    <th>光影配置</th>
                                    <th>下载链接(附介绍)</th>
                                    <th>审核状态</th>
                                    <th>收藏</th>
                                    <c:if test="${currentUser.auth == 0 }">
                                        <th>操作</th>
                                    </c:if>
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
                                            <a href="${game.url}" target="_blank" style="color: black"
                                               title="点击即可跳转">${game.url}</a>
                                        </td>
                                        <c:if test="${currentUser.auth == 1 }">
                                            <td>
                                                    ${game.state==2?'驳回':(game.state==1?'通过':'未审核')}
                                            </td>
                                        </c:if>
                                        <c:if test="${currentUser.auth == 0 }">
                                            <td>
                                                <c:if test="${empty game.state }">
                                                    <a href="/ssm/light/view?id=${game.id}" role="button"
                                                       class="btn btn-success">审核</a>
                                                </c:if>
                                                <c:if test="${!empty game.state }">
                                                    ${game.state==1?'通过':'驳回'}
                                                </c:if>
                                            </td>
                                        </c:if>
                                        <td>
                                            <a href="/ssm/collect/save?gameid=${game.id}&gamename=${game.name}&url=${game.url}"
                                               role="button" class="btn btn-warning">收藏</a>
                                        </td>
                                        <c:if test="${currentUser.auth == 0 }">
                                            <td>
                                                <a href="/ssm/light/form?id=${game.id}" role="button"
                                                   class="btn btn-info">修改</a>
                                                <a href="/ssm/light/delete?id=${game.id}" role="button"
                                                   class="btn btn-danger"
                                                   onclick="return confirmx('确认要删除该管理信息吗？', this.href)">删除</a>
                                            </td>
                                        </c:if>
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
        <nav aria-label="...">
            <%
                GameVo pageParam = (GameVo) request.getAttribute("param");
                int pageCount = (int) request.getAttribute("pages");
                String firstShow = "";
                String lastShow = "";
                boolean firstLabel = true;
                boolean lastLabel = true;
                if (pageParam.getPageNo() == 1) {
                    firstShow = "disabled";
                    firstLabel = false;
                }
                if (pageParam.getPageNo() == pageCount) {
                    lastShow = "disabled";
                    lastLabel = false;
                }
            %>
            <ul class="pager">
                <li class="<%=firstShow%>">

                    <c:if test="<%=firstLabel%>">
                        <a href="/ssm/light/list?pageNo=<%=pageParam.getPageNo()-1%>">上一页</a>
                    </c:if>
                    <c:if test="<%=!firstLabel%>">
                        <span href="/ssm/light/list?pageNo=<%=pageParam.getPageNo()-1%>">上一页</span>
                    </c:if>
                </li>
                <li>当前第${param.pageNo==null?"1":param.pageNo}页</li>
                <li class="<%=lastShow%>">
                    <c:if test="<%=lastLabel%>">
                        <a href="/ssm/light/list?pageNo=<%=pageParam.getPageNo()+1%>">下一页</a>
                    </c:if>
                    <c:if test="<%=!lastLabel%>">
                        <span href="/ssm/light/list?pageNo=<%=pageParam.getPageNo()+1%>">下一页</span>
                    </c:if>

                </li>
                <li>共：${pages}页</li>
            </ul>
        </nav>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
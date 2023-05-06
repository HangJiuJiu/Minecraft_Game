<%@ page import="com.ssm.bean.GameVo" %>
<%@ page import="java.util.Objects" %>
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
                <h1 class="page-header">模组信息</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <form action="/ssm/game/list" method="post">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <select name="edition" type="text" class="form-control" placeholder="模组版本"
                                    style="display: inline; width:20%;" value="${param.edition}">
                                <option value="">请选择模组版本</option>
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
                            <select name="type" type="text" class="form-control" placeholder="模组类型"
                                    style="display: inline; width:20%;" value="${param.type}">
                                <option value="">请选择模组类型</option>
                                <option value="魔法" ${param.type == '魔法'?'selected':'' }>魔法</option>
                                <option value="科技" ${param.type == '科技'?'selected':'' }>科技</option>
                                <option value="冒险" ${param.type == '冒险'?'selected':'' }>冒险</option>
                                <option value="实用" ${param.type == '实用'?'selected':'' }>实用</option>
                                <option value="农业" ${param.type == '农业'?'selected':'' }>农业</option>
                                <option value="装饰" ${param.type == '装饰'?'selected':'' }>装饰</option>
                                <option value="魔改" ${param.type == '魔改'?'selected':'' }>魔改</option>
                                <option value="辅助" ${param.type == '辅助'?'selected':'' }>辅助</option>
                                <option value="LIB" ${param.type == 'LIB'?'selected':'' }>LIB</option>
                            </select>
                            <input name="name" class="form-control" placeholder="模组名称"
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

                                    <th>模组名称</th>
                                    <th>模组版本</th>
                                    <th>模组类型</th>
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
                                                    <a href="/ssm/game/view?id=${game.id}" role="button"
                                                       class="btn btn-success">审核</a>
                                                </c:if>
                                                <c:if test="${!empty game.state }">
                                                    ${game.state==1?'通过':'驳回'}
                                                </c:if>
                                            </td>
                                        </c:if>
                                        <td>
                                            <a href="/ssm/collect/save?gameid=${game.id}&gamename=${game.name}&url=${game.url}"
                                               role="button"
                                               class="btn btn-warning">收藏</a>
                                        </td>
                                        <c:if test="${currentUser.auth == 0 }">
                                            <td>
                                                <a href="/ssm/game/form?id=${game.id}" role="button"
                                                   class="btn btn-info">修改</a>
                                                <a href="/ssm/game/delete?id=${game.id}" role="button"
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
                //总结：判断是否有上下页
                GameVo pageParam = (GameVo) request.getAttribute("param");
                int pageCount = (int) request.getAttribute("pages");
                String firstShow = "";
                String lastShow = "";
                //默认情况可以直接点击下一页
                boolean firstLabel = true;
                boolean lastLabel = true;
                //判断是否为第一个
                if (pageParam.getPageNo() == 1) {
                    firstShow = "disabled";
                    firstLabel = false;
                }
                //判断是否为最后一页
                if (pageParam.getPageNo() == pageCount) {
                    lastShow = "disabled";
                    lastLabel = false;
                }
            %>
            <ul class="pager">
                <li class="<%=firstShow%>">
                    <%--如果是第一页显示这个按钮样式--%>
                    <c:if test="<%=firstLabel%>">
                        <%--实现上一页--%>
                        <a href="/ssm/game/list?pageNo=<%=pageParam.getPageNo()-1%>">上一页</a>
                    </c:if>
                    <%--如果不是第一页显示这个按钮样式--%>
                    <c:if test="<%=!firstLabel%>">
                        <span href="/ssm/game/list?pageNo=<%=pageParam.getPageNo()-1%>">上一页</span>
                    </c:if>
                </li>
                <li>当前第${param.pageNo==null?"1":param.pageNo}页</li>
                <li class="<%=lastShow%>">
                    <%--如果是最后一页显示这个按钮样式--%>
                    <%--test="<%=lastLabel%>" lastLabel=false效果就无法实现下一页--%>
                    <c:if test="<%=lastLabel%>">
                        <%--实现下一页--%>
                        <a href="/ssm/game/list?pageNo=<%=pageParam.getPageNo()+1%>">下一页</a>
                    </c:if>
                    <%--如果不是最后一页显示这个按钮样式--%>
                    <c:if test="<%=!lastLabel%>">
                        <span href="/ssm/game/list?pageNo=<%=pageParam.getPageNo()+1%>">下一页</span>
                    </c:if>

                </li>
                <li>共：${pages}页</li>
            </ul>
        </nav>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
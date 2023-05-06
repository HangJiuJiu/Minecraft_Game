<%--
  Created by IntelliJ IDEA.
  User: xyzy9
  Date: 2022/6/18
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教程</title>
    <link href="//unpkg.com/layui@2.6.13/dist/css/layui.css" rel="stylesheet">
</head>
<body>
<%@ include file="./commom/head.jsp" %>
<div class="layui-tab" style="width: 80%;float: right">
    <ul class="layui-tab-title">
        <li class="layui-this">模组</li>
        <li>材质包</li>
        <li>光影包</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <img src="${ctx}/static/image/mod.png"/>
        </div>
        <div class="layui-tab-item">
            <img src="${ctx}/static/image/resourcepacks.png"/>
        </div>
        <div class="layui-tab-item">
            <img src="${ctx}/static/image/shaderpacks.png"/>
        </div>
    </div>
</div>
<script src="//unpkg.com/layui@2.6.13/dist/layui.js"></script>
<script>
    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element;

        //触发事件
        var active = {
            tabAdd: function () {
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项' + (Math.random() * 1000 | 0) //用于演示
                    , content: '内容' + (Math.random() * 1000 | 0)
                    , id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            , tabDelete: function (othis) {
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            , tabChange: function () {
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function () {
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function (elem) {
            location.hash = 'test=' + $(this).attr('lay-id');
        });

    });
</script>
</body>
</html>

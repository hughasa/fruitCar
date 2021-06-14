<%--
  Created by IntelliJ IDEA.
  User: 高龙飞
  Date: 2020/6/28
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/adminjsp/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="/adminjsp/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="/adminjsp/assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="header">

    <div class="dl-title">
        <%--<img src="/adminjsp/assets/img/top.png">--%>
    </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user">${sessionScope.admin.adminname}</span><a href="/tuichuadmin.form" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">系统管理</div></li>

        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script type="text/javascript" src="/adminjsp/assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="/adminjsp/assets/js/bui-min.js"></script>
<script type="text/javascript" src="/adminjsp/assets/js/common/main-min.js"></script>
<script type="text/javascript" src="/adminjsp/assets/js/config-min.js"></script>
<script>
    BUI.use('common/main',function(){
        var config = [{id:'1',menu:[{text:'水果超市管理',items: [
                    {id:'12',text:'水果管理',href:'/alladmingoods.form?type=sp'},
                    {id:'3',text:'积分管理',href:'/alladmingoods.form?type=jf'},
                    {id:'4',text:'活动管理',href:'/alladmingoods.form?type=hd'},
                    {id:'6',text:'订单管理',href:'/alladminorders.form'}
                    ]}
                    ]},];
        new PageUtil.MainPage({
            modulesConfig : config
        });
    });
</script>
</body>
</html>
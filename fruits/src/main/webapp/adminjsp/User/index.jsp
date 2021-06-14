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
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/adminjsp/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="/adminjsp/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="/adminjsp/Css/style.css" />
    <script type="text/javascript" src="/adminjsp/Js/jquery.js"></script>
    <script type="text/javascript" src="/adminjsp/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="/adminjsp/Js/bootstrap.js"></script>
    <script type="text/javascript" src="/adminjsp/Js/ckform.js"></script>
    <script type="text/javascript" src="/adminjsp/Js/common.js"></script>

 

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
    <script type="text/javascript">
        $(function () {
            $("#alladminlikegoodsform").submit(function () {
                var bool=true;
                var rolename=$("#rolename").val();
                if(rolename.trim().length==0){
                    alert("搜索框不能为空！！！");
                    bool=false;
                }
                return bool;
            });
        })
    </script>
</head>
<body>
<form class="form-inline definewidth m20" action="/alladminlikegoods.form" method="post" id="alladminlikegoodsform">
    <input type="hidden" value="hd" name="type"/>
    商品名称：
    <input type="text" name="goodsname" id="rolename" class="abc input-default" placeholder="" value="">&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;
    <a href="${sessionScope.adminurl}1">首页</a>
    <a href="${sessionScope.adminurl}${sessionScope.pageadminIndex-1}">上一页</a>
    <input type="text" id="pageadminIndex" size="2" onblur="fyshu()" value="${sessionScope.pageadminIndex}">
    <a href="${sessionScope.adminurl}${sessionScope.pageadminIndex+1}">下一页</a>
    <a href="${sessionScope.adminurl}${sessionScope.totleadminpage}">尾页</a>
    [${sessionScope.pageadminIndex}/${sessionScope.totleadminpage}]
</form>
<table class="table table-bordered table-hover definewidth m10">
    <c:forEach var="goodsList" items="${sessionScope.goodsadminlistList}" varStatus="varStatus">
        <thead>
        <tr>
            <c:if test="${varStatus.index eq 0}">
                <th colspan="6">水果</th>
            </c:if>
            <c:if test="${varStatus.index eq 1}">
                <th colspan="6">蔬菜</th>
            </c:if>
            <c:if test="${varStatus.index eq 2}">
                <th colspan="6">干果</th>
            </c:if>
            <c:if test="${varStatus.index eq 3}">
                <th colspan="6">其他</th>
            </c:if>
        </tr>
        </thead>
        <thead>
        <tr>
            <th>商品名称</th>
            <th>优惠商品</th>
            <th>优惠后的价格</th>
            <th>优惠开始时间</th>
            <th>优惠结束时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <c:forEach var="goods" items="${goodsList}">
            <tr>
                <td>${goods.goodsname}</td>
                <td>
                    <c:if test="${goods.teambuy eq 1}" var="fol">
                        是
                    </c:if>
                    <c:if test="${!fol}">
                        否
                    </c:if>
                </td>
                <td>
                    <c:if test="${!fol}">
                        无优惠
                    </c:if>
                    <c:if test="${fol}">
                        ${goods.teambuyprice}
                    </c:if>
                </td>
                <td>${goods.begintime}</td>
                <td>${goods.endtime}</td>
                <td>
                    <a href="/updateadmingoods.form?type=hd&goodsid=${goods.goodsid}">发布优惠活动</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="/updateqradmingoods.form?type=hd&goodsid=${goods.goodsid}&teambuy=0">停止优惠活动</a>
                </td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>
</body>
</html>
<script>
    $(function () {
        

		$('#addnew').click(function(){
				window.location.href="add.jsp";
		 });


    });

	function del(id)
	{
		
		
		if(confirm("确定要删除吗？"))
		{
		
			var url = "index.html";
			
			window.location.href=url;		
		
		}
	
	
	
	
	}
</script>
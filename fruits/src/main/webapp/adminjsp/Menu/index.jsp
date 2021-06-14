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
    <link rel="stylesheet" type="text/css" href="/adminjsp/Css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/adminjsp/Css/bootstrap-responsive.css"/>
    <link rel="stylesheet" type="text/css" href="/adminjsp/Css/style.css"/>
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
        function fyshu() {
            var pageorderIndex = $("#pageorderIndex").val();
            var test = /^\d{0,}$/
            if (test.test(pageorderIndex)) {
                location.href = "${sessionScope.orderurl}" + pageorderIndex;
            } else {
                $("#pageorderIndex").val(${sessionScope.pageorderIndex})
                alert("请输入正确的页码！！！")
            }
        }
    </script>
</head>
<body>
<form class="form-inline definewidth m20">
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
    <a href="${sessionScope.orderurl}1">首页</a>
    <a href="${sessionScope.orderurl}${sessionScope.pageorderIndex-1}">上一页</a>
    <input type="text" id="pageorderIndex" size="2" onblur="fyshu()" value="${sessionScope.pageorderIndex}">
    <a href="${sessionScope.orderurl}${sessionScope.pageorderIndex+1}">下一页</a>
    <a href="${sessionScope.orderurl}${sessionScope.totleorderpage}">尾页</a>
    [${sessionScope.pageorderIndex}/${sessionScope.totleorderpage}]
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>订单编号</th>
        <th>下单时间</th>
        <th>订单状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:forEach var="order" items="${sessionScope.ordersList}">
        <tr>
            <td>${order.ordersid}</td>
            <td>${order.orderscreatetime}</td>
            <td>${order.orderstatetype.orderstatetypename}</td>
            <td>
                <c:if test="${order.orderstatetype.orderstatetypeid eq 1}">
                    <a href="/updateadminorders.form?ordersid=${order.ordersid}&orderstatetypeid=2">发货</a>
                </c:if>
                <c:if test="${order.orderstatetype.orderstatetypeid ne 1}">
                    <a href="/oneadminorders.form?ordersid=${order.ordersid}">查看</a>
                </c:if>
                <c:if test="${order.orderstatetype.orderstatetypeid le 3}">
                    <a href="/deleteadminorders.form?ordersid=${order.ordersid}">取消订单</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>

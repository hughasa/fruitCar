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
</head>
<body>
<form action="index.jsp" method="post" class="definewidth m20">
    <input type="hidden" name="id" value="{$menu.id}"/>
    <table class="table table-bordered table-hover m10">
        <tr>
            <td width="10%" class="tableleft">订单详情编号</td>
            <td class="tableleft">商品名称</td>
            <td class="tableleft">商品数量</td>
            <td class="tableleft">商品总价</td>
            <td class="tableleft">订单总价</td>
        </tr>
        <c:forEach var="orderdetail" items="${sessionScope.ordersadmin.orderdetailList}" varStatus="varStatus">
            <tr>
                <td>${orderdetail.orderdetailid}</td>
                <td>${orderdetail.goods.goodsname}</td>
                <td>${orderdetail.orderfruitnum}</td>
                <td>${orderdetail.orderfruitmoney}</td>
                <c:if test="${varStatus.index eq 0}">
                    <c:set var="price" value="0"></c:set>
                    <c:forEach var="orderdetail" items="${sessionScope.ordersadmin.orderdetailList}" varStatus="varStatus">
                        <c:set var="price" value="${orderdetail.orderfruitmoney+price}"></c:set>
                        <c:set var="index" value="${varStatus.index}"></c:set>
                    </c:forEach>
                    <td rowspan="${index+1}" style="text-align: center;">${price}</td>
                </c:if>

            </tr>
        </c:forEach>
        <tr>
            <td colspan="5">
                &nbsp;&nbsp;
                <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script>
    $(function () {
        $('#backid').click(function () {
            window.location.href = "/adminjsp/Menu/index.jsp";
        });

    });
</script>
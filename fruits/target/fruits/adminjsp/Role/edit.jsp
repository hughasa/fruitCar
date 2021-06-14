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
        $(function () {
            var pointbuy = $("#pointbuy").val();
            var option = "";
            if (pointbuy == 1) {
                option += "<option value=\"1\" selected=\"selected\">是</option>"
            } else {
                option += "<option value=\"1\">是</option>"
            }
            if (pointbuy == 0) {
                option += "<option value=\"0\" selected=\"selected\">否</option>"
            } else {
                option += "<option value=\"0\">否</option>"
            }
            $("#point").html(option);
            $("#point").change(function () {
                var point=$("#point").val();
                var goodsprice=$("#goodsprice").html();
                if(point==1){
                    $("#pointbuyprice").val(goodsprice*100);
                }else {
                    $("#pointbuyprice").val(0);
                }
            });
            $("#updateqradmingoodsform").submit(function () {
                var bool=true;
                var point=$("#point").val();
                var test=/^[123456789]\d{0,}$/;
                if(!test.test(point)){
                    alert("积分必须是纯数字正整数!!!")
                    bool=false;
                }
                return bool;
            });
        });
    </script>
</head>
<body>
<form action="/updateqradmingoods.form" method="post" class="definewidth m20" id="updateqradmingoodsform">
    <input type="hidden" name="type" value="jf"/>
    <input type="hidden" name="goodsid" value="${sessionScope.updateadmingoods.goodsid}"/>
    <input type="hidden" value="${sessionScope.updateadmingoods.pointbuy}" id="pointbuy"/>
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">商品名称</td>
            <td>${sessionScope.updateadmingoods.goodsname}</td>
        </tr>
        <tr>
            <td class="tableleft">商品价格</td>
            <td id="goodsprice">${sessionScope.updateadmingoods.goodsprice}</td>
        </tr>
        <tr>
            <td class="tableleft">是否积分购买</td>
            <td>
                <select id="point" name="pointbuy">

                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft">积分购买价格</td>
            <td>
                <input type="text" id="pointbuyprice" name="pointbuyprice" value="${sessionScope.updateadmingoods.pointbuyprice}"/>*建议（价格*100）
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button type="submit" class="btn btn-primary" type="button">确认修改</button>
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
        $(':checkbox[name="group[]"]').click(function () {
            $(':checkbox', $(this).closest('li')).prop('checked', this.checked);
        });

        $('#backid').click(function () {
            window.location.href = "/adminjsp/Role/index.jsp";
        });

    });
</script>
<%--
  Created by IntelliJ IDEA.
  User: 高龙飞
  Date: 2020/6/28
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <script type="text/javascript" src="/adminjsp/laydate/laydate.js"></script>
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
            var teambuy = $("#buy").val();
            var option = "";
            if (teambuy == 1) {
                option += "<option value=\"1\" selected=\"selected\">是</option>"
            } else {
                option += "<option value=\"1\">是</option>"
            }
            if (teambuy == 0) {
                option += "<option value=\"0\" selected=\"selected\">否</option>"
            } else {
                option += "<option value=\"0\">否</option>"
            }
            $("#teambuy").html(option);
            $("#hdform").submit(function () {
                var bool=true;
                var teambuy = $("#teambuy").val();
                var teambuyprice = $("#teambuyprice").val();
                var begintime = $("#begintime").val();
                var endtime = $("#endtime").val();
                var goodsprice = $("#goodsprice").html();
                if(teambuy!="1"){
                    alert("优惠商品必须是（'是'）！！！");
                    bool=false;
                }else {
                    if(parseFloat(goodsprice)<=parseFloat(teambuyprice)){
                        alert("优惠价格必须比实际价格小！！！");
                        bool=false;
                    }else {
                        var date=new Date();
                        var date1=new Date(begintime);
                        var date2=new Date(endtime);
                        if(date.getTime()>=date1.getTime()){
                            alert("开始时间必须比当前时间大！！！");
                            bool=false;
                        }else if(date2.getTime()<=date1.getTime()){
                            alert("结束时间必须比开始时间大！！！");
                            bool=false;
                        }
                    }
                }
                var price = /(^[123456789]\d{0,11}\.\d{0,8}$)|(^[123456789]{1,12}$)/;
                if (!price.test(teambuyprice) | teambuyprice.trim().length == 0) {
                    alert("优惠后的价格不能为空且长度小于20 格式（xxx(1-12).xxx(0-8)|xxx(1-12)数字）！！！");
                    bool = false;
                }else if (begintime.trim().length == 0) {
                    alert("开始时间不能为空！！！");
                    bool = false;
                }else if (endtime.trim().length == 0) {
                    alert("结束时间不能为空！！！");
                    bool = false;
                }
                return bool;
            });
        });
    </script>
</head>
<body>
<form action="/updateqradmingoods.form" method="post" class="definewidth m20" id="hdform">
    <input type="hidden" name="goodsid" value="${sessionScope.updateadmingoods.goodsid}"/>
    <input type="hidden" name="type" value="hd"/>
    <input type="hidden" value="${sessionScope.updateadmingoods.teambuy}" id="buy"/>
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">商品名称</td>
            <td>${sessionScope.updateadmingoods.goodsname}</td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">商品价格</td>
            <td id="goodsprice">${sessionScope.updateadmingoods.goodsprice}</td>
        </tr>
        <tr>
            <td class="tableleft">优惠商品</td>
            <td>
                <select id="teambuy" name="teambuy">

                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft">优惠后的价格</td>
            <td><input type="text" id="teambuyprice" name="teambuyprice" value="${sessionScope.updateadmingoods.teambuyprice}"/></td>
        </tr>
        <tr>
            <td class="tableleft">优惠开始时间</td>
            <td><input type="text" id="begintime" name="begintime"
                       value="${fn:substring(sessionScope.updateadmingoods.begintime,0,19)}"/></td>
        </tr>
        <tr>
            <td class="tableleft">优惠结束时间</td>
            <td>
                <input type="text" id="endtime" name="endtime"
                       value="${fn:substring(sessionScope.updateadmingoods.endtime,0,19)}"/>
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button type="submit" class="btn btn-primary" type="button">确认发布优惠活动</button>
                &nbsp;&nbsp;
                <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $('#backid').click(function () {
            window.location.href = "/adminjsp/User/index.jsp";
        });

    });
    laydate.render({
        elem: '#begintime'
        , type: 'datetime'
    });
    laydate.render({
        elem: '#endtime'
        , type: 'datetime'
    });
</script>
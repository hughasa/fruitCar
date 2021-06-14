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
    <script type="text/javascript" src="/js/distpicker.data.js"></script>
    <script type="text/javascript" src="/js/distpicker.js"></script>
    <script type="text/javascript" src="/js/main.js"></script>
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
            $("#addadmingoodsform").submit(function () {
                var bool = true;
                var goodsname = $("#goodsname").val();
                var goodsprice = $("#goodsprice").val();
                var goodsinfo = $("#goodsinfo").val();
                var filename = $("#filename").val();
                var place = $("#place").val();
                var goodstypeid = $("#goodstypeid").val();
                var price = /(^[123456789]\d{0,11}.\d{0,8}$)|(^[123456789]{1,12}$)/;
                if (goodsname.trim().length == 0 || goodsname.trim().length > 50) {
                    alert("商品名称不能为空且长度小于50！！！");
                    bool = false;
                } else if (!price.test(goodsprice) | goodsprice.trim().length == 0) {
                    alert("商品价格不能为空且长度小于20 格式（xxx(1-12).xxx(0-8)|xxx(1-12)数字）！！！");
                    bool = false;
                } else if (goodsinfo.trim().length == 0 || goodsinfo.trim().length > 100) {
                    alert("商品描述不能为空且长度小于100！！！");
                    bool = false;
                } else if (!adminimg(filename)) {
                    bool = false;
                } else if (place=="") {
                    alert("商品产地不能为空！！！");
                    bool = false;
                }
                return bool;
            });
        });

        function adminimg(filename) {
            var bool=true;
            if (filename.trim().length == 0) {
                alert("商品图片不能为空且格式为（jpg, png, jpeg, gif, psd, pdd, pdf）！！！");
                bool = false;
            } else {
                $.ajaxSettings.async = false;
                $.post("adminimg.form",
                    {"filename": filename},
                    function (data) {
                        if (data == "no") {
                            alert("商品图片不能为空且格式为（jpg, png, jpeg, gif, psd, pdd, pdf）！！！");
                            bool = false;
                        }
                    }, "text");
                $.ajaxSettings.async = true;
            }
            return bool;
        }
    </script>
</head>
<form action="/addadmingoods.form" id="addadmingoodsform" method="post" enctype="multipart/form-data">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">商品名称</td>
            <td><input id="goodsname" type="text" name="goodsname"/></td>
        </tr>
        <tr>
            <td class="tableleft">商品价格</td>
            <td><input id="goodsprice" type="text" name="goodsprice"/></td>
        </tr>
        <tr>
            <td class="tableleft">商品描述</td>
            <td><input id="goodsinfo" type="text" name="goodsinfo"/></td>
        </tr>
        <tr>
            <td class="tableleft">商品图片</td>
            <td>
                <input id="filename" type="file" name="filename"/>
            </td>
        </tr>
        <tr>
            <td class="tableleft">产地</td>
            <td id="distpicker5">
                <select name="place" id="place">
                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft">类别</td>
            <td>
                <select name="goodstypeid" id="goodstypeid">
                    <option value="101">水果</option>
                    <option value="102">蔬菜</option>
                    <option value="103">干果</option>
                    <option value="104">其他</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button type="submit" class="btn btn-primary" type="button">新添商品</button>
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
            window.location.href = "/adminjsp/Node/index.jsp";
        });

    });
</script>
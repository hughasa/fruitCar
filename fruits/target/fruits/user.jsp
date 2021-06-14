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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <link href="css/common.css" rel="stylesheet" type="text/css"/>
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery.min.1.8.2.js" type="text/javascript"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/slide.js"></script>
    <script src="js/common_js.js" type="text/javascript"></script>
    <script src="js/jquery.foucs.js" type="text/javascript"></script>
    <title>用户中心</title>
</head>
<script type="text/javascript">
    $(document).ready(function () {

        setInterval(showTime, 1000);

        function timer(obj, txt) {
            obj.text(txt);
        }

        function showTime() {
            var today = new Date();
            var weekday = new Array(7)
            weekday[0] = "星期日"
            weekday[1] = "星期一"
            weekday[2] = "星期二"
            weekday[3] = "星期三"
            weekday[4] = "星期四"
            weekday[5] = "星期五"
            weekday[6] = "星期六"
            var y = today.getFullYear() + "年";
            var month = today.getMonth() + 1 + "月";
            var td = today.getDate();
            var d = weekday[today.getDay()];
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            timer($("#y"), y + month);
            //timer($("#MH"),month);
            timer($("h1"), td);
            timer($("#D"), d);
            timer($("#H"), h);
            timer($("#M"), m);
            timer($("#S"), s);
        }
    });

    function updateorders(ordersid) {
        if (confirm("是否确认收货？")) {
            window.location = "/updateorders.form?ordersid=" + ordersid + "&orderstatetypeid=3";
        }
    }

    function deleteorders(ordersid) {
        if (confirm("是否删除订单？")) {
            window.location = "/deleteorders.form?ordersid=" + ordersid;
        }
    }

    function plorders(ordersid) {
        if (ordersid == null) {
            var ordersid = $("#ordersid").val();
            var pl = $("#pl").val();
            if (pl.trim().length == 0 || pl.trim().length > 600) {
                alert("评论不能为空且长度1-600字之内！！！");
            } else {
                window.location = "/addcomment.form?ordersid=" + ordersid + "&orderstatetypeid=4&commentcontext=" + pl;
            }
        } else {
            $("#plinput").show();
            $("#ordersid").val(ordersid);
        }
    }

    function qxorders() {
        $("#plinput").hide();
    }
    function orderstateu(ordersta) {
        if(ordersta=="1"){
            $(".order1").show();
            $(".order2").hide();
            $(".order3").hide();
            $(".order4").hide();
            $("#order11").addClass("name");
            $("#order22").removeClass("name");
            $("#order33").removeClass("name");
            $("#order44").removeClass("name");
        }else if(ordersta=="2"){
            $(".order1").hide();
            $(".order2").show();
            $(".order3").hide();
            $(".order4").hide();
            $("#order11").removeClass("name");
            $("#order22").addClass("name");
            $("#order33").removeClass("name");
            $("#order44").removeClass("name");
        }else if(ordersta=="3"){
            $(".order1").hide();
            $(".order2").hide();
            $(".order3").show();
            $(".order4").hide();
            $("#order11").removeClass("name");
            $("#order22").removeClass("name");
            $("#order33").addClass("name");
            $("#order44").removeClass("name");
        }else if(ordersta=="4"){
            $(".order1").show();
            $(".order2").show();
            $(".order3").show();
            $(".order4").show();
            $("#order11").removeClass("name");
            $("#order22").removeClass("name");
            $("#order33").removeClass("name");
            $("#order44").addClass("name");
        }
    }
</script>
<body>
<!--顶部样式-->
<div class="top_header">
    <em class="left_img"></em>
    <div class="header clearfix" id="header">
        <a href="#" class="logo_img"><img src="images/logo.png"/></a>
        <div class="header_Section">
            <div class="shortcut">
                <ul>
                    <c:if test="${empty sessionScope.customer}" var="fol">
                        <li class="hd_menu_tit"><em class="login_img"></em><a href="Login.jsp">登录</a></li>
                    </c:if>
                    <c:if test="${!fol}">
                        <li class="hd_menu_tit"><em class="login_img"></em>${sessionScope.customer.custname}</li>
                    </c:if>
                    <c:if test="${fol}">
                        <li class="hd_menu_tit"><em class="registered_img"></em><a href="registered.jsp">注册</a></li>
                    </c:if>
                    <c:if test="${!fol}">
                        <li class="hd_menu_tit"><em class="registered_img"></em><a href="/tuichucustomer.form">退出</a>
                        </li>
                    </c:if>
                    <li class="hd_menu_tit"><em class="Collect_img"></em><a href="/allcollectionn.form">收藏夹</a></li>
                    <li class="hd_menu_tit"><em class="cart_img"></em><a href="shopping_cart.jsp">购物车（
                        <c:if test="${fol}" var="fol">
                            0
                        </c:if>
                        <c:if test="${!fol}">
                            ${sessionScope.customer.carList.size()}
                        </c:if>
                        ）</a></li>
                    <li class="hd_menu_tit list_name" data-addclass="hd_menu_hover"><a href="#">网站导航</a><em
                            class="navigation_img"></em>

                        <div class="hd_menu_list">
                            <span class="wire"></span>
                            <ul>
                                <li><a href="#">常见问题</a></li>
                                <li><a href="#">在线退换货</a></li>
                                <li><a href="#">在线投诉</a></li>
                                <li><a href="#">配送范围</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="nav" id="Navigation">
                <ul class="Navigation_name">
                    <li class=""><a href="index.jsp">首页</a></li>
                    <li class=""><a href="/allflgoods.form">所有果蔬</a></li>
                    <li class=""><a href="/alltggoods.form">活动专区</a></li>
                    <li class=""><a href="/allfyshuiguogoods.form">水果馆</a></li>
                    <li class=""><a href="/allfygoods.form">素菜馆</a></li>
                    <li class=""><a href="user.jsp">会员中心</a></li>
                    <li class=""><a href="#">联系我们</a></li>
                </ul>
            </div>
            <script>$("#Navigation").slide({titCell: ".Navigation_name li"});</script>
        </div>
    </div>
    <em class="right_img"></em>
</div>
<!---->
<div><a href="#"><img src="images/AD_page_img_02.png" width="100%"/></a></div>
<!--位置-->
<div class="Bread_crumbs">
    <div class="Inside_pages clearfix">
        <div class="right Search">
            <form>
                <input name="" type="text" class="Search_Box"/>
                <input name="" type="button" name="" class="Search_btn"/>
            </form>
        </div>
    </div>
</div>
<!--用户中心-->
<div class="Inside_pages clearfix">
    <div class="clearfix user">
        <div class="user_left">
            <div class="user_info">
                <div class="Head_portrait"><img src="${sessionScope.customer.customerinfo.custpic}" width="80px"
                                                height="80px"/><!--头像区域-->
                </div>
                <div class="user_name">${sessionScope.customer.custname}<a href="user_info.jsp">[个人资料]</a></div>
            </div>
            <ul class="Section">
                <li><a href="user_info.jsp"><em></em><span>个人信息</span></a></li>
                <li><a href="user_Password.jsp"><em></em><span>修改密码</span></a></li>
                <li><a href="user.jsp"><em></em><span>我的订单</span></a></li>
                <li><a href="user_integral.jsp"><em></em><span>我的积分</span></a></li>
                <li><a href="/allcollectionn.form"><em></em><span>我的收藏</span></a></li>
                <li><a href="/alladdress.form"><em></em><span>收货地址管理</span></a></li>
            </ul>
        </div>
        <div class="user_right">
            <div class="user_center_style">
                <div class="user_time">
                    <h1></h1>
                    <h4 id="D"></h4>
                    <h4 id="y"></h4>
                </div>
                <ul class="user_center_info">
                    <li>
                        <img src="images/user_img_05.png"/>
                        <h4 class="Money">余额￥${sessionScope.customer.ye}</h4>
                    </li>
                    <li><img src="images/user_img_04.png"/>
                        <a href="#">代收货（
                            <c:set var="dsh" value="0"></c:set>
                            <c:forEach var="order" items="${sessionScope.customer.ordersList}">
                                <c:if test="${order.orderstatetypeid eq 2}">
                                    <c:set var="dsh" value="${dsh+1}"></c:set>
                                </c:if>
                            </c:forEach>
                            ${dsh}
                            ）</a>
                    </li>
                    <li><img src="images/user_img_06.png"/>
                        <a href="#">积分
                            <c:if test="${empty sessionScope.customer.custpoint}" var="fol">
                                0
                            </c:if>
                            <c:if test="${!fol}">
                                ${sessionScope.customer.custpoint.pointnum}
                            </c:if>
                            分</a>
                    </li>
                    <li><img src="images/user_img_03.png"/>
                        <a href="#">订单评价（0）</a>
                    </li>
                </ul>
            </div>
            <p id="plinput" hidden="hidden">
                <input type="hidden" id="ordersid"/>
                <input type="text" id="pl"/><input type="button" onclick="plorders(null)" value="提交评论"/>
                <input type="button" onclick="qxorders()" value="取消评论"/>
            </p>
            <div class="Order_form">
                <div class="user_Borders">
                    <div class="title_name">
                        <span class="name" onclick="orderstateu('1')" id="order11">待发货</span>
                        <span onclick="orderstateu('2')" id="order22">待收货</span>
                        <span onclick="orderstateu('3')" id="order33">待评价</span>
                        <span onclick="orderstateu('4')" id="order44">所有订单</span>
                    </div>
                    <div class="Order_form_list">
                        <table>
                            <thead>
                            <td class="list_name_title0">商品</td>
                            <td class="list_name_title1">单价(元)</td>
                            <td class="list_name_title2">数量</td>
                            <td class="list_name_title4">实付款(元)</td>
                            <td class="list_name_title5">订单状态</td>
                            <td class="list_name_title6">操作</td>
                            </thead>
                            <c:forEach var="order" items="${sessionScope.customer.ordersList}">
                                <c:if test="${order.orderstatetypeid eq 1}">
                                    <tbody class="order1">
                                    <tr>
                                        <td colspan="6" class="Order_form_time">${order.orderscreatetime}
                                            订单号：${order.ordersid}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <table class="Order_product_style">
                                                <c:forEach var="orderdetail" items="${order.orderdetailList}">
                                                    <tr>
                                                        <td>
                                                            <div class="product_name clearfix">
                                                                <a href="#"><img
                                                                        src="images/${orderdetail.goods.goodspic}"
                                                                        width="80px" height="80px"/></a>
                                                                <a href="#" title="${orderdetail.goods.goodsinfo}"
                                                                   style="display: block;width:200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${orderdetail.goods.goodsinfo}</a>
                                                                <p class="specification">礼盒装20个/盒</p>
                                                            </div>
                                                        </td>
                                                        <td>${orderdetail.goods.goodsprice}</td>
                                                        <td>${orderdetail.orderfruitnum}</td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </td>
                                        <td class="split_line">${order.orderstotalpage}</td>
                                        <td class="split_line">
                                                ${order.orderstatetype.orderstatetypename}
                                        </td>
                                        <td>
                                            <c:if test="${order.orderstatetypeid eq 3}">
                                                <a href="javascript:plorders('${order.ordersid}')">评价商品</a>
                                            </c:if>
                                            <c:if test="${order.orderstatetypeid eq 2}">
                                                <a href="javascript:updateorders('${order.ordersid}')">确认收货</a>
                                            </c:if>
                                            <c:if test="${order.orderstatetypeid le 2}">
                                                <a href="javascript:deleteorders('${order.ordersid}')">取消订单</a>
                                            </c:if>
                                            <c:if test="${order.orderstatetypeid ge 3}">
                                                完成订单
                                            </c:if>
                                        </td>
                                    </tr>
                                    </tbody>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="order" items="${sessionScope.customer.ordersList}">
                                <c:if test="${order.orderstatetypeid eq 2}">
                                    <tbody hidden="hidden" class="order2">
                                    <tr>
                                        <td colspan="6" class="Order_form_time">${order.orderscreatetime}
                                            订单号：${order.ordersid}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <table class="Order_product_style">
                                                <c:forEach var="orderdetail" items="${order.orderdetailList}">
                                                    <tr>
                                                        <td>
                                                            <div class="product_name clearfix">
                                                                <a href="#"><img src="images/${orderdetail.goods.goodspic}" width="80px" height="80px"/></a>
                                                                <a href="#" title="${orderdetail.goods.goodsinfo}"
                                                                   style="display: block;width:200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${orderdetail.goods.goodsinfo}</a>
                                                                <p class="specification">礼盒装20个/盒</p>
                                                            </div>
                                                        </td>
                                                        <td>${orderdetail.goods.goodsprice}</td>
                                                        <td>${orderdetail.orderfruitnum}</td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </td>
                                        <td class="split_line">${order.orderstotalpage}</td>
                                        <td class="split_line">
                                                ${order.orderstatetype.orderstatetypename}
                                        </td>
                                        <td>
                                            <c:if test="${order.orderstatetypeid eq 3}">
                                                <a href="javascript:plorders('${order.ordersid}')">评价商品</a>
                                            </c:if>
                                            <c:if test="${order.orderstatetypeid eq 2}">
                                                <a href="javascript:updateorders('${order.ordersid}')">确认收货</a>
                                            </c:if>
                                            <c:if test="${order.orderstatetypeid le 2}">
                                                <a href="javascript:deleteorders('${order.ordersid}')">取消订单</a>
                                            </c:if>
                                            <c:if test="${order.orderstatetypeid ge 3}">
                                                完成订单
                                            </c:if>
                                        </td>
                                    </tr>
                                    </tbody>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="order" items="${sessionScope.customer.ordersList}">
                                <c:if test="${order.orderstatetypeid eq 3}">
                                    <tbody hidden="hidden" class="order3">
                                    <tr>
                                        <td colspan="6" class="Order_form_time">${order.orderscreatetime}
                                            订单号：${order.ordersid}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <table class="Order_product_style">
                                                <c:forEach var="orderdetail" items="${order.orderdetailList}">
                                                    <tr>
                                                        <td>
                                                            <div class="product_name clearfix">
                                                                <a href="#"><img
                                                                        src="images/${orderdetail.goods.goodspic}"
                                                                        width="80px" height="80px"/></a>
                                                                <a href="#" title="${orderdetail.goods.goodsinfo}"
                                                                   style="display: block;width:200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${orderdetail.goods.goodsinfo}</a>
                                                                <p class="specification">礼盒装20个/盒</p>
                                                            </div>
                                                        </td>
                                                        <td>${orderdetail.goods.goodsprice}</td>
                                                        <td>${orderdetail.orderfruitnum}</td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </td>
                                        <td class="split_line">${order.orderstotalpage}</td>
                                        <td class="split_line">
                                                ${order.orderstatetype.orderstatetypename}
                                        </td>
                                        <td>
                                            <c:if test="${order.orderstatetypeid eq 3}">
                                                <a href="javascript:plorders('${order.ordersid}')">评价商品</a>
                                            </c:if>
                                            <c:if test="${order.orderstatetypeid eq 2}">
                                                <a href="javascript:updateorders('${order.ordersid}')">确认收货</a>
                                            </c:if>
                                            <c:if test="${order.orderstatetypeid le 2}">
                                                <a href="javascript:deleteorders('${order.ordersid}')">取消订单</a>
                                            </c:if>
                                            <c:if test="${order.orderstatetypeid ge 3}">
                                                完成订单
                                            </c:if>
                                        </td>
                                    </tr>
                                    </tbody>
                                </c:if>
                            </c:forEach>
                            <c:forEach var="order" items="${sessionScope.customer.ordersList}">
                                <c:if test="${order.orderstatetypeid eq 4}">
                                    <tbody hidden="hidden" class="order4">
                                    <tr>
                                        <td colspan="6" class="Order_form_time">${order.orderscreatetime}
                                            订单号：${order.ordersid}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <table class="Order_product_style">
                                                <c:forEach var="orderdetail" items="${order.orderdetailList}">
                                                    <tr>
                                                        <td>
                                                            <div class="product_name clearfix">
                                                                <a href="#"><img
                                                                        src="images/${orderdetail.goods.goodspic}"
                                                                        width="80px" height="80px"/></a>
                                                                <a href="#" title="${orderdetail.goods.goodsinfo}"
                                                                   style="display: block;width:200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${orderdetail.goods.goodsinfo}</a>
                                                                <p class="specification">礼盒装20个/盒</p>
                                                            </div>
                                                        </td>
                                                        <td>${orderdetail.goods.goodsprice}</td>
                                                        <td>${orderdetail.orderfruitnum}</td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </td>
                                        <td class="split_line">${order.orderstotalpage}</td>
                                        <td class="split_line">
                                                ${order.orderstatetype.orderstatetypename}
                                        </td>
                                        <td>
                                            <c:if test="${order.orderstatetypeid eq 3}">
                                                <a href="javascript:plorders('${order.ordersid}')">评价商品</a>
                                            </c:if>
                                            <c:if test="${order.orderstatetypeid eq 2}">
                                                <a href="javascript:updateorders('${order.ordersid}')">确认收货</a>
                                            </c:if>
                                            <c:if test="${order.orderstatetypeid le 2}">
                                                <a href="javascript:deleteorders('${order.ordersid}')">取消订单</a>
                                            </c:if>
                                            <c:if test="${order.orderstatetypeid ge 3}">
                                                完成订单
                                            </c:if>
                                        </td>
                                    </tr>
                                    </tbody>
                                </c:if>
                            </c:forEach>
                            <tbody>
                            <tr>
                                <td colspan="6" class="Order_form_time"></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <table class="Order_product_style">
                                        <tr>
                                            <td>

                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="split_line"></td>
                                <td class="split_line">
                                </td>
                                <td>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--底部样式-->
<div class="footer">
    <div class="footer_img_bg"></div>
    <div class="footerbox">
        <div class="footer_info">
            <div class="footer_left">
                <a href="#"><img src="images/logo.png"/></a>
                <p class="erwm">
                    <img src="images/erweim.png" width="80px" height="80px"/>
                    <img src="images/erweim.png" width="80px" height="80px"/>
                <p>
            </div>
            <div class="helper_right clearfix">
                <dl>
                    <dt><em class="guide"></em>新手指南</dt>
                    <dd><a href="#">注册新用户</a></dd>
                    <dd><a href="#">实名认证</a></dd>
                    <dd><a href="#">找回密码</a></dd>
                </dl>
                <dl>
                    <dt><em class="h_about"></em>关于我们</dt>
                    <dd><a href="#">关于我们</a></dd>
                    <dd><a href="#">政策服务</a></dd>
                    <dd><a href="#">常见问题</a></dd>
                </dl>
                <dl>
                    <dt><em class="h_conact"></em>联系我们</dt>
                    <dd><a href="#">联系我们</a></dd>
                    <dd><a href="#">在线客服</a></dd>
                </dl>
            </div>
        </div>
    </div>
    <div class=" Copyright ">
        @2015 四川莆田特色馆版权所有
    </div>
</div>
</body>
</html>

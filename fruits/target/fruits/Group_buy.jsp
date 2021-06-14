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
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
    <![endif]-->
    <title>商品团购</title>
    <script type="text/javascript">
        function loginzunzai() {
            var bool = true;
            $.ajaxSettings.async=false;
            $.post("loginzunzai.form",
                function (data) {
                    if (data == "no") {
                        alert("你还没有登录！！！")
                        bool = false;
                    }
                }, "text");
            $.ajaxSettings.async=true;
            return bool;
        }
        function endtime(endtime1, goodsid) {
            var date = new Date();
            var time = parseInt((endtime1 - date.getTime()) / 1000);
            var dd = parseInt(time / 60 / 60 / 24);
            var hh = parseInt(time / 60 / 60 % 24);
            var mmi = parseInt(time / 60 % 60);
            var ss = parseInt(time % 60);
            var daojishi = "距离结束还有" + dd + "天" + hh + "小时" + mmi + "分" + ss + "秒";
            if (time <= 0) {
               window.location="/updategoodshd.form?goodsid="+goodsid+"&teambuy=0";
            } else {
                $("#endtime" + goodsid).html(daojishi);
                window.setTimeout("endtime('" + endtime1 + "','" + goodsid + "')", 1000);
            }
        }

        $(function () {
            $.post("allajaxtggoods.form",
                function (data) {
                    $(data).each(function () {
                        endtime(this.endtime, this.goodsid);
                    });
                }, "json");
        });
        function fyshu() {
            var pagetgIndex=$("#pagetgIndex").val();
            var test=/^\d{0,}$/
            if(test.test(pagetgIndex)){
                location.href="${sessionScope.urltg}"+pagetgIndex;
            }else {
                $("#pageflIndex").val(${sessionScope.pagetgIndex})
                alert("请输入正确的页码！！！")
            }
        }
        function addcollectionn(goodsid) {
            if(loginzunzai()){
                var goodsid=goodsid;
                $.post("addcollectionn.form",
                    {"goodsid":goodsid},
                    function (data) {
                        if(data=="ok"){
                            alert("该商品收藏成功！！！");
                        }else {
                            alert("该商品已收藏！！！");
                        }
                    },"text");
            }
        }
    </script>
</head>

<body>
<input type="hidden" id="goods" value="${sessionScope.goodstgList}">
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
<div style="background:url(images/group_img.jpg) no-repeat; height:472px; width:100%; background-position:center"></div>
<!--位置-->
<div class="Bread_crumbs">
    <div class="Inside_pages clearfix">
        <div class="left">当前位置：<a href="index.jsp">首页</a>&gt;<a href="/alltggoods.form">活动专区</a>
            <label style="font-size: 16px">
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
                <a href="${sessionScope.urltg}1">首页</a>
                <a href="${sessionScope.urltg}${sessionScope.pagetgIndex-1}">上一页</a>
                <input type="text" id="pagetgIndex" size="2" onblur="fyshu()" value="${sessionScope.pagetgIndex}">
                <a href="${sessionScope.urltg}${sessionScope.pagetgIndex+1}">下一页</a>
                <a href="${sessionScope.urltg}${sessionScope.totletgpage}">尾页</a>
                [${sessionScope.pagetgIndex}/${sessionScope.totletgpage}]
            </label>
        </div>
        <div class="right Search">
            <form action="/alltglikegoods.form" method="post" id="alllikegoods">
                <input name="goodsname" type="text" class="Search_Box"/>
                <input type="button" onclick="$('#alllikegoods').submit()" name="" class="Search_btn"/>
            </form>
        </div>
    </div>
</div>

<!--团购样式-->
<div class="Inside_pages clearfix">
    <div class="Group_buy">
        <div class="Group_title"><em></em>今日团购<span>GROUP-BUYING</span></div>
        <div class="Group_list clearfix">
            <div class="left_Group">
                <c:forEach var="goods" items="${sessionScope.goodstgList}" end="3">
                    <div class="Group_prodcut">
                        <div class="clearfix">
                            <div class="Group_info">
                                <a href="javascript:addcollectionn('${goods.goodsid}')" class="Collect"></a>
                                <ul>
                                    <li class="Group_p_name"><a href="#">${goods.goodsname}</a></li>
                                    <li class="Group_p_about" title="${goods.goodsinfo}"
                                        style="display: block;width:150px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${goods.goodsinfo}</li>
                                    <Li>礼盒装 500g</Li>
                                    <li class="Group_price"><span
                                            class="Current_price"><i>￥</i>${goods.teambuyprice}</span> <span
                                            class="Group_List">原价：${goods.goodsprice}</span></li>
                                    <li class="Group_p_buy">
                                        <span class="Group_Number"><em></em>${goods.goodssales}人购买</span>
                                        <span class="Group_button right"><a href="/onegoods.form?goodsid=${goods.goodsid}" class="buy_button"></a></span>
                                    </li>
                                </ul>
                            </div>
                            <div class="Group_img"><a href="/onegoods.form?goodsid=${goods.goodsid}"><img src="images/${goods.goodspic}" height="195px"
                                                                   width="365px"/></a>
                            </div>
                        </div>
                        <div class="Group_time">
                            <em></em><span id="endtime${goods.goodsid}">${goods.endtime}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!--右侧团购样式-->
            <div class="right_Group">
                <div class="right_Group_p_style">
                    <c:forEach var="goods" items="${sessionScope.goodstgList}" begin="4" end="4">
                        <div class="clearfix">
                            <div class="left_Group_name">
                                <a href="javascript:addcollectionn('${goods.goodsid}')" class="Collect"></a>
                                <ul>
                                    <li class="Group_p_name"><a href="#">${goods.goodsname}</a></li>
                                    <li class="Group_p_about" title="${goods.goodsinfo}"
                                        style="display: block;width:150px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${goods.goodsinfo}</li>
                                    <Li class="spacing">礼盒装 500g</Li>
                                    <li class="Group_price"><span class="Current_price"><i>￥</i>${goods.teambuyprice}</span> <span
                                            class="Group_List">原价：${goods.goodsprice}</span></li>
                                    <li class="Group_p_buy">
                                        <span class="Group_Number"><em></em>${goods.goodssales}人购买</span>
                                        <span class="Group_button right"><a href="/onegoods.form?goodsid=${goods.goodsid}" class="buy_button"></a></span>
                                    </li>
                                </ul>
                            </div>
                            <div class="right_Group_img"><a href=""><img src="images/${goods.goodspic}" height="370" width="365"/></a></div>
                        </div>
                        <div class="Group_time">
                            <em></em><span id="endtime${goods.goodsid}" onload="endtime('${goods.endtime}','${goods.goodsid}')">${goods.endtime}</span>
                        </div>
                    </c:forEach>
                </div>
                <!--团购列表-->
                <div class="other_Group clearfix">
                    <c:forEach var="goods" items="${sessionScope.goodstgList}" begin="5">
                        <div class="g_p_list">
                            <div class="g_p_style">
                                <div class="g_p_img"><a href="#"><img src="images/${goods.goodspic}" height="220" width="274"/></a></div>
                                <ul>
                                    <a href="javascript:addcollectionn('${goods.goodsid}')" class="Collect"></a>
                                    <li><a href="" class="name">${goods.goodsname}</a></li>
                                    <li title="${goods.goodsinfo}"
                                        style="display: block;width:150px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${goods.goodsinfo}</li>
                                    <li class="Group_price"><span class="Current_price"><i>￥</i>${goods.teambuyprice}</span> <span
                                            class="Group_List">原价：${goods.goodsprice}</span></li>
                                    <li class="Group_p_buy">
                                        <span class="Group_Number">${goods.goodssales}人购买</span>
                                        <span class="Group_button right"><a href="/onegoods.form?goodsid=${goods.goodsid}" class="buy_button"></a></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>
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

<%--
Created by IntelliJ IDEA.
User: 高龙飞
Date: 2020/6/28
Time: 11:28
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>产品</title>
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

        function fyshu() {
            var pageflIndex = $("#pageflIndex").val();
            var test = /^\d{0,}$/
            if (test.test(pageflIndex)) {
                location.href = "${sessionScope.urlfl}" + pageflIndex;
            } else {
                $("#pageflIndex").val(${sessionScope.pageflIndex})
                alert("请输入正确的页码！！！")
            }
        }

        function addcar(goodsid) {
            if (loginzunzai()) {
                $.post("addcar.form",
                    {"goodsid": goodsid, "goodsnum": 1},
                    function (data) {
                        alert("该商品添加购物车成功！！！");
                        $("#carnum").html("购物车(" + data + ")");
                    }, "text");
            }
        }

        function addcollectionn(goodsid) {
            if (loginzunzai()) {
                alert(1)
                var goodsid = goodsid;
                $.post("addcollectionn.form",
                    {"goodsid": goodsid},
                    function (data) {
                        if (data == "ok") {
                            alert("该商品收藏成功！！！");
                        } else {
                            alert("该商品已收藏！！！");
                        }
                    }, "text");
            }
        }
    </script>
</head>

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
                    <li class="hd_menu_tit"><em class="cart_img"></em><a href="shopping_cart.jsp" id="carnum">购物车（
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
<div class="AD_img"><a href="#"><img src="images/AD_page_img_02.png" width="100%"/></a></div>
<!--位置-->
<div class="Bread_crumbs">
    <div class="Inside_pages clearfix">
        <div class="left">当前位置：<a href="index.jsp">首页</a>&gt;<a href="/allflgoods.form">所有果蔬</a>
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
                <a href="${sessionScope.urlfl}1">首页</a>
                <a href="${sessionScope.urlfl}${sessionScope.pageflIndex-1}">上一页</a>
                <input type="text" id="pageflIndex" size="2" onblur="fyshu()" value="${sessionScope.pageflIndex}">
                <a href="${sessionScope.urlfl}${sessionScope.pageflIndex+1}">下一页</a>
                <a href="${sessionScope.urlfl}${sessionScope.totleflpage}">尾页</a>
                [${sessionScope.pageflIndex}/${sessionScope.totleflpage}]
            </label>
        </div>
        <div class="right Search">
            <form action="/allfllikegoods.form" method="post" id="alllikegoods">
                <input name="goodsname" type="text" class="Search_Box"/>
                <input type="button" onclick="$('#alllikegoods').submit()" name="" class="Search_btn"/>
            </form>
        </div>
    </div>
</div>
<!--产品-->
<div class="Inside_pages">
    <!--水果馆-->
    <div class="fruits_Forum">
        <div class="title_style">
            <div class="title_name"><a href="/allfyshuiguogoods.form"><img src="images/sg_pro_img_12.png"/></a></div>
            <div class="title_info">
                <p class="title_x_name">[健康水果小知识]</p>
                <p class="x_info">水果是指多汁且大多数有甜味可直接生吃的植物果实，不但含有丰富的营养且能够帮助消化。水果是对部分可以食用的植物果实和种子的统称。水果有降血压、减缓衰老、减肥瘦身、皮肤保养、
                    明目、抗癌、降低胆固醇补充维生素等保健作用。</p>
            </div>
            <div class="title_img"><img src="images/sg_pro_img_17.png"/></div>
        </div>
        <jsp:useBean id="now" class="java.util.Date"/>
        <c:set var="time1"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/></c:set>
        <div class="list_style">
            <ul class="clearfix">
                <c:forEach var="goodsshuguo" items="${sessionScope.goodsflshuguoList}">
                    <li class="clearfix">
                        <div class="product_lists clearfix">
                            <a href="javascript:addcollectionn('${goodsshuguo.goodsid}')" class="Collect"></a>
                            <a href="/onegoods.form?goodsid=${goodsshuguo.goodsid}"><img
                                    src="images/${goodsshuguo.goodspic}" width="207px" height="219px"/></a>
                            <p class="title_p_name">${goodsshuguo.goodsname}</p>
                            <p class="title_Profile" title="${goodsshuguo.goodsinfo}"
                               style="display: block;width:200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${goodsshuguo.goodsinfo}</p>
                            <p class="price"><b>￥</b>
                                <c:if test="${goodsshuguo.teambuy eq 1}" var="fol">
                                    <c:set var="begintime"><fmt:formatDate value="${goodsshuguo.begintime}"
                                                                           pattern="yyyy-MM-dd HH:mm:ss"/></c:set>
                                    <c:if test="${begintime le time1}" var="fol">
                                        优惠价：${goodsshuguo.teambuyprice}
                                    </c:if>
                                </c:if>
                                <c:if test="${!fol}">
                                    ${goodsshuguo.goodsprice}
                                </c:if>
                            </p>
                            <p class="btn_style">
                                <a href="/onegoods.form?goodsid=${goodsshuguo.goodsid}" class="buy_btn"></a>
                                <a href="javascript:addcar('${goodsshuguo.goodsid}','${goodsshuguo.goodstypeid}')"
                                   class="Join_btn"></a>
                            </p>
                        </div>
                    </li>
                </c:forEach>
                <c:if test="${empty sessionScope.goodsflguoshuList}">
                    该类型的水果在该页没有
                </c:if>
            </ul>
        </div>
    </div>
    <!--蔬菜馆-->
    <div class="vegetables_Forum">
        <div class="title_style">
            <div class="title_name"><a href="/allfygoods.form"><img src="images/vegetables_img_40.png"/></a></div>
            <div class="title_info">
                <p class="title_x_name">[健康水果小知识]</p>
                <p class="x_info">水果是指多汁且大多数有甜味可直接生吃的植物果实，不但含有丰富的营养且能够帮助消化。水果是对部分可以食用的植物果实和种子的统称。水果有降血压、减缓衰老、减肥瘦身、皮肤保养、
                    明目、抗癌、降低胆固醇补充维生素等保健作用。</p>
            </div>
            <div class="title_img"><img src="images/title_p_img_32.png"/></div>
        </div>
        <div class="list_style">
            <ul class="clearfix">
                <c:forEach var="goodsguoshu" items="${sessionScope.goodsflguoshuList}">
                    <li class="clearfix">
                        <div class="product_lists clearfix">
                            <a href="javascript:addcollectionn('${goodsguoshu.goodsid}')" class="Collect"></a>
                            <a href="/onegoods.form?goodsid=${goodsguoshu.goodsid}"><img
                                    src="images/${goodsguoshu.goodspic}" width="207px" height="219px"/></a>
                            <p class="title_p_name">${goodsguoshu.goodsname}</p>
                            <p class="title_Profile" title="${goodsguoshu.goodsinfo}"
                               style="display: block;width:200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${goodsguoshu.goodsinfo}</p>
                            <p class="price"><b>￥</b>
                                <c:if test="${goodsguoshu.teambuy eq 1}" var="fol">
                                    <c:set var="begintime1"><fmt:formatDate value="${goodsguoshu.begintime}"
                                                                            pattern="yyyy-MM-dd HH:mm:ss"/></c:set>
                                    <c:if test="${begintime1 le time1}" var="fol">
                                        优惠价：${goodsguoshu.teambuyprice}
                                    </c:if>
                                </c:if>
                                <c:if test="${!fol}">
                                    ${goodsguoshu.goodsprice}
                                </c:if>
                            </p>
                            <p class="btn_style">
                                <a href="/onegoods.form?goodsid=${goodsguoshu.goodsid}" class="buy_btn"></a>
                                <a href="javascript:addcar('${goodsguoshu.goodsid}','${goodsguoshu.goodstypeid}')"
                                   class="Join_btn"></a>
                        </div>
                    </li>
                </c:forEach>
                <c:if test="${empty sessionScope.goodsflguoshuList}">
                    该类型的果蔬在该页没有
                </c:if>
            </ul>
        </div>
    </div>
    <!--其他特色馆-->
    <div class="fruits_Forum">
        <div class="title_style">
            <div class="title_name"><a href="/allfyshuiguogoods.form"><img src="images/sg_pro_img_12.png"/></a></div>
            <div class="title_info">
                <p class="title_x_name">[健康水果小知识]</p>
                <p class="x_info">水果是指多汁且大多数有甜味可直接生吃的植物果实，不但含有丰富的营养且能够帮助消化。水果是对部分可以食用的植物果实和种子的统称。水果有降血压、减缓衰老、减肥瘦身、皮肤保养、
                    明目、抗癌、降低胆固醇补充维生素等保健作用。</p>
            </div>
            <div class="title_img"><img src="images/sg_pro_img_17.png"/></div>
        </div>
        <div class="list_style">
            <ul class="clearfix">
                <c:forEach var="goodsganguo" items="${sessionScope.goodsflganguoList}">
                    <li class="clearfix">
                        <div class="product_lists clearfix">
                            <a href="javascript:addcollectionn('${goodsganguo.goodsid}')" class="Collect"></a>
                            <a href="/onegoods.form?goodsid=${goodsganguo.goodsid}"><img
                                    src="images/${goodsganguo.goodspic}" width="207px" height="219px"/></a>
                            <p class="title_p_name">${goodsganguo.goodsname}</p>
                            <p class="title_Profile" title="${goodsganguo.goodsinfo}"
                               style="display: block;width:200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${goodsganguo.goodsinfo}</p>
                            <p class="price"><b>￥</b>
                                <c:if test="${goodsganguo.teambuy eq 1}" var="fol">
                                    <c:set var="begintime2"><fmt:formatDate value="${goodsganguo.begintime}"
                                                                            pattern="yyyy-MM-dd HH:mm:ss"/></c:set>
                                    <c:if test="${begintime2 le time1}" var="fol">
                                        优惠价：${goodsganguo.teambuyprice}
                                    </c:if>
                                </c:if>
                                <c:if test="${!fol}">
                                    ${goodsganguo.goodsprice}
                                </c:if>
                            </p>
                            <p class="btn_style">
                                <a href="/onegoods.form?goodsid=${goodsganguo.goodsid}" class="buy_btn"></a>
                                <a href="javascript:addcar('${goodsganguo.goodsid}','${goodsganguo.goodstypeid}')"
                                   class="Join_btn"></a>
                            </p>
                        </div>
                    </li>
                </c:forEach>
                <c:if test="${empty sessionScope.goodsflganguoList}">
                    该类型的干果在该页没有
                </c:if>
            </ul>
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

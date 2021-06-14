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
    <script src="http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=402727"></script>
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
    <![endif]-->
    <title>商品详细介绍</title>
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

        function addcar() {
            var goodsid =${sessionScope.goods.goodsid};
            var goodsnum = $("#number").val();
            var test = /^\d{1,}$/;
            if (test.test(goodsnum) && goodsnum != 0) {
                if (loginzunzai()) {
                    $.post("addcar.form",
                        {"goodsid": goodsid, "goodsnum": goodsnum},
                        function (data) {
                            alert("该商品添加购物车成功！！！");
                            $("#carnum").val("购物车(" + data + ")");
                        }, "text");
                }
            } else {
                alert("请输入正确的数量！！！");
            }
        }

        function number(type) {
            if (type == "jian") {
                var number = parseInt($("#number").val()) - 1;
                if (number == 0) {
                    alert("已经减到1了不能在减了！！！")
                } else {
                    $("#number").val(number);
                }
            } else if (type == "text") {
                var test = /^\d{1,}$/;
                var number = $("#number").val();
                if (!test.test(number) || number == 0) {
                    alert("请输入正确的数量不能为0！！！");
                    $("#number").val(1);
                }
            } else {
                var number = parseInt($("#number").val()) + 1;
                $("#number").val(number);
            }
        }

        function addcollectionn() {
            if (loginzunzai()) {
                var goodsid =${sessionScope.goods.goodsid};
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

        function addorder() {
            var goodsid =${sessionScope.goods.goodsid};
            var goodsnum = $("#number").val();
            var test = /^\d{1,}$/;
            if (test.test(goodsnum) && goodsnum != 0 && goodsnum <= 9999) {
                window.location = "/addorder.form?goodsid=" + goodsid + "&goodsnum=" + goodsnum;
            } else if (goodsnum > 9999) {
                alert("不得超过库存（9999）！！！");
            } else {
                alert("请输入正确的数量！！！");
            }
        }

        function fyshu(goodsid) {
            var pagecomIndex = $("#pagecomIndex").val();
            var test = /^\d{0,}$/
            if (test.test(pagecomIndex)) {
                fycom(goodsid, pagecomIndex);
            } else {
                $("#pagecomIndex").val(${sessionScope.pagecomIndex})
                alert("请输入正确的页码！！！")
            }
        }

        function goodsinfo(goodsid) {
            $("#goodsinfo").show();
            $("#fycomment").hide();
            $("#comment").hide();
        }

        function fycom(goodsid, pagecomIndex) {
            if (loginzunzai()) {
                $("#goodsinfo").hide();
                $("#fycomment").show();
                $("#comment").show();
                $.post("allcomment.form",
                    {"goodsid": goodsid, "pagecomIndex": pagecomIndex},
                    function (data) {
                        var pagecomIndex = 0;
                        var totlecompage = 0;
                        var comment = "";
                        $(data).each(function (index) {
                            if (index == 0) {
                                $(this).each(function () {
                                    var date = new Date(this.commenttime);
                                    var date1 = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + "&nbsp;&nbsp;" + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
                                    comment += date1 + "&nbsp;&nbsp;&nbsp;&nbsp;" + this.customer.custname + ":" + this.commentcontext + "<br/>";
                                });
                            } else if (index == 1) {
                                pagecomIndex = this;
                            } else if (index == 2) {
                                totlecompage = this;
                            }
                        });
                        var ajaxfy = "<a href='javascript:fycom(" + goodsid + "," + 1 + ")'>首页</a>" +
                            "<a href='javascript:fycom(" + goodsid + "," + (pagecomIndex - 1) + ")'>上一页</a>" +
                            "<input type='text' id='pagecomIndex' size='2' onblur='fyshu(" + goodsid + ")' value='" + pagecomIndex + "'>" +
                            "<a href='javascript:fycom(" + goodsid + "," + (pagecomIndex + 1) + ")'>下一页</a>" +
                            "<a href='javascript:fycom(" + goodsid + "," + totlecompage + ")'>尾页</a>" +
                            "[" + pagecomIndex + "/" + totlecompage + "]";
                        $("#fycomment").html(ajaxfy);
                        $("#comment").html(comment);
                    }, "json");
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
<div><a href="#"><img src="images/AD_page_img_02.png" width="100%"/></a></div>
<!--位置-->
<div class="Bread_crumbs">
    <div class="Inside_pages clearfix">
        <div class="left">当前位置：<a href="#">首页</a>&gt;<a href="#">素菜馆</a></div>
        <div class="right Search">
            <form>
                <input name="" type="text" class="Search_Box"/>
                <input name="" type="button" name="" class="Search_btn"/>
            </form>
        </div>
    </div>
</div>
<!--商品详细介绍-->
<jsp:useBean id="now" class="java.util.Date"/>
<c:set var="time1"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/></c:set>
<div class="Inside_pages clearfix">
    <div class="left_style">
        <div class="title_img_p"><img src="images/p_vegetables_img.png"/></div>
        <div class="ranking">
            <div class="ranking_title"><span>销量</span>排行</div>
            <ul class="ranking_list">
                <c:forEach var="goods" items="${sessionScope.goodsxlList}" varStatus="varStatus">
                    <li class="">
                        <em class="ranking_label">${varStatus.index+1}</em>
                        <a href="/onegoods.form?goodsid=${goods.goodsid}" class="img"> <img
                                src="images/${goods.goodspic}" width="100px" height="100px"/></a>
                        <p class="ranking_name">${goods.goodsname}</p>
                        <p class="price"><b>￥</b>
                            <c:if test="${goods.teambuy eq 1}" var="fol">
                                <c:set var="begintime"><fmt:formatDate value="${goods.begintime}"
                                                                       pattern="yyyy-MM-dd HH:mm:ss"/></c:set>
                                <c:if test="${begintime le time1}" var="fol">
                                    优惠价：${goods.teambuyprice}
                                </c:if>
                            </c:if>
                            <c:if test="${!fol}">
                                ${goods.goodsprice}
                            </c:if>
                        </p>
                        <p><a href="/onegoods.form?goodsid=${goods.goodsid}">立即查看< </a></p>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <!--详细介绍样式-->
    <div class="right_style">
        <div class="pro_detailed">
            <div class="Details_style clearfix">
                <div class="mod_picfold clearfix">
                    <div class="clearfix" id="detail_main_img">
                        <div class="layout_wrap">
                            <!--相册样式-->
                            <img src="images/${sessionScope.goods.goodspic}" width="430px" height="480px"/>
                        </div>
                    </div>
                    <div class="Sharing">
                        <div class="bdsharebuttonbox right">
                            <a href="#" class="bds_more" data-cmd="more"></a>
                            <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                            <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                            <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                            <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                            <a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
                        </div>
                        <script>
                            window._bd_share_config = {
                                "common": {
                                    "bdSnsKey": {},
                                    "bdText": "",
                                    "bdMini": "2",
                                    "bdMiniList": false,
                                    "bdPic": "",
                                    "bdStyle": "1",
                                    "bdSize": "16"
                                },
                                "share": {},
                                "image": {
                                    "viewList": ["qzone", "weixin", "tsina", "tqq", "renren"],
                                    "viewText": "分享到：",
                                    "viewSize": "16"
                                },
                                "selectShare": {
                                    "bdContainerClass": null,
                                    "bdSelectMiniList": ["qzone", "weixin", "tsina", "tqq", "renren"]
                                }
                            };
                            with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
                        </script>
                        <!--收藏-->
                        <div class="coding">商品编码：${sessionScope.goods.goodsid}</div>
                    </div>
                </div>
                <!--购买信息-->
                <div class="Buying_info">
                    <div class="product_name"><h2>${sessionScope.goods.goodsname}</h2>
                        <span>${sessionScope.goods.goodsname}</span></div>
                    <div class="product_price">
                        <div class="price"><label>商城价：</label>￥
                            <c:if test="${sessionScope.goods.teambuy eq 1}" var="fol">
                                <c:set var="begintime1"><fmt:formatDate value="${sessionScope.goods.begintime}"
                                                                        pattern="yyyy-MM-dd HH:mm:ss"/></c:set>
                                <c:if test="${begintime1 le time1}" var="fol">
                                    优惠价：${sessionScope.goods.teambuyprice}
                                </c:if>
                            </c:if>
                            <c:if test="${!fol}">
                                ${sessionScope.goods.goodsprice}
                            </c:if>
                            <b>元/箱</b></div>
                        <div class="jyScore-fra"><span><em style="width:60px;"></em></span><b>4.5</b><a
                                href="#">共有${sessionScope.comsize}条评论</a></div>
                    </div>
                    <div class="productDL">
                        <dl>
                            <dt>品种：</dt>
                            <dd class="left">
                                <div class="item  selected"><b></b><a href="#none" title="金晕">芹川</a></div>
                                <div class="item"><b></b><a href="#none" title="芹川">芹川</a></div>
                            </dd>
                        </dl>
                        <dl>
                            <dt>包装：</dt>
                            <dd class="left">
                                <div class="item  selected"><b></b><a href="#none" title="小礼盒">小礼盒</a></div>
                                <div class="item"><b></b><a href="#none" title="普通包装">普通包装</a></div>
                                <div class="item"><b></b><a href="#none" title="大礼盒">大礼盒</a></div>
                            </dd>
                        </dl>
                        <dl>
                            <dt>数量：</dt>
                            <dd class="left">
                                <div class="Numbers">
                                    <a href="javascript:number('jian');" class="jian  ">-</a>
                                    <input id="number" type="text" value="1" onblur="number('text')"
                                           class="number_text">
                                    <a href="javascript:number('jia');" class="jia  ">+</a>
                                </div>
                            </dd>
                            <dd class="left Quantity">(库存：${sessionScope.goods.goodsinventory})</dd>
                        </dl>
                    </div>
                    <div class="product_Quantity">销量：${sessionScope.goods.goodssales}</div>
                    <div class="operating">
                        <a href="javascript:addorder()" class="buy_btn"></a>
                        <a href="javascript:addcar()" class="Join_btn"></a>
                        <a href="javascript:addcollectionn()" class="Collect_btn"></a>
                    </div>
                </div>
            </div>
            <!--信息展示-->
            <div class="mainListRight" id="status1">
                <ul class="fixed_bar" style="">
                    <li class="status_on active"><a href="javascript:goodsinfo()">产品介绍</a></li>
                    <li class="status_on"><a
                            href="javascript:fycom('${sessionScope.goods.goodsid}',null)">商品评价<span>(${sessionScope.comsize})</span></a>
                    </li>
                    <li class="status_on"><a href="#">售后服务</a></li>
                    <div class="statusBtn" style="display: none;">
                        <a href="javascript:addToCart_bak(77)" class="statusBtn1" title="加入购物车"></a>
                    </div>
                </ul>
                <div id="status">
                    <p id="goodsinfo" style="font-size: 20px">${sessionScope.goods.goodsinfo}</p>
                    <p id="fycomment" hidden="hidden" style="font-size: 20px">
                    </p>
                    <p id="comment" hidden="hidden" style="font-size: 20px">
                    </p>
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

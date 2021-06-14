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
    <title>购物车</title>
    <script type="text/javascript">
        function jian(carid) {
            var goodsnum=$("#numbersg"+carid).val()-1;
            if(goodsnum==0){
                if(confirm("是否将该商品从购物车删除")){
                    deletecar(carid);
                }
            }else {
                updategoodsnum(carid,goodsnum);
            }
        }
        function jia(carid) {
            var goodsnum=parseInt($("#numbersg"+carid).val())+1;
            if(goodsnum>9999){
                goodsnum=9999;
            }
            updategoodsnum(carid,goodsnum);
        }
        function goodsnum(carid) {
            var goodsnum=parseInt($("#numbersg"+carid).val());
            var test=/^\d{1,}$/;
            if(test.test(goodsnum)&&goodsnum!=0){
                if(goodsnum>9999){
                    goodsnum=9999;
                }
                updategoodsnum(carid,goodsnum);
            }else if(goodsnum==0){
                if(confirm("是否将该商品从购物车删除")){
                    deletecar(carid);
                }else {
                    $.post("onecar.form",
                        {"carid":carid},
                        function (data) {
                            $("#numbersg"+carid).val(data.goodsnum);
                        },"json");
                }
            }else {
                alert("请输入正确的数量！！！");
                $.post("onecar.form",
                    {"carid":carid},
                    function (data) {
                        $("#numbersg"+carid).val(data.goodsnum);
                    },"json");
            }
        }
        function updategoodsnum(carid,goodsnum) {
            $.post("updategoodsnum.form",
                {"carid":carid,"goodsnum":goodsnum},
                function (data) {
                    $("#numbersg"+carid).val(data.goodsnum);
                    $("#totleprice"+carid).html("￥"+data.totalprice);
                    totleprice();
                },"json");
        }
        function deletecar(carid) {
            $.post("deletecar.form",
                {"carid":carid},
                function (data) {
                    $("#"+carid).remove();
                    $("#gwcsize").html("购物车("+data+")");
                    totleprice();
                },"text");
        }
        function totleprice() {
            var carids=new Array();
            $("input[name='bis']:checked").each(function () {
                carids.push($(this).val());
            });
            $.post("cartotleprice.form?carids="+carids,
                function (data) {
                    $("#totleprice").html("￥"+data)
                },"text");
        }
        function addorder(){
            var carids=new Array();
            $("input[name='bis']:checked").each(function () {
                carids.push($(this).val());
            });
            if(carids.length==0){
                alert("你没有勾选商品无法下单！！！")
            }else {
                window.location="addorder.form?carids="+carids;
            }
        }
        $(function () {
           totleprice();
            $("#rememberMequan").click(function () {
                if($(this).val()=="全选"){
                    $("#rememberMequan").val("全不选");
                    $("input[name=bis]").prop("checked",true)
                }else{
                    $("#rememberMequan").val("全选");
                    $("input[type=checkbox]").prop("checked",false)
                }
                totleprice();
            });
            $("input[name='bis']").click(function () {
                totleprice()
            });
        });
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
                        <li class="hd_menu_tit"><em class="registered_img"></em><a href="/tuichucustomer.form">退出</a></li>
                    </c:if>
                    <li class="hd_menu_tit"><em class="Collect_img"></em><a href="/allcollectionn.form">收藏夹</a></li>
                    <li class="hd_menu_tit"><em class="cart_img"></em><a href="shopping_cart.jsp" id="gwcsize">购物车（
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
    </div>
</div>
<!--购物车样式-->
<div class="Narrow">
    <div class="shop_cart">
        <div class="schedule"></div>
        <div class="cart_style">
            <div class="title_name">
                <ul>
                    <li class="title_width"><label class="auto-label">
                        <input type="checkbox" id="rememberMequan" value="全选">
                        <span>全选</span></label>
                    </li>
                    <li class="title_width1">商品信息</li>
                    <li class="title_width2">单价</li>
                    <li class="title_width3">数量</li>
                    <li class="title_width4">小计</li>
                    <li class="title_width5">操作</li>
                </ul>
            </div>
            <div class="list_style">
                <div class="class_title">水果馆</div>
                <c:forEach var="car" items="${sessionScope.customer.carList}">
                    <c:if test="${car.goods.goodstypeid ne 102}">
                        <ul class="product_cart" id="${car.carid}">
                            <li class="title_width"><input type="checkbox" name="bis" value="${car.carid}"></li>
                            <li class="title_width1">
                                <a href="#" class="product_img left"><img src="images/${car.goods.goodspic}" width="207px" height="219px"/></a>
                                <p class="cart_content">
                                    <a href="#" class="title_name">${car.goods.goodsname}</a>
                                </p>
                            </li>
                            <li class="title_width2">￥
                                <c:choose>
                                    <c:when test="${car.goods.teambuy eq 1}">
                                        ${car.goods.teambuyprice}
                                    </c:when>
                                    <c:otherwise>
                                        ${car.goods.goodsprice}
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li class="title_width3">
                                <div class="Numbers">
                                    <a href="javascript:jian('${car.carid}')" class="jian">-</a>
                                    <input id="numbersg${car.carid}" onblur="goodsnum('${car.carid}')" type="text" value="${car.goodsnum}" class="number_text">
                                    <a href="javascript:jia('${car.carid}')" class="jia">+</a>
                                </div>
                            </li>
                            <li class="title_width4" id="totleprice${car.carid}">￥ ${car.totalprice}</li>
                            <li class="title_width5"><a href="javascript:deletecar('${car.carid}')">删除</a></li>
                        </ul>
                    </c:if>
                </c:forEach>
            </div>
            <div class="list_style">
                <div class="class_title">果蔬馆</div>
                <c:forEach var="car" items="${sessionScope.customer.carList}">
                    <c:if test="${car.goods.goodstypeid eq 102}">
                        <ul class="product_cart" id="${car.carid}">
                            <li class="title_width"><input type="checkbox" name="bis" value="${car.carid}"></li>
                            <li class="title_width1">
                                <a href="#" class="product_img left"><img src="images/${car.goods.goodspic}" width="207px" height="219px"/></a>
                                <p class="cart_content">
                                    <a href="#" class="title_name">${car.goods.goodsname}</a>
                                </p>
                            </li>
                            <li class="title_width2">￥
                                <c:choose>
                                    <c:when test="${car.goods.teambuy eq 1}">
                                        ${car.goods.teambuyprice}
                                    </c:when>
                                    <c:otherwise>
                                        ${car.goods.goodsprice}
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li class="title_width3">
                                <div class="Numbers">
                                    <a href="javascript:jian('${car.carid}')" class="jian">-</a>
                                    <input id="numbersg${car.carid}" onblur="goodsnum('${car.carid}')" type="text" value="${car.goodsnum}" class="number_text">
                                    <a href="javascript:jia('${car.carid}')" class="jia">+</a>
                                </div>
                            </li>
                            <li class="title_width4" id="totleprice${car.carid}">￥ ${car.totalprice}</li>
                            <li class="title_width5"><a  href="javascript:deletecar('${car.carid}')">删除</a></li>
                        </ul>
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <!--操作-->
        <div class="cart_operating clearfix">
            <div class="cart_operating_style">
                <div class="cart_price">商品总价：（不含运费）<b id="totleprice"></b></div>
                <div class="cart_btn"><a href="javascript:addorder()" class="payment_btn"></a><a href="Products.jsp" class="continue_btn"></a></div>
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

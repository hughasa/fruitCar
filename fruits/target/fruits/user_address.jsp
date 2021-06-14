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
    <script src="js/distpicker.data.js" type="text/javascript"></script>
    <script src="js/distpicker.js" type="text/javascript"></script>
    <script src="js/main.js" type="text/javascript"></script>
    <title>用户地址管理</title>
    <script type="text/javascript">
        function addresscz() {
            var bool=true;
            if(!addressrecname()){
                bool=false;
            }else if(!addressarea()){
                bool=false;
            }else if(!addresscity()){
                bool=false;
            }else if(!addressemail()){
                bool=false;
            }else if(!addresstel()){
                bool=false;
            }
            if(bool){
                $("#addressform").submit()
            }
        }
        function deleteaddress(addressid) {
            location.href="/deleteaddress.form?addressid="+addressid;
        }
        function addressrecname() {
            var bool=true;
            var addressrecname=$("#addressrecname").val();
            if(addressrecname.trim().length==0 || addressrecname.trim().length>10){
                alert("用户名长度不超过10且不能为空！！！");
                bool=false;
            }
            return bool;
        }
        function addressarea() {
            var bool=true;
            var addressareas=$("#addressareas").val();
            var addressareashi=$("#addressareashi").val();
            var addressareaqu=$("#addressareaqu").val();
            if(addressareas=="" || addressareashi==""|| addressareaqu==""){
                alert("（省.市.区）不能为空！！！");
                bool=false;
            }
            return bool;
        }
        function addresscity() {
            var bool=true;
            var addresscity=$("#addresscity").val();
            if(addresscity.trim().length==0||addresscity.trim().length>1000){
                alert("收货地址不能为空（长度1-100）");
                bool=false;
            }
            return bool;
        }
        function addressemail() {
            var bool=true;
            var addressemail=$("#addressemail").val();
            var test=/^[1-9]\d{5}$/
            if(!test.test(addressemail)){
                alert("邮编的长度固定6且格式第一位[1-9]后五位[0-9]");
                bool=false;
            }
            return bool;
        }
        function addresstel() {
            var bool=true;
            var addresstel=$("#addresstel").val();
            var addressphone=$("#addressphone").val();
            var custteltest=/^1[3578]\d{9}$/;
            if(!custteltest.test(addresstel)||!custteltest.test(addressphone)){
                alert("电话号码或固定电话以1[3578]开头的数字组合11位且不能为空！！！");
                bool=false;
            }
            return bool;
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
                        <li class="hd_menu_tit"><em class="registered_img"></em><a href="/tuichucustomer.form">退出</a></li>
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
<!--用户中心(地址管理界面)-->
<div class="Inside_pages clearfix">
    <div class="clearfix user">
        <!--左侧菜单栏样式-->
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
        <!--右侧内容样式-->
        <div class="user_right">
            <div class="user_Borders">
                <div class="title_name">
                    <span class="name">地址管理</span>
                </div>
                <div class="about_user_info">
                    <c:if test="${empty sessionScope.address}" var="fol">
                        <form id="addressform"  method="post" action="/addaddress.form">
                    </c:if>
                    <c:if test="${!fol}">
                        <form id="addressform"  method="post" action="/updateaddress.form">
                            <input type="hidden" name="addressid" value="${sessionScope.address.addressid}"/>
                    </c:if>
                        <div class="user_layout">
                            <ul>
                                <li><label class="user_title_name">收件人姓名：</label>
                                    <input id="addressrecname" name="addressrecname" value="${sessionScope.address.addressrecname}" type="text" class="add_text"><em>*</em></li>
                                <li><label class="user_title_name">省&nbsp;市&nbsp;区：</label>
                                    <c:if test="${fol}">
                                        <span id="distpicker5">
                                    </c:if>
                                    <c:if test="${!fol}">
                                        <input type="hidden" value="${sessionScope.address.addressareas}" id="addressareas"/>
                                        <input type="hidden" value="${sessionScope.address.addressareashi}" id="addressareashi"/>
                                        <input type="hidden" value="${sessionScope.address.addressareaqu}" id="addressareaqu"/>
                                         <span id="distpicker6">
                                    </c:if>
                                        <select name="addressareas" id="addressareas">
                                        </select>
                                        <select name="addressareashi" id="addressareashi">
                                        </select>
                                        <select name="addressareaqu" id="addressareaqu">
                                        </select>
                                    </span>
                                    <em>*</em></li>
                                <li><label class="user_title_name">收货地址：</label>
                                    <input name="addresscity" id="addresscity" value="${sessionScope.address.addresscity}" type="text" class="add_text"><em>*</em></li>
                                <li><label class="user_title_name">邮&nbsp;&nbsp;&nbsp;&nbsp;编：</label>
                                    <input name="addressemail" id="addressemail" value="${sessionScope.address.addressemail}" type="text" class="add_text"><em>*</em>
                                </li>
                                <li><label class="user_title_name">手&nbsp;机&nbsp;号：</label>
                                    <input name="addresstel" id="addresstel"  value="${sessionScope.address.addresstel}"  type="text" class="add_text"><em>*</em>
                                </li>
                                <li><label class="user_title_name">固定电话：</label>
                                    <input name="addressphone" id="addressphone" value="${sessionScope.address.addressphone}" type="text" class="add_text"><em>*</em></li>
                            </ul>
                            <div class="operating_btn"><input name="name" type="button" onclick="addresscz()" value="确认" class="submit—btn">
                            </div>
                        </div>
                    </form>
                </div>
                <!--地址列表-->
                <div class="Address_List">
                    <div class="title_name"><span class="name">用户地址列表</span></div>
                    <div class="list">
                        <table>
                            <thead>
                            <td class="list_name_title0">收件人姓名</td>
                            <td class="list_name_title1">地区</td>
                            <td class="list_name_title2">邮编</td>
                            <td class="list_name_title3">电话</td>
                            <td class="list_name_title4">收货地址</td>
                            <td class="list_name_title5">操作</td>
                            </thead>
                            <c:forEach var="address" items="${sessionScope.customer.addressList}">
                                <tr>
                                    <td>${address.addressrecname}</td>
                                    <td>${address.addressareas}${address.addressareashi}${address.addressareaqu}</td>
                                    <td>${address.addressemail}</td>
                                    <td>${address.addresstel}</td>
                                    <td>${address.addresscity}</td>
                                    <td><a href="/oneaddress.form?addressid=${address.addressid}">修改</a><a href="javascript:deleteaddress('${address.addressid}')">删除</a></td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty sessionScope.customer.addressList}">
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </c:if>
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

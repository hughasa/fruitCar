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
    <script type="text/javascript">
        function custname() {
            var bool=true;
            var custname=$("#custname").val();
            if(custname.trim().length==0 || custname.trim().length>10){
                alert("用户名长度不超过10且不能为空！！！");
                bool=false;
            }
            return bool;
        }
        function custtel() {
            var bool=true;
            var custtel=$("#custtel").val();
            var custteltest=/^1[3578]\d{9}$/;
            if(!custteltest.test(custtel)){
                alert("电话号码以1[3578]开头的数字组合11位且不能为空！！！");
                bool=false;
            }
            return bool;
        }
        function cfcusytel() {
            var bool=true;
            var custtel=$("#custtel").val();
            var custtel1=$("#custtel1").val();
            if(custtel!=custtel1){
                $.ajaxSettings.async=false;
                $.post("cfcustnameortel.form",
                    {"custtel":custtel},
                    function (data) {
                        if(data=="no"){
                            alert("电话号码不能重复！！！");
                            bool=false;
                        }
                    },"text");
                $.ajaxSettings.async=true;
            }
            return bool;
        }
        function cfcusyname() {
            var bool=true;
            var custname=$("#custname").val();
            var custname1=$("#custname1").val();
            if(custname!=custname1){
                $.ajaxSettings.async=false;
                $.post("cfcustnameortel.form",
                    {"custname":custname},
                    function (data) {
                        if(data=="no"){
                            alert("用户名不能重复！！！");
                            bool=false;
                        }
                    }, "text");
                $.ajaxSettings.async=true;
            }
            return bool;
        }
        function infoyx() {
            var bool=true;
            var custemail=$("#custemail").val();
            var test=/^\w{1,22}\@\w{3}\.com$/;
            if(custemail.trim().length>30||custemail.trim().length<8||!test.test(custemail)) {
                alert("邮箱格式为（字母加数字（1-22位）@（字母加数字（3位）.com）且长度（8-30位）！！！");
                bool=false;
            }
            return bool;
        }
        function infozname() {
            var bool=true;
            var custtname=$("#custtname").val();
            if(custtname.trim().length==0 || custtname.trim().length>10){
                alert("真实姓名长度不超过10且不能为空！！！");
                bool=false;
            }
            return bool;
        }
        function img() {
            var bool=true;
            var filename=$("#filename").val();
            if (filename.trim().length != 0) {
                $.ajaxSettings.async = false;
                $.post("adminjsp/Node/adminimg.form",
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
        $(function () {
            $("#addcustomerinfoform").submit(function () {
                var bool=true;
                if(!custname()){
                    bool=false;
                }else if(!infozname()){
                    bool=false;
                }else if(!custtel()){
                    bool=false;
                }else if(!infoyx()){
                    bool=false;
                }else if(!img()){
                    bool=false;
                }else if(!cfcusyname()){
                    bool=false;
                }else if(!cfcusytel()){
                    bool=false;
                }
                return bool;
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
                <div class="Head_portrait"><img src="${sessionScope.customer.customerinfo.custpic}" width="80px" height="80px"/><!--头像区域-->
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
            <div class="user_Borders">
                <div class="title_name">
                    <span class="name">个人信息设置</span>
                </div>
                <div class="about_user_info">
                    <form id="addcustomerinfoform" method="post" action="/addcustomerinfo.form" enctype="multipart/form-data">
                        <div class="user_layout">
                            <ul>
                                <li>
                                    <label class="user_title_name">用户头像：</label>
                                    <c:if test="${empty sessionScope.customer.customerinfo.custpic}" var="fol">
                                        暂无头像
                                    </c:if>
                                    <c:if test="${!fol}">
                                       有头像
                                    </c:if>
                                    <input type="file" name="filename" id="filename"/>
                                </li>
                                <li><label class="user_title_name">用户昵称：</label>
                                    <input id="custname1" type="hidden" value="${sessionScope.customer.custname}" />
                                    <input name="custname" id="custname" value="${sessionScope.customer.custname}" type="text" class="add_text"/><em>*</em></li>
                                <li><label class="user_title_name">真实姓名：</label>
                                    <input name="custtname" id="custtname" value="${sessionScope.customer.customerinfo.custtname}" type="text" class="add_text"/><em>*</em></li>
                                <li><label class="user_title_name">用户性别：</label>
                                    <c:choose>
                                        <c:when test="${empty sessionScope.customer.customerinfo.custsex}">
                                            <label class="sex">
                                                <input type="radio" name="custsex" value="男" id="RadioGroup1_0" checked="checked"/><span>男</span></label>
                                            <label class="sex">
                                                <input type="radio" name="custsex" value="女" id="RadioGroup1_1"/><span>女</span></label>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${sessionScope.customer.customerinfo.custsex eq '男'}" var="fol">
                                                <label class="sex">
                                                    <input type="radio" name="custsex" value="男" id="RadioGroup1_0" checked="checked"/><span>男</span></label>
                                                <label class="sex">
                                                    <input type="radio" name="custsex" value="女" id="RadioGroup1_1"/><span>女</span></label>
                                            </c:if>
                                            <c:if test="${!fol}">
                                                <label class="sex">
                                                    <input type="radio" name="custsex" value="男" id="RadioGroup1_0"/><span>男</span></label>
                                                <label class="sex">
                                                    <input type="radio" name="custsex" value="女" id="RadioGroup1_1" checked="checked"/><span>女</span></label>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                    <em>*</em>
                                </li>
                                <li><label class="user_title_name">手&nbsp;机&nbsp;号：</label>
                                    <input id="custtel1" type="hidden" value="${sessionScope.customer.custtel}" />
                                    <input name="custtel" id="custtel" value="${sessionScope.customer.custtel}" type="text" class="add_text"/><em>*</em>
                                </li>
                                <li><label class="user_title_name">邮箱地址：</label>
                                    <input name="custemail" id="custemail"  value="${sessionScope.customer.customerinfo.custemail}" type="text" class="add_text"/><em>*</em></li>
                            </ul>
                            <div class="operating_btn"><input name="name" type="submit" value="提交" class="submit—btn"/>
                            </div>
                        </div>
                    </form>
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

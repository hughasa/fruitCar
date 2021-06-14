<%--
Created by IntelliJ IDEA.
User: 高龙飞
Date: 2020/6/28
Time: 11:28
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>用户注册</title>
    <script type="text/javascript">
        function cfcusyname() {
            var bool=true;
            var custname=$("#custname").val();
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
            return bool;
        }
        function cfcusytel() {
            var bool=true;
            var custtel=$("#custtel").val();
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
            return bool;
        }
        function passquer() {
            var bool=true;
            var custpwd=$("#custpwd").val();
            var custpwd1=$("#custpwd1").val();
            if(custpwd!=custpwd1){
                alert("两次密码不一致！！！");
                bool=false;
            }
            return bool;
        }
        function yzm() {
            var bool=true;
            var yzm=$("#yzm").val();
            $.ajaxSettings.async=false;
            $.post("yzm.form",
                {"yzm":yzm},
                function (data) {
                    if(data=="no"){
                        alert("验证码错误！！！");
                        bool=false;
                    }
                },"text");
            $.ajaxSettings.async=true;
            return bool;
        }
        function regisform() {
            var bool=true;
            if(!custtel()){
                bool=false;
            }else if(!custname()){
                bool=false;
            }else if(!custpwd()){
                bool=false;
            }else if(!cfcusytel()){
                bool=false;
            }else if(!cfcusyname()){
                bool=false;
            }else if(!passquer()){
                bool=false;
            }else if(!$("#rememberMe").is(':checked')){
                alert("必须勾选注册协议！！！");
                bool=false;
            }else if(!yzm()){
                bool=false;
            }
            if(bool){
                $("#regisform").submit();
            }
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
        function custname() {
            var bool=true;
            var custname=$("#custname").val();
            if(custname.trim().length==0 || custname.trim().length>10){
                alert("用户名长度不超过10且不能为空！！！");
                bool=false;
            }
            return bool;
        }
        function custpwd() {
            var bool=true;
            var custpwd=$("#custpwd").val();
            var custpwdtest=/^\w{6,16}$/
            if(!custpwdtest.test(custpwd)|custpwd.trim().length==0 || custpwd.trim().length>10){
                alert("密码长度不超过16大于6由数字字母组成且不能为空！！！");
                bool=false;
            }
            return bool;
        }
        /*点击图片更换验证码事件*/
        function changeImage() {
            $('#verifyCodeImage').attr('src', '/getVerifyCode.form?date='+new Date().getTime());
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
                    <li class="hd_menu_tit"><em class="login_img"></em><a href="Login.jsp">登录</a></li>
                    <li class="hd_menu_tit"><em class="registered_img"></em><a href="registered.jsp">注册</a></li>
                    <li class="hd_menu_tit"><em class="Collect_img"></em><a href="#">收藏夹</a></li>
                    <li class="hd_menu_tit"><em class="cart_img"></em><a href="#">购物车（0）</a></li>
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
<!--注册样式-->
<div class="Inside_pages clearfix">
    <div class="register">
        <div class="register_style">
            <form action="/regis.form" method="post" id="regisform">
                <div class="u_register">
                    <ul>
                        <li><label class="name">手机号码：</label><input name="custtel" type="text" class="text_Add" id="custtel"/></li>
                        <li><label class="name">用户名称：</label><input name="custname" type="text" class="text_Add" id="custname"/></li>
                        <li><label class="name">设置密码：</label><input name="custpwd" type="password" class="text_Add"  id="custpwd" placeholder="6-20个字符，由字母、数字和符号的两种以上组合"/></li>
                        <li><label class="name">确认密码：</label><input type="password" class="text_Add"  id="custpwd1"/></li>
                        <li><label class="name">验&nbsp;证&nbsp;码：</label><input type="text" class="text_verification" id="yzm"/><img src="/getVerifyCode.form" width="110" height="34" id="verifyCodeImage" onclick="changeImage()"></li>
                    </ul>
                    <div class="auto-register"><label class="auto-label"><input type="checkbox" id="rememberMe"><span><a href="#">《国际商贸城网站注册协议》</a></span></label></div>
                    <div class="register-btn"><a href="javascript:regisform()" class="btn_register">注&nbsp;&nbsp;&nbsp;&nbsp;册</a>
                    </div>
                </div>
            </form>
        </div>
        <div class="register_img"><img src="images/Register_img.png"/></div>
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

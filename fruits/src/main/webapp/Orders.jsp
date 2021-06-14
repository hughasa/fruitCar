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
    <link href="css/common.css" rel="stylesheet" tyle="text/css"/>
    <link href="css/Orders.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.reveal.js" type="text/javascript"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="js/jquery.sumoselect.min.js" type="text/javascript"></script>
    <script src="js/common_js.js" type="text/javascript"></script>
    <script src="js/footer.js" type="text/javascript"></script>
    <script src="js/jquery.jumpto.js" type="text/javascript"></script>
    <title>确认订单界面</title>
    <script type="text/javascript">
        $(function () {
            window.asd = $('.SlectBox').SumoSelect({csvDispCount: 3});
            window.test = $('.testsel').SumoSelect({okCancelInMulti: true});
            showaddress(null);
            totleprice();
            $("#ly").blur(function () {
                var ly = $("ly").val();
                var shuliang = 50 - ly.length;
                if (shuliang > 0) {
                    $("sy").html(shuliang);
                } else {
                    $("sy").html(0)
                }
            });
            $("#hp").change(function () {
                hp();
            });
            $("#fp").click(function () {
                fp();
            });
        });

        function showaddress(addressid) {
            if (addressid == null) {
                $.post("oneshowaddress.form",
                    function (data) {
                        var address = "<li><label>收货人姓名</label><span>" + data.addressrecname + "</span></li>" +
                            "<li><label>电子邮件</label><span>" + $("#custemail").val() + "</span></li>" +
                            "<li><label>详细地址</label><span>" + data.addressareas + data.addressareashi + data.addressareaqu + data.addresscity + "</span></li>" +
                            "<li><label>邮政编码</label><span>" + data.addressemail + "</span></li>" +
                            "<li><label>移动电话</label><span>" + data.addresstel + "</span></li>" +
                            "<li><label>固定电话</label><span>" + data.addressphone + "</span></li>";
                        $("#showaddress").html(address);
                        $("#addressid").val(data.addressareas + data.addressareashi + data.addressareaqu + data.addresscity)
                    }, "json");
            } else {
                $.post("oneshowaddress.form",
                    {"addressid": addressid},
                    function (data) {
                        var address = "<li><label>收货人姓名</label><span>" + data.addressrecname + "</span></li>" +
                            "<li><label>电子邮件</label><span>" + $("#custemail").val() + "</span></li>" +
                            "<li><label>详细地址</label><span>" + data.addressareas + data.addressareashi + data.addressareaqu + data.addresscity + "</span></li>" +
                            "<li><label>邮政编码</label><span>" + data.addressemail + "</span></li>" +
                            "<li><label>移动电话</label><span>" + data.addresstel + "</span></li>" +
                            "<li><label>固定电话</label><span>" + data.addressphone + "</span></li>";
                        $("#showaddress").html(address);
                        $("#addressid").val(data.addressareas + data.addressareashi + data.addressareaqu + data.addresscity)
                    }, "json");
            }
        }

        function totleprice() {
            $.post("oneorderprice.form",
                function (data) {
                    $(data).each(function (index) {
                        if (index == 0) {
                            $("#totleprice").html(this);
                        } else if (index == 1) {
                            $("#youhuiprice").html(this);
                            $("#youhuiprice1").val(this);
                        } else if (index == 2) {
                            $("#shifuprice").html(this);
                            $("#shifuprice1").val(this);
                            $("#totalprice").val(this);
                            $("#jf").html(this * 10);
                        }
                    });
                }, "json");
        }

        function addqrorder() {
            var bool = true;
            var ly = $("#ly").val();
            if (ly.length > 50) {
                alert("留言不能超过50个字！！！");
                bool = false;
            }
            if($("input[name=paytypeid]:checked").val()==5){
                if($("#shifuprice").html()>${sessionScope.customer.ye}){
                    alert("你的余额不足！！！");
                    bool = false;
                }
            }else if($("#addressid").val()==0){
                alert("地址不能为空！！！");
                bool = false;
            }
            if (bool) {
                $("#addorderform").submit();
            }
        }

        function fp() {
            var fp = $("#fp").val();
            if (fp == 0) {
                $("#fp").val(1);
            } else {
                $("#fp").val(0);
            }
        }

        function hp() {
            var hp = $("#hp").val();
            var shifuprice1 = $("#shifuprice1").val();
            var youhuprice1 = $("#youhuiprice1").val();
            var bool = true;
            if (shifuprice1 == 0) {
                alert("积分换购的商品不能使用红包");
                bool = false;
            } else {
                if (hp == 0) {
                    bool = false;
                } else if (shifuprice1 <= 100) {
                    if (hp > 10) {
                        alert("订单不超过100元只能使用5元和10元的红包");
                        bool = false;
                    }
                } else if (shifuprice1 > 100 && shifuprice1 <= 200) {
                    if (hp > 20) {
                        alert("订单不超过200但大于100元只能使用5元和10元和20元的红包");
                        bool = false;
                    }
                } else if (shifuprice1 > 200 && shifuprice1 <= 500) {
                    if (hp > 50) {
                        alert("订单不超过500元但大于200元只能使用5元和10元和20元和50元的红包");
                        bool = false;
                    }
                } else if (shifuprice1 > 500 && shifuprice1 <= 1000) {
                    if (hp > 100) {
                        alert("订单不超过1000元但大于500元只能使用5元和10元和20元和50元和100元的红包");
                        bool = false;
                    }
                }
            }
            if (bool) {
                if (hp == 5) {
                    shifuprice1 = shifuprice1 - 5;
                    youhuprice1 = youhuprice1 - 5;
                } else if (hp == 10) {
                    shifuprice1 = shifuprice1 - 10;
                    youhuprice1 = youhuprice1 - 10;
                } else if (hp == 20) {
                    shifuprice1 = shifuprice1 - 20;
                    youhuprice1 = youhuprice1 - 20;
                } else if (hp == 50) {
                    shifuprice1 = shifuprice1 - 50;
                    youhuprice1 = youhuprice1 - 50;
                } else if (hp == 100) {
                    shifuprice1 = shifuprice1 - 100;
                    youhuprice1 = youhuprice1 - 100;
                } else if (hp == 200) {
                    shifuprice1 = shifuprice1 - 200;
                    youhuprice1 = youhuprice1 - 200;
                }
                if (shifuprice1<0.01) {
                    shifuprice1=0.01;
                }
                $("#shifuprice").html(shifuprice1);
                $("#youhuiprice").html(youhuprice1);
                $("#totalprice").val(shifuprice1);
                $("#jf").html(shifuprice1*10);
            } else {
                $("#shifuprice").html(shifuprice1);
                $("#youhuiprice").html(youhuprice1);
                $("#totalprice").val(shifuprice1);
            }
        }
    </script>
</head>
<body>
<input id="custemail" value="${sessionScope.customer.customerinfo.custemail}" type="hidden"/>
<div id="Orders" class="Inside_pages  clearfix">
    <div class="Orders_style clearfix">
        <div class="address clearfix">
            <div class="title">收货人信息</div>
            <div class="adderss_list clearfix">
                <div class="title_name">选择收货地址 <a href="/addaddress.form?ordertype=addorder">+添加地址</a></div>
                <div class="list" id="select">
                    <c:forEach var="address" items="${sessionScope.customer.addressList}" varStatus="varStatus">
                    <c:choose>
                    <c:when test="${varStatus.index eq 0}">
                    <ul class="confirm active" onclick="showaddress('${address.addressid}')">
                        <div class="default">默认地址</div>
                        </c:when>
                        <c:otherwise>
                        <ul class="" onclick="showaddress('${address.addressid}')">
                            </c:otherwise>
                            </c:choose>
                            <div class="adderss_operating">
                                <div class="Operate">
                                    <a href="/deleteaddress.form?addressid=${address.addressid}&ordertype=order" class="delete_btn"></a>
                                    <a href="/oneaddress.form?addressid=${address.addressid}&ordertype=order" class="modify_btn"></a>
                                </div>
                            </div>
                            <div class="user_address">
                                <li>${address.addressrecname}</li>
                                <li>${address.addressareas}${address.addressareashi}${address.addressareaqu}${address.addresscity}</li>
                                <li class="Postcode">${address.addressemail}</li>
                                <li>${address.addresstel}</li>
                            </div>
                        </ul>
                        </c:forEach>
                </div>
            </div>
            <!--收货地址样式-->
            <div class="Shipping_address">
                <ul class="detailed" id="showaddress">
                </ul>
            </div>
        </div>

        <form class="form" method="post" action="/addqrorder.form" id="addorderform">
            <input type="hidden" name="address" id="addressid"/>
            <fieldset>
                <!--快递选择-->
                <div class="express_delivery">
                    <div class="title_name">选择快递方式</div>

                    <ul class="dowebok">
                        <li><input type="radio" name="expressid" value="1" data-labelauty="圆通快递" checked="checked">
                            <div class="description">
                                <em class="arrow"></em>
                                <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                                <p>资费：15元</p>
                                <p class="Note">满68元包邮</p>
                                <p><a href="#">点击查看是否在配送范围内</a></p>
                            </div>
                        </li>
                        <li><input type="radio" name="expressid" value="2" data-labelauty="中通快递">
                            <div class="description">
                                <em class="arrow"></em>
                                <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                                <p>资费：15元</p>
                                <p class="Note">满68元包邮</p>
                            </div>
                        </li>
                        <li><input type="radio" name="expressid" value="3" data-labelauty="申通快递">
                            <div class="description">
                                <em class="arrow"></em>
                                <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                                <p>资费：15元</p>
                                <p class="Note">满68元包邮</p>
                            </div>
                        </li>
                        <li><input type="radio" name="expressid" value="4" data-labelauty="邮政EMS">
                            <div class="description">
                                <em class="arrow"></em>
                                <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                                <p>资费：15元</p>
                                <p class="Note">满68元包邮</p>
                            </div>
                        </li>
                        <li><input type="radio" name="expressid" value="5" data-labelauty="城际快递">
                            <div class="description">
                                <em class="arrow"></em>
                                <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                                <p>资费：同城包邮</p>

                            </div>
                        </li>
                        <li><input type="radio" name="expressid" value="6" data-labelauty="韵达快递">
                            <div class="description">
                                <em class="arrow"></em>
                                <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                                <p>资费：15元</p>
                                <p class="Note">满68元包邮</p>
                            </div>
                        </li>
                        <li><input type="radio" name="expressid" value="7" data-labelauty="国通快递">
                            <div class="description">
                                <em class="arrow"></em>
                                <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                                <p>资费：15元</p>
                                <p class="Note">满68元包邮</p>
                            </div>
                        </li>
                        <li><input type="radio" name="expressid" value="8" data-labelauty="顺丰快递">
                            <div class="description">
                                <em class="arrow"></em>
                                <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                                <p>资费：15元</p>
                                <p class="Note">满88元包邮</p>
                            </div>
                        </li>
                        <li><input type="radio" name="expressid" value="9" data-labelauty="邮政小包">
                            <div class="description">
                                <em class="arrow"></em>
                                <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                                <p>资费：15元</p>
                                <p class="Note">满68元包邮</p>
                            </div>
                        </li>
                        <li><input type="radio" name="expressid" value="10" data-labelauty="天天快递">
                            <div class="description">
                                <em class="arrow"></em>
                                <p>到付价格=现付价格*1.25 ，不足1元按1元收取，到付最低15元起。此价格供参考，详情请咨询圆通当地营业网点</p>
                                <p>资费：15元</p>
                                <p class="Note">满68元包邮</p>
                            </div>
                        </li>
                    </ul>

                </div>

                <!--付款方式-->
                <div class="payment">
                    <div class="title_name">支付方式</div>
                    <ul>
                        <li><input type="radio" name="paytypeid" value="5" data-labelauty="余额支付" checked="checked"></li>
                        <li><input type="radio" name="paytypeid" value="1" data-labelauty="支付宝"></li>
                        <li><input type="radio" name="paytypeid" value="3" data-labelauty="财付通"></li>
                        <li><input type="radio" name="paytypeid" value="4" data-labelauty="银联支付"></li>
                        <li><input type="radio" name="paytypeid" value="2" data-labelauty="货到付款"></li>
                    </ul>
                </div>
                <!--发票样式-->
                <div class="invoice_style">
                    <ul>
                        <li class="invoice_left"><input name="invoice" id="fp" type="checkbox" value="0"
                                                        data-labelauty="是否开发票"/></li>
                    </ul>
                </div>
                <!--产品列表-->
                <div class="Product_List">
                    <div class="envelopes">
                        选择已有红包
                        <select name="somename" class="SlectBox" id="hp">
                            <option value="0" selected="selected">选择红包金额</option>
                            <!--placeholder-->
                            <option value="5">5元红包</option>
                            <option value="10">10元红包</option>
                            <option value="20">20元红包</option>
                            <option value="50">50元红包</option>
                            <option value="100">100元红包</option>
                            <option value="200">200元红包</option>
                        </select>
                    </div>
                    <table>
                        <thead>
                        <tr class="title">
                            <td class="name">商品名称</td>
                            <td class="price">商品价格</td>
                            <td class="Preferential">优惠价</td>
                            <td class="Quantity">购买数量</td>
                            <td class="Money">金额</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="car" items="${sessionScope.carorderList}">
                            <tr>
                                <td class="Product_info">
                                    <a href="#"><img src="images/${car.goods.goodspic}" width="100px"
                                                     height="100px"/></a>
                                    <a href="#" class="product_name">${car.goods.goodsinfo}</a>
                                </td>
                                <td><i>￥</i>${car.goods.goodsprice}</td>
                                <td><i>￥</i>
                                    <c:if test="${car.goods.teambuy eq 1}" var="fol">
                                        ${car.goods.teambuyprice}
                                    </c:if>
                                    <c:if test="${!fol}">
                                        无优惠
                                    </c:if>
                                </td>
                                <td> ${car.goodsnum}</td>
                                <td class="Moneys"><i>￥</i><span>${car.totalprice}</span></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="Pay_info">
                        <label>订单留言</label><input name="ordersmessage" type="text" onkeyup="checkLength(this);"
                                                  class="text_name " id="ly"/>
                        <span class="wordage">剩余字数：<span id="sy" style="color:Red;">50</span></span>
                    </div>
                    <!--价格-->
                    <div class="price_style">
                        <div class="right_direction">
                            <ul>
                                <li><label>商品总价</label><i>￥</i><span id="totleprice"></span></li>
                                <li><label>优惠金额</label><i>￥</i><span id="youhuiprice"></span></li>
                                <li><label>配&nbsp;&nbsp;送&nbsp;&nbsp;费</label><i>￥</i><span>0</span></li>
                                <li class="shiji_price">
                                    <label>实&nbsp;&nbsp;付&nbsp;&nbsp;款</label><i>￥</i><span id="shifuprice"></span></li>
                                <input type="hidden" id="shifuprice1">
                                <input type="hidden" id="youhuiprice1">
                                <input type="hidden" id="totalprice" name="orderstotalpage">
                            </ul>
                            <div class="btn"><input type="button" onclick="addqrorder()" value="提交订单"
                                                    class="submit_btn"/>
                                <input onclick="javascript:location='shopping_cart.jsp'" type="button" value="返回购物车"
                                       class="return_btn"/></div>
                            <c:if test="${empty sessionScope.ustpoint}" var="fol">
                                <div class="integral right">待订单确认后，你将获得<span id="jf"></span>积分</div>
                            </c:if>
                            <c:if test="${!fol}">
                                <div class="integral right">待订单确认后，你将扣除<span>${sessionScope.custpoint.pointnum}</span>积分</div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</div>
<script type="text/javascript">
    function checkLength(which) {
        var maxChars = 50; //
        if (which.value.length > maxChars) {
            alert("您出入的字数超多限制!");
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0, maxChars);
            return false;
        } else {
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    }
</script>
<script>
    $(function () {
        $(':input').labelauty();
    });
</script>
</body>
</html>

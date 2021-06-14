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
<HEAD>
    <TITLE>后台管理系统登录</TITLE>
    <STYLE>
        TD {
            FONT-SIZE: 11px;
            COLOR: #000000;
            FONT-FAMILY: Verdana, Arial, Helvetica, sans-serIf;
            TEXT-DECORATION: none
        }

        .input_1 {
            BORDER-RIGHT: #999999 1px solid;
            PADDING-RIGHT: 2px;
            BORDER-TOP: #999999 1px solid;
            PADDING-LEFT: 2px;
            LIST-STYLE-POSITION: inside;
            FONT-SIZE: 12px;
            PADDING-BOTTOM: 2px;
            MARGIN-LEFT: 10px;
            BORDER-LEFT: #999999 1px solid;
            COLOR: #333333;
            PADDING-TOP: 2px;
            BORDER-BOTTOM: #999999 1px solid;
            FONT-FAMILY: Arial, Helvetica, sans-serIf;
            LIST-STYLE-TYPE: none;
            HEIGHT: 18px;
            BACKGROUND-COLOR: #dadedf
        }
    </STYLE>
    <META content="MSHTML 6.00.6000.16705" name=GENERATOR>
    <script type="text/javascript" src="/adminjsp/Js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#adminloginform").submit(function () {
                var bool=true;
                var adminname=$("#adminname").val();
                var adminpwd=$("#adminpwd").val();
                var test=/^\w{6,16}$/;
                if(adminname.trim().length==0 || adminname.trim().length>10){
                    alert("管理员名不能为空且长度不超过10！！！")
                    bool=false;
                }else if(!test.test(adminpwd)){
                    alert("管理员密码不能为空且由数字加字母组成的长度不超过16最小6！！！")
                    bool=false;
                }
                return bool;
            });
        });
        function set() {
            $("#adminname").val("");
           $("#adminpwd").val("");
        }
    </script>
</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width=651 align=center border=0>
    <TBODY>

    <TR>
        <TD height=50></TD>
    </TR>
    <TR>
        <TD height=351>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>

                <TR>
                    <TD width=15 background=/adminjsp/images/ileft.gif height=43></TD>
                    <TD width=620 background=/adminjsp/images/i_topbg2.gif><IMG
                            height=43 src="/adminjsp/images/i_top1.gif" width=43></TD>
                    <TD width=16><IMG height=43 src="/adminjsp/images/iright.gif"
                                      width=16></TD>
                </TR>
                <TR>
                    <TD background=/adminjsp/images/ileftbg.gif></TD>
                    <TD vAlign=center background=/adminjsp/images/bg.gif height=279>
                        <TABLE height=109 cellSpacing=0 cellPadding=0 width=369 align=center
                               border=0>
                            <TBODY>
                            ${sessionScope.msg}
                            <TR>
                                <TD width=155><IMG height=140
                                                   src="/adminjsp/images/logo.jpg" width=155 useMap=#Map
                                                   border=0></TD>
                                <TD vAlign=top align=left width=214>
                                    <TABLE cellSpacing=0 cellPadding=0 width=167 border=0>
                                        <TBODY>

                                        <TR>
                                            <TD vAlign=bottom width=167 height=30><A
                                                    href="#"><IMG
                                                    height=19 src="/adminjsp/images/adminsyteam.gif"
                                                    width=154 border=0></A></TD>
                                        </TR>
                                        <TR>
                                            <TD height=123>
                                                <TABLE height=109 cellSpacing=0 cellPadding=0
                                                       align=center border=0>
                                                    <FORM id="adminloginform" action="/loginadmin.form" method="post">
                                                        <TR>
                                                            <TD vAlign=bottom align=left width=44 height=28>
                                                                <DIV align=right><IMG height=14
                                                                                      src="/adminjsp/images/id.gif"
                                                                                      width=43></DIV>
                                                            </TD>
                                                            <TD vAlign=bottom align=left width=114
                                                                height=28><INPUT class=input_1 id="adminname" size=15
                                                                                 name="adminname">
                                                            </TD>
                                                        </TR>
                                                        <TR>
                                                            <TD align=left height=20>
                                                                <DIV align=right><IMG height=14
                                                                                      src="/adminjsp/images/pass.gif"
                                                                                      width=43></DIV>
                                                            </TD>
                                                            <TD height=20><INPUT class=input_1 id="adminpwd"
                                                                                 type=password size=15 name="adminpwd">
                                                            </TD>
                                                        </TR>
                                                        <TR>
                                                            <TD vAlign=center colSpan=2 height=25>
                                                                <DIV align=center>
                                                                    <INPUT type=image
                                                                           src="/adminjsp/images/b_login.gif"
                                                                           name=denglu>
                                                                    <IMG style="CURSOR: hand"
                                                                         onclick="set()" height="21"
                                                                         src="/adminjsp/images/b_clean.gif" width="73">
                                                                </DIV>
                                                            </TD>
                                                        </TR>
                                                    </FORM>

                                                </TABLE>
                                            </TD>
                                        </TR>
                                        </TBODY>
                                    </TABLE>
                                </TD>
                            </TR>
                            </TBODY>
                        </TABLE>
                    </TD>
                    <TD background=/adminjsp/images/irightbg.gif></TD>
                </TR>
                <TR>
                    <TD><IMG height=29 src="/adminjsp/images/i_bottom_left.gif"
                             width=15></TD>
                    <TD background=/adminjsp/images/i_bottom_bg.gif></TD>
                    <TD width=16><IMG height=29
                                      src="/adminjsp/images/i_bottom_right.gif"
                                      width=16></TD>
                </TR>
                </TBODY>
            </TABLE>
        </TD>
    </TR>
    <TR>
        <TD height=1></TD>
    </TR>
    <TR>
        <TD>&nbsp;</TD>
    </TR>
    </TBODY>
</TABLE>
</BODY>
</HTML>

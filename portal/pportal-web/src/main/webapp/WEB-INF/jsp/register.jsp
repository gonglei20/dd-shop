<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/3/27
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>用户注册</title>
    <link href="${pageContext.request.contextPath}/css/index_5.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/member_2.css" type="text/css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery_3.js" type="text/javascript"></script>
    <%--<script type="text/javascript">
        $(function() {
            $("#jvForm").validate();
        });
        function onSubmit(){
            if(!$("#contract").attr("checked")==true){
                alert("请阅读注册协议!");
                return ;
            }
            $("#jvForm").submit()
            location.href="${pageContext.request.contextPath}/toRegister"
                alert("注册成功");

        }
    </script>--%>
</head>

<body>
<div id="Topbar" class="Topbar">
    <div class="ctr cf">
        <ul class="Topbar-menu fr">
            <li class="Topbar-menu-item ib"><a href="/order/myorder.jspx">我的JSPGOU</a></li>
            <li class="Topbar-menu-item ib"><a href="/collect/mycollect.jspx">收藏夹</a></li>
            <!--<li class="Topbar-menu-item ib"><a target="_blank" href="">网站导航</a>-->
            </li>
        </ul>
        <ul class="Topbar-welcome fl" id="top_user_bar">
            <li class="Topbar-welcome-item">Hi~欢迎来到JSPGOU商城</li>
            <li class="Topbar-welcome-item"><a href="/login.jspx">请登录</a></li>
            <li class="Topbar-welcome-item"><a
                    href="/register.jspx">免费注册</a></li>
        </ul>



    </div>
</div>

<script type="text/javascript">
    console.log(2);
    localStorage.removeItem("sessionKey");
    localStorage.removeItem("userName");
</script><script src="js/jquery_3.js" type="text/javascript"></script>
<!--商品类目栏 end  -->
<div class="user-page-content">
    <div class="clearfix w">
        <div class="content-one content-hei">
            <div class="user_title">注册新用户<span class="fr" style="font-size:12px;">已有帐号，<a href="/login.jspx" style="color:#F00; font-size:14px;">登录</a></span></div>
            <form id="jvForm" action="register.jspx" method="post">
                <table border="0" align="center" cellpadding="3" cellspacing="0" class="zhuce">
                    <tr>
                        <td height="45" width="200" align="right">用户名：</td>
                        <td>
                            <input type="text" id="username" name="username" class="register_input w200 fl mr20" vld="{required:true,rangelength:[3,20],remote:'/username_unique.jspx',messages:{remote:'用户名已存在'}}"/>
                        </td>
                        <td>
                            <span class="gray">用户名由3到20位的中文字符、英文字母、数字组成。</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="45" width="" align="right">Email：</td>
                        <td><input type="text" name="email" id="email"  class="register_input w200 fl mr20" vld="{required:true,email:true,remote:'/email_unique.jspx',messages:{remote:'email已经被使用'}}"/></td>
                        <td><span class="gray">输入有效邮箱地址</span></td>
                    </tr>
                    <tr>
                        <td height="45" width="200" align="right">密码：</td>
                        <td><input name="password" type="password" class="register_input w200 fl mr20" id="password" vld="{required:true,rangelength:[6,32]}" /></td>
                        <td><span class="gray">6－20位字符</span></td>
                    </tr>
                    <tr>
                        <td height="45" width="200" align="right">确认密码：</td>
                        <td><input type="password" equalTo="#password" class="register_input w200 fl mr20"  vld="{required:true}"/></td>
                        <td><span class="gray">再次输入相同密码</span></td>
                    </tr>
                    <tr>
                        <td height="45" width="200" align="right">验证码：</td>
                        <td colspan="2"><input type="text" name="checkcode"  class="register_input w200 fl mr20" vld="{required:true}"/>
                            <img src="picture/checkcode.svl" height="40" class="fl" id="checkcode" onclick="$('#checkcode').attr('src','/checkcode.svl?d'+new Date()*1);"/>
                            <a href="javascript:void(0);" style="line-height:30px;" onclick="$('#checkcode').attr('src','/checkcode.svl?d'+new Date()*1);return false">看不清，换一张 </a>
                        </td>
                    </tr>
                    <tr>
                        <td height="45" width="200" align="right">&nbsp;</td>
                        <td colspan="2">
                            <input type="checkbox" id="contract" name="contract" checked="checked"/>
                            <a href="javascript:void(0);" onclick="window.open('treaty.jspx','','height=600,width=600,scrollbars=1');" class="xieyi">已阅读并接受《 叮当网上书城 》</a></td>
                    </tr>
                    <tr>
                        <td height="50" width="200" align="right">&nbsp;</td>
                        <td colspan="2"><input type="button" onclick="onSubmit();" value="注册" class="ss_button w200"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<div class="clear"></div>
<div class="Footer">
    <div class="footer-icon">
        <div class="w">
            <a href="/baozhang/14.htm" target="_blank" class="icon-map">
                <p class="icon-bg i1"></p>
                <p class="icon-title">100%正品</p>
            </a>
            <a href="/baozhang/15.htm" target="_blank" class="icon-map">
                <p class="icon-bg i2"></p>
                <p class="icon-title">双重质检</p>
            </a>
            <a href="/baozhang/16.htm" target="_blank" class="icon-map">
                <p class="icon-bg i3"></p>
                <p class="icon-title">全球化采购</p>
            </a>
            <a href="/baozhang/17.htm" target="_blank" class="icon-map">
                <p class="icon-bg i4"></p>
                <p class="icon-title">无理由退货</p>
            </a>
            <a href="/baozhang/18.htm" target="_blank" class="icon-map">
                <p class="icon-bg i5"></p>
                <p class="icon-title">贵就赔</p>
            </a>
            <a href="/baozhang/19.htm" target="_blank" class="icon-map">
                <p class="icon-bg i6"></p>
                <p class="icon-title">万千口碑</p>
            </a>
        </div>
    </div>

    <!-- 帮助中心栏目start -->
    <div class="Footer-block pt20 pb20 ctr cf">
        <ul class="Sitemap fl cf">
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="/xsrm/index.htm">新手入门</a>
                </h4>
                <ul>
                    <li><a href="/xsrm/1.htm" class="track2" target="_blank">积分说明</a></li>
                    <li><a href="/xsrm/2.htm" class="track2" target="_blank">购买流程</a></li>
                    <li><a href="/xsrm/3.htm" class="track2" target="_blank">账户注册</a></li>
                    <li><a href="/xsrm/4.htm" class="track2" target="_blank">大宗购物</a></li>
                </ul>
            </li>
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="/wzgg/index.htm">网站公告</a>
                </h4>
                <ul>
                    <li><a href="/wzgg/5.htm" class="track2" target="_blank">最新商品</a></li>
                </ul>
            </li>
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="/news/index.htm">新闻中心</a>
                </h4>
                <ul>
                    <li><a href="/news/6.htm" class="track2" target="_blank">jspgou v5.0即将发布</a></li>
                </ul>
            </li>
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="/remen/index.htm">热门促销</a>
                </h4>
                <ul>
                    <li><a href="/remen/7.htm" class="track2" target="_blank">热门促销</a></li>
                </ul>
            </li>
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="/ps/index.htm">配送范围及时间</a>
                </h4>
                <ul>
                    <li><a href="/ps/8.htm" class="track2" target="_blank">订单拆分</a></li>
                    <li><a href="/ps/9.htm" class="track2" target="_blank">海外配送</a></li>
                    <li><a href="/ps/10.htm" class="track2" target="_blank">国内配送</a></li>
                </ul>
            </li>
        </ul>
        <div class="QR fl">
            <img class="QR-img" src="picture/jspgou-wx_5.jpg" >
        </div>
    </div>
    <!-- 帮助中心栏目 end-->

    <div class="Copyright">
        <div class="ctr tac">
            <a href="/dilan/20.htm"target="_blank">关于JSPGOU</a> |
            <a href="/dilan/21.htm"target="_blank">最新资讯</a> |
            <a href="/dilan/22.htm"target="_blank">帮助中心</a> |
            <a href="/dilan/23.htm"target="_blank">隐私保护</a> |
            <a href="/dilan/24.htm"target="_blank">网站导航</a> |
            <a href="/dilan/25.htm"target="_blank">联系我们</a>
        </div>
        <div class="ctr tac">Copyright © JSPGOU 2017，All Rights Reserved</div>
    </div>
</div></body>
</html>

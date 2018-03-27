<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/3/27
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会员登录页</title>
    <link href="${pageContext.request.contextPath}/css/index_6.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/member_3.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/login.css" type="text/css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery_4.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            $("#jvForm").validate();
        });
    </script>
</head>

<body style="background:#fff;">
<div class="Header">
    <div class="ctr pr">
        <a href="/" title="返回单店首页">
            <img src="picture/logo_6.jpg" width="158" height="58" class="Logo" />
        </a>
    </div>
</div>

<div style="width:1000px; margin:auto auto 30px auto; overflow:hidden;">
    <img src="picture/login_pic.jpg" class="fl" />
    <div class="fr">
        <form action="${pageContext.request.contextPath}/checkLogin" method="post">
            <div style="line-height:30px;">

                <input type="hidden" name="returnUrl" value="/"/>
            </div>

            <div style="border:2px solid #e7e7e7; width:390px; height:390px; margin-top:30px;">

                <table width="335" border="0" align="center" cellpadding="2" cellspacing="0" style="margin:auto;">
                    <tr>
                        <td height="70">
                            <div class="fl" style="font-size:18px; color:#484848; font-family:微软雅黑;">账户登录</div>
                            <a href="/register.jspx" style="color:#cf1e1e; font-size:14px;" class="fr">免费注册</a>
                        </td>
                    </tr>
                    <tr>
                        <td height="75" >
                            <input type="text" name="username" id="username" class="loginInput"  required="true"  placeholder="用户名" />
                        </td>
                    </tr>
                    <tr>
                        <td height="75">
                            <input type="password" name="password" id="" class="loginInput" placeholder="密码" />
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            <a href="/forgot_password.jspx" target="_blank" class="fr">忘记密码</a>
                        </td>
                    </tr>

                    <tr>
                        <td height="75" >
                            <input type="submit" value="登 录" style="width:100%; height:45px; text-align:center; color:#fff; background:#AF0000; cursor:pointer; border:0; font-size:16px;border-radius:4px;"/>
                        </td>
                    </tr>
                </table>


                <div class="quick">

                    <div class="quick-list clearfix">
                        <a class="quick-qq" id="qqLoginBtn" title="用QQ账号登录"></a>
                        <script type="text/javascript" src="js/qc_loader.js" data-appid="323432" data-redirecturi="http://demo3.jeecms.com/public_auth.jspx" charset="utf-8"></script>
                        <script type="text/javascript">
                            //插入按钮的节点qqLoginBtn id
                            QC.Login({btnId:"qqLoginBtn",size: "A_M"}, function(reqData, opts){//登录成功
                                //根据返回数据，更换按钮显示状态方法
                                var dom = document.getElementById(opts['btnId']),
                                    _logoutTemplate=[
                                        //头像
                                        //   '<span><img src="picture/2a08def0992a4470a3d72af094614e06.gif" class="{size_key}"/></span>',
                                        //昵称
                                        '<span>{nickname!}</span>',
                                        //退出
                                        '<span><a href="javascript:QC.Login.signOut();">退出</a></span>'
                                    ].join("");
                                dom && (dom.innerHTML = QC.String.format(_logoutTemplate, {
                                    nickname : QC.String.escHTML(reqData.nickname), //做xss过滤
                                    figureurl : reqData.figureurl
                                }));
                                var userId=null;
                                if(QC.Login.check()&&userId==null){
                                    QC.Login.signOut();
                                }
                            });
                        </script>

                        <a class="quick-weChat" onclick="EV_modeAlert('envon')" title="微信帐号登陆"></a>
                        <script src="js/modealert.js" type="text/javascript"></script>
                        <script src="js/wxlogin.js"></script>	<!-- 二维码微信登录JS	 -->
                        <div id="envon" style="width:300px; background-color:#FFFFFF; border:1px solid #000000; padding:20px; overflow:hidden; display:none;">
                            <p>
                            <div style="width:100%;text-align:right; font-family:微软雅黑;"><a href="javascript:EV_closeAlert()">关闭</a> </div>
                            <div id="login_container" style="background: #fff;"></div>
                            </p>
                        </div>
                        <script type="text/javascript">
                            function generateMixed(n) {
                                var chars = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
                                var res = "";
                                for(var i = 0; i < n ; i ++) {
                                    var id = Math.ceil(Math.random()*35);
                                    res += chars[id];
                                }
                                return res;
                            }
                            var obj = new WxLogin({
                                id:"login_container",
                                appid: "wx797f3f026a9fbe5b", //公众号的唯一标识
                                scope: "snsapi_login",     // 应用授权作用域，，网页应用目前仅填写snsapi_login
                                redirect_uri: "/public_wechat_login.jspx",	//重定向地址，需要进行UrlEncode（前面认证网页应用中获得）
                                state: generateMixed(10),	//用于保持请求和回调的状态，授权请求后原样带回给第三方。该参数可用于防止csrf攻击（跨站请求伪造攻击），建议第三方带上该参数，可设置为简单的随机数加session进行校验
                                style: "black",
                                href: ""
                            });
                        </script>
                        <a class="quick-sina" id="wb_connect_btn" title="用新浪微博账号登录"></a>
                        <script src="js/wb.js" type="text/javascript" charset="utf-8"></script>
                        <script type="text/javascript">
                            WB2.anyWhere(function(W){
                                W.widget.connectButton({
                                    id: "wb_connect_btn",
                                    type: '3,2',
                                    callback : {
                                        login:function(o){
                                            //登录成功之后执行
                                            location="/public_auth.jspx?screen_name="+o.screen_name;
                                        },
                                        logout:function(){
                                            //退出之后执行退出本地用户
                                            location="/logout.jspx?returnUrl=/";
                                        }
                                    }
                                });
                            });
                        </script>
                    </div>
                </div>

            </div>
        </form>
    </div>
</div>

<div class="Copyright clear" style="background:#fff;">
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
</body>
</html>

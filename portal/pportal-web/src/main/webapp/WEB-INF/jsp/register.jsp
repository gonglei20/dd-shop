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
    <title>用户注册 - jeegou开发站- Powered by JSPGOU</title>
    <link href="${pageContext.request.contextPath}/css/index_5.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/member_2.css" type="text/css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery_3.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            $("#jvForm").validate();
        });
        function onSubmit(){
            if(!$("#contract").attr("checked")==true){
                alert("请阅读注册协议!");
                return ;
            }
            $("#jvForm").submit();
        }
    </script>
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
<!--<div class="Header">
    <div class="ctr pr">
        <a href="/"><div class="Logo">
            <img src="picture/logo_5.jpg" width="158" height="58" />
        </div></a>
        <form class="Search"  id="searchForm" action="/search.jspx">
            <input id="search_form_input" class="Search-input zi2" type="text"
                   name="q" id="q" value="请输入关键词" type="text"
                   onfocus="if(this.value=='请输入关键词')this.value=''"
                   onblur="if(this.value=='')this.value='请输入关键词'">
            <input class="Search-submit" value="搜索" onclick="sousuo();"  type="button">
        </form>
        <div class="Search-hot">
            <a id="请输入关键词" onclick="parssKey(this);" class="gray">请输入关键词</a>
            <a id="手机" onclick="parssKey(this);" class="gray">手机</a>
            <a id="数码" onclick="parssKey(this);" class="gray">数码</a>
            <a id="" onclick="parssKey(this);" class="gray"></a>
            <a id="日用百货" onclick="parssKey(this);" class="gray">日用百货</a>
            <a id="1" onclick="parssKey(this);" class="gray">1</a>

        </div>
        <script type="text/javascript">
            function parssKey(o) {
                var v = o.id;
                $("#q").val(v);
                document.getElementById("searchForm").submit();
            }

            function sousuo(){

                var a=$("input[name='q']").val();
                if(a=="请输入关键词"){
                    alert("亲！请输入关键词");
                }else{
                    document.getElementById("searchForm").submit();

                }
            }


        </script>
        <div class="top_shopping">
            <i></i>
            <a href="/cart/shopping_cart.jspx">我的购物车(<span id="cart_total_items"></span>) </a>
        </div>

        <script type="text/javascript">
            $('#cart_total_items').html(Shop.cartTotalItems());
        </script>
    </div>
</div>-->
<!--商品类目栏 begin  -->
<!--<div class="Nav">
    <ul class="ctr cf pr">
        <li id="nav_category"
            class="Nav-item Nav-category fl zi6 ">
            <!--  <h2 class="tac">全部商品分类</h2>
            <ul class="Nav-catelist">
                <li class="Nav-catelist-item even">
                    <ul class="Nav-cate-sublist">

                        <li><a target="_blank" href="/shouji/index.htm">手机</a></li>
                        <li><a target="_blank" href="/bjb/index.htm">笔记本</a></li>
                        <li><a target="_blank" href="/tsj/index.htm">电脑整机</a></li>


                        <ul class="Nav-cate-detail">
                            <div class="list">
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/shouji/index.htm">手机</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/sanxing/index.htm">三星</a></li>
                                        <li><a target="_blank" href="/Iphone/index.htm">苹果</a></li>
                                        <li><a target="_blank" href="/huawei/index.htm">华为</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/bjb/index.htm">笔记本</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/lenovo/index.htm">联想</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/tsj/index.htm">电脑整机</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/ipad/index.htm">平板电脑</a></li>
                                        <li><a target="_blank" href="/taishiji/index.htm">台式机</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/bg/index.htm">办公</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/wenju/index.htm">文具</a></li>
                                        <li><a target="_blank" href="/dayinji/index.htm">打印机</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/xj/index.htm">摄影摄像</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/xiangji/index.htm">相机</a></li>
                                        <li><a target="_blank" href="/danfan/index.htm">单反</a></li>
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </ul>
                </li>
                <li class="Nav-catelist-item even">
                    <ul class="Nav-cate-sublist">

                        <li><a target="_blank" href="/woman/index.htm">女装</a></li>
                        <li><a target="_blank" href="/man/index.htm">男装</a></li>
                        <li><a target="_blank" href="/child/index.htm">童装</a></li>


                        <ul class="Nav-cate-detail">
                            <div class="list">
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/woman/index.htm">女装</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/langmanqunzhuang/index.htm">浪漫裙装</a></li>
                                        <li><a target="_blank" href="/jiagxuanshangzhuang/index.htm">精选上装</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/man/index.htm">男装</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/nanshiwantao/index.htm">男士外套</a></li>
                                        <li><a target="_blank" href="/nanshikuzhuang/index.htm">男士裤装</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/child/index.htm">童装</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/qinzizhuang/index.htm">亲子装</a></li>
                                        <li><a target="_blank" href="/taozhuang/index.htm">套装</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/neiyi/index.htm">内衣</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/kuzi/index.htm">裤子</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </ul>
                </li>
                <li class="Nav-catelist-item even">
                    <ul class="Nav-cate-sublist">

                        <li><a target="_blank" href="/nvbao/index.htm">女包</a></li>
                        <li><a target="_blank" href="/nanxie/index.htm">男鞋</a></li>
                        <li><a target="_blank" href="/tongxie/index.htm">童鞋</a></li>


                        <ul class="Nav-cate-detail">
                            <div class="list">
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/nvbao/index.htm">女包</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/danjianbao/index.htm">单肩包</a></li>
                                        <li><a target="_blank" href="/shuangjianbao/index.htm">双肩包</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/nanxie/index.htm">男鞋</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/xiuxianpixie/index.htm">休闲皮鞋</a></li>
                                        <li><a target="_blank" href="/banxie/index.htm">板鞋</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/tongxie/index.htm">童鞋</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/nvxie/index.htm">女鞋</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/nanbao/index.htm">男包</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </ul>
                </li>
                <li class="Nav-catelist-item even">
                    <ul class="Nav-cate-sublist">

                        <li><a target="_blank" href="/shenghuodianqi/index.htm">生活电器</a></li>


                        <ul class="Nav-cate-detail">
                            <div class="list">
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/shenghuodianqi/index.htm">生活电器</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/pingbandianshi/index.htm">平板电视</a></li>
                                        <li><a target="_blank" href="/kongtiao/index.htm">空调</a></li>
                                        <li><a target="_blank" href="/xiyiji/index.htm">洗衣机</a></li>
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </ul>
                </li>
                <li class="Nav-catelist-item even">
                    <ul class="Nav-cate-sublist">

                        <li><a target="_blank" href="/wujingongju/index.htm">五金工具</a></li>
                        <li><a target="_blank" href="/woshijiaj/index.htm">卧室家具</a></li>


                        <ul class="Nav-cate-detail">
                            <div class="list">
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/wujingongju/index.htm">五金工具</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/kaiguanchazuo/index.htm">开关插座</a></li>
                                        <li><a target="_blank" href="/gongjuxiang/index.htm">工具箱</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/woshijiaj/index.htm">卧室家具</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/chuang/index.htm">床</a></li>
                                        <li><a target="_blank" href="/yigui/index.htm">衣柜</a></li>
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </ul>
                </li>
                <li class="Nav-catelist-item even">
                    <ul class="Nav-cate-sublist">

                        <li><a target="_blank" href="/huangjinshoushi/index.htm">黄金首饰</a></li>
                        <li><a target="_blank" href="/zuanshi/index.htm">钻石彩宝</a></li>
                        <li><a target="_blank" href="/wanbiao/index.htm">腕表</a></li>


                        <ul class="Nav-cate-detail">
                            <div class="list">
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/huangjinshoushi/index.htm">黄金首饰</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/huangjinxianglian/index.htm">黄金项链</a></li>
                                        <li><a target="_blank" href="/zujinshipin/index.htm">足金饰品</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/zuanshi/index.htm">钻石彩宝</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/jiehunzuanjie/index.htm">结婚钻戒</a></li>
                                        <li><a target="_blank" href="/zuanshiershi/index.htm">钻石耳饰</a></li>
                                    </ul>
                                </li>
                                <li class="cf">
                                    <h4 class="fl" >

                                        <a target="_blank" class="nav-menu-subs" href="/wanbiao/index.htm">腕表</a>
                                    </h4>
                                    <ul class="Nav-cate-detail-list">
                                        <li><a target="_blank" href="/ruishimingbiao/index.htm">瑞士名表</a></li>
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </ul>
                </li>
            </ul>
        </li>

        导航栏 begin
        <li class="Nav-item fl first active"><a href="/"   id="nav0" onmouseover="jte(this,0)">首页</a></li>
        <input type="hidden" id="hidden1" value="6"></input>
        <li class="Nav-item fl"> <a href="/shuma/index.htm"  id="nav1" class="white"  onmouseover="jte(this,6)">数码</a></li>
        <input type="hidden" id="hidden2" value="6"></input>
        <li class="Nav-item fl"> <a href="/fuzhuang/index.htm"  id="nav2" class="white"  onmouseover="jte(this,6)">服装</a></li>
        <input type="hidden" id="hidden3" value="6"></input>
        <li class="Nav-item fl"> <a href="/xiebao/index.htm"  id="nav3" class="white"  onmouseover="jte(this,6)">鞋包配饰</a></li>
        <input type="hidden" id="hidden4" value="6"></input>
        <li class="Nav-item fl"> <a href="/riyongbaihuo/index.htm"  id="nav4" class="white"  onmouseover="jte(this,6)">日用百货</a></li>
        <input type="hidden" id="hidden5" value="6"></input>
        <li class="Nav-item fl"> <a href="/jiajujiancai/index.htm"  id="nav5" class="white"  onmouseover="jte(this,6)">家居建材</a></li>
        <input type="hidden" id="hidden6" value="6"></input>
        <li class="Nav-item fl"> <a href="/zhubaoshoubiao/index.htm"  id="nav6" class="white"  onmouseover="jte(this,6)">珠宝手表</a></li>


        <script type="text/javascript">
            function jte(obj,n){
                obj.className="current";
                var t;
                var id;
                var s;
                if(n!=0){
                    for(var i=0;i<=n;i++){
                        id ="nav"+i;
                        t = document.getElementById(id);
                        if(id != obj.id){
                            t.className="white";
                        }
                    }
                }else{
                    n=document.getElementById("hidden1").value;
                    for(var i=0;i<=n;i++){
                        id ="nav"+i;
                        t = document.getElementById(id);
                        if(id != obj.id){
                            t.className="white";
                        }
                    }
                }
            }
        </script>

        <!--导航栏 end
    </ul>
</div>-->
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
                        <td><span class="gray">输入有效邮箱地址并成功激活，可用此邮箱做为登录账号及找回密码</span></td>
                    </tr>
                    <tr>
                        <td height="45" width="200" align="right">密码：</td>
                        <td><input name="password" type="password" class="register_input w200 fl mr20" id="password" vld="{required:true,rangelength:[6,32]}" /></td>
                        <td><span class="gray">6－20位字符，可由大小写英文、数字或符号组成 </span></td>
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
                            <a href="javascript:void(0);" onclick="window.open('treaty.jspx','','height=600,width=600,scrollbars=1');" class="xieyi">已阅读并接受《 JSPGOU协议 》</a></td>
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

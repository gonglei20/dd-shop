<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hang1
  Date: 2018/4/20
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>会员信息修改页 - jeegou开发站- Powered by JSPGOU</title>
    <link href="css/index_2.css" type="text/css" rel="stylesheet" />
    <link href="css/member_1.css" type="text/css" rel="stylesheet" />
    <script src="js/jquery_2.js" type="text/javascript"></script>
    <script src="js/wdatepicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        function g(o){
            return document.getElementById(o);
        }
        $(function() {
            $("#jvForm").validate();
            $("#jvForm1").validate();
            $("#jvForm2").validate();
        });
        function HoverLi(m,n,counter){
            for(var i=1;i<=counter;i++){
                g('tb_'+m+i).className='normaltab';
                g('tbc_'+m+i).className='undis';
            }
            g('tbc_'+m+n).className='dis';
            g('tb_'+m+n).className='curr';
        }
        function checkJvForm(){
            var mobile=$("#mobile").val();
            if(mobile==null||mobile==""){
                $("#checkmobile").html("请输入您的手机号码");
            }else if(mobile.length != 11 || !/^[0-9]+$/.test(mobile)) {
                message = "您输入的格式有误，请重新输入您的手机号码。";
                $("#checkmobile").html(message);
                return;
            }else{
                $("#checkmobile").html("");
            }

            var flag=false;
            $("input[name='userDegreeId']").each(function(){
                if(this.checked){flag=true;}
            });
            if(!flag){
                $("#checkUserDegreeId").html("请勾选所属身份！");
                return;
            }else{
                $("#checkUserDegreeId").html("");
            }

            var incomeDescId=$("#incomeDescId").val();
            if(incomeDescId==null|| incomeDescId==""){
                $("#checkIncomeDescId").html("请选择个人收入状况");
                return;
            }else{
                $("#checkIncomeDescId").html("");
            }

            var flagcar=false;
            $("input[name='isCar']").each(function(){
                if(this.checked){flagcar=true;}
            });
            if(!flagcar){
                $("#checkIsCar").html("请勾选是否有车！");
                return;
            }else{
                $("#checkIsCar").html("");
            }

            $("#jvForm").submit();
        }

        function checkJvForm1(){
            var flag=false;

            var workSeniorityId=$("#workSeniorityId").val();
            if(workSeniorityId==null|| workSeniorityId==""){
                $("#checkWorkSeniorityId").html("请勾选工作年限！");
                return;
            }else{
                $("#checkWorkSeniorityId").html("");
            }

            var flagwork=false;
            $("input[name='degreeId']").each(function(){
                if(this.checked){flagwork=true;}
            });
            if(!flagwork){
                $("#checkDegreeId").html("请选择个人教育程度");
                return;
            }else{
                $("#checkDegreeId").html("");
            }

            $("#jvForm1").submit();
        }
        function checkJvForm2(){
            $("#jvForm2").submit();
        }

    </script>
</head>
<body>
<div id="Topbar" class="Topbar">
    <div class="ctr cf">
        <ul class="Topbar-menu fr">
            <li class="Topbar-menu-item ib"><a href="/order/myorder.jspx">我的个人中心</a></li>
            <li class="Topbar-menu-item ib"><a href="/collect/mycollect.jspx">收藏夹</a></li>
            </li>
        </ul>
        <ul class="Topbar-welcome fl" id="top_user_bar">
            <li class="Topbar-welcome-item">Hi,<font color="red">${user.username} </font>欢迎来到叮当书城</li>
            <c:if test="${user.username==null}">
                <li class="Topbar-welcome-item"><a href="${pageContext.request.contextPath}/login">登录</a></li>
                <li class="Topbar-welcome-item"><a href="${pageContext.request.contextPath}/register">注册</a></li>
            </c:if>
            <c:if test="${user.username!=null}">
                <li class="Topbar-welcome-item"><a onclick="logout()" href="javascript:void(0)">退出登录</a></li>
            </c:if>
        </ul>



    </div>
</div>

<script type="text/javascript">
    console.log(1);
    localStorage.setItem("sessionKey",'6ce3c7a001ae066744ec2dfc6dd2f4b14bc468c6d52a175f085d682bbd70b72799196cfda23eede19412a78d9b6dea41');
    localStorage.setItem("userName", 'test1');
</script><script src="js/jquery_2.js" type="text/javascript"></script>
<div class="Header">
    <div class="ctr pr">
        <a href="/"><div class="Logo">
            <img src="picture/logo_2.jpg" width="158" height="58" />
        </div></a>
        <form class="Search"  id="searchForm" action="/search.jspx">
            <input id="search_form_input" class="Search-input zi2" type="text"
                   name="q" id="q" value="请输入关键词" type="text"
                   onfocus="if(this.value=='请输入关键词')this.value=''"
                   onblur="if(this.value=='')this.value='请输入关键词'">
            <input class="Search-submit" value="搜索" onclick="sousuo();"  type="button">
        </form>
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
                    var keyWord = $("input[name='q']").val()
                    //alert(keyWord);
                    location.href="${pageContext.request.contextPath}/findSearch?bname="+keyWord;
                    // document.getElementById("searchForm").submit();

                }
            }


        </script>
        <div class="top_shopping">
            <i></i>
            <a href="/cart/shopping_cart.jspx">我的购物车</a>
        </div>

        <script type="text/javascript">
            $('#cart_total_items').html(Shop.cartTotalItems());
        </script>
    </div>
</div><!--商品类目栏 begin  -->
<div class="Nav">
    <ul class="ctr cf pr">
        <li id="nav_category"
            class="Nav-item Nav-category fl zi6 ">
            <!--  <h2 class="tac">全部商品分类</h2>-->
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

        <!--导航栏 begin -->
        <li class="Nav-item fl first active"><a href="${pageContext.request.contextPath}/index" >首页</a></li>
        <input type="hidden" id="hidden1" value="6"></input>
        <li class="Nav-item fl"> <a href="${pageContext.request.contextPath}/cat?pid=1"   id="nav1">计算机类</a></li>
        <input type="hidden" id="hidden2" value="6"></input>
        <li class="Nav-item fl"> <a href="${pageContext.request.contextPath}/cat?pid=2"  id="nav2">小说类</a></li>
        <input type="hidden" id="hidden3" value="6"></input>
        <li class="Nav-item fl"> <a href="${pageContext.request.contextPath}/cat?pid=3"  id="nav3">生活类</a></li>
        <input type="hidden" id="hidden1" value="6"></input>
        <li class="Nav-item fl"> <a href="${pageContext.request.contextPath}/cat?pid=4"   id="nav1">教辅类</a></li>
        <input type="hidden" id="hidden1" value="6"></input>
        <li class="Nav-item fl"> <a href="${pageContext.request.contextPath}/cat?pid=5"   id="nav1">励志类</a></li>
        <input type="hidden" id="hidden2" value="6"></input>
        <li class="Nav-item fl"> <a href="${pageContext.request.contextPath}/cat?pid=6"  id="nav2">科技类</a></li>
        <input type="hidden" id="hidden3" value="6"></input>
        <li class="Nav-item fl"> <a href="${pageContext.request.contextPath}/cat?pid=7"  id="nav3">儿童类</a></li>
        <!--导航栏 end -->

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

        <!--导航栏 end -->
    </ul>
</div>
<!--商品类目栏 end  --><div class="user-page-content">
    <div class="clearfix w">
        <script type="text/javascript">
            var productIds = HistoryRecord.record();
            function g(o){
                return document.getElementById(o);
            }

            function HoverLiGuide(m,n,counter){
                for(var i=1;i<=counter;i++){
                    g('tbg_'+m+i).className='';
                }
                g('tbg_'+m+n).className='current';
            }
            function displayed(i){
                $("#ul"+i).toggle();
                if($("#ss"+i).attr("class")=="user_ss"){
                    $("#ss"+i).attr("class","user_tt");
                }else{
                    $("#ss"+i).attr("class","user_ss");
                }
            }
        </script>

        <div class="user_menu">
            <div class="navs" id="JS_u_navs">
                <div id="ss1" onclick="displayed(1);"><h3><span class="s1"></span>订单中心</h3></div>
                <ul id="ul1">
                    <li class="current" id="tbg_11" onclick="HoverLiGuide(1,1,13);"><a href="/order/myorder.jspx">我的订单</a></li>

                    <li class="sep" id="tbg_13" onclick="HoverLiGuide(1,3,13);"><a href="/order/myReturnOrder.jspx">退货订单</a></li>
                    <li class="sep" id="tbg_14" onclick="HoverLiGuide(1,4,13);"><a href="/collect/mycollect.jspx">我的收藏</a></li>
                    <li  id="tbg_144" onclick="HoverLiGuide(1,44,13);">
                        <a href="/member/message_mng.jspx?cl=tbg_144">站内信息</a>
                    </li>
                    <li class="sep" id="tbg_15" onclick="HoverLiGuide(1,5,13);"><a href="/myCoupon.jspx">我的优惠卷</a></li>
                </ul>

                <div id="ss2" onclick="displayed(2);"><h4><span class="s2"></span>账户管理</h4></div>
                <ul id="ul2">
                    <li class="sep" id="tbg_16" onclick="HoverLiGuide(1,6,13);"><a href="/shopScore/myscore.jspx">我的积分</a></li>
                    <li class="sep" id="tbg_17" onclick="HoverLiGuide(1,7,13);"><a href="/shopScore/exchange.jspx">积分兑换</a></li>
                    <li class="sep" id="tbg_18" onclick="HoverLiGuide(1,8,13);"><a href="/shopMoney/mymoney.jspx">账户余额</a></li>
                    <li class="sep" id="tbg_19" onclick="HoverLiGuide(1,9,13);"><a href="/shopMemberAddress/address_list.jspx">收货地址</a></li>
                    <li class="sep" id="tbg_110" onclick="HoverLiGuide(1,10,13);"><a href="/shopMember/profile.jspx">个人资料</a></li>
                    <li class="sep" id="tbg_111" onclick="HoverLiGuide(1,11,13);"><a href="/shopMember/pwd.jspx">密码管理</a></li>
                </ul>

                <div id="ss3" onclick="displayed(3);"><h5><span class="s3"></span>服务与评价</h5></div>
                <ul id="ul3">
                    <li class="sep" id="tbg_112" onclick="HoverLiGuide(1,11,12);"><a href="/my_discuss.jspx">商品评论</a></li>
                    <li class="sep" id="tbg_113" onclick="HoverLiGuide(1,12,12);"><a href="/my_cousult.jspx">购买咨询</a></li>
                </ul>
            </div>
        </div>
        <script type="text/javascript">
            function checkClass(o){
                o.className="current1";
            }
        </script>        <div class="user_main">
        <div class="content-one content-hei">
            <div class="user_title">
                个人资料

            </div>
            <div class="clear"></div>
            <div style="overflow:hidden; padding:10px; margin:auto; width:95%;">
                <div class="user_photo fl">
                    <div class="photo_img">
                        <a href="/shopMember/portrait.jspx">
                            <img src="picture/12114302oqni.jpg" width="90" height="90" />
                        </a>
                    </div>
                </div>
                <div class="user_xinxi fr">
                    <p>
                        <span style="color:#010000;"><strong>${user.username}</strong></span>
                    </p>
                    <p style="color:#666; font-size:12px;">上次登录时间：2018-04-20 12:26:08</p>
                    <p style="color:#666; font-size:12px;">
                        今年已消费：<span style="color:#eb0e22;"><b>￥0</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        账户余额：<span style="color:#eb0e22;"><b>￥0</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        我的积分：<span style="color:#eb0e22;"><b>3000</b></span>分
                    </p>
                </div>
            </div>
            <div class="clear" style="height:30px;"></div>


            <div class="ysppm">
                <ul>
                    <li class="curr" id="tb_11" onclick="HoverLi(1,1,3);">个人信息</li>
                   <%-- <li class="normaltab" id="tb_12" onclick="HoverLi(1,2,3);">更多个人信息</li>
                    <li class="normaltab" id="tb_13" onclick="HoverLi(1,3,3);">兴趣爱好</li>--%>
                </ul>
            </div>
            <div class="mc_content">
                <div id="tbc_11" class="dis">
                    <form id="jvForm" action="/shopMember/profile.jspx" method="post">

                        <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0">
                            <tr>
                                <td width="150" height="40" align="right">用户名：</td>
                                <td>${user.username}</td>
                            </tr>
                            <tr>
                                <td height="40" align="right">
                                    <font color="red">*</font>邮箱 ：</td>
                                <td>&nbsp;<input type="text" id="email" name="email" value="${user.email}" class="ss_input required email" /></td>
                            </tr>
                            <tr>
                                <td height="40" align="right">
                                    <font color="red">*</font>真实姓名：</td>
                                <td>&nbsp;<input type="text" id="realName" name="realName" value="${user.realName}" class="ss_input required" /></td>
                            </tr>
                            <tr>
                                <td height="40" align="right">
                                    <font color="red">*</font>手机：</td>
                                <td>&nbsp;<input type="text" id="mobile" name="mobile" value="${user.mobile}" class="ss_input required digits"/>
                                    <font color="red"> <span id="checkmobile"></span></font>
                                </td>
                            </tr>
                            <tr>
                                <td height="40" align="right">
                                    <font color="red">*</font>性别：</td>
                                <td>
                                    <c:if test="${user.gender.equals('男')}">
                                    &nbsp;&nbsp;<input type="radio" name="gender" value="男" checked />男&nbsp;&nbsp;
                                    </c:if>
                                    <c:if test="${user.gender.equals('女')}">
                                        &nbsp;&nbsp;<input type="radio" name="gender" value="女" checked />女&nbsp;&nbsp;
                                    </c:if>
                                    <%--<input type="radio" name="gender" value="false"  checked  />女--%>
                                </td>
                            </tr>
                            <tr>
                                <td height="40" align="right">
                                    <font color="red">*</font>生日：</td>
                                <td>&nbsp;<input type="text" name="birthday" value="${user.birthday}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="time_input required" style="width:100px;"/></td>
                            </tr>
                            <tr>
                                <td height="40" align="right"> 您的地址：</td>
                                <td>&nbsp;<input type="text" id="address" name="address" value="${user.address}" class="ss_input" style="width:600px;" /></td>
                            </tr>

                            <tr>
                                <td height="50">&nbsp;</td>
                                <td>
                                    <input type="hidden" name="id" value="9"/>
                                    <input type="button" value="提交" onclick="checkJvForm();" class="ss_button"/>
                                    &nbsp; <input type="reset" value="重置" class="no_button"/>
                                    <input type="hidden" name="backUrl" value="http://demo3.jeecms.com/shopMember/profile.jspx"/></td>
                            </tr>
                        </table>
                    </form>
                </div>

               <%-- <div id="tbc_12" class="undis">
                    <form id="jvForm1" action="/shopMember/profile.jspx" method="post">
                        <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0">
                            <tr>
                                <td width="150" height="40" align="right">单位名称：</td>
                                <td><input type="text" id="company" name="company" value="jjjjjjjj" class="ss_input"  /></td>
                            </tr>

                            <tr>
                                <td height="40" align="right">职位：</td>
                                <td>
                                    <input type="text" name="position" value="hhhhhhhhhh" class="ss_input"/>
                                    &nbsp;&nbsp;例如：一般员工 经理 总监 CEO
                                </td>
                            </tr>
                            <tr>
                                <td height="40" align="right">
                                    <font color="red">*</font>工作年限：</td>
                                <td>
                                    <select name="workSeniorityId" id="workSeniorityId" class="ss_input">
                                        <option value="">--请选择--</option>
                                        <option value="22"
                                                selected
                                        >1年</option>
                                        <option value="23"

                                        >2年</option>
                                        <option value="24"

                                        >3年</option>
                                        <option value="25"

                                        >4年以上</option>
                                    </select>
                                    <font color="red"><span id="checkWorkSeniorityId"></span></font>
                                </td>
                            </tr>
                            <tr>
                                <td height="40" align="right">
                                    <font color="red">*</font>教育程度：</td>
                                <td>
                                    <input type="radio" name="degreeId" id="degreeId" value="16"
                                    />高中以下&nbsp;
                                    <input type="radio" name="degreeId" id="degreeId" value="17"
                                           checked/>中专&nbsp;
                                    <input type="radio" name="degreeId" id="degreeId" value="18"
                                    />大专&nbsp;
                                    <input type="radio" name="degreeId" id="degreeId" value="19"
                                    />本科&nbsp;
                                    <input type="radio" name="degreeId" id="degreeId" value="20"
                                    />硕士&nbsp;
                                    <input type="radio" name="degreeId" id="degreeId" value="21"
                                    />博士&nbsp;
                                    <font color="red"><span id="checkDegreeId"></span></font>
                                </td>
                            </tr>
                            <tr>
                                <td height="40" align="right">毕业学校：</td>
                                <td><input type="text" name="schoolTag" id="schoolTag" value="oooo" class="ss_input"/></td>
                            </tr>
                            <tr>
                                <td height="40" align="right">毕业时间：</td>
                                <td><input type="text" name="schoolTagDate" id="schoolTagDate" value="2017-09-06" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="time_input" style="width:100px;"/></td>
                            </tr>
                            <tr>
                                <td height="40">&nbsp;</td>
                                <td>
                                    <input type="hidden" name="id" value="9"/>
                                    <input type="button" value="提交"  onclick="checkJvForm1();" class="ss_button"/>
                                    &nbsp; <input type="reset" value="重置" class="no_button"/>
                                    <input type="hidden" name="backUrl" value="http://demo3.jeecms.com/shopMember/profile.jspx"/></td>
                            </tr>
                        </table>
                    </form>
                </div>


                <div id="tbc_13" class="undis">
                    <form id="jvForm2" action="/shopMember/profile.jspx" method="post">
                        <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1">

                            <tr>
                                <td width="150" height="140" align="right">最喜爱的品牌：</td>
                                <td>
                                    <textarea cols="70" rows="5" name="favoriteBrand" class="ss_input"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td height="140" align="right">最喜爱的明星：</td>
                                <td>
                                    <textarea cols="70" rows="5" name="favoriteStar" class="ss_input"></textarea>
                                </td>
                            </tr>

                            <tr>
                                <td height="140" align="right"> 最喜爱的电影：</td>
                                <td>
                                    <textarea cols="70" rows="5" name="favoriteMovie" class="ss_input"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td height="140" align="right">
                                    最喜爱的人物：</td>
                                <td>
                                    <textarea cols="70" rows="5" name="favoritePersonage" class="ss_input"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td height="50">&nbsp;</td>
                                <td>
                                    <input type="hidden" name="id" value="9"/>
                                    &nbsp;<input type="button" value="提交" onclick="checkJvForm2();" class="ss_button"/>
                                    &nbsp; <input type="reset" value="重置" class="no_button"/>
                                    <input type="hidden" name="backUrl" value="http://demo3.jeecms.com/shopMember/profile.jspx"/></td>
                            </tr>--%>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>
<div class="clear"></div>
<div class="Footer">
    <div class="footer-icon">
        <div class="w">
            <a href="#" target="_blank" class="icon-map">
                <p class="icon-bg i1"></p>
                <p class="icon-title">100%正品</p>
            </a>
            <a href="#" target="_blank" class="icon-map">
                <p class="icon-bg i2"></p>
                <p class="icon-title">双重质检</p>
            </a>
            <a href="#" target="_blank" class="icon-map">
                <p class="icon-bg i3"></p>
                <p class="icon-title">全球化采购</p>
            </a>
            <a href="#" target="_blank" class="icon-map">
                <p class="icon-bg i4"></p>
                <p class="icon-title">无理由退货</p>
            </a>
            <a href="#" target="_blank" class="icon-map">
                <p class="icon-bg i5"></p>
                <p class="icon-title">贵就赔</p>
            </a>
            <a href="#" target="_blank" class="icon-map">
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
                    <a target="_blank" href="#">新手入门</a>
                </h4>
                <ul>
                    <li><a href="#" class="track2" target="_blank">积分说明</a></li>
                    <li><a href="#" class="track2" target="_blank">购买流程</a></li>
                    <li><a href="#" class="track2" target="_blank">账户注册</a></li>
                    <li><a href="#" class="track2" target="_blank">大宗购物</a></li>
                </ul>
            </li>
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="#">网站公告</a>
                </h4>
                <ul>
                    <li><a href="#" class="track2" target="_blank">最新商品</a></li>
                </ul>
            </li>
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="#">新闻中心</a>
                </h4>
                <ul>
                    <li><a href="#" class="track2" target="_blank">jspgou v5.0即将发布</a></li>
                </ul>
            </li>
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="#">热门促销</a>
                </h4>
                <ul>
                    <li><a href="#" class="track2" target="_blank">热门促销</a></li>
                </ul>
            </li>
            <li class="Sitemap-item fl">
                <h4>
                    <a target="_blank" href="/ps/index.htm">配送范围及时间</a>
                </h4>
                <ul>
                    <li><a href="#" class="track2" target="_blank">订单拆分</a></li>
                    <li><a href="#" class="track2" target="_blank">海外配送</a></li>
                    <li><a href="#" class="track2" target="_blank">国内配送</a></li>
                </ul>
            </li>
        </ul>
        <div class="QR fl">
            <img class="QR-img" src="picture/jspgou-wx_2.jpg" >
        </div>
    </div>
    <!-- 帮助中心栏目 end-->

    <div class="Copyright">
        <div class="ctr tac">
            <a href="#"target="_blank">关于叮当</a> |
            <a href="#"target="_blank">最新资讯</a> |
            <a href="#"target="_blank">帮助中心</a> |
            <a href="#"target="_blank">隐私保护</a> |
            <a href="#"target="_blank">网站导航</a> |
            <a href="#"target="_blank">联系我们</a>
        </div>
        <div class="ctr tac">Copyright © JSPGOU 2017，All Rights Reserved</div>
    </div>
</div></body>
</html>

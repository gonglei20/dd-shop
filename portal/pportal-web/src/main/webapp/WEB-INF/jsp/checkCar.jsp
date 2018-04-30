<%--
  Created by IntelliJ IDEA.
  User: hang1
  Date: 2018/4/19
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>确认订单  - jeegou开发站- Powered by JSPGOU</title>
    <link href="${pageContext.request.contextPath}/css/index_1.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/member.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/checkout.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/buy_1.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/cart_1.css" type="text/css" rel="stylesheet" />
    <link href="css/index.css" type="text/css" rel="stylesheet" />
    <link href="css/buy.css" type="text/css" rel="stylesheet" />
    <link href="css/cart.css" type="text/css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery_1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/cart_sure.js"  type="text/javascript"></script>
    <script type="text/javascript">
        var URLPrefix = {
            "url":""
        };
        $(function() {
            $("#jvForm").validate();
            $(':radio[name=memberCoupon]').each(function(){
                $(this).click(function(){
                    if($(this).attr('checked')){
                        $(':radio[name=memberCoupon]').removeAttr('checked');
                        $(this).attr('checked','checked');
                    }
                    if($(this).attr("checked")==true){
                        var memberCoupon=document.getElementsByName("memberCoupon");
                        for(var i=0;i<memberCoupon.length;i++){
                            if(memberCoupon[i].checked){
                                var	str = memberCoupon[i].value;
                                var strs = new Array();
                                strs=str.split(",");
                                $("#deduceAmount").html(strs[1]);
                                $("#memberCouponId").val(strs[0]);
                            }
                        }
                    }else{
                        $("#deduceAmount").html(0);
                        $("#memberCouponId").val("");
                    }
                    var cart_price= $("#cart_price").html();
                    var deduceAmount=$("#deduceAmount").html();
                    var totalDeliveryFee=$("#totalDeliveryFee").html();
                    $("#amount_payable").html(parseFloat(cart_price)+parseFloat(totalDeliveryFee)-parseFloat(deduceAmount));
                });
            });

        });
        $().ready(function() {
            var $paymentMethodId = $("#paymentMethod :radio");
            var $shippingMethodId = $("#shippingMethod :radio");
            var shippingMethodIds = {};
            shippingMethodIds["1"] = [  "2", "1"];
            shippingMethodIds["2"] = [  "2", "1"];
            shippingMethodIds["3"] = [  "2", "1"];
            // 支付方式
            $paymentMethodId.click(function() {
                var $this = $(this);
                if ($(this).attr("disabled")) {
                    return false;
                }
                var paymentMethodId = $this.val();
                $shippingMethodId.each(function() {
                    var $this = $(this);
                    if ($.inArray($this.val(), shippingMethodIds[paymentMethodId]) >= 0) {
                        $(this).attr("disabled", false);
                    } else {
                        $this.attr("disabled", true).attr("checked", false);
                    }
                });

            });
            // 配送方式
            $shippingMethodId.click(function() {
                var $this = $(this);
                if ($(this).attr("disabled")) {
                    return false;
                }
            });
        });

        //获得城市
        function getResultCity(d){
            $.post('../shopMemberAddress/findAllCity.jspx', {"id":d},
                function(data) {
                    if(data.success){
                        $("#itemcity").html("");
                        var select="<select name='cityId' onchange='getResultCountry(this.value)'>";
                        for(var i=0;i<data.ids.length;i++){
                            select+="<option value='"+data.ids[i]+"'>&nbsp;"+data.citys[i]+"&nbsp;</option>";
                        }
                        select+="</select>";
                        getResultCountry(data.ids[0]);
                        $("#itemcity").append(select);
                    }
                },"json");
        }
        //获得县、区
        function getResultCountry(a){
            $.post('../shopMemberAddress/findAllCountry.jspx', {"id":a},
                function(data) {
                    if(data.success){
                        $("#itemarea").html("");
                        var select="<select name='countryId'>";
                        for(var i=0;i<data.ids.length;i++){
                            select+="<option value='"+data.ids[i]+"'>&nbsp;"+data.areas[i]+"&nbsp;</option>";
                        }
                        select+="</select>";
                        $("#itemarea").append(select);
                    }
                },"json");
        }

        function checkSubmit(){
            if($("#provinceId").val()==''||$("#provinceId").val()==null){
                alert("请选择所在地址!");
                return;
            }
            if($("#tel").val()==null&&$("#phone").val()==null||$("#tel").val()==''&&$("#phone").val()==''){
                alert("手机跟电话至少有一项必填");
                return;
            }
            $("#jvForm").attr("action","../shopMemberAddress/address_save.jspx");
            $("#jvForm").submit();
        }

        function checkSubmit1(){
            if($("input[name='deliveryInfo']").length<=0){
                alert("请添加邮寄地址");
                return;
            }
            if($("input[name='paymentMethodId']").length<=0){
                alert("请选择支付方式");
                return;
            }
            var $checkedShippingMethodId = $("#shippingMethod :radio").filter(":checked");
            if ($checkedShippingMethodId.size() == 0) {
                alert("请选择配送方式");
                return;
            }
            if($("#error1").val()!=null){
                alert("您选择的商品当中含有款式商品已下架的情况,不能购买");
                return;
            }
            if($("#error2").val()!=null){
                alert("您选择的商品当中含有款式商品无库存的情况,不能购买");
                return;
            }
            if($("error3").val()!=null){
                alert("您选择的商品当中含有款式商品的购买数量大于库存的问题,不能购买");
                return;
            }
            if($("error4").val()!=null){
                alert("您选择的商品当中含有商品已下架的情况,不能购买");
                return;
            }
            if($("error5").val()!=null){
                alert("您选择的商品当中含有商品无库存的情况,不能购买");
                return;
            }
            if($("error6").val()!=null){
                alert("您选择的商品当中含有商品的购买数量大于库存的问题,不能购买");
                return;
            }
            var pd=false;
            $("input[name='deliveryInfo']").each(function(){
                if($(this).attr("checked")){
                    pd=true;
                }
            });
            if(!pd){
                alert("请选择邮寄地址！");
                return;
            }
            $("#addrInputDiv").html('');
            $("#jvForm").attr("action","../order/order_shipping.jspx");
            $("#jvForm").submit();
        }
        function showBalanceDiv(a){
            if(a.className == ""){
                a.className = "bh-on";
                $("#balance_div").fadeOut("800");
            }else{
                a.className = "";
                $("#balance_div").fadeIn("800");
            }
        }

        function showCouponDiv(a){
            if(a.className == ""){
                a.className = "bh-on";
                $("#coupon_div").fadeOut("800");
            }else{
                a.className = "";
                $("#coupon_div").fadeIn("800");
            }
        }

        function showRemark(chk){
            if(chk.checked){
                $("#remark").fadeIn("500");
            }else{
                $("#remark").fadeOut("500");
            }
        }
    </script>
</head>
<body style="background:#fff;">
<div id="Topbar" class="Topbar">
    <div class="ctr cf">
        <ul class="Topbar-menu fr">
            <li class="Topbar-menu-item ib"><a href="${pageContext.request.contextPath}/myCenter">个人中心</a></li>
            <li class="Topbar-menu-item ib"><a href="/collect/mycollect.jspx">收藏夹</a></li>
            <!--<li class="Topbar-menu-item ib"><a target="_blank" href="">网站导航</a>-->
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
    localStorage.setItem("sessionKey",'09138987a610521f3902b344e2f64cc9d09a40765edd899efdf5bb96b705b7c385f675f8c0c99f1ec0cb7d2085baffee');
    localStorage.setItem("userName", 'test1');
</script><script src="js/jquery_1.js" type="text/javascript"></script>
<div class="Header">
    <div class="ctr pr">
        <a href="/"><div class="Logo">
            <img src="${pageContext.request.contextPath}/picture/logo_2.jpg" width="400" height="80" />
        </div></a>
        <form class="Search"  id="searchForm" action="/search.jspx">
            <input id="search_form_input" class="Search-input zi2" type="text"
                   name="q" id="q" value="请输入关键词" type="text"
                   onfocus="if(this.value=='请输入关键词')this.value=''"
                   onblur="if(this.value=='')this.value='请输入关键词'">

            <!--<button class="Search-submit" type="submit">搜 索</button>-->
            <!-- <input class="Search-submit"  value="搜索" onclick="sousuo();"/>-->
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
</div>
<!--商品类目栏 begin  -->
<div class="Nav">
    <ul class="ctr cf pr">


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
<!--商品类目栏 end  -->
<div class="w">
    <div id="topcolumn"></div>
    <div class="weizhi">您当前的位置：<a href="/" target="_blank">首页</a> > 确认订单信息</div>
    <ul class="step clearfix">
        <li><span>STEP 1.</span>查看购物车</li>
        <li class="on"><span>STEP 2.</span>确认订单信息</li>
        <li><span>STEP 3.</span>成功提交订单</li>
    </ul>

    <div id="checkoutUI">
        <div id="errorMsgDisplayDiv" style="z-index:1000;"></div>
        <form id="jvForm" action="../order/order_shipping.jspx" method="post">
            <div style="border-bottom:1px solid #ddd; overflow:hidden; padding:10px 10px 0px 10px;">
                <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#ddd" style="margin:auto;">
                    <tbody><tr>
                        <td width="30" height="30" align="center" bgcolor="#f9f9f9">&nbsp;</td>
                        <td align="center" bgcolor="#f9f9f9">收货人</td>
                       <%-- <td align="center" bgcolor="#f9f9f9">所在地区</td>--%>
                        <td align="center" bgcolor="#f9f9f9">详细地址</td>
                        <td width="100" align="center" bgcolor="#f9f9f9">邮编</td>
                        <td width="100" align="center" bgcolor="#f9f9f9">手机</td>
                      <%--  <td width="100" align="center" bgcolor="#f9f9f9">固定电话</td>--%>
                        <td width="170" align="center" bgcolor="#f9f9f9">操作</td>
                    </tr>
                    <tr>
                        <td height="50" align="center" bgcolor="#FFFFFF">
                            <input type="radio" name="deliveryInfo" class="delivery_info" value="267" checked="checked" "="">
                        </td>
                        <td align="center" bgcolor="#FFFFFF">${user.realName}</td>
                        <td align="center" bgcolor="#FFFFFF">${user.address}</td>
                        <td align="center" bgcolor="#FFFFFF">310000</td>
                        <td align="center" bgcolor="#FFFFFF">${user.mobile}</td>
                       <%-- <td align="center" bgcolor="#FFFFFF">13222222222</td>--%>
                        <td align="center" bgcolor="#FFFFFF">
                            -

                            -</td>
                        <td align="center" bgcolor="#FFFFFF">
                            <a href="../shopMemberAddress/address_delete.jspx?id=267&amp;returnUrl=../cart/checkout_shipping.jspx" class="no_button">删除</a>
                            <a href="../shopMemberAddress/address_default.jspx?id=267&amp;returnUrl=../cart/checkout_shipping.jspx" class="no_button">设为默认</a>
                        </td>
                    </tr>
                    </tbody></table>

            </div>
                <%--<div id="receiver_buffer_window" class="delivery mb10">
                    <div class="title"><h2>收货人信息</h2> </div>

                     <div id="inputUI_rece" class="rece_box">
                         <p id="btn_away_ui">&nbsp;</p>
                         <div class="x_address">
                         </div>
                         &lt;%&ndash;<p class="add_adds" style="padding-top:8px; text-align:center;">
                             <span class="tianjia" onclick="jQuery('#addrInputDiv').show();">添加新地址</span>
                             <span class="quxiao" onclick="jQuery('#addrInputDiv').hide();">取消新地址</span>
                         </p>&ndash;%&gt;
                         <hr class="delivery_hr" />
                         <div id="addrInputDiv" class="adress_edit2 none">
                             <h3 class="h3">请填写收货人信息：</h3>
                             <p class="info_form">
                                 <label for="user_name" class="lab"><em>*</em>收&nbsp;货 &nbsp;人：</label>
                                 <input type="text" id="receiverName" name="username" class="user_name text required" />
                                 <span id="nameError" class="prompt"></span>
                             </p>
                             <p class="info_form">
                                 <label for="user_name" class="lab"><em>*</em>性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>&nbsp;
                                 <input type="radio" name="gender" value="true" checked/>男&nbsp;&nbsp;&nbsp;&nbsp;
                                 <input type="radio" name="gender" value="false"/>女
                             </p>
                             <p class="info_form">
                                 <label for="select_province" class="lab"><em>*</em>收货地址：</label>
                                 <select id="provinceId" name="provinceId" onchange="getResultCity(this.value)"  >
                                     <option value="">--请选择--</option>
                                     <option value="1">江西省</option>
                                     <option value="9">安徽省</option>
                                     <option value="10">北京市</option>
                                     <option value="11">上海市</option>
                                 </select>
                                 <span id="itemcity"></span>
                                 <span id="itemarea"></span>
                             </p>
                             <p class="info_form">
                                 <label for="user_adress" class="lab"><em>*</em>详细地址：</label>
                                 <input id="detailAddress" name="detailaddress" class="user_adress text required" type="text" />
                             </p>
                             <p class="info_form">
                                 <label for="user_adress" class="lab"><em>*</em>邮政编码：</label>
                                 <input id="postCode" name="postCode" class="user_phone text required digits" type="text" />
                             </p>
                             <p class="info_form">
                                 <label for="user_phone" class="lab">手机号码：</label>
                                 <input type="text" id="tel" name="tel" class="user_phone text digits"  />
                                 <span id="mobileError" class="prompt">手机或电话必填一种</span>
                             </p>
                             <p class="info_form">
                                 <label for="user_phone" class="lab"> 固定电话：</label>
                                 <input type="text"  id="areaCode" name="areaCode"  size="4"  maxlength="4" class="user_areaCode text digits"/>
                                 -
                                 <input type="text" id="phone" name="phone"  size="14" maxlength="10" class="user_phone text digits"/>
                                 -
                                 <input  type="text" id="extNumber" name="extNumber"  size="6"  maxlength="6" class="user_extNumber text digits"/>
                                 区号(3到4位数字，可选)-电话号码(7到8位数字)-分机号(最多6位数字，可选)
                             </p>
                             <p class="info_form">
                                 <input type="checkbox" onclick="$('#isDefault').val(this.checked)" style="margin-left:100px;"/>
                                 <input type="hidden" id="isDefault" name="isDefault" value="false"/>
                                 <label for="daily_address">设为默认地址</label>
                             </p>
                             <p class="btn" id="addrSubBtn">
                                 <input type="hidden" name="returnUrl" value="../cart/checkout_shipping.jspx"/>
                                 <input type="button" value="保存收货信息"  onclick="checkSubmit();" />
                             </p>
                         </div>
                     </div>
                 </div>--%>
            <div id="payment_buffer_window" class="delivery mb10">
                <div class="title"> <h2>支付方式</h2></div>
                <div class="delivery_box" id="paymentMethod">
                    <p id="pNet" class="radio_select">
                        <input type="radio" id="paymentMethod_1" name="paymentMethodId" value="1"  checked="true"/>
                        <label>网上支付</label>
                        <span class="des"> 支持支付宝、财付通、以及大多数网上银行支付</span>
                    </p>
                    <%--<p id="pNet" class="radio_select">
                        <input type="radio" id="paymentMethod_2" name="paymentMethodId" value="2"  />
                        <label>银行汇款</label>
                        <span class="des"> 支持工行、建行、农行汇款支付，收款时间一般为汇款后的1-2个工作日</span>
                    </p>
                    <p id="pNet" class="radio_select">
                        <input type="radio" id="paymentMethod_3" name="paymentMethodId" value="3"  />
                        <label>货到付款</label>
                        <span class="des"> 由快递公司送货上门，您签收后直接将货款交付给快递员</span>
                    </p>--%>
                </div>
            </div>
            <div id="delivery_buffer_window" class="delivery mb10">
                <div class="title"><h2>配送信息</h2></div>
                <div class="delivery_box" id="inputUI_delivery">

                    <table width="100%" border="0" cellpadding="3" cellspacing="0">
                        <tr class="head">
                            <td width="70" height="40"></td>
                            <td>商品名称</td>
                            <td width="150" align="center">数　量</td>
                            <td width="150" align="center">重　量</td>
                            <td width="150" align="center">金额小计</td>
                            <td width="150"><span style="padding-left:30px;">配送方式</span></td>
                        </tr>
                        <tr class="body">
                            <td width="70"><a class="img60" href="/riyongbaihuo/40.htm" target="_blank">
                                <img src="picture/09110022apad.jpg" width="60" height="60"/></a></td>
                            <input type="hidden" name="cartItemId" value='2192'/>
                            <input type="hidden" name="cartProductId" value="40"/>
                            <input type="hidden" name="cartCountId" value="1"/>
                            <td>
                                <a href="/riyongbaihuo/40.htm" title="快乐学习" class="a2" target="_blank">
                                    快乐学习    </a>
                            </td>
                            <td align="center"><span id="cart_count_2192">1</span></td>
                            <td align="center"><span id="cart_weight_2192">0</span>g</td>
                            <td align="center" class="line_right">¥<span id="cart_price_2192">0.1</span></td>
                            <td rowspan="1" align="center">
                                <div id="shippingMethod" style="position:relative;zoom:1;float:left;width:100%;">
                                    <div style="height: 43px;position: relative;z-index: 0;width: 100%;">
                                        <input type="radio" onclick="ajaxtotalDeliveryFee('1','0');" id="shippingMethod_1" name="shippingMethodId" class="delivery_radio"  checked value="1" />
                                        <label style="line-height: 43px;margin-right: 45px;">普通快递</label>
                                    </div>
                                    <div style="height: 43px;position: relative;z-index: 0;width: 100%;">
                                        <input type="radio" onclick="ajaxtotalDeliveryFee('2','0');" id="shippingMethod_2" name="shippingMethodId" class="delivery_radio"   value="2" />
                                        <label style="line-height: 43px;margin-right: 45px;">顺丰快递</label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>

                </div>
            </div>





            <div id="delivery_buffer_window" class="delivery mb10" style="overflow:hidden">
                <div class="title"><h2>结算信息</h2></div>
                <div class="delivery_box" id="inputUI_delivery">
                    <ul>
                        <li><span class="bold">商品金额：￥<strong><span id="cart_price"></span></strong>元</span>&nbsp;+ 运费：￥<strong id="totalDeliveryFee"></strong>元&nbsp;-&nbsp;优惠券：￥<strong><span id="deduceAmount">0.0</span></strong>元-&nbsp;立省：￥<strong><span id="popularityPrice">0</span></strong>元
                            &nbsp;&nbsp;&nbsp;<span class="bold">重量：<strong><span id="cart_weight"></span></strong>g</span>
                        </li>
                        <li>
                            <div style="border:none!important;font-size:14px;float:right">
                                <span class="bold">应付金额:<strong><span style="font-size:14px;color:#a71f24;font-weight:bold" id="amount_payable"></span></strong>元</span>
                            </div>

                            <div><a href="javascript:void(0);" onclick="showCouponDiv(this)"><span style="font-size:14px;color:#a71f24;font-weight:bold">使用优惠券抵消部分总额</span></a> （<a target="_blank" href="/coupon.jspx">领取优惠券</a>）</div>
                            <div style="display: none;" id="coupon_div">
                                <input type="hidden" id="memberCouponId" name="memberCouponId"/>
                            </div>
                        </li>
                    </ul>
                    <div style="clear:both; margin-top:10px; overflow:hidden;">
                        <div style="float:left; line-height:28px;">
                            <input type="checkbox" id="remark_chk" onclick="showRemark(this)" />订单备注
                            <input type="text" name="comments" id="remark" style="display:none;" class="ss_input" />
                        </div>
                        <div class="btn">
                            <input type="button" id="confirm_delivery" value="提交订单" onclick="checkSubmit1();" style="float:right;" />
                        </div>
                    </div>
                </div>
            </div>


            <div class="delivery_box" id="inputUI_delivery">
                <p class="btn">&nbsp;</p>
            </div>
        </form>
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
            <img class="QR-img" src="picture/jspgou-wx_1.jpg" >
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

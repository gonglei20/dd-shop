<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/3/28
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>服装 - jeegou开发站- Powered by JSPGOU</title>
    <meta http-equiv="keywords" content="JSPGOU演示站"/>
    <meta http-equiv="description" content="JSPGOU演示站"/>
    <link href="css/index_8.css" type="text/css" rel="stylesheet" />
    <link href="css/list.css" type="text/css" rel="stylesheet" />
    <script src="js/jquery1.42.min_2.js" type="text/javascript"></script>
    <script>
        $(function(){
            $('#nav_category').mouseenter(function(){
                $(this).addClass('active');
            }).mouseleave(function(){
                $(this).removeClass('active');
            });
        });

        function getJvForm(){
            return document.getElementById("jvForm");
        }


        $(function(){
            $('#nav_category').mouseenter(function(){
                $(this).addClass('active');
            }).mouseleave(function(){
                $(this).removeClass('active');
            });
        });


        //品牌确认控制
        function smallChange(obj) {
            var smObj = document.getElementsByName("brand");
            var bigObj = document.getElementById("bigclassauthorize");
            if (obj.checked == true){
                bigObj.style.display='block';
            }else {
                b = true;
                for (var i = 0; i < smObj.length; i++) {
                    if (smObj[i].checked == true){
                        b = false;
                    }
                }
                if (b == true){
                    bigObj.style.display='none';
                }
            }
        }


        //更多选项按钮
        function clickOrderBy(a){
            $("#orderBy").val(a);
            var jvForm = getJvForm();
            jvForm.onsubmit=null;
            jvForm.submit();
        }



        //品牌多选
        function MultiBrand() {
            var bb = "";
            var temp = "";
            var a = document.getElementsByName("brand");
            for ( var i = 0; i < a.length; i++) {
                if (a[i].checked) {
                    temp = a[i].value;
                    bb = bb + "," +temp;
                }
            }
            document.getElementById("brandId").value = bb.substring(1, bb.length);
            var jvForm = getJvForm();
            jvForm.onsubmit=null;
            jvForm.submit();
        }

        //品牌确认控制
        function smallChange(obj) {
            var smObj = document.getElementsByName("brand");
            var bigObj = document.getElementById("bigclassauthorize");
            if (obj.checked == true){
                bigObj.style.display='block';
            }else {
                b = true;
                for (var i = 0; i < smObj.length; i++) {
                    if (smObj[i].checked == true){
                        b = false;
                    }
                }
                if (b == true){
                    bigObj.style.display='none';
                }
            }
        }

        //品牌全部
        function AllBrand(b){
            $("#brandId").val(b);
            var jvForm = getJvForm();
            jvForm.onsubmit=null;
            jvForm.submit();
        }

        //品牌更多，收起
        function showMoreq(a,d){
            if(jQuery("#FacetBrandsMoreBtnq")[0]&&jQuery("#FacetBrandsBackBtnq")[0]){
                if(d&&d=="more"){
                    jQuery("#FacetBrandsMoreBtnq")[0].style.display="none";
                    jQuery("#FacetBrandsBackBtnq")[0].style.display="block";
                }else{
                    jQuery("#FacetBrandsMoreBtnq")[0].style.display="block";
                    jQuery("#FacetBrandsBackBtnq")[0].style.display="none";
                }
            }
            var c=9;
            if(typeof(cateType)!="undefined"&&cateType==1){c=9;}
            var b=$("#"+a).children();
            if(d&&d=="more"){
                b.each(function(e){$(this).show()})
            }else{
                b.each(function(e){if(e>c){$(this).hide()}})
            }
        }


        //价格确认按钮
        function searchPriceRange(){
            var d=$("#startPrice").val();
            var a=$("#endPrice").val();
            if((d.value=="")&&(a.value=="")){
                alert("请输入价格区间");d.focus();return;
            }
            if((d.value!="")&&(a.value!="")){
                if(Number(a.value)<Number(d.value)){
                    alert("输入价格区间 右值必须大于或等于左值");
                    a.focus();return;
                }
            }
            var jvForm = getJvForm();
            jvForm.onsubmit=null;
            jvForm.submit();
        }
        //价格清除按钮
        function cleanPrice(){
            document.getElementById("startPrice").value="￥";
            document.getElementById("endPrice").value="￥";
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
            <li class="Topbar-welcome-item">Hi,<font color="red">  test1  </font>欢迎

                来到JSPGOU商城</li>
            <li class="Topbar-welcome-item"><a href="/logout.jspx?username=test1">退出登录</a></li>
        </ul>



    </div>
</div>

<script type="text/javascript">
    console.log(1);
    localStorage.setItem("sessionKey",'ef2d85ef385c7ed8378ec01e87bb18d2640073ce9db58421ab52798da2b5ef2d9347650321fa5eef661364c461a5379b');
    localStorage.setItem("userName", 'test1');
</script><script src="js/jquery_6.js" type="text/javascript"></script>
<div class="Header">
    <div class="ctr pr">
        <a href="/"><div class="Logo">
            <img src="picture/logo_8.jpg" width="158" height="58" />
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
    </ul>
</div>
<!--商品类目栏 end  -->

<div class="category-filter">
    <div class="w">
        <div id="JS_category_filter" class="filter">

            <dl class="cat clearfix">
                <dt><a href="">服装</a></dt>
                <dd>
                    <table>
                        <tr>
                            <td height="21" id="JS_filter_cats">
                                <!-- 这里可以从数据库回显出分类信息-->
                            </td>
                        </tr>
                    </table>
                </dd>
            </dl>
            <form id="jvForm" action="index.htm">
        </div>
    </div>
</div>


<div class="w self-panel">
    <div class="self-wrap clearfix">
        <ul class="s-attrs clearfix" style="margin-right:10px;">
            <input type="hidden" name="orderBy" id="orderBy" value="0"/>
            <li class="normal"><a  onclick="clickOrderBy(0);" title="默认排序">综合</a></li>
            <li ><a onclick="clickOrderBy(4);"><span>销量</span></a></li>
            <li class="defaultPrice"><a onclick="clickOrderBy(7);" > <span>价格</span></a></li>
            <li ><a onclick="clickOrderBy(2);"><span>上架时间</span></a></li>
        </ul>
        <span style="margin-left:10px;">
            <input class="ip1" name="startPrice" id="startPrice" value="￥" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" class="number"
                   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" type="text" style=" font-family:微软雅黑; font-size:12px; color:#666666; float:left; width:50px; height:21px; border:1px solid #dfdfdf;"><span style=" font-family:微软雅黑; font-size:12px; color:#666666; float:left;"> - </span>
            <input class="ip2" name="endPrice" id="endPrice" value="￥" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" type="text" style=" font-family:微软雅黑; font-size:12px; color:#666666; float:left; width:50px; height:21px; border:1px solid #dfdfdf">
            <a  style="text-decoration: none;" onclick="searchPriceRange();" id="JS_filter_price_btn" class="price-btn"><input type="button" value="确定" style="border:1px solid #dfdfdf; padding:0 5px; line-height:21px; background:#dddddd;"></a>
            <a style="text-decoration: none;" onclick="cleanPrice()" ><input type="button" value="清除" style="border:1px solid #dfdfdf; padding:0 5px; line-height:21px; background:#dddddd;"></a>
            </span>
    </div>
</div>
</form>



<form id="tableForm" action="/fuzhuang/index.htm" method="get">
    <div id="JS_list_panel" class="list-panel">
        <div class="list-wrap">
            <ul class="list-goods clearfix" style="width:1220px;">
                <li class="g-item">
                    <div class="g-dtl">
                        <a href="/woman/37.htm" target="_blank"  >
                            <img  class="d-img" src="picture/20084652fznp.jpg" />
                        </a>
                        <div class="d-price clearfix">
                            <strong class="fl p-money"><sub class="m-mark">￥</sub>
                                <span class="m-count JS_async_price">100            </span></strong>
                            <del class="fl p-del" style="margin-right: 0px;">
                                <sub class="d-mark">￥</sub><del>
                                100
                            </del>
                            </del>
                        </div>
                        <a href="" target="_blank" title="" class="d-name">
                            <span>牛仔裤</span>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="scott">
        &nbsp;<a class="disabled">上一页</a>
        <span class="current">1</span>
        ...
        <a id="page_1" href="index_1.htm">1</a>
        &nbsp;&nbsp;&nbsp;到第&nbsp;&nbsp;<input type="text" id="_goPs" class="ssinput" style="width:64px; border:#c3c3c3 1px

solid;" /> 页  <button  onclick="_gotoPage($('#_goPs').val(),'index','.htm');"  disabled="disabled" class="menu_queding">确定</button>
    </div>
    <script type="text/javascript">
        function _gotoPage(pageNo,urlp,urls) {
            try{
                var url =urlp+"_"+pageNo+urls;
                $("#tableForm").attr('action',url);
                $("#tableForm").submit();
            } catch(e) {
                alert('_gotoPage(pageNo)方法出错');
            }
        }
    </script>

    <div id="hisAssociated" style="clear:both;"></div>
</form>

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
            <img class="QR-img" src="picture/jspgou-wx_7.jpg" >
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
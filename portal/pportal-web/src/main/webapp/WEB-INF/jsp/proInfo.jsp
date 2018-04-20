<%--
  Created by IntelliJ IDEA.
  User: hang1
  Date: 2018/4/17
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品详情页</title>
    <link href="css/index_7.css" type="text/css" rel="stylesheet" />
    <link href="css/product.css" type="text/css" rel="stylesheet" />
    <script src="js/jquery_5.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function() {
            jQuery.jqtab = function(tabtit,tabcon) {
                $(tabcon).hide();
                $(tabtit+" li:first").addClass("thistab").show();
                $(tabcon+":first").show();

                $(tabtit+" li").click(function() {
                    $(tabtit+" li").removeClass("thistab");
                    $(this).addClass("thistab");
                    $(tabcon).hide();
                    var activeTab = $(this).find("a").attr("tab");
                    $("#"+activeTab).fadeIn();
                    return false;
                });

            };
            /*调用方法如下：*/
            $.jqtab("#tabs",".tab_con");

        });

        function addToCart(productId) {

           alert("成功加入购物车");
           location.href="${pageContext.request.contextPath}/addCat?bid="+productId;
        }

        function addToCollect(productId){
            $.post('/collect/add_to_collect.jspx',{
                'productId':productId
            }, function(data){
                if(data.status == 1){
                    alert('收藏成功!');
                }else if(data.status== 2){
                    alert('收藏过该商品');
                }else{
                    location.href='/login.jspx';
                }
            },'json');
        }
    </script>
</head>

<body>
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
    localStorage.setItem("sessionKey",'a61e624df2bb23249b02bc115f879b6ca9a8d0ef783b515e11550d6e38e5a111baf6979c0bc46071b7076b65d923faae');
    localStorage.setItem("userName", 'test1');
</script><script src="js/jquery_5.js" type="text/javascript"></script>
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
            <a href="${pageContext.request.contextPath}/proCar">我的购物车</a>
        </div>

        <script type="text/javascript">
            $('#cart_total_items').html(Shop.cartTotalItems());
        </script>
    </div>
</div><!--商品类目栏 begin  -->
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
<!--商品类目栏 end  --><div class="weizhi">
    您现在的位置：<a href="/">首页</a> > <a href="/woman/index.htm">女装</a>
</div>
<div class="view Page-detail">

    <div class="Detail">

        <div class="Detail-meta cf">
            <div class="Detail-ml fl">
                <div class="Detail-main-images">
                    <a   style="height:350px;">
                        <img id="productImg" src="${findOneBook.image_2}" height="350" style="margin:auto; display:block;"/>
                    </a>
                </div>

                <div class="pic_slide">
                    <span class="prev" id="prevBtn"></span>
                    <div class="pic_slide_box" id="sliderImgs">
                        <ul id="detailPictureSlider">
                            <li><img  class="selected" src="${findOneBook.image_1}" onmouseover="initCurrPicture(jQuery(this),'/u/201703/20085754f9ub.jpg','/u/201703/08133627vekx.jpg')" width="58" height="58" /></li>
                        </ul>
                    </div>
                    <span class="next" id="nextBtn"></span>
                </div>
            </div>

            <div class="Detail-mm fl">
                <h1 class="Detail-name" style="margin-bottom:15px;">${findOneBook.bname}</h1>
                <div style="width: 520px; height: 38px; background-image: url(images/xxbg.jpg)">
                    <div style="float: left; font-size: 13px; color: #fff; font-family:'Microsoft Yahei'; margin-top: 10px; margin-left: 15px">全场书籍低价<span style="color: #fec40b">疯抢中</span>，尽快选购吧！</div>
                </div>

                <div class="Detail-price p10">
                    <input type="hidden" id="current_merchantId" value="34"/>
                    <dl class="promo cf" >
                        <dt>销售价</dt>
                        <dd>
                            <span style="float: left;">¥&nbsp;</span>
                            <em id="product_price" style="float: left;">${findOneBook.price}</em>
                        </dd>
                    </dl>

                    <dl class="original cf">
                        <dt>原价</dt>
                        <dd>¥&nbsp;<del id="product_oprice">100</del></dd>
                    </dl>



                    <span class="favour"><span class="icon"></span><a class="text"  href="javascript:void(0);" onclick="javascript:addToCollect(35);">收藏</a></span>
                </div>

                <div class="sys_item_spec" style="padding:7px 10px 0 10px;">
                    <%--<dl class="sys_item_specpara clearfix" data-sid="1" data-attrval="33">
                        <dt>颜色</dt>
                        <dd>
                            <ul class="sys_spec_img">
                                <li data-aid="33" class="selected"><a href="javascript:;" title="红色"><img src="picture/23135649j52d.jpg" alt="红色" /></a><i></i></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="sys_item_specpara clearfix" data-sid="2" data-attrval="37">
                        <dt>尺寸</dt>
                        <dd>
                            <ul class="sys_spec_text">
                                <li data-aid="37" class="selected"><a href="javascript:;" title="m">m</a><i></i></li>
                            </ul>
                        </dd>
                    </dl>--%>
                </div>
                <div class="Detail-spec p10">
                    <dl class="amount cf">
                        <dt>数量</dt>

                        <!-- <dd>
                            <div class="computing">
                                <input type="button" class="less" value="一" onclick="decrementAll();"/>
                                <input type="text" id="product_amount" name="productAmount" onchange ="buyButtonNumChange('product_amount')" class="num" onkeyup="inputOnlyNum(this, 1, 999);" value="1"/>
                                <input type="button" class="more"  value="+" style="font-size: 14px;" onclick="incrementAll();"/>
                            </div>
                        </dd> -->
                        <dd>
                            <div class="computing">
                                <input type="button" class="less shuliang" value="一" style="font-size: 10px;" onclick="decrementAll();"/>
                                <input type="text" id="product_amount" name="productAmount" onchange ="buyButtonNumChange('product_amount')" class="num" onkeyup="inputOnlyNum(this, 1, 999);" value="1"/>
                                <input type="button" class="more shuliang" value="+" style="font-size: 16px;" onclick="incrementAll();"/>
                            </div>
                        </dd>

                    </dl>
                    <dl class="buy cf">
                        <dt></dt>
                        <dd>
                            <span>
	                           <input type="button" class="cart" value="加入购物车" onclick="addToCart('${findOneBook.bid}')"/>
	                        </span>
                        </dd>
                    </dl>


                    <dl class="promise cf">
                        <dt>商品编号</dt>
                        <dd><span id="productCode">${findOneBook.pid}</span></dd>
                    </dl>

                    <dl class="promise cf">
                        <dt>分享到</dt>
                        <dd>
                            <span >
			 						<a  style="background:url(images/r1_c5.png) no-repeat;" href="javascript:(function(){var rul=location.href;if(rul.indexOf('?')>0){rul = rul +'&'}else{rul = rul +'?'};rul = rul +'tarcker_u=9402576';window.open(' http://v.t.sina.com.cn/share/share.php?title=【恋爱女王节妈咪版系列复古的灵感挑战你的高腰牛仔裤】,JSPGOU价 ￥100&url='+encodeURIComponent(rul),'_blank','width=615,height=505');})()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新浪微博</a>
			                        <a  style="background:url(images/1228_r3_c5.png) no-repeat;" href="javascript:void(0)" onclick="posttoWb('http://v.t.qq.com/share/share.php','恋爱女王节妈咪版系列复古的灵感挑战你的高腰牛仔裤￥100','2fc26c2514bb48ec891170ce68db2683');" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;腾讯微博</a>
                            </span>

                        </dd>
                    </dl>
                </div>

            </div>


            <div class="Detail-mr fr">

            </div>
        </div>


        <div class="Detail-content cf" id="Detail-content">
            <div class="aside fl">
                <div class="b">
                    <div class="h">看了又看</div>
                    <div id="liulan"></div>
                </div>
            </div>

            <div id="tabbox">
                <ul class="tabs" id="tabs">
                    <li><a href="" tab="tab1">商品详情</a></li>
                    <li><a href="" tab="tab2">规格参数</a></li>
                    <li><a href="" tab="tab3">商品评价</a></li>
                    <li><a href="" tab="tab4">商品咨询</a></li>
<%--                    <li><a href="" tab="tab5">成交记录</a></li>--%>
                </ul>
                <ul class="tab_conbox">
                    <li id="tab1" class="tab_con">
                        <p><img alt="" src="${findOneBook.image_2}" style="width: 350px;height: 350px;"  /></p>
                    </li>

                    <li id="tab2" class="tab_con">
                        <p class="attr-list-hd tm-clear"><em>详细参数：</em></p>
                        <ul id="J_AttrUL">
                            <li >
                                作者:&nbsp;${findOneBook.author}</li>
                            <li>
                                页数:&nbsp;${findOneBook.pageNum}</li>
                            <li title="&nbsp;HO5224">
                                纸张:&nbsp;${findOneBook.paper}</li>
                            <li >
                               出版时间：&nbsp;${findOneBook.publishTime}</li>
                            <li title="&nbsp;铅笔裤">
                                款式:&nbsp;铅笔裤</li>

                        </ul>

                    </li>

                    <li id="tab3" class="tab_con">

                        <script type="text/javascript">
                            function g(o){
                                return document.getElementById(o);
                            }
                            function HoverLi(x,y,m,n,counter){
                                for(var i=1;i<=counter;i++){
                                    g(x+m+i).className='normaltab';
                                    g(y+m+i).className='undis';
                                }
                                g(y+m+n).className='dis';
                                g(x+m+n).className='curr';
                            }
                        </script>
                        <div class="pingjia">
                            <ul>
                                <li onclick="HoverLi('ty_','tyc_',1,1,3);" class="curr" id="ty_11">好评(0)</li>
                                <li onclick="HoverLi('ty_','tyc_',1,2,3);" class="normaltab" id="ty_12">中评(0)</li>
                                <li onclick="HoverLi('ty_','tyc_',1,3,3);" class="normaltab" id="ty_13">差评(0)</li>
                            </ul>
                        </div>
                        <div class="clear"></div>
                        <div class="dis" id="tyc_11">
                            <div class="dt-com">
                                <ul class="com-ul">
                                    <li class="cfix tac">对不起，暂时没有评论。</li>
                                </ul>

                            </div>
                        </div>
                        <div class="undis" id="tyc_12">
                            <div class="dt-com">
                                <ul class="com-ul">
                                    <li class="cfix tac">对不起，暂时没有评论。</li>
                                </ul>
                            </div>
                        </div>
                        <div class="undis" id="tyc_13">
                            <div class="dt-com">
                                <ul class="com-ul">
                                    <li class="cfix tac">
                                        对不起，暂时没有评论。
                                    </li>
                                </ul>
                            </div>
                        </div>


                    </li>
                    <li id="tab4" class="tab_con">
                        <iframe width="944" frameborder=0 scrolling=no src="/consultProduct.jspx?productId=35" name="rightFrame" noresize="noresize" id="rightFrame" height="400">
                        </iframe>
                    </li>
                    <li id="tab5" class="tab_con">
                        <iframe width="944"  frameborder=0 scrolling=no  src="/bargain.jspx?productId=35" name="rightFrame" noresize="noresize" id="rightFrame"  height="400">
                        </iframe>
                    </li>
                </ul>
            </div>

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
            <img class="QR-img" src="picture/jspgou-wx_6.jpg" >
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
</div>
<script language="JavaScript" type="text/JavaScript">
    var sys_item={
        "mktprice":"100",
        "price":"100",
        "attitude":" 红色 m",
        "fashId":"34",

        "sys_attrprice":{
            "33_37":{"price":"100","mktprice":"100","attitude":" 红色 m","fashId":"34"}
        }
    };

    //商品规格选择
    $(function(){
        $(".sys_item_spec .sys_item_specpara").each(function(){
            var i=$(this);
            var p=i.find("ul>li");
            p.click(function(){

                if(!!$(this).hasClass("selected")){
                    $(this).removeClass("selected");
                    i.removeAttr("data-attrval");
                }else{
                    $(this).addClass("selected").siblings("li").removeClass("selected");
                    i.attr("data-attrval",$(this).attr("data-aid"))
                }
                getattrprice() //输出价格
            })
        })
        //获取对应属性的价格
        function getattrprice(){
            var defaultstats=true;
            var _val='';
            var _resp={
                mktprice:".sys_item_mktprice",
                price:".sys_item_price",
                attitude:".sys_item_attitude"
            }  //输出对应的class
            $(".sys_item_spec .sys_item_specpara").each(function(){
                var i=$(this);
                var v=i.attr("data-attrval");
                if(!v){
                    defaultstats=false;
                }else{
                    _val+=_val!=""?"_":"";
                    _val+=v;
                }
            })

            if(!!defaultstats){
                if((sys_item['sys_attrprice'][_val])!=undefined){
                    _mktprice=sys_item['sys_attrprice'][_val]['mktprice'];
                    _price=sys_item['sys_attrprice'][_val]['price'];
                    _attitude=sys_item['sys_attrprice'][_val]['attitude'];
                    _fashId=sys_item['sys_attrprice'][_val]['fashId'];
                }else{
                    alert("您选择的商品已无库存！");
                    _mktprice=sys_item['mktprice'];
                    _price=sys_item['price'];
                    _attitude=sys_item['attitude'];
                    _fashId=sys_item['fashId'];
                }

            }else{
                _mktprice=sys_item['mktprice'];
                _price=sys_item['price'];
                _attitude=sys_item['attitude'];
                _fashId=sys_item['fashId'];
            }
            //输出价格
            $(_resp.mktprice).text(_mktprice);  ///其中的math.round为截取小数点位数
            $(_resp.price).text(_price);
            $(_resp.attitude).text(_attitude);
            $("#current_merchantId").val(_fashId);
        }
    })
</script>


<script type="text/javascript">
    var p_id = "35";
    var p_title = "恋爱女王节妈咪版系列复古的灵感挑战你的高腰牛仔裤";
    var p_price = "100";
    var p_url = "/woman/35.htm";
    var p_pic = "";
    p_pic ="/u/201703/20085754f9ub.jpg";
    var id = "product";
    var price = "price";
    var title = "title";
    var pic = "pic";
    var url = "url";


    //*取出cookie并显示
    for(i = 0 ;i<5;i++){
        title = title+i;
        price = price+i;
        pic = pic+i;
        url = url+i;
        var arr0 = document.cookie.match(new RegExp("(^| )"+title+"=([^;]*)(;|$)"));
        var arr1 = document.cookie.match(new RegExp("(^| )"+price+"=([^;]*)(;|$)"));
        var arr2 = document.cookie.match(new RegExp("(^| )"+pic+"=([^;]*)(;|$)"));
        var arr3 = document.cookie.match(new RegExp("(^| )"+url+"=([^;]*)(;|$)"));
        if(arr0 != null ){
            var str = "<ul><li>"+
                "<div class='p-wrap'>"+
                "<div class='p-img'>"+
                "<a target='_blank' href="+unescape(arr3[2])+">"+
                "<img src='"+unescape(arr2[2])+"'>"+
                "</a>"+
                "</div>"+
                "<div class='p-info'>"+
                "<div class='p-name'>"+
                "<a target='_blank' title='"+unescape(arr0[2])+"' href='"+unescape(arr3[2])+"'>"+unescape(arr0[2])+"</a>"+
                "</div>"+
                "<div class='p-price'>"+
                "<s>￥</s>"+unescape(arr1[2])+
                "</div>"+
                "</div>"+
                "</div>"+
                "</li></ul>";
            $("#liulan").append(str);
        }
        price = "price";
        title = "title";
        pic = "pic";
        url = "url";
    }

    var number = 4;
    SetCookie();
    function SetCookie()//两个参数，一个是cookie的名子，一个是值
    {
        var Days = 30; //此 cookie 将被保存 30 天
        var exp  = new Date();    //new Date("December 31, 9998");
        exp.setTime(exp.getTime() + Days*24*60*60*1000);
        for(i = 0 ;i<5;i++){
            id = id+i;
            var arr = document.cookie.match(new RegExp("(^| )"+id+"=([^;]*)(;|$)"));
            if(arr != null && getCookie(id) == p_id){
                title = title+i;
                price = price+i;
                pic = pic+i;
                url = url+i;
                delCookie(id);
                delCookie(title);
                delCookie(price);
                delCookie(pic);
                delCookie(url);
                number = i;
            }
            id = "product";
            price = "price";
            title = "title";
            pic = "pic";
            url = "url";
        }
        for(var i = number ;i>0;i--){
            id0 = id+(i-1);
            price0 = price+(i-1);
            title0 = title+(i-1);
            pic0 = pic+(i-1);
            url0 = url+(i-1);
            id = id +i;
            price = price+i;
            title = title+i;
            pic = pic+i;
            url = url + i;
            if(getCookie(id0) != null){
                document.cookie = id + "="+ escape (getCookie(id0)) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
                document.cookie = price + "="+ escape (getCookie(price0)) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
                document.cookie = title + "="+ escape (getCookie(title0)) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
                document.cookie = pic + "="+ escape (getCookie(pic0)) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
                document.cookie = url + "="+ escape (getCookie(url0)) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
            }

            id = "product";
            price = "price";
            title = "title";
            pic = "pic";
            url = "url";
        }


        //* 让当前商品相关cookie保存为第0个
        id = id+"0";
        price = price+"0";
        title = title+"0";
        pic = pic+"0";
        url = url +"0";
        document.cookie = id + "="+ escape (p_id) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
        document.cookie = price + "="+ escape (p_price) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
        document.cookie = title + "="+ escape (p_title) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
        document.cookie = pic + "="+ escape (p_pic) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
        document.cookie = url + "="+ escape (p_url) + ";expires=" + exp.toGMTString()+";path=/;domain=demo3.jeecms.com";
        id = "product";
        price = "price";
        title = "title";
        pic = "pic";
        url = "url";
    }



    function getCookie(name){//取cookies函数
        var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
        if(arr != null ){
            return unescape(arr[2]);
        }else if(i == 5){
            return null;
        }
    }
    function delCookie(name)//删除cookie
    {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval=getCookie(name);
        if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
    }
</script>
<script src="js/product.js"  type="text/javascript"></script>
</body>
</html>

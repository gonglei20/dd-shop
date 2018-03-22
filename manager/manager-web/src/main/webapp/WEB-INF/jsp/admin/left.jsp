<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/3/15
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.wysiwyg.old-school.css">

    <!-- jQuery AND jQueryUI -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">
    <!--<script type="text/javascript" src="js/index.js"></script>-->
</head>

<body>
<!--      左侧菜单     -->
<div id="sidebar">
    <ul>
        <li><a><img src="${pageContext.request.contextPath}/images/menuPic/layout.png" alt="">工作台</a></li>
        <li><a><img src="${pageContext.request.contextPath}/images/menuPic/product.png" alt="">商品</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/pages/product/productList" target="right">商品管理</a></li>
                <li><a href="product/car.html" target="right">发布商品</a></li>
                <li><a href="product/accessory.html" target="right">分类管理</a></li>
            </ul>
        </li>
        <li><a><img src="${pageContext.request.contextPath}/images/menuPic/comment.png" alt="">订单</a>
            <ul>
                <li><a href="guide/lamp.html" target="right">订单管理</a></li>
                <li><a href="guide/lectureHall.html" target="right">打印快递单</a></li>
                <li><a href="guide/guide.html" target="right">发货信息管理</a></li>
            </ul>
        </li>

        <li><a><img src="${pageContext.request.contextPath}/images/menuPic/brush.png" alt="">用户</a>
            <ul>
                <li><a  href="information/promotion.html" target="right">用户管理</a></li>
            </ul>
        </li>
        <li><a><img src="images/huser.png" alt=""> 客户管理</a>
            <ul>
                <li><a href="customer/customer.html" target="right">客户管理</a></li>
                <li><a href="customer/order_records.html" target="right">预约记录</a></li>
                <li><a href="customer/rescue_records.html" target="right">救援记录</a></li>
            </ul>
        </li>
        <li><a><img src="${pageContext.request.contextPath}/images/lab.png" alt="">统计查询</a>
            <ul>
                <li><a href="tongji/drive_amout.html" target="right">试驾量统计</a></li>
                <li><a href="tongji/keep_amout.html" target="right">保养量统计</a></li>
                <li><a href="tongji/rescue_amout.html" target="right">救援量统计</a></li>
                <li><a href="tongji/access_amout.html" target="right">访问量统计</a></li>
            </ul>
        </li>

    </ul>
</div>
</body>
</html>

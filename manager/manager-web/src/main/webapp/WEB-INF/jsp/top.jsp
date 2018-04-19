<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/3/15
  Time: 17:37
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
<!--    顶部   -->
<div id="head">
    <div class="left"> <a class="button profile"><img src="${pageContext.request.contextPath}/images/huser.png" alt="">
    </a> Hi, <font color="red">${user.adminName}</font>
    <a style="padding-left: 30px"></a>
    </div>

</div>

</body>
</html>



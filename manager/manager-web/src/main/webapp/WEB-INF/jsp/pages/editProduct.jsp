<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/4/2
  Time: 20:27
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
    <!--<script type="text/javascript" src="js/index.js"></script>-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">

</head>
<body class="modal white">


<!--     内容      -->
<form>
<div id="content" class="white">
    <div class="bloc">
        <div class="title">修改商品信息<a class="toggle"></a></div>
        <div class="content" style="height:290px;">
            <div class="input">
                <label>商品名称</label>
                <input type="text" id="bname" value="${findBookByBid.bname}">
                <input type="text" id="author" value="${findBookByBid.author}">
                <input type="text" id="price" value="${findBookByBid.price}">
                <input type="text" id="stock" value="${findBookByBid.stock}">
                <input type="text" id="status" value="<c:if test="${findBookByBid.status==0}">上架</c:if> ">
            </div>

            <div class="inpput"></div>
            <div class="submit">
                <input type="submit" value="确定">

            </div>
        </div>
    </div>
</div>
</form>
<br>

<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
</body><br>

</html>

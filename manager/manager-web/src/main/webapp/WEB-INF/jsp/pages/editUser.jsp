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
    <script type="text/javascript0" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/min.js"></script>
    <!--<script type="text/javascript" src="js/index.js"></script>-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">

</head>
<body class="modal white">


<!--     内容      -->
<form action="${pageContext.request.contextPath}/submitUser?uid=${editOneUser.uid}" method="post">
    <div id="content" class="white">
        <div class="bloc">
            <div class="title">修改用户信息<a class="toggle"></a></div>
            <div class="content" style="height:700px;">
                <div class="input">
                    <label>用户名</label>
                    <input type="text" id="username" name="username" value="${editOneUser.username}" readonly="readonly">
                    <label>密码</label>
                    <input type="text" id="password" name="password" value="${editOneUser.password}" readonly="readonly">
                    <label>邮箱</label>
                    <input type="text" id="email" name="email" value="${editOneUser.email}">
                    <label>状态</label>
                    <select id="status" name="status">
                        <c:if test="${editOneUser.status==1}">
                            <option value="1">正常</option>
                            <option value="0">异常</option>
                        </c:if>
                        <c:if test="${editOneUser.status==0}">
                            <option value="0">异常</option>
                            <option value="1">正常</option>
                        </c:if>
                    </select>
                    <label>真实姓名</label>
                    <input type="text" id="realName" name="realName" value="${editOneUser.realName}" readonly="readonly">
                    <label>手机</label>
                    <input type="text" id="mobile" name="mobile" value="${editOneUser.mobile}" >
                    <label>性别</label>
                    <select id="gender" name="gender">
                        <c:if test="${editOneUser.gender.equals('男')}">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </c:if>
                        <c:if test="${editOneUser.gender.equals('女')}">
                            <option value="女">女</option>
                            <option value="男">男</option>
                        </c:if>
                    </select>
                    <%--<label>生日</label>
                    <input type="date" id="birthday" name="birthday" value="${editOneUser.birthday}" >--%>
                    <label>住址</label>
                    <input type="text" id="address" name="address" value="${editOneUser.address}" >
                   <%-- <input type="text" id="stock" value="${editOneUser.status}">
                    <label>状态</label>
                    <input type="text" id="status"
                           <c:if test="${findBookByBid.status==0}">value="上架"</c:if>
                           <c:if test="${findBookByBid.status==1}">value="下架"</c:if>--%>
                    <%--<c:if test="${findBookByBid.status==0}">value="上架"</c:if>
                    >--%>
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

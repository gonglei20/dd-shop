<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/3/16
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理系统</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

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
<body>

<!--     内容      -->
<div id="content" class="white">
    <h1><img src="${pageContext.request.contextPath}/images/posts.png" alt="">用户管理</h1>

    <!--操作栏-->
    <div class="bloc">
        <div class="title"> 操作 <a class="toggle"></a></div>
        <div class="content dashboard">
            <div class="center" style="display: block; width: auto;">
                <a href="${pageContext.request.contextPath}/addUser" class="shortcut zoombox w500 h300">
                    <img src="${pageContext.request.contextPath}/images/glyph-add.png" alt="" width="48" height="48"> 添加用户 </a>
                
                <div class="cb">
                </div>
            </div>
        </div>
    </div>


    <div class="bloc">
        <div class="title"> 用户列表 <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#" class="toggle"></a></div>
        <div class="content">
            <table>
                <thead>
                <tr>
                    <th>id</th>
                    <th>用户名</th>
                    <th>邮箱</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <c:forEach items="${pageInfo.list}" var="userList">
                <tbody>
                <tr>
                    <td>${userList.uid}</td>
                    <td>${userList.username}</td>
                    <td>${userList.email}</td>
                    <td>
                        <c:if test="${userList.status==1}">
                            正常
                        </c:if>
                        <c:if test="${userList.status==0}">
                            异常
                        </c:if>

                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/editUser?uid=${userList.uid}" title="修改" class=" zoombox w500 h300">
                            <img src="${pageContext.request.contextPath}/images/edit.png" alt=""></a>
                        <a href="javascript:void(0)" onclick="deletePro('${userList.uid}')" title="删除">
                            <img src="${pageContext.request.contextPath}/images/delete.png" alt=""></a>
                    </td>
                </tr>
                </tbody>
                </c:forEach>
            </table>
            <%--<div class="pagination"> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#" class="prev">«</a> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#">1</a> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#" class="current">2</a> ... <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#">21</a> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#">22</a> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#" class="next">»</a> </div>--%>
            <!-- 分页数据 -->


        </div>
    </div>
</div>
<div class="row">

    <!-- 分页文字信息 -->
    <div class="col-md-6">
        <%-- 当前${pageInfo.pageNum}页,总${pageInfo.pages}页,总${pageInfo.total }条记录--%>
    </div>
    <!-- 分页条信息 -->
    <div class="col-md-6" >
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a  href="${pageContext.request.contextPath}/user?pn=1">首页</a></li>
                <c:if test="${pageInfo.hasPreviousPage }">
                    <li>
                        <a href="${pageContext.request.contextPath}/user?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                    <c:if test="${page_Num==pageInfo.pageNum }">
                        <li class="active"><a href="#">${page_Num }</a></li>
                    </c:if>
                    <c:if test="${page_Num!=pageInfo.pageNum }">
                        <li><a href="${pageContext.request.contextPath}/user?pn=${page_Num }">${page_Num }</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage }">
                    <li>
                        <a href="${pageContext.request.contextPath}/user?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

                <li><a href="${pageContext.request.contextPath}/user?pn=${pageInfo.pages}">末页</a></li>
            </ul>
        </nav>
    </div>

</div>
<br>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">

</div>
<script>
    function deletePro(uid) {
       var reslut = confirm("确认删除？");
       if(reslut==true){
          location.href="${pageContext.request.contextPath}/deleteUser?uid="+uid;
       }
    }
</script>
</body>
<br>
</html>
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
    <h1><img src="${pageContext.request.contextPath}/images/posts.png" alt="">分类管理</h1>

    <!--操作栏-->
    <div class="bloc">
        <div class="title"> 操作 <a class="toggle"></a></div>
        <div class="content dashboard">
            <select>
                <option >1</option>
                <option >1</option>

            </select>
            <div class="center" style="display: block; width: auto;">
                <a href="${pageContext.request.contextPath}/findCategory" class="shortcut zoombox w500 h300">
                    <img src="${pageContext.request.contextPath}/images/glyph-add.png" alt="" width="48" height="48"> 查询 </a>
                <div class="cb"></div>
            </div>
            </div>
        </div>
    </div>


    <div class="bloc">
        <div class="title"> 分类列表 <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#" class="toggle"></a></div>
        <div class="content">
            <table>
                <thead>
                <tr>
                    <th>id</th>
                    <th>二级分类名称</th>
                    <th>一级分类名称</th>
                    <th>操作</th>
                </tr>
                </thead>
                <c:forEach items="${categoryList}" var="categoryList">
                    <tbody>
                    <tr>
                        <td>${categoryList.cid}</td>
                        <td>${categoryList.cname}</td>
                        <td>${categoryList.pname}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/editCategory?id=${categoryList.cid}" title="修改" class=" zoombox w500 h300">
                                <img src="${pageContext.request.contextPath}/images/edit.png" alt=""></a>
                            <a href="javascript:void(0)" onclick="deletePro('${all.bid}')" title="删除">
                                <img src="${pageContext.request.contextPath}/images/delete.png" alt=""></a>
                        </td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
            <div class="pagination"> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#" class="prev">«</a> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#">1</a> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#" class="current">2</a> ... <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#">21</a> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#">22</a> <a href="http://www.grafikart.fr/demo/coreadmin/index.php?p=table#" class="next">»</a> </div>
        </div>
    </div>
</div>
<br>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">

</div>
<script>
    function deletePro(bid) {
        var reslut = confirm("确认删除？");
        if(reslut==true){
            location.href="${pageContext.request.contextPath}/deleteProduct?bid="+bid;
        }
    }
</script>
</body>
<br>
</html>
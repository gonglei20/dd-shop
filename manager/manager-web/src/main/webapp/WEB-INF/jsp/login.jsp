<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/3/15
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>后台管理</title>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="login_box">
    <div class="login_l_img"><img src="${pageContext.request.contextPath}/images/login-img.png" /></div>
    <div class="login">
        <div class="login_logo"><a href="#"><img src="${pageContext.request.contextPath}/images/login_logo.png" /></a></div>
        <div class="login_name">
            <p>后台管理系统</p>
        </div>
        <form id="userForm">
            <input name="adminName" type="text"  value="用户名" >
            <input name="adminPWD" type="password" id="adminPWD"  />
            <input value="登录" style="width:100%;" type="submit">
        </form>
    </div>
    <div class="copyright">某某有限公司 版权所有©2016-2018 技术支持电话：000-00000000</div>
</div>
<script type="text/javascript">
    //表单校验
    $(function() {
        $("#userForm")
            .validate(
                {
                    rules : {
                        username : "required",
                        password : {
                            required : true,
                            minlength : 5
                        }
                    },
                    messages : {
                        username : "用户名不能为空",
                        password : {
                            required : "请输入密码",
                            minlength : "密码长度不能小于 5 个字母"
                        }
                    },
                    submitHandler : function() {
                        //提交Ajax
                        $.ajax({
                            data : $("#userForm").serialize(),
                            dataType : "text",
                            type : "post",
                            url : "${pageContext.request.contextPath}/tologin",
                            success : function(rec) {
                                if(rec=="0"){
                                    $("#mess").html("用户名或密码错误");
                                }else{
                                    location.href = "${pageContext.request.contextPath}/index"
                                }
                            }
                        });
                    }
                });
    })
</script>
</body>
</html>

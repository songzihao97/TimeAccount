<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>用户登录</title>
        <!-- Custom Theme files -->
        <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <!-- Custom Theme files -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <!--Google Fonts-->
        <link href='http://fonts.useso.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
        <link href='http://fonts.useso.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <!--Google Fonts-->
        <style>
            body{
            background: url(${pageContext.request.contextPath}/static/images/banner.jpg)repeat;
            padding:100px 0px 30px 0px;
            font-family: 'Roboto', sans-serif;
            font-size: 100%;
            }
        </style>
    </head>
    <body>
        <div class="login">
            <h2>时间账单</h2>
            <div class="login-top">
                <h1>用户登录</h1>
                <form action="${pageContext.request.contextPath}/user/login" method="post">
                    <input type="text" name="username" placeholder="用户名">
                    <input type="password" name="password" placeholder="密码">
                <div class="forgot">
                    <%--<a href="#">forgot Password</a>--%>
                    <input type="submit" value="登录" >
                </div>
                </form>
                <span style="color: #761c19"><c:if test="${msg!=null}">${msg}</c:if></span>

            </div>
            <div class="login-bottom">
                <h3>管理员 <a href="${pageContext.request.contextPath}/adminLogin.jsp">登录</a>&nbsp&nbsp&nbsp新用户 &nbsp;<a href="${pageContext.request.contextPath}/regist.jsp">注册</a>&nbsp&nbsp</h3>
            </div>
        </div>
        <div class="copyright">
            <p>Copyright &copy;</p>
        </div>
    </body>
</html>
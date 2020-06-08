<%@page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
        <!-- 指定字符集 -->
        <meta charset="utf-8">
        <title>时间账单</title>
        <!-- 1. 导入CSS的全局样式 -->
        <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
        <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
        <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
        <!-- 3. 导入bootstrap的js文件 -->
        <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/calendar.jsp">Time</a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li style="width: 200px;height: 5px"></li>
                            <li><a href="${pageContext.request.contextPath}/UserInfo.jsp"><p style="width: 70px;height: 5px">用户信息</p></a></li>
                            <li><a href="${pageContext.request.contextPath}/lea/leaList"><p style="width: 70px;height: 5px">学习日程</p><span class="sr-only">(current)</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/work/workList"><p style="width: 70px;height: 5px">工作日程</p></a></li>
                            <li><a href="${pageContext.request.contextPath}/amu/amuList"><p style="width: 70px;height: 5px">娱乐日程</p></a></li>
                            <li><a href="${pageContext.request.contextPath}/lea/total"><p style="width: 95px;height: 5px">学习日程统计</p></a></li>
                            <li><a href="${pageContext.request.contextPath}/work/total"><p style="width: 95px;height: 5px">工作日程统计</p></a></li>
                            <li><a href="${pageContext.request.contextPath}/amu/total"><p style="width: 95px;height: 5px">娱乐日程统计</p></a></li>
                            <li><a href="${pageContext.request.contextPath}/user/total"><p style="width: 95px;height: 5px">所有日程统计</p></a></li>
                            <c:if test="${loginUser.userId==1}">
                                <li><a href="${pageContext.request.contextPath}/user/userList"><p style="width: 95px;height: 5px">用户信息管理</p></a></li>
                            </c:if>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>


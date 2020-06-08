<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<html lang="zh-CN">
    <head>
        <!-- 指定字符集 -->
        <meta charset="utf-8">
        <title>用户列表</title>
        <!-- 1. 导入CSS的全局样式 -->
        <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
        <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
        <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
        <!-- 3. 导入bootstrap的js文件 -->
        <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
        <style>
            td {text-align:center}
            th {text-align:center}
        </style>

        <script>
            function deleteUser(id) {
                //提示框
                if(confirm("您确定要删除吗？")){
                    location.href="${pageContext.request.contextPath}/user/delUser?userId="+id+"&&pn=${pageInfo.pageNum}";
                }
            }

            //全选/全部选
            $(function () {
                $("#check_all").click(function () {
                    $(".check_item").prop("checked",$(this).prop("checked"));
                });

                $(document).on("click",".check_item",function () {
                    //当前被选中check_item的个数
                    var flag=$(".check_item:checked").length==$(".check_item").length;
                    $("#check_all").prop("checked",flag);
                });
            });

            //删除选中
            $(function () {
                $("#delSelected").click(function () {
                    //提示
                    if (confirm("您确定要删除选中项吗?")){
                        //判断是否有被选中项
                        if ($(".check_item:checked").length!=0){
                            $("#del_form").submit();
                        }
                    }
                });
            });

        </script>

    </head>
    <body>
        <jsp:include page="top.jsp"></jsp:include>
        <%--页面主体--%>
        <div class="container">
            <!--标题-->
            <div class="row">
                <div class="col-md-12 col-md-offset-5">
                    <h1>用户管理</h1>
                </div>
            </div>
            <!--按钮-->
            <div class="row">
                <div style="float: right;margin:5px" class="col-md-2 col-md-offset-10" >
                    <a class="btn btn-danger" href="javascript:void(0)" id="delSelected">删除选中</a>
                </div>
            </div>
            <!--表格-->
            <div class="row">
                <div class="col-md-12">
                    <form id="del_form" action="${pageContext.request.contextPath}/user/delSelected" method="post">
                        <input type="text" style="display:none" name="pn" value="${pageInfo.pageNum}">
                        <table class="table table-bordered table-hover table-condensed">
                        <thead>
                        <tr>
                            <th><input type="checkbox" id="check_all"></th>
                            <th>编号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>生日</th>
                            <th>email</th>
                            <th>注册日期</th>
                            <th>最近登录</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageInfo.list}" var="user" varStatus="s">
                        <tr>
                            <td><input type="checkbox"  class="check_item" name="userId"  value="${user.userId}"></td>
                            <td>${s.count}</td>
                            <td>${user.username}</td>
                            <td>${user.sex}</td>
                            <td><f:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td>
                            <td>${user.email}</td>
                            <td><f:formatDate value="${user.registerTime}" pattern="yyyy-MM-dd"/></td>
                            <td><f:formatDate value="${user.lastLoginTime}" pattern="yyyy-MM-dd"/></td>
                            <td><a class="btn btn-danger btn-xs" href="javascript:deleteUser(${user.userId});">删除</a></td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    </form>
                </div>
            </div>
            <!--分页信息-->
            <div class="row">
                <div class="col-md-4">
                    总记录数：<span style="color: #46b8da">${pageInfo.total}</span> 总页码数：<span style="color: #46b8da">${pageInfo.pages}</span>
                </div>
                <div class="col-md-6">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li><a href="${pageContext.request.contextPath}/user/userList?pn=1">首页</a></li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/userList?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                                <c:if test="${page_Num==pageInfo.pageNum}">
                                    <li class="active"><a href="#">${page_Num}</a></li>
                                </c:if>
                                <c:if test="${page_Num!=pageInfo.pageNum}">
                                    <li><a href="${pageContext.request.contextPath}/user/userList?pn=${page_Num}">${page_Num}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageInfo.hasNextPage}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/userList?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <li><a href="${pageContext.request.contextPath}/user/userList?pn=${pageInfo.total}">末页</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<html>
    <head>
        <!-- 指定字符集 -->
        <meta charset="utf-8">
        <title>用户信息</title>
        <!-- 1. 导入CSS的全局样式 -->
        <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
        <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
        <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
        <!-- 3. 导入bootstrap的js文件 -->
        <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
        <script>
            $(function () {
                $("#user_update").click(function () {
                    //弹出模态框
                    $("#userUpdateModal").modal({
                        backdrop:"static"
                    });
                });
            });
            //点击保存
            $(function () {
                $("#user_update_btn").click(function () {
                        //模态框中信息提交服务器保存
                        $("#updateUser").submit();
                        //关闭模态框
                        $("#userAddModal").modal('hide');
                });
            });
        </script>
    </head>
    <body>
        <jsp:include page="WEB-INF/pages/top.jsp"></jsp:include>
        <div class="col-md-offset-6">
        <h3>个人信息</h3>
        </div>
        <%--修改按钮模态框--%>
        <div class="modal fade" id="userUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/user/updateUser" id="updateUser">
                            <%--<input type="text" style="display:none"  name="userId" value="${loginUser.userId}" readonly>--%>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">用户名</label>
                                <input type="text" style="display:none" name="userId" value="${loginUser.userId}">
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="username" name="username" value="${loginUser.username}" readonly>
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="password" name="password" value="${loginUser.password}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-10">
                                        <input type="radio" name="sex" value="男" checked="checked"/>男
                                        <input type="radio" name="sex" value="女"/>女
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">生日</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control" id="birthday" name="birthday"  value="<f:formatDate value="${loginUser.birthday}" pattern="yyyy-MM-dd"/>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">email</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="email" name="email" value="${loginUser.email}">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="user_update_btn">修改</button>
                    </div>

                </div>
            </div>
        </div>
        <%--主体--%>
        <form action="user/register" method="post" id="form" class="form-horizontal">
            <div class="row col-md-offset-4">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>用户名</label>
                        <input type="text" class="form-control" name="username" value="${loginUser.username}" readonly>
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input type="text" class="form-control" name="password" value="${loginUser.password}" readonly>
                    </div>
                    <div class="form-group">
                        <label>性别</label>
                        <input type="text" class="form-control" name="sex" value="${loginUser.sex}" readonly>
                    </div>
                    <div class="form-group">
                        <label>生日：</label>
                        <input type="text" class="form-control" name="birthday" value="<f:formatDate value="${loginUser.birthday}" pattern="yyyy-MM-dd"/>" readonly>
                    </div>
                    <div class="form-group">
                        <label>Email：</label>
                        <input type="text" class="form-control" name="email" value="${loginUser.email}" readonly>
                    </div>
                    <div class="form-group">
                        <label>注册日期：</label>
                        <input type="text" class="form-control" name="birthday" value="<f:formatDate value="${loginUser.registerTime}" pattern="yyyy-MM-dd"/>" readonly>
                    </div>
                </div>
            </div>
        </form>
        <div class="col-md-offset-6">
        <button class="btn btn-warning" id="user_update">修改</button>
        </div>
    </body>
</html>

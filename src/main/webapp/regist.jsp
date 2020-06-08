<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<!-- HTML5文档-->
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>注册</title>

    <!-- 1. jQuery导入，建议使用1.9以上的版本 -->
    <script src="static/js/jquery-2.1.0.min.js"></script>
    <!-- 2. 导入CSS的全局样式 -->
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="static/js/bootstrap.min.js"></script>
    <script>
        //校验填写数据
       $(function () {
            //重置
            $("#reset").click(function () {
                var href="${pageContext.request.contextPath}/regist.jsp";
                location.href=href;
            });
            //返回
           $("#back").click(function () {
                var href="${pageContext.request.contextPath}/index.jsp";
                location.href=href;
            });
            //1.表单验证
           $("#submit").click(function () {
                return checkEmail()&&nameExit()&&checkPassword();
            });
        });
        //校验密码
        function checkPassword(){
            //1.获取值
            var password = $("#password").val();
            //2.定义正则表达式
            var reg_password =/^[a-z0-9_-]{4,18}$/;
            //3.判断值是否符合正则的规则
            var flag = reg_password.test(password);
            //4.提示信息
            if(!flag){
                //提示红色用户名有误
                $("#t_password")[0].innerHTML = "密码格式有误";
            }else{
                $("#t_password")[0].innerHTML = "";
            }
            return flag;
        }
        //校验邮箱
        function checkEmail(){
            //1.获取值
            var email = $("#email").val();
            //2.定义正则表达式
            var reg_email =/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
            //3.判断值是否符合正则的规则
            var flag = reg_email.test(email);
            //4.提示信息
            if(!flag){
                //提示红色用户名有误
                $("#t_email")[0].innerHTML = "邮箱格式有误";
            }else{
                $("#t_email")[0].innerHTML = "";
            }
            return flag;
        }
        //ajax用户名后台验证
        function nameExit(){
            var flag=true;
            var username=$("#name").val().trim();
            if(username!="" && username.length>0){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/checkUsername",
                    data:"username="+username,
                    type:"POST",
                    success:function (result) {
                        if (result.code==100){
                            $("#t_err_name")[0].innerHTML = "";
                            $("#t_success_name")[0].innerHTML = "用户名可用";
                            flag=true;
                            $("#")
                        }else if (result.code==200){
                            $("#t_err_name")[0].innerHTML = "用户名不可用";
                            flag=false;
                        }
                    }
                });
            }else {
                $("#t_err_name")[0].innerHTML = "用户名不能为空";
                flag=false;
            };
            return flag;
        }
    </script>
    <style>
        .error{
            color: red;
        }
        .success{
            color: #3e8f3e;
        }
    </style>
</head>
<body>
<div class="container">
    <center><h3>注册页面</h3></center>
    <form action="user/register" method="post" id="form" class="form-horizontal">
        <div class="row col-md-offset-3">
            <div class="col-md-8">
                <div class="form-group form-horizontal">
                    <label for="name">姓名：</label>
                    <input type="text" class="form-control" id="name" name="username" placeholder="请输入姓名" onblur="nameExit()">
                    <span id="t_err_name" class="error help-block"></span>
                    <span id="t_success_name" class="success help-block"></span>
                </div>

                <div class="form-group">
                    <label for="password">密码：</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" onblur="checkPassword()">
                    <span id="t_password" class="error help-block"></span>
                </div>

                <div class="form-group">
                    <label>性别：</label>
                    <input type="radio" name="sex" value="男" checked="checked"/>男
                    <input type="radio" name="sex" value="女"/>女
                </div>

                <div class="form-group">
                    <label for="birthday">生日：</label>
                    <input type="date" class="form-control" id="birthday" name="birthday" value="2000-01-01">
                </div>

                <div class="form-group">
                    <label for="email">Email：</label>
                    <input type="text" class="form-control" name="email" placeholder="请输入邮箱地址" id="email" onblur="checkEmail()"/>
                    <span id="t_email" class="error help-block"></span>
                </div>
                <div class="form-group" style="text-align: center">
                    <input class="btn btn-primary" type="submit" id="submit" value="注册" />
                    <input class="btn btn-default" id="reset" type="reset" value="重置" />
                    <input class="btn btn-default" id="back" type="button" value="返回" />
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
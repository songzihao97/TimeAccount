<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<html>
    <head>
        <!-- 指定字符集 -->
        <meta charset="UTF-8">
        <!-- 1. 导入CSS的全局样式 -->
        <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
        <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
        <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
        <!-- 3. 导入bootstrap的js文件 -->
        <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
        <title>娱乐日程</title>

        <script>
            //打开新增模态框
            $(function () {
                $("#amu_Add_Modal").click(function () {
                    //清空表单
                    $("#amuAddModal form")[0].reset();
                    //发送ajax请求
                    getAmuType("#amuType_add_select");
                    //设置date默认值为当前时间
                    $("#date_add")[0].valueAsDate=new Date();
                    $("#startTime_add").val(datetimeFormat(new Date()))
                    $("#endTime_add").val(datetimeFormat(new Date()))
                    //弹出模态框
                    $("#amuAddModal").modal({
                        backdrop:"static"
                    });
                });
            });
            //查出所有娱乐日程类型数据并显示在下拉列表
            function getAmuType(ele) {
                $.ajax({
                    url:"${pageContext.request.contextPath}/amu/getAll",
                    type:"Get",
                    success:function (result) {
                        //先清空数据
                        $(ele).empty();
                        $.each(result.extend.amuTypes,function () {
                            var optionEle=$("<option></option>").append(this.amuType).attr("value",this.amuId);
                            optionEle.appendTo($(ele))
                        });
                    }
                });
            }
            //校验方法
            function validate_add_form(){
                var schedule=$("#schedule_add").val();
                if (schedule==null||schedule.length==0){
                    show_validate_msg("#schedule_add","error","不能为空")
                    return false;
                }else{
                    show_validate_msg("#schedule_add","success","")
                    return true;
                }
            }
            //校验显示
            function show_validate_msg(ele,status,msg){
                if("success"==status){
                    $(ele).parent().addClass("has-success");
                    $(ele).next("span").text("")
                }else if ("error"==status){
                    $(ele).parent().addClass("has-error");
                    $(ele).next("span").text(msg);
                }
            }
            //点击保存
            $(function () {
                $("#amu_save_btn").click(function () {
                    if (!validate_add_form()){
                        return false;
                    }else{
                        //模态框中信息提交服务器保存
                        $("#addAmu").submit();
                        //关闭模态框
                        $("#amuAddModal").modal('hide');
                    }
                });
            });

            //修改模态框
            $(function () {
                $(".edit_btn").click(function () {
                    //1.查询类别信息
                    getAmuType("#amuType_update_select");
                    //2.查询日程信息
                    getOneAmu($(this).attr("edit-id"));
                    //打开
                   $("#amuUpdateModal").modal({
                      backdrop:"static"
                   });
                });
            })

            //修改时间格式为datetime赋初值
            function datetimeFormat(date){
                var format="";
                var nTime = new Date(date);
                format += nTime.getFullYear()+"-";
                format += (nTime.getMonth()+1)<10?"0"+(nTime.getMonth()+1):(nTime.getMonth()+1);
                format += "-";
                format += nTime.getDate()<10?"0"+(nTime.getDate()):(nTime.getDate());
                format += "T";
                format += nTime.getHours()<10?"0"+(nTime.getHours()):(nTime.getHours());
                format += ":";
                format += nTime.getMinutes()<10?"0"+(nTime.getMinutes()):(nTime.getMinutes());
                return format;
            }
            function dateFormat(date){
                var format="";
                var nTime = new Date(date);
                format += nTime.getFullYear()+"-";
                format += (nTime.getMonth()+1)<10?"0"+(nTime.getMonth()+1):(nTime.getMonth()+1);
                format += "-";
                format += nTime.getDate()<10?"0"+(nTime.getDate()):(nTime.getDate());
                return format;
            }

            //根据查询日程信息
            function getOneAmu(id) {
                $.ajax({
                    url:"${pageContext.request.contextPath}/amu/getAmuById",
                    data:"id="+id,
                    type:"get",
                    success:function (result) {
                        //console.log(result);
                        var amuAccount=result.extend.amuAccount;
                        $("#schedule_update").val(amuAccount.schedule);
                        $("#date_update").val(dateFormat(amuAccount.date));
                        $("#amuUpdateModal select").val([amuAccount.typeId]);
                        $("#startTime_update").val(datetimeFormat(amuAccount.startTime));
                        $("#endTime_update").val(datetimeFormat(amuAccount.endTime));
                        $("#id").val(amuAccount.id);
                    }
                });
            }

            //校验方法
            function validate_update_form(){
                var schedule=$("#schedule_update").val();
                if (schedule==null||schedule.length==0){
                    show_validate_msg("#schedule_update","error","不能为空")
                    return false;
                }else{
                    show_validate_msg("#schedule_update","success","")
                    return true;
                }
            }

            //点击修改
            $(function () {
                $("#amu_update_btn").click(function () {
                    if (!validate_update_form()){
                        return false;
                    }else{
                        //模态框中信息提交服务器保存
                        $("#updateAmu").submit();
                        //关闭模态框
                        $("#amuUpdateModal").modal('hide');
                    }
                });
            });
            function deleteAmu(id) {
                //提示框
                if(confirm("您确定要删除吗？")){
               location.href="${pageContext.request.contextPath}/amu/delAmu?id="+id+"&&pn="+${AmuPageInfo.pageNum};
                }
            }
        </script>

        <style>
            td {text-align:center}
            th {text-align:center}
        </style>
    </head>
    <body>
        <jsp:include page="top.jsp"></jsp:include>
        <%--添加按钮模态框--%>
        <div class="modal fade" id="amuAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel_add">娱乐日程添加</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/amu/addAmu" id="addAmu" method="post">
                            <div class="form-group">
                                <input style="display:none" type="text" name="uid" value="${loginUser.userId}">
                                <label class="col-sm-2 control-label">名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="schedule_add" name="schedule" placeholder="请输入名称">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">日期</label>
                                <div class="col-sm-10">
                                    <input type="date" required="required" class="form-control" id="date_add" name="date">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">日程类型</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="typeId" id="amuType_add_select">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">开始时间</label>
                                <div class="col-sm-10">
                                    <input type="datetime-local" class="form-control" id="startTime_add" name="startTime" placeholder="按照yyyy-MM-dd HH:mm格式填写" <%--value="2020-01-01T08:00"--%>/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">结束时间</label>
                                <div class="col-sm-10">
                                    <input type="datetime-local" class="form-control" id="endTime_add" name="endTime" placeholder="按照yyyy-MM-dd HH:mm格式填写" value="2020-01-01T08:20">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="amu_save_btn">保存</button>
                    </div>

                </div>
            </div>
        </div>
        <%--修改按钮模态框--%>
        <div class="modal fade" id="amuUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">娱乐日程修改</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/amu/updateAmu" id="updateAmu" method="post">
                            <div class="form-group">
                                <input style="display:none" type="text" name="id" id="id">
                                <input style="display:none" type="text" name="pn" value="${AmuPageInfo.pageNum}">
                                <label class="col-sm-2 control-label">名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="schedule_update" name="schedule">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">日期</label>
                                <div class="col-sm-10">
                                    <input type="date"  class="form-control" id="date_update" name="date">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">日程类型</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="typeId" id="amuType_update_select">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">开始时间</label>
                                <div class="col-sm-10">
                                    <input type="datetime-local" class="form-control" id="startTime_update" name="startTime">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">结束时间</label>
                                <div class="col-sm-10">
                                    <input type="datetime-local" class="form-control" id="endTime_update" name="endTime">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="amu_update_btn">修改</button>
                    </div>

                </div>
            </div>
        </div>
        <%--页面主体--%>
        <div class="container">
            <!--标题-->
            <div class="row">
                <div class="col-md-12 col-md-offset-5">
                    <h1>娱乐日程</h1>
                </div>
            </div>
            <!--按钮-->
            <div class="row" style="margin:5px">
                <div class="col-md-10">
                    <form action="${pageContext.request.contextPath}/amu/amuList" method="get" class="form-inline">
                        <div class="form-group">
                            <label>名称</label>
                            <input type="text" class="form-control" id="schedule" placeholder="请输入名称关键字" name="schedule" value="${account.schedule}">
                        </div>
                        <div class="form-group">
                            <label>耗费时间>=</label>
                            <input type="text" class="form-control" id="elapsedTime" name="elapsedTime" placeholder="请填入整小时数" value="${account.elapsedTime}">
                        </div>
                        <button type="submit" class="btn btn-default">查询</button>
                    </form>
                </div>
                <div  class="col-md-2">
                    <button class="btn btn-info" id="amu_Add_Modal">增加日程</button>
                </div>
            </div>
            <!--表格-->
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-bordered table-hover table-condensed">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>名称</th>
                            <th>日期</th>
                            <th>日程类型</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>耗费时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${AmuPageInfo.list}" var="amuAccount" varStatus="s">
                            <tr>
                                <td>${s.count}</td>
                                <td>${amuAccount.schedule}</td>
                                <td><f:formatDate value="${amuAccount.date}" pattern="yyyy-MM-dd"/></td>
                                <td>${amuAccount.amuType.amuType}</td>
                                <td><f:formatDate value="${amuAccount.startTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                <td><f:formatDate value="${amuAccount.endTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                <td>${amuAccount.elapsedTime}</td>
                                <td><button class="btn btn-info btn-xs edit_btn" edit-id="${amuAccount.id}">修改</button>
                                    <a class="btn btn-danger btn-xs" href="javascript:deleteAmu(${amuAccount.id});">删除</a>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--分页信息-->
            <div class="row">
                <div class="col-md-4">
                    总记录数：<span style="color: #46b8da">${AmuPageInfo.total}</span> 总页码数：<span style="color: #46b8da">${AmuPageInfo.pages}</span>
                </div>
                <div class="col-md-6">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li><a href="${pageContext.request.contextPath}/amu/amuList?pn=1&&schedule=${account.schedule}&elapsedTime=${account.elapsedTime}">首页</a></li>
                            <c:if test="${AmuPageInfo.hasPreviousPage}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/amu/amuList?pn=${AmuPageInfo.pageNum-1}&&schedule=${account.schedule}&elapsedTime=${account.elapsedTime}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach items="${AmuPageInfo.navigatepageNums}" var="page_Num">
                                <c:if test="${page_Num==AmuPageInfo.pageNum}">
                                    <li class="active"><a href="#">${page_Num}</a></li>
                                </c:if>
                                <c:if test="${page_Num!=AmuPageInfo.pageNum}">
                                    <li><a href="${pageContext.request.contextPath}/amu/amuList?pn=${page_Num}&&schedule=${account.schedule}&elapsedTime=${account.elapsedTime}">${page_Num}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${AmuPageInfo.hasNextPage}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/amu/amuList?pn=${AmuPageInfo.pageNum+1}&&schedule=${account.schedule}&elapsedTime=${account.elapsedTime}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <li><a href="${pageContext.request.contextPath}/amu/amuList?pn=${AmuPageInfo.total}&&schedule=${account.schedule}&elapsedTime=${account.elapsedTime}">末页</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </body>
</html>

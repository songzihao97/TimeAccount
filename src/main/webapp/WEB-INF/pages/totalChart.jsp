<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>可视化数据统计</title>
        <%--引入echarts--%>
        <script src="${pageContext.request.contextPath}/static/js/echarts.min.js"></script>
        <!-- 1. 导入CSS的全局样式 -->
        <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
        <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
        <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
        <!-- 3. 导入bootstrap的js文件 -->
        <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            //近7天数据
            $(function () {
                // 基于准备好的dom，初始化echarts实例
                var week_bar = echarts.init(document.getElementById('week_bar'));
                var week_pie = echarts.init(document.getElementById('week_pie'));
                // 指定图表的配置项和数据
                //柱形图
                var week_bar_option = {
                    title: {
                        text: '近7天${type}日程统计',
                        left: 'center',
                    },
                    tooltip: {},
                    legend: {
                        data:['时间']
                    },
                    xAxis: {
                        data: [
                            <c:forEach items="${totalWeek}" var="total">
                            "${total.typeName}",
                            </c:forEach>
                        ]
                    },
                    yAxis: {},
                    series: [{
                        name: '耗时/小时',
                        type: 'bar',
                        data: [
                            <c:forEach items="${totalWeek}" var="total">
                            "${total.total}",
                            </c:forEach>
                        ]
                    }]
                };
                //饼形图
                var week_pie_option = {
                    title: {
                        text: '近7天${type}日程统计',
                        left: 'center',
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a} <br/>{b} : {c} ({d}%)'
                    },
                    series: [
                        {
                            name: '耗时/小时',
                            type: 'pie',
                            radius: '70%',
                            data: [
                                <c:forEach items="${totalWeek}" var="total">
                                {value: ${total.total}, name: '${total.typeName}'},
                                </c:forEach>
                            ]
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                week_bar.setOption(week_bar_option);
                week_pie.setOption(week_pie_option);
            });
            //近30天数据
            $(function () {
                // 基于准备好的dom，初始化echarts实例
                var month_bar = echarts.init(document.getElementById('month_bar'));
                var month_pie = echarts.init(document.getElementById('month_pie'));
                // 指定图表的配置项和数据
                //柱形图
                var month_bar_option = {
                    title: {
                        text: '近30天${type}日程统计',
                        left: 'center',
                    },
                    tooltip: {},
                    legend: {
                        data:['时间']
                    },
                    xAxis: {
                        data: [
                            <c:forEach items="${totalMonth}" var="total">
                            "${total.typeName}",
                            </c:forEach>
                        ]
                    },
                    yAxis: {},
                    series: [{
                        name: '耗时/小时',
                        type: 'bar',
                        data: [
                            <c:forEach items="${totalMonth}" var="total">
                            "${total.total}",
                            </c:forEach>
                        ]
                    }]
                };
                //饼形图
                var month_pie_option = {
                    title: {
                        text: '近30天${type}日程统计',
                        left: 'center',
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a} <br/>{b} : {c} ({d}%)'
                    },
                    series: [
                        {
                            name: '耗时/小时',
                            type: 'pie',
                            radius: '70%',
                            data: [
                                <c:forEach items="${totalMonth}" var="total">
                                {value: ${total.total}, name: '${total.typeName}'},
                                </c:forEach>
                            ]
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                month_bar.setOption(month_bar_option);
                month_pie.setOption(month_pie_option);
            });
            //所有数据
            $(function () {
                // 基于准备好的dom，初始化echarts实例
                var all_bar = echarts.init(document.getElementById('all_bar'));
                var all_pie = echarts.init(document.getElementById('all_pie'));
                // 指定图表的配置项和数据
                //柱形图
                var all_bar_option = {
                    title: {
                        text: '全部${type}日程统计',
                        left: 'center',
                    },
                    tooltip: {},
                    legend: {
                        data:['时间']
                    },
                    xAxis: {
                        data: [
                            <c:forEach items="${totalAll}" var="total">
                            "${total.typeName}",
                            </c:forEach>
                        ]
                    },
                    yAxis: {},
                    series: [{
                        name: '耗时/小时',
                        type: 'bar',
                        data: [
                            <c:forEach items="${totalAll}" var="total">
                            "${total.total}",
                            </c:forEach>
                        ]
                    }]
                };
                //饼形图
                var all_pie_option = {
                    title: {
                        text: '全部${type}日程统计',
                        left: 'center',
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a} <br/>{b} : {c} ({d}%)'
                    },
                    series: [
                        {
                            name: '耗时/小时',
                            type: 'pie',
                            radius: '70%',
                            data: [
                                <c:forEach items="${totalAll}" var="total">
                                {value: ${total.total}, name: '${total.typeName}'},
                                </c:forEach>
                            ]
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                all_bar.setOption(all_bar_option);
                all_pie.setOption(all_pie_option);
            });
        </script>
    </head>
    <body>
        <jsp:include page="top.jsp"></jsp:include>
        <div class="row panel">
            <div class="panel-body panel-success text-center"><h3 style="color: #2aabd2">近7天${type}日程记录统计</h3></div>
        </div>
        <div class="row">
            <div class="col-md-5 col-md-offset-1" id="week_bar" style="width: 600px;height:400px;"></div>
            <div class="col-md-5 col-md-offset-1" id="week_pie" style="width: 600px;height:400px;"></div>
        </div>
        <div class="row panel">
            <div class="panel-body panel-success text-center"><h3 style="color: #2aabd2">近30天${type}日程记录统计</h3></div>
        </div>
        <div class="row">
            <div class="col-md-5 col-md-offset-1" id="month_bar" style="width: 600px;height:400px;"></div>
            <div class="col-md-5 col-md-offset-1" id="month_pie" style="width: 600px;height:400px;"></div>
        </div>
        <div class="row panel">
        <div class="panel-body panel-success text-center"><h3 style="color: #2aabd2">全部${type}日程记录统计</h3></div>
        </div>
        <div class="row">
            <div class="col-md-5 col-md-offset-1" id="all_bar" style="width: 600px;height:400px;"></div>
            <div class="col-md-5 col-md-offset-1" id="all_pie" style="width: 600px;height:400px;"></div>
        </div>
    </body>
</html>

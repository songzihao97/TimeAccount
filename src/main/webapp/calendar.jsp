<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <meta charset="UTF-8">
    <title>日历</title>
    <link rel="stylesheet" href="https://at.alicdn.com/t/font_234130_nem7eskcrkpdgqfr.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        ul {
            list-style: none;
        }

        #schedule-box {
            width: 320px;
            margin: 0 auto;
            padding: 35px 20px;
            font-size: 13px;
        }

        .schedule-hd {
            display: flex;
            justify-content: space-between;
            padding: 0 15px;
        }

        .today {
            flex: 1;
            text-align: center;
        }

        .ul-box {
            overflow: hidden;
        }

        .ul-box>li {
            float: left;
            width: 14.28%;
            text-align: center;
            padding: 5px 0;
        }

        .other-month {
            color: #999999;
        }

        .disabled {
            pointer-events: none;
            background-color: #eeeeee;
            color: #999999;
        }

        .current-month {
            color: #333333;
        }

        .today-style {
            border-radius: 50%;
            background: #58d321;
        }

        .arrow {
            cursor: pointer;
        }

        .dayStyle {
            display: inline-block;
            width: 35px;
            height: 35px;
            border-radius: 50%;
            text-align: center;
            line-height: 35px;
            cursor: pointer;
        }

        .current-month>.dayStyle:hover {
            background: #00BDFF;
            color: #ffffff;
        }

        .today-flag {
            background: #00C2B1;
            color: #fff;
        }

        .boxshaw {
            box-shadow: 2px 2px 15px 2px #e3e3e3;
        }

        .selected-style {
            background-color: #ffba5a;
            color: #ffffff;
        }

        .active-style {
            background: #00BDFF;
            color: #ffffff;
        }

        #h3Ele {
            text-align: center;
            padding: 10px;
        }

        .today {
            text-align: center;
            color: #8ac6d1;
            padding: 5px 0 0;
            font-weight: bold;
            cursor: pointer;
            font-size: 15px;
        }
    </style>
    <script>
        $(function () {
           var birthday=Date.parse('${loginUser.birthday}');
           var now=new Date();
           var life=(Date.parse(now)-birthday)/(1000*60*60);
           //放入数据，精确到哪一位
           $("#date").text(life.toFixed(0));
        });
    </script>
    </head>

    <body>
        <%@include file="WEB-INF/pages/top.jsp"%>
        <div style="text-align: center;font-size: 20px">您已度过<span style="color: #5bc0de" id="date"></span>小时，请合理利用您的时间</div>
        <div style="height:40px;"></div>
        <div id='schedule-box' class="boxshaw" style="top: 40px" >

        </div>
        <div>
            <h3 id='h3Ele'></h3>
        </div>
    </body>
    <script src="${pageContext.request.contextPath}/static/js/schedule.js"></script>
    <script>
        var mySchedule = new Schedule({
            el: '#schedule-box',	//容器元素
            date: new Date(),
            showToday: true,	//回到今天
            clickCb: function (date) {
                document.querySelector('#h3Ele').innerHTML = '日期：' + date
            },
            nextMonthCb: function (currentYear, currentMonth) {
                console.log('currentYear:' + currentYear, 'currentMonth:' + currentMonth)
            },
            nextYeayCb: function (currentYear, currentMonth) {
                console.log('currentYear:' + currentYear, 'currentMonth:' + currentMonth)
            },
            prevMonthCb: function (currentYear, currentMonth) {
                console.log('currentYear:' + currentYear, 'currentMonth:' + currentMonth)
            },
            prevYearCb: function (currentYear, currentMonth) {
                console.log('currentYear:' + currentYear, 'currentMonth:' + currentMonth)
            }
        });
    </script>
</html>
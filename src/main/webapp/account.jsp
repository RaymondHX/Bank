<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<!doctype html>

<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人主页</title>

    <%--    <link rel="stylesheet" type="text/css" href="css/normalize.css" />--%>
    <%--    <link rel="stylesheet" type="text/css" href="css/default.css">--%>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <%--    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">--%>
    <%--    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">--%>
    <%--    <link rel="stylesheet" href="assets/css/form-elements.css">--%>
    <%--    <link rel="stylesheet" href="assets/css/style.css">--%>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!--	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>-->
    <!--	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>-->


    <style type="text/css">
        html, body {
            margin: 0;
            padding: 0;
            width: 100%;
            /*height: 100%;*/
            background-color: #66cbbb;
            font-family: 'Raleway';
        }

        ul, li {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .icon {
            position: relative;
            width: 32px;
            height: 32px;
            display: block;
            fill: rgba(51, 51, 51, 0.5);
            margin-right: 20px;
            -webkit-transition: all .2s ease-out;
            transition: all .2s ease-out;
        }

        .icon.active {
            /*fill: #E74C3C;*/
            fill: #66cbbb;
        }

        .icon.big {
            width: 64px;
            height: 64px;
            fill: rgba(51, 51, 51, 0.5);
        }

        #wrapper {
            width: 900px;
            height: 400px;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            background-color: #fff;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: left;
            -webkit-justify-content: left;
            -ms-flex-pack: left;
            justify-content: left;
            overflow: hidden;
        }

        #left-side {
            height: 70%;
            width: 25%;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            -ms-flex-pack: center;
            justify-content: center;
        }

        #left-side ul li {
            padding-top: 10px;
            padding-bottom: 10px;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            line-height: 34px;
            color: rgba(51, 51, 51, 0.5);
            font-weight: 500;
            cursor: pointer;
            -webkit-transition: all .2s ease-out;
            transition: all .2s ease-out;
        }

        #left-side ul li:hover {
            color: #333333;
            -webkit-transition: all .2s ease-out;
            transition: all .2s ease-out;
        }

        #left-side ul li:hover > .icon {
            fill: #333;
        }

        #left-side ul li.active {
            color: #333333;
        }

        #left-side ul li.active:hover > .icon {
            fill: #E74C3C;
        }

        #border {
            height: 288px;
            width: 1px;
            background-color: rgba(51, 51, 51, 0.2);
        }

        #border #line.one {
            width: 5px;
            height: 54px;
            background-color: #E74C3C;
            margin-left: -2px;
            margin-top: 35px;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        #border #line.two {
            width: 5px;
            height: 54px;
            background-color: #E74C3C;
            margin-left: -2px;
            margin-top: 89px;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        #border #line.three {
            width: 5px;
            height: 54px;
            background-color: #E74C3C;
            margin-left: -2px;
            margin-top: 143px;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        #border #line.four {
            width: 5px;
            height: 54px;
            background-color: #E74C3C;
            margin-left: -2px;
            margin-top: 197px;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        #right-side {
            height: 300px;
            width: 75%;
            overflow: hidden;
        }

        #right-side #first, #right-side #second, #right-side #third, #right-side #fourth {
            position: absolute;
            height: 300px;
            width: 75%;
            -webkit-transition: all .6s ease-in-out;
            transition: all .6s ease-in-out;
            margin-top: -350px;
            opacity: 0;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            -ms-flex-pack: center;
            justify-content: center;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
        }

        #right-side #first h1, #right-side #second h1, #right-side #third h1, #right-side #fourth h1 {
            font-weight: 800;
            color: #333;
        }

        #right-side #first p, #right-side #second p, #right-side #third p, #right-side #fourth p {
            color: #333;
            font-weight: 500;
            padding-left: 30px;
            padding-right: 30px;
        }

        #right-side #first.active, #right-side #second.active, #right-side #third.active, #right-side #fourth.active {
            margin-top: 0px;
            opacity: 1;
            -webkit-transition: all .6s ease-in-out;
            transition: all .6s ease-in-out;
        }
    </style>
    <script type="text/javascript" src="js/crypto-js/core.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/crypto-js/cipher-core.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/crypto-js/mode-ecb.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/crypto-js/tripledes.js" charset="utf-8"></script>
</head>


<body>

<svg id="svg-source" height="0" version="1.1" xmlns="http://www.w3.org/2000/svg"
     xmlns:xlink="http://www.w3.org/1999/xlink" style="position: absolute">
    <g id="shopping-cart" data-iconmelon="e-commerce icons:7c96e2dece0152dc594d66b260f79db0">
        <path d="M22.463,25.841c0.528,0,0.918-0.429,0.918-0.958v-6.786c0-0.529-0.39-0.958-0.918-0.958c-0.529,0-0.92,0.429-0.92,0.958
	v6.786C21.543,25.413,21.934,25.841,22.463,25.841z M18.156,25.841c0.529,0,0.919-0.429,0.919-0.958v-6.786
	c0-0.529-0.39-0.958-0.919-0.958s-0.919,0.429-0.919,0.958v6.786C17.237,25.413,17.627,25.841,18.156,25.841z M13.851,25.841
	c0.528,0,0.919-0.429,0.919-0.958v-6.786c0-0.529-0.391-0.958-0.919-0.958c-0.529,0-0.919,0.429-0.919,0.958v6.786
	C12.932,25.413,13.321,25.841,13.851,25.841z M29.426,8.511h-5.327l-2.731-4.396c-0.342-0.593-0.98-0.961-1.666-0.961
	c-0.336,0-0.668,0.089-0.959,0.258c-0.918,0.529-1.233,1.707-0.689,2.647l1.564,2.451h-7.976l1.58-2.475
	c0.529-0.917,0.214-2.095-0.704-2.624c-0.292-0.169-0.623-0.258-0.959-0.258c-0.686,0-1.323,0.368-1.655,0.943L7.161,8.511H2.574
	C1.155,8.511,0,9.667,0,11.086v1.47c0,1.274,0.934,2.525,2.152,2.728l1.931,11.042c0.03,1.394,1.173,2.519,2.573,2.519h18.605
	c1.401,0,2.545-1.125,2.574-2.52l1.921-11.032C31.019,15.128,32,13.862,32,12.556v-1.47C32,9.667,30.845,8.511,29.426,8.511z
	 M26.615,26.167l-0.009,0.104c0,0.741-0.604,1.344-1.345,1.344H6.656c-0.741,0-1.344-0.603-1.344-1.344L3.407,15.327h25.096
	L26.615,26.167z M30.77,12.556c0,0.74-0.603,1.541-1.344,1.541H2.574c-0.741,0-1.344-0.8-1.344-1.541v-1.47
	c0-0.741,0.603-1.344,1.344-1.344h5.271l3.113-5.011c0.184-0.318,0.623-0.439,0.944-0.253c0.33,0.19,0.444,0.614,0.268,0.92
	L9.396,9.742h12.467l-2.76-4.32c-0.189-0.33-0.076-0.753,0.253-0.944c0.323-0.186,0.756-0.074,0.955,0.27l3.104,4.994h6.011
	c0.741,0,1.344,0.603,1.344,1.344V12.556z M9.545,25.841c0.528,0,0.918-0.429,0.918-0.958v-6.786c0-0.529-0.39-0.958-0.918-0.958
	c-0.529,0-0.919,0.429-0.919,0.958v6.786C8.626,25.413,9.016,25.841,9.545,25.841z"></path>
    </g>
    <g id="credit-card" data-iconmelon="e-commerce icons:c3144b166f93e0f6b73aee04a0a48397">
        <path d="M29.018,4.751H2.981C1.337,4.751,0,6.089,0,7.733v16.534c0,1.644,1.337,2.981,2.981,2.981h26.036
	c1.645,0,2.982-1.338,2.982-2.981V7.733C32,6.089,30.662,4.751,29.018,4.751z M30.638,24.267c0,0.893-0.727,1.62-1.621,1.62H2.981
	c-0.893,0-1.62-0.727-1.62-1.62V13.603h29.276V24.267z M30.638,10.236H1.362V7.733c0-0.894,0.727-1.62,1.62-1.62h26.036
	c0.894,0,1.621,0.727,1.621,1.62V10.236z M8.848,22.494H2.724v1.338h6.124V22.494z M19.043,22.494H9.548v1.338h9.495V22.494z"></path>
    </g>
    <g id="gift" data-iconmelon="e-commerce icons:05fa65d254ada5a9cb5c2f1e8d87f02b">
        <path d="M29.084,7.154h-4.807c0.157-0.146,0.731-0.497,0.866-0.678c0.757-1.01,1.016-2.355,0.677-3.51
	c-0.473-1.612-1.773-2.575-3.479-2.575c-1.017,0-1.993,0.371-2.546,0.967c-0.759,0.818-2.841,3.57-3.764,4.8
	c-0.923-1.23-3.004-3.982-3.764-4.8c-0.553-0.596-1.528-0.967-2.546-0.967c-1.706,0-3.007,0.962-3.479,2.575
	c-0.339,1.155-0.08,2.5,0.677,3.51C7.053,6.657,7.5,7.007,7.657,7.154H2.915C1.308,7.154,0,8.462,0,10.07v5.262h1.356v13.362
	c0,1.607,1.308,2.915,2.916,2.915h23.435c1.607,0,2.915-1.308,2.915-2.915V15.332H32V10.07C32,8.462,30.692,7.154,29.084,7.154z
	 M14.281,30.311H4.272c-0.857,0-1.555-0.76-1.555-1.617V15.401h11.563V30.311z M14.281,13.949H1.362V10.07
	c0-0.857,0.696-1.555,1.553-1.555h11.366V13.949z M9.456,6.471c-0.731,0-1.221-0.508-1.447-0.811
	c-0.498-0.664-0.678-1.571-0.46-2.312c0.423-1.441,1.661-1.597,2.173-1.597c0.729,0,1.303,0.268,1.548,0.532
	c0.623,0.671,2.289,2.854,3.301,4.197C12.948,6.477,10.35,6.471,9.456,6.471z M20.792,2.285c0.245-0.265,0.819-0.532,1.548-0.532
	c0.513,0,1.75,0.156,2.173,1.597c0.217,0.74,0.037,1.647-0.46,2.311c-0.227,0.303-0.716,0.811-1.447,0.811
	c-0.894,0-3.493,0.006-5.115,0.011C18.504,5.139,20.169,2.956,20.792,2.285z M29.26,28.694c0,0.857-0.697,1.617-1.554,1.617h-10.02
	v-14.91H29.26V28.694z M30.638,13.949H17.687V8.515h11.397c0.858,0,1.554,0.698,1.554,1.555V13.949z"></path>
    </g>
    <g id="package" data-iconmelon="e-commerce icons:de2d76203b2448ee25bda0d82fa73c00">
        <path d="M31.666,7.132l0.028-0.014L16.191,0L0.264,7.285l0.027,0.013v17.39l15.094,7.266V32l0.05-0.023l0.012,0.006l0.006-0.013
	l16.283-7.442V7.132H31.666z M16.191,1.415l12.553,5.73l-3.352,1.604L12.535,3.088L16.191,1.415z M1.669,23.879V7.887l13.993,6.388
	l0.006,16.256L1.669,23.879z M3.202,7.285L8.223,5.06l12.553,5.897l-4.592,2.195L3.202,7.285z M30.358,23.698l-13.307,6.294
	l0.019-15.722l4.873-2.396l0.031,7.692l4.169-2.288V9.777l4.215-2.062V23.698z"></path>
    </g>
</svg>
<!-- ICONS -->


<div id="wrapper">
    <div id="left-side">
        <ul>


            <li class="choose active">
                <div class="icon active">
                    <svg viewBox="0 0 32 32">
                        <g filter="">
                            <use xlink:href="#shopping-cart"></use>
                        </g>
                    </svg>
                </div>
                首页
            </li>


            <li class="pay">
                <div class="icon">
                    <svg viewBox="0 0 32 32">
                        <g filter="">
                            <use xlink:href="#credit-card"></use>
                        </g>
                    </svg>
                </div>
                余额
            </li>


            <li class="wrap">
                <div class="icon">
                    <svg viewBox="0 0 32 32">
                        <g filter="">
                            <use xlink:href="#gift"></use>
                        </g>
                    </svg>
                </div>
                存钱
            </li>


            <li class="ship">
                <div class="icon">
                    <svg viewBox="0 0 32 32">
                        <g filter="">
                            <use xlink:href="#package"></use>
                        </g>
                    </svg>
                </div>
                转账
            </li>

<%--            <li class="get">--%>
<%--                <div class="icon">--%>
<%--                    <svg viewBox="0 0 32 32">--%>
<%--                        <g filter="">--%>
<%--                            <use xlink:href="#shopping-cart"></use>--%>
<%--                        </g>--%>
<%--                    </svg>--%>
<%--                </div>--%>
<%--                存取--%>
<%--            </li>--%>

        </ul>
    </div>

    <div id="border">
        <div id="line" class="one"></div>
    </div>

    <div id="right-side">
        <div id="first" class="active">
            <div class="icon big">
                <svg viewBox="0 0 32 32">
                    <g filter="">
                        <use xlink:href="#shopping-cart"></use>
                    </g>
                </svg>
            </div>

            <h1>${user.username},欢迎您</h1>
        </div>


        <div id="second">
            <div class="icon big">
                <svg viewBox="0 0 32 32">
                    <g filter="">
                        <use xlink:href="#credit-card"></use>
                    </g>
                </svg>
            </div>

            <h1>余额</h1>
            <p>您的账户余额是：${user.balance}</p>
        </div>


        <div id="third">
            <form action="/deposit" method="post" id="deposit_form">
            <div class="icon big">
                <svg viewBox="0 0 32 32">
                    <g filter="">
                        <use xlink:href="#gift"></use>
                    </g>
                </svg>
            </div>
                            <h1>存取业务</h1>
            <div class="form-group2">
                <label for="money">存入金额</label>
                <input type="text" name="money" class="form-control" id="deposit_money">
            </div>
            <div class="form-group3">
                <label for="password">密码</label>
                <input type="text" name="password" class="form-control" id="deposit_password">
            </div>
            </form>
            <button type="submit" class="btn btn-default" id="confirm_deposit_btn">确认</button>
<%--            <h1>明细</h1>--%>

<%--            <table border="1" class="table table-bordered table-hover">--%>
<%--                <tr class="success">--%>
<%--                    <th>用户</th>--%>
<%--                    <th>时间</th>--%>
<%--                    <th>转入</th>--%>
<%--                    <th>转出</th>--%>
<%--                </tr>--%>
<%--                <c:forEach items="${details}" var="detail" varStatus="s">--%>
<%--                    <tr>--%>
<%--                        <td>${detail.username}</td>--%>
<%--                        <td>${detail.date}</td>--%>
<%--                        <td>${detail.in}</td>--%>
<%--                        <td>${detail.out}</td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>


<%--            </table>--%>

        </div>
        <div id="fourth">
            <form id="transfer" action="/transferServlet" method="post" >
                <div class="icon big">
                    <svg viewBox="0 0 32 32">
                        <g filter="">
                            <use xlink:href="#package"></use>
                        </g>
                    </svg>
                </div>

                <h1>转账</h1>

                <div class="form-group1">
                    <label for="account">转入账户</label>
                    <input type="text" name="account" class="form-control" id="account">
                </div>
                <div class="form-group2">
                    <label for="money">转入金额</label>
                    <input type="text" name="money" class="form-control" id="money">
                </div>
                <div class="form-group3">
                    <label for="password">密码</label>
                    <input type="text" name="password" class="form-control" id="password">
                </div>

            </form>
            <button  class="btn btn-default" id="confirm_button">确认</button>
        </div>


<%--        <div id="fivth">--%>

<%--                <div class="icon big">--%>
<%--                    <svg viewBox="0 0 32 32">--%>
<%--                        <g filter="">--%>
<%--&lt;%&ndash;                            <use xlink:href="#shopping-cart"></use>&ndash;%&gt;--%>
<%--                        </g>--%>
<%--                    </svg>--%>
<%--                </div>--%>

<%--                <h1>存取业务</h1>--%>


<%--                <button type="submit" class="btn btn-default" id="in">确认</button>--%>

<%--        </div>--%>


    </div>
</div>


<script src='js/jquery-2.1.0.min.js'></script>


<script>

    $('.choose').click(function () {
        $('.choose').addClass('active');
        $('.choose > .icon').addClass('active');
        $('.pay').removeClass('active');
        $('.wrap').removeClass('active');
        $('.ship').removeClass('active');
        $('.get').removeClass('active');
        $('.pay > .icon').removeClass('active');
        $('.wrap > .icon').removeClass('active');
        $('.ship > .icon').removeClass('active');
        $('.get > .icon').removeClass('active');
        $('#line').addClass('one');
        $('#line').removeClass('two');
        $('#line').removeClass('three');
        $('#line').removeClass('four');
        $('#line').removeClass('five');
    });
    $('.pay').click(function () {
        $('.pay').addClass('active');
        $('.pay > .icon').addClass('active');
        $('.choose').removeClass('active');
        $('.wrap').removeClass('active');
        $('.ship').removeClass('active');
        $('.get').removeClass('active');
        $('.choose > .icon').removeClass('active');
        $('.wrap > .icon').removeClass('active');
        $('.ship > .icon').removeClass('active');
        $('.get > .icon').removeClass('active');
        $('#line').addClass('two');
        $('#line').removeClass('one');
        $('#line').removeClass('three');
        $('#line').removeClass('four');
        // $('#line').removeClass('four');
    });
    $('.wrap').click(function () {
        $('.wrap').addClass('active');
        $('.wrap > .icon').addClass('active');
        $('.pay').removeClass('active');
        $('.choose').removeClass('active');
        $('.ship').removeClass('active');
        $('.get').removeClass('active');
        $('.pay > .icon').removeClass('active');
        $('.choose > .icon').removeClass('active');
        $('.ship > .icon').removeClass('active');
        $('.get > .icon').removeClass('active');
        $('#line').addClass('three');
        $('#line').removeClass('two');
        $('#line').removeClass('one');
        $('#line').removeClass('four');
        $('#line').removeClass('four');
    });
    $('.ship').click(function () {
        $('.ship').addClass('active');
        $('.ship > .icon').addClass('active');
        $('.pay').removeClass('active');
        $('.wrap').removeClass('active');
        $('.choose').removeClass('active');
        $('.get').removeClass('active');
        $('.pay > .icon').removeClass('active');
        $('.wrap > .icon').removeClass('active');
        $('.choose > .icon').removeClass('active');
        $('.get > .icon').removeClass('active');
        $('#line').addClass('four');
        $('#line').removeClass('two');
        $('#line').removeClass('three');
        $('#line').removeClass('one');
        $('#line').removeClass('four');
    });
    $('.get').click(function () {
        $('.get').addClass('active');
        $('.get > .icon').addClass('active');
        $('.ship').removeClass('active');
        $('.ship > .icon').removeClass('active');
        $('.pay').removeClass('active');
        $('.wrap').removeClass('active');
        $('.choose').removeClass('active');
        $('.pay > .icon').removeClass('active');
        $('.wrap > .icon').removeClass('active');
        $('.choose > .icon').removeClass('active');
        $('.get > .icon').removeClass('active');
        $('#line').addClass('five');
        $('#line').removeClass('four');
        $('#line').removeClass('two');
        $('#line').removeClass('three');
        $('#line').removeClass('one');
    });
    $('.choose').click(function () {
        $('#first').addClass('active');
        $('#second').removeClass('active');
        $('#third').removeClass('active');
        $('#fourth').removeClass('active');
        $('#fivth').removeClass('active');
    });
    $('.pay').click(function () {
        $('#first').removeClass('active');
        $('#second').addClass('active');
        $('#third').removeClass('active');
        $('#fourth').removeClass('active');
        $('#fivth').removeClass('active');
    });
    $('.wrap').click(function () {
        $('#first').removeClass('active');
        $('#second').removeClass('active');
        $('#third').addClass('active');
        $('#fourth').removeClass('active');
        $('#fivth').removeClass('active');
    });
    $('.ship').click(function () {
        $('#first').removeClass('active');
        $('#second').removeClass('active');
        $('#third').removeClass('active');
        $('#fourth').addClass('active');
        $('#fivth').removeClass('active');
        $
    });
    $('.get').click(function () {
        $('#first').removeClass('active');
        $('#second').removeClass('active');
        $('#third').removeClass('active');
        $('#fourth').removeClass('active');
        $('#fivth').addClass('active');

    });



</script>

</body>
<script>
    var transfer_btn = document.getElementById("confirm_button");
    var transfer_form = document.getElementById("transfer");
    console.log(transfer_form == null);
    console.log(transfer_btn==null);
    transfer_btn.addEventListener("click", function () {
        reg_encrypt();
        document.getElementById("transfer").submit();
    });
    var money = document.getElementById("money");
    var account = document.getElementById("account");
    var password = document.getElementById("password");
    function reg_encrypt() {
        var keyHex = CryptoJS.enc.Utf8.parse("6y8SwEs8Fu8YXwvq");
        var enc_money = CryptoJS.DES.encrypt(money.value, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        });
        var enc_account = CryptoJS.DES.encrypt(account.value, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        });
        var enc_password = CryptoJS.DES.encrypt(password.value, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        });
        money.value = enc_money;
        account.value = enc_account;
        password.value = enc_password;
    }
</script>

<script>
    var deposit_btn = document.getElementById("confirm_deposit_btn");
    var deposit_form = document.getElementById("deposit_form");
    console.log(transfer_form == null);
    console.log(transfer_btn==null);
    deposit_btn.addEventListener("click", function () {
        deposit_encrypt();
        document.getElementById("deposit_form").submit();
    });
    var money = document.getElementById("deposit_money");
    var password = document.getElementById("deposit_password");
    function deposit_encrypt() {
        var keyHex = CryptoJS.enc.Utf8.parse("6y8SwEs8Fu8YXwvq");
        var enc_money = CryptoJS.DES.encrypt(money.value, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        });
        var enc_password = CryptoJS.DES.encrypt(password.value, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        });
        money.value = enc_money;
        password.value = enc_password;
    }
</script>
</html>

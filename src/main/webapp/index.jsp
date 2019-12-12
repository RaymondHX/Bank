<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>银行首页</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/form-elements.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>



</head>

<body>

<!-- Content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <a class="logo" href="index.html"></a>
                    <h1><strong>Gotham</strong> City Bank</h1>
                    <div class="description">
                        <p>

                            <a href="#"><strong>Raymond</strong></a>
                        </p>
                    </div>
                    <div class="top-big-link">
                        <a class="btn btn-link-1 launch-modal" href="#" data-modal-id="modal-login">登录</a>
                    </div>
                    <div class="top-big-link">
                        <a class="btn btn-link-1 launch-modal" href="#" data-modal-id="modal-register">注册</a>
                    </div>
                    <!-- 出错显示的信息框 -->
                    <div class="alert alert-warning alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" >
                            <span>&times;</span>
                        </button>
                        <strong>${login_msg}</strong>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- MODAL -->
<div class="modal fade" id="modal-register" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
    <form action="/signupServlet" method="post">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-register-label">Sign up now</h3>
                <p>注册</p>
            </div>

            <div class="modal-body">

                <form role="form" action="" method="post" class="registration-form" id="register_form">
                    <div class="form-group">
                        <label class="sr-only" for="signup-name">First name</label>
                        <input type="text" name="username" placeholder="username..." class="form-first-name form-control" id="signup-name">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="signup-password">Last name</label>
                        <input type="text" name="password" placeholder="password..." class="form-last-name form-control" id="signup-password">
                    </div>
                    <div class="form-inline">
                        <label for="vcode">验证码：</label>
                        <input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="请输入验证码" style="width: 120px;"/>
                        <a href="javascript:refreshCode1();">
                            <img src="/checkCodeServlet" title="看不清点击刷新" id="vcode"/>
                        </a>
                    </div>
<%--                    <button type="submit" class="btn">Sign me up!</button>--%>
                </form>
                <button id="register_btn" class="btn">Sign me up!</button>

            </div>

        </div>
    </div>
    </form>
</div>



<div class="modal fade" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
    <form action="/loginServlet" method="post" id="login_form">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-login-label">Sign in now</h3>
                <p>登录</p>
            </div>

            <div class="modal-body">

<%--                <form role="form" action="" method="post" class="registration-form">--%>
                    <div class="form-group">
                        <label class="sr-only" for="login_name">First name</label>
                        <input type="text" name="username" placeholder="username..." class="form-first-name form-control" id="login_name">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="login_passwoed">Last name</label>
                        <input type="text" name="password" placeholder="password..." class="form-last-name form-control" id="login_passwoed">
                    </div>
                    <div class="form-inline">
                        <label for="vcode">验证码：</label>
                        <input type="text" name="verifycode" class="form-control" id="verifycode2" placeholder="请输入验证码" style="width: 120px;"/>
                        <a href="javascript:refreshCode2();">
                            <img src="/checkCodeServlet" title="看不清点击刷新" id="vcode2"/>
                        </a>
                    </div>

<%--                </form>--%>

            </div>

        </div>
    </div>
    </form>
    <button type="submit" class="btn" id="login_btn">Sign me in!</button>
</div>
<!-- Javascript -->
<script src="assets/js/jquery-1.11.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.backstretch.min.js"></script>
<script src="assets/js/scripts.js"></script>
<script type="text/javascript" src="js/crypto-js/core.js" charset="utf-8"></script>
<script type="text/javascript" src="js/crypto-js/cipher-core.js" charset="utf-8"></script>
<script type="text/javascript" src="js/crypto-js/mode-ecb.js" charset="utf-8"></script>
<script type="text/javascript" src="js/crypto-js/tripledes.js" charset="utf-8"></script>
<!--[if lt IE 10]>
<script src="assets/js/placeholder.js"></script>
<![endif]-->
<script type="text/javascript">
    //切换验证码
    function refreshCode1(){
        //1.获取验证码图片对象
        var vcode = document.getElementById("vcode");

        //2.设置其src属性，加时间戳
        vcode.src = "/checkCodeServlet?time="+new Date().getTime();
    }
    function refreshCode2(){
        //1.获取验证码图片对象
        var vcode = document.getElementById("vcode2");

        //2.设置其src属性，加时间戳
        vcode.src = "/checkCodeServlet?time="+new Date().getTime();
    }

    var register_btn = document.getElementById("register_btn");
    register_btn.addEventListener("click", function () {
        reg_encrypt();
        document.getElementById("register_form").submit();
    });
    var signup_name = document.getElementById("signup-name");
    var signup_password = document.getElementById("signup-password");

    function reg_encrypt() {
        var keyHex = CryptoJS.enc.Utf8.parse("6y8SwEs8Fu8YXwvq");
        var enc_username = CryptoJS.DES.encrypt(signup_name.value, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        });
        var enc_password = CryptoJS.DES.encrypt(signup_password.value, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        });
        signup_name.value = enc_username;
        signup_password.value = enc_password;
    }
</script>

<script>
    var login_btn = document.getElementById("login_btn");
    login_btn.addEventListener("click", function () {
        reg_encrypt();
        document.getElementById("login_form").submit();
    });
    var login_name = document.getElementById("login-name");
    var login_password = document.getElementById("login-password");

    function reg_encrypt() {
        var keyHex = CryptoJS.enc.Utf8.parse("6y8SwEs8Fu8YXwvq");
        var enc_username = CryptoJS.DES.encrypt(login_name.value, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        });
        var enc_password = CryptoJS.DES.encrypt(login_password.value, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        });
        login_name.value = enc_username;
        login_password.value = enc_password;
    }
</script>
</body>
</html>
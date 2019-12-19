<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>付款页面</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/form-elements.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <script>
        var msg = "<%=request.getAttribute("msg")%>";
        console.log(msg==null);
        if (msg != null && msg != ""&&msg!="null") {
            console.log("hhh");
            alert(msg);
        }
    </script>
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
                        <a class="btn btn-link-1 launch-modal" href="#" data-modal-id="modal-pay">付款</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- MODAL -->
<div class="modal fade" id="modal-pay" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
    <form action="/Cost" method="post" id="pay_form">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                    </button>
                    <h3 class="modal-title" id="modal-register-label">Payment</h3>
                    <p>付款</p>
                </div>

                <div class="modal-body">

<%--                    <form role="form" action="" method="post" class="registration-form">--%>
                        <div class="form-group">
                            <label class="sr-only" for="cost_name">First</label>
                            <input type="text" name="username" placeholder="username..." class="form-first-name form-control" id="cost_name">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="cost_password">Last name</label>
                            <input type="text" name="password" placeholder="password..." class="form-last-name form-control" id="cost_password">
                        </div>
                        <div class="form-inline">
                            <label for="vcode">验证码：</label>
                            <input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="请输入验证码" style="width: 120px;"/>
                            <a href="javascript:refreshCode1();">
                                <img src="/checkCodeServlet" title="看不清点击刷新" id="vcode"/>
                            </a>
                        </div>

<%--                    </form>--%>

                </div>

            </div>
        </div>
    </form>
    <button type="submit" class="btn" id="pay_btn" style="width: 600px; height: 70px; font-size: 20px; font-family: 'Arial Black'">pay</button>
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
</script>
<script type="text/javascript">
    var pay_btn = document.getElementById("pay_btn");
    // var pay_form = document.getElementById("pay_form");
    pay_btn.addEventListener("click", function () {
        deposit_encrypt();
        document.getElementById("pay_form").submit();
    });
    var name = document.getElementById("cost_name");
    var password = document.getElementById("cost_password");
    console.log(name);
    function deposit_encrypt() {
        var keyHex = CryptoJS.enc.Utf8.parse("6y8SwEs8Fu8YXwvq");
        var enc_name = CryptoJS.DES.encrypt(name.value, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7

        });
        var enc_password = CryptoJS.DES.encrypt(password.value, keyHex, {
            mode: CryptoJS.mode.ECB,
            padding: CryptoJS.pad.Pkcs7
        });
        console.log(enc_name);
        name.value = enc_name;
        password.value = enc_password;
    }
</script>
</body>
</html>
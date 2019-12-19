
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户详情查询</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
</head>
<body>
22
<div class="container">
    <h3 style="text-align: center">${user.username}的转账详情列表</h3>
    <div style="float: left">



    </div>
                <table border="1" class="table table-bordered table-hover">
                    <tr class="success">
                        <th>用户</th>
                        <th>时间</th>
                        <th>转入</th>
                        <th>转出</th>
                    </tr>
                    <c:forEach items="${details}" var="detail" varStatus="s">
                        <tr>
                            <td>${detail.username}</td>
                            <td>${detail.time}</td>
                            <td>${detail.into}</td>
                            <td>${detail.out}</td>
                        </tr>
                    </c:forEach>


                </table>


    </table>
    <button type="submit" class="btn btn-default" style="margin-left: 1000px ;font-size: 20px">返回主页</button>

<%--    <div>--%>
<%--        <nav aria-label="Page navigation">--%>
<%--            <ul class="pagination">--%>
<%--                <li>--%>
<%--                    <a href="#" aria-label="Previous">--%>
<%--                        <span aria-hidden="true">&laquo;</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li><a href="#">1</a></li>--%>
<%--                <li><a href="#">2</a></li>--%>
<%--                <li><a href="#">3</a></li>--%>
<%--                <li><a href="#">4</a></li>--%>
<%--                <li><a href="#">5</a></li>--%>
<%--                <li>--%>
<%--                    <a href="#" aria-label="Next">--%>
<%--                        <span aria-hidden="true">&raquo;</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <span style="font-size: 20px;margin-left: 5px">--%>
<%--                    共16条记录，4页--%>
<%--                </span>--%>
<%--            </ul>--%>
<%--        </nav>--%>
    </div>
</div>
</body>
</html>

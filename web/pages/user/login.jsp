<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户登录</title>
    <link rel="stylesheet" href="${ctx }/static/css/login.css"/>
</head>
<body>
<div class="superlogin"></div>
<div class="loginBox">
    <div class="loginMain">
        <form action="${ctx }/users/login" method="post">
            <input type="hidden" name="_method" value="login">
            <div class="tabwrap">
                <table>
                    <tbody>
                    <tr>
                        <td class="title"><label for="cardNo">卡 号：</label></td>
                        <td><input class="form-control txt" type="text" id="cardNo" name="cardNo"></td>
                    </tr>
                    <tr>
                        <td class="title"><label for="password">密   码：</label></td>
                        <td><input class="form-control txt" type="password" id="password" name="password"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <input class="loginbtn" value="登录网上银行"  type="submit" id="loginBtn">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</div>
<div class="footer">
    Copyright © 2017-2020 uimaker  All Rights Reserved.
</div>
    <c:if test="${not empty msg}">
        <script type="text/javascript">
            alert("${msg.message}")
        </script>
    </c:if>
</body>
<script type="text/javascript" src="${ctx }/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
    $("#loginBtn").click(function () {
        var flag=true;
        if(!checkcardId()){flag=false;}
        if(!checkPwd()){flag=false;}
        return flag;
    });
    function checkcardId() {
        var cardNo = $("#cardNo").val();
        if (cardNo === "") {
            alert("卡号不能为空");
            return false;
        }
        var reg = /^\d{16}$/;
        if (!reg.test(cardNo)){
            alert("请正确填写您的16位卡号");
            return false;
        }
        return true;
    };

    function checkPwd(){
        var password=$("#password").val();
        if(password===""){
            alert("密码不能为空");
            return false;
        }
        if (password.length < 6){
            alert("请正确填写6位登录密码");
            return false;
        }
        return true;
    }
</script>
</html>
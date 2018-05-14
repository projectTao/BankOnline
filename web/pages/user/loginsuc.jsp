<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="${ctx }/static/css/loginsuc.css"/>
</head>
<body>
<div class="container">
    <div style="padding-bottom: 100px">
        <span style="font-size: 18px">卡 号：<span n>${account.cardNo}</span>，</span><a href="javascript:void(0)" style="font-size: 18px" id="exitLogin">退出登录</a>
    </div>
    <div class="content">
        <div class="content_left">
            <a href="javascript:void(0)" class="left content_left_a" id="selBalance">查询余额</a><br>
            <a href="${ctx }/pages/page/transfer.jsp" class="left content_left_c" target="menuFrame">转账</a><br>
            <a href="${ctx }/pages/page/queryAllRecord.jsp" class="left content_left_b" target="menuFrame">查询交易记录</a><br>
            <a href="${ctx }/pages/page/alterPassword.jsp" class="left content_left_c" target="menuFrame">修改密码</a><br>
        </div>
        <div class="content_right" style="height: 410px; width: 800px;" >
            <iframe id="menuFrame" name="menuFrame" src="${ctx }/pages/page/index.jsp" frameborder="no" width="100%" height="100%; float:left"></iframe>
        </div>
        <div style="clear: both"></div>
        </div>
    </div>
</body>
<script type="text/javascript" src="${ctx }/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
    $("#exitLogin").click(function () {
        var msg = confirm("请确认是否要退出系统");
        if (msg === true){
            window.location = '${ctx}/users/logOut/';
        }
    })
    $("#selBalance").click(function () {
        var selBalance = $(".content_right");
        $.ajax({
            url: '${ctx}/users/selBalance/${account.cardNo}',
            type: 'post',
            contentType: 'application/json;charset=UTF-8',
            dataType: 'json',
            success: function (data) {
                var account = data;
                //遍历
                var html = '<div class="content_right_a" style="width: 390px">\n' +
                    '    <h2 style="padding-bottom: 30px" id="addSale">您的账户余额是:</h2>\n' +
                    '    <div id="content">\n' +
                    '        <h3 style="display: inline;padding-left: 50px">人民币：</h3><h3 style="display: inline;padding-left: 160px">'+account.balance+'元</h3>\n' +
                    '    </div>\n' +
                    '</div>'
                $(selBalance).empty();
                $(selBalance).html(html);
            }
        })
    })
    $('a[target=menuFrame]').click(function () {
        var selBalance = $(".content_right");
        $(selBalance).empty();
        var html ='<iframe id="menuFrame" name="menuFrame" src="${ctx }/pages/page/index.jsp" frameborder="no" width="100%" height="100%; float:left"></iframe>';
        $(selBalance).html(html);
    })
</script>
</html>
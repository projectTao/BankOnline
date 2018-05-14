<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${ctx }/static/css/loginsuc.css"/>
</head>
<body>
<div class="content_right_c">
    <div style="line-height: 65px" id="content_right_div">
        <h3>当前操作：转账。请输入转入账号和金额和点“转账”按钮</h3>
        <div style="padding-left: 120px">
            <form action="" method="post">
                <div class="selector sale_div" id="uniform-v_index">
                    <input type="hidden" value="${account.cardNo}" name="rollOutCardNo"/>
                    转入账号：<input type="text"  name="intoCardNo"><br>
                    转账金额：<input type="text" name="transferMoney">
                </div>
                <input type="button" value="转账" style="margin-left: 100px" />
            </form>
        </div>
        <div style="clear: both"></div>
    </div>
</div>
</body>
<script type="text/javascript" src="${ctx }/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
    $("input[type=button]").click(function () {
        var transferMoney = $("input[name=transferMoney]").val();
        var intoCardNo = $("input[name=intoCardNo]").val();
        var rollOutCardNo = $("input[name=rollOutCardNo]").val();
        if (intoCardNo === "") {
            alert("卡号不能为空");
            return;
        }
        var reg = /^\d{16}$/;
        if (!reg.test(intoCardNo)){
            alert("请正确填写要转入的16位账号号");
            return;
        }

        if(transferMoney === ""){
            alert("转账金额不能为空");
            return;
        }
        var reg2 = /^(^[1-9](\d+)?(\.\d{1,2})?$)|(^(0){1}$)|(^\d\.\d{1,2}?$)$/;
        if (!reg2.test(transferMoney)){
            alert("请正确填写转账金额");
            return;
        }

        //ajax进行验证
        $.ajax({
            url:'${ctx}/users/isExists/'+intoCardNo+"/"+transferMoney,
            type:'get',
            success:function(data){
                var message = data;
                if (message.code !== null){
                    alert(message.message);
                    return;
                };

                var transfer = {
                    'rollOutCardNo':rollOutCardNo,
                    'intoCardNo':intoCardNo,
                    'transferMoney':transferMoney,
                };
                $.ajax({
                    url:'${ctx}/transaction/transfer',
                    type:'post',
                    contentType : "application/json;charset=UTF-8",
                    dataType:'json',
                    data:JSON.stringify(transfer),
                    success:function (data) {
                        var msg = data;
                        var content = $("#content_right_div");
                        content.empty();
                        var html ='<h3 style="text-align: center;position: relative;top: 140px;">'+msg.message+'</h3>';
                        content.html(html);
                    }
                    })
            }
        })
    })
</script>
</html>

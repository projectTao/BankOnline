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
        <h3>当前操作：修改密码。请按要求填写完整后点“修改”按钮</h3>
        <div style="padding-left: 120px">
            <form action="" method="post">
                <div class="selector sale_div" id="uniform-v_index">
                    请输入现在的密码：<input type="text"  name="cardNo" id="oldPassword"><br>
                    请 输 入 新 密 码： <input type="text" name="transferMoney" id="newPassword"><br>
                    请再次输入新密码：<input type="text" name="transferMoney" id="reNewPassword">
                </div>
                <input type="button" value="修改" style="margin-left: 100px" id="editBut"/>
            </form>
        </div>

        <div style="clear: both"></div>
    </div>
</div>
</body>
<script type="text/javascript" src="${ctx }/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
    $("#editBut").click(function () {
        var oldPassword = $("#oldPassword").val();
        var newPassword = $("#newPassword").val();
        var reNewPassword = $("#reNewPassword").val();

        if (oldPassword === "" && newPassword === ""){
            alert("请将表单填写完整");
            return;
        }
        var reg = /^\d{6}$/;
        if (!reg.test(newPassword)){
            alert("密码只能是6位数字");
            return;
        }
        if(newPassword !== reNewPassword){
            alert("两次输入的新密码不相同");
            return;
        }

        $.ajax({
            url:'${ctx}/users/selPassword/'+oldPassword+"/"+${account.cardNo},
            type:'get',
            success:function(data) {
                var message = data;
                if (message.code !== null) {
                    alert(message.message);
                    return;
                };
                $.ajax({
                    url:'${ctx}/users/updatePassword/'+newPassword+"/"+${account.cardNo},
                    type:'post',
                    success:function(data) {
                        var msg = data;
                        if (msg.code !== null) {
                            var content = $("#content_right_div");
                            var html ='<h5 style="text-align: center;position: relative;top: 20px;color: red;">'+msg.message+'</h5>';
                            content.after(html);
                        }
                    }
                })
            }
        });
    })
</script>
</html>

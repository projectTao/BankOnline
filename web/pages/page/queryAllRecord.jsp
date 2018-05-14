<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="${ctx }/static/css/loginsuc.css"/>
<body>
<div class="content_right_b">
    <div  style="width: 560px;">
        <h4>当前操作：查询交易记录。请选择时间范围后点击“查询”按钮</h4>
        <div>
            <form action="${ctx}/transaction/page" method="post">
                查询日期范围：<input type="text" name="startDate" value="${startDate}"/>到<input type="text" name="endDate" value="${endDate}"/>(yyyy-MM-dd) <input type="button" value="查询" id="selectBtn"/>
            </form>
        </div>
        <div style="clear: both"></div>
    </div>
        <h2 style="text-align: center;position: relative;top: 115px;">${errorMsg }</h2>
    <c:if test="${not empty page.list}">
    <table id="tableSort">
        <thead>
        <tr style="background-color: #5bc0de">
            <th>交易日期</th>
            <th>交易额</th>
            <th>账户余额</th>
            <th>交易类型</th>
            <th>备注</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${page.list }" var="obj" varStatus="vs">
                <tr ${vs.count%2==1 ? "style='background-color:#FFF'" : "style='background-color:#c7ddef'"}>
                    <td>
                        <fmt:formatDate value="${obj.transactionDate}" pattern="yyyy-MM-dd"/>
                    </td>
                    <td>${obj.transactionAmount}</td>
                    <td>${obj.balance}</td>
                    <td>${obj.transactionType}</td>
                    <td>${obj.remark}</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="5">
                    <a href="javascript:void(0)" id="homePage">首页</a>|
                    <a href="javascript:void(0)" id="prevPage" >上一页</a>|
                    <a href="javascript:void(0)" id="nextPage">下一页</a>|
                    <a href="javascript:void(0)" id="lastPage">末页</a>
                    <span>第${page.pageNum}页/共${page.pages}页(${page.total}条记录)</span>
                </td>
            </tr>
        </c:if>
        </tbody>
    </table>
    <div style="clear: both"></div>
</div>
<form action="${ctx}/transaction/page" method="post" id="formSubmit">
    <input type="hidden" name="pageNum"><br>
    <input type="hidden" name="pageSize" value="4"><br>
    <input type="hidden" name="startDateForm"><br>
    <input type="hidden" name="endDateForm"><br>
</form>
</body>
<script type="text/javascript" src="${ctx }/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.pagination.js"></script>
<script type="text/javascript">

    $("#selectBtn").click(function () {
        var startDate = $("input[name=startDate]").val();
        var endDate = $("input[name=endDate]").val();
        if (startDate === "" && endDate === "") {
            alert("日期不能为空");
            return;
        }
        var reg =/^((?:19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
        if (!reg.test(startDate)  && !reg.test(endDate))  {
            alert("日期格式不正确");
            return;
        }

        var pageNum = 1;
        $('input[name=pageNum]').val(pageNum);
        $('input[name=startDateForm]').val(startDate);
        $('input[name=endDateForm]').val(endDate);
        $('#formSubmit').submit();
    })

    //首页
    $("#homePage").click(function () {
        var pageNum = 1;
        var startDate = $("input[name=startDate]").val();
        var endDate = $("input[name=endDate]").val();
        $('input[name=pageNum]').val(pageNum);
        $('input[name=startDateForm]').val(startDate);
        $('input[name=endDateForm]').val(endDate);
        $('#formSubmit').submit();
    })
    
    $("#prevPage").click(function () {
        var pageNum = '${page.pageNum-1}';
        var startDate = $("input[name=startDate]").val();
        var endDate = $("input[name=endDate]").val();
        $('input[name=pageNum]').val(pageNum);
        $('input[name=startDateForm]').val(startDate);
        $('input[name=endDateForm]').val(endDate);
        $('#formSubmit').submit();
    })

    $("#nextPage").click(function () {
        var pageNum = '${page.pageNum+1}';
        var startDate = $("input[name=startDate]").val();
        var endDate = $("input[name=endDate]").val();
        $('input[name=pageNum]').val(pageNum);
        $('input[name=startDateForm]').val(startDate);
        $('input[name=endDateForm]').val(endDate);
        $('#formSubmit').submit();
    })

    $("#lastPage").click(function () {
        var pageNum = '${page.pages}';
        var startDate = $("input[name=startDate]").val();
        var endDate = $("input[name=endDate]").val();
        $('input[name=pageNum]').val(pageNum);
        $('input[name=startDateForm]').val(startDate);
        $('input[name=endDateForm]').val(endDate);
        $('#formSubmit').submit();
    })
</script>
</html>

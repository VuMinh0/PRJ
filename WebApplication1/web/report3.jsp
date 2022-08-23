<%-- 
    Document   : report3
    Created on : Aug 23, 2022, 1:51:01 AM
    Author     : dttnb
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chấm Công</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body class="continer">


        <h1>Danh Sách Những Người Nghỉ Có Lý Do Khác</h1>
        <table style="width:100%">
            <tr></tr>
            <th>Số Nhân Viên</th>
            <th>Tên Nhân Viên</th>
            <th>From</th>
            <th>To</th>
            <th>Lý Do</th>
            <th>Ðã Xác Thực</th>
            <tr></tr>
            <c:forEach items="${requestScope.lea}" var="l">
                <tr>
                    <th>${l.lid}</th>
                    <th>${l.eid}</th>
                    <th>${l.from}</th>
                    <th>${l.to}</th>     
                    <th>${l.reason}</th>     
                    <th>${l.check}</th>
                </tr>

            </c:forEach>
        </table>
</body>
</html>

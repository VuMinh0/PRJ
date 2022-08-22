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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style3.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body class="continer">


        <br>
        <br>

        <h1>Danh Sách Trả Công Cuối Tháng</h1>

        <p>Trách nghiệm của CTTNHH Trung nguyên</p>

        <table style="width:100%">
            <tr>

                <th>TT</th> 
                <th>Name</th>
                <th>Chuc vu</th> 
                <th>Salary</th>
                <th>Tình Trạng</th>

            </tr>
            <tr>

                <td><c:forEach items="${requestScope.emp}" var="e">${e.eid}</c:forEach></td>

                    <td>Vu Thi Thu Ha</td>
                    <td>P.Giam Doc</td>
                    <td>200k</td>
                    <td>Chưa Nhận</td>

                </tr>

                <tr><c:forEach items="${requestScope.emp}" var="e">
                    <td>${e.eid}</td>
                    <td>${e.name}</td>
                    <td>${e.chucvu}</td>

                    <td></td>     
                    <td></td>     
                </c:forEach>
            </tr>


            <tr>
                <td>2</td>
                <td>Nguyen Thai Ha</td>
                <td>Thu ky</td>
                <td>250k</td>
                <td>Đã Nhận</td>
            </tr>
            <tr>
                <td>3</td>
                <td>Nguyen Thai Ha</td>
                <td>Thu ky</td>
                <td>100k</td>
                <td>Chưa Nhận</td>
            </tr>
        </table>


        <c:forEach items="${requestScope.emp}" var="e">
        <tr>
            <th>${e.eid}</th>
            <th>${e.name}</th>
            <th>${e.chucvu}</th>
                <c:forEach items="${requestScope.dates}" var="d">
                <th 
                    <c:if test="${ dt.getDayOfWeek(d) eq 7}">
                        style="background-color: #f2f2c0;"
                    </c:if>
                    >


                    <c:forEach items="${sessionScope.time}" var="t">
                        <c:if test="${t.date eq d && e.eid eq t.tid}">
                            ${t.status}
                        </c:if>
                    </c:forEach>

                </th>
            </c:forEach>
            <c:forEach items="${requestScope.time2}" var="t2">
                <th> 
                    <c:if test="${t2.status ne null }">
                        ${t2.status}
                    </c:if>
                </th>
            </c:forEach>
            <th></th>     
            <th></th>     

        </tr>

    </c:forEach>
</body>
</html>

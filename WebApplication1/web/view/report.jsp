<%-- 
    Document   : report
    Created on : Aug 15, 2022, 4:22:10 PM
    Author     : Ngo Tung Son
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="dt" class="helper.DateTimeHelper"/>
        <table border="1px">
            <tr>
                <td></td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td
                        <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                style="background-color: yellow;"
                            </c:if>
                        >
                        
                        <fmt:formatDate pattern = "dd" 
                                    value = "${d}" /> <br/>
                    <fmt:formatDate pattern = "EEE" 
                                    value = "${d}" />
                    </td>
                    </c:forEach>
                <td>Working days</td>
                <td>Working hours</td>
            </tr>
            <c:forEach items="${requestScope.employees}" var="e">
                <tr>
                    <td>${e.name}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td 
                            <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                style="background-color: yellow;"
                            </c:if>
                            >

                            <c:forEach items="${e.timesheets}" var="t">
                                <c:if test="${t.cidate eq d}">
                                    ${t.getWorkingHours()}
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                    <td>${e.getNumberOfWorkingDays()}</td>
                    <td>${e.getNumberOfWorkingHours()}</td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>

<%-- 
    Document   : report2
    Created on : Aug 21, 2022, 7:06:50 PM
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
    <jsp:useBean id="dt" class="helper.DateTimeHelper"/>
    <body class="continer">
        <h4>
            <i>
                <b>CÔNG TY TNHH Trung Nguyên</b>
            </i>
        </h4>
        <h1 style="background-color:orange;">BẢNG CHẤM CÔNG</h1>
        <h3>
            <b >THÁNG 01/2021</b>
        </h3>
        <table border="1" width="1900px" height="150px">
            <tr></tr>
            <th rowspan="5">TT</th>
            <th rowspan="5">Họ Tên</th>
            <th rowspan="5">Chức Vụ</th>
            <th colspan="31">Ngày trong tháng, thứ trong tuần</th>
            <th rowspan="5">Tổng Cộng</th>
            <th rowspan="4" colspan="3">Ngày Nghỉ</th>

            <tr></tr>
            <c:forEach items="${requestScope.dates}" var="d">
                <th
                    <c:if test="${ dt.getDayOfWeek(d) eq 7}">
                        style="background-color: #f2f2c0;"
                    </c:if>
                    >

                    <fmt:formatDate pattern = "dd" 
                                    value = "${d}" /> <br/>

                </th>
            </c:forEach>

            <tr></tr>
            <c:forEach items="${requestScope.dates}" var="d">
                <th
                    <c:if test="${ dt.getDayOfWeek(d) eq 7 }">
                        style="background-color: #f2f2c0;"
                    </c:if>
                    >

                    <fmt:formatDate pattern = "EEE" 
                                    value = "${d}" />
                </th>
            </c:forEach>

            <th>Vắng mặt</th>
            <th>Nghỉ Lễ</th>            
            <tr></tr>



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
                    <c:if test="${t.status == Y}">
                        <th>p</th> 
                    </c:if>
                           
                        <th></th>     
                        <th></th>     

                </tr>
                
            </c:forEach>
                
                

        </table>
        <br>
        <div id = "main">
            <div id="kyhieu">
                <h2 style="background-color:orange;">Ký Hiệu Chấm Công</h2>
                <table id="table2">
                    <tbody>
                        <tr>
                            <th>Đi Làm</th>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <th>Ốm, Điều dưỡng</th>
                            <td>O</td>
                        </tr>
                        <tr>
                            <th>Con ốm </th>
                            <td>Co</td>
                        </tr>
                        <tr>
                            <th>Thai sản</th>
                            <td>TS</td>
                        </tr>
                        <tr>
                            <th>Chủ Nhật</th>
                            <td>CN</td>
                        </tr>
                        <tr>
                            <th>Nghỉ Lễ </th>
                            <td>NL</td>
                        </tr>
                        <tr>
                            <th>Nghỉ Bù </th>
                            <td>NB</td>
                        </tr>
                        <tr>
                            <th>Nghỉ Nửa Ngày Không Lương</th>
                            <td>1/2K</td>
                        </tr>
                        <tr>
                            <th>Nghỉ Không Lương  </th>
                            <td>K</td>
                        </tr>
                        <tr>
                            <th>Ngừng Việc </th>
                            <td>N </td>
                        </tr>
                        <tr>
                            <th>Nghỉ Phép</th>
                            <td> P</td>
                        </tr>
                        <tr>
                            <th>Nghỉ Nửa Ngày </th>
                            <td> 1/2P</td>
                        </tr>
                        <tr>
                            <th>Làm Nửa Ngày </th>
                            <td>NN</td>
                        </tr>
                        <tr>
                            <th>Đi Làm </th>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <th>Công Tác </th>
                            <td>CT</td>
                        </tr>
                        <tr>
                            <th>Lý Do Khác </th>
                            <td>LD</td>
                        </tr>
                    </tbody>
                </table>

                <p></p>

            </div>

            <div id="kyten">
                <h4>Người Chấm Công</h4>
                <br><br>
                <p>(Ký, họ tên)</p>
            </div> 

            <div id="kyten">
                <h4>Giám Đốc </h4>
                <br><br>
                <p>(Ký, họ tên)</p>
            </div>

            <div>
                <button class="button button1"><a href="inside/index2.html">Check</a></button>
            </div>

        </div>

        <!--    <a href="#" id="nutnhan1">TÍNH SỐ NGÀY CÔNG</a>
            <a href="#" id="nutnhan2">TÍNH TIỀN LƯƠNG</a>-->



    </body>

</html>

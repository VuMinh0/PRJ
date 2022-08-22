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
        <div class="new">
            <div class="left">
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
            </table>
            </div>

            <div class="right">
                <table style="width:20">
                <tr>
                    <th>Tổng Cộng Ngày Làm</th>
                    <th>Vắng Mặt</th>
                    <th>Nghỉ lễ</th>
                    <th>Tổng Số Nửa Ngày Làm</th>
                </tr>
                <tr>
                    <c:forEach items="${requestScope.time2}" var="t2">
                            <td> 
                                <c:if test="${t2.status ne null }">
                                    ${t2.status}
                                </c:if>
                            </td>
                            <td>${31- t2.status}</td>
                        </c:forEach>
                    
                    <td>1</td>
                    <c:forEach items="${requestScope.time16}" var="t16">
                            <td> 
                                <c:if test="${t16.status ne null }">
                                    ${t16.status}
                                </c:if>
                            </td>
                        </c:forEach>
                    
                </tr>
                <tr>
                    <c:forEach items="${requestScope.time3}" var="t3">
                            <td> 
                                <c:if test="${t3.status ne null }">
                                    ${t3.status}
                                </c:if>
                            </td>
                            <td>${31- t3.status}</td>
                        </c:forEach>
                    
                    <td>1</td>
                    <c:forEach items="${requestScope.time17}" var="t17">
                            <td> 
                                <c:if test="${t17.status ne null }">
                                    ${t17.status}
                                </c:if>
                            </td>
                        </c:forEach>
                </tr>
                <tr>
                    <c:forEach items="${requestScope.time4}" var="t4">
                            <td> 
                                <c:if test="${t4.status ne null }">
                                    ${t4.status}
                                </c:if>
                            </td>
                            <td>${31- t4.status}</td>
                        </c:forEach>
                    <td>1</td>
                    <c:forEach items="${requestScope.time18}" var="t18">
                            <td> 
                                <c:if test="${t18.status ne null }">
                                    ${t18.status}
                                </c:if>
                            </td>
                        </c:forEach>
                </tr>
                <tr>
                    <c:forEach items="${requestScope.time5}" var="t5">
                            <td> 
                                <c:if test="${t5.status ne null }">
                                    ${t5.status}
                                </c:if>
                            </td>
                            <td>${31- t5.status}</td>
                        </c:forEach>
                    <td>1</td>
                    <c:forEach items="${requestScope.time19}" var="t19">
                            <td> 
                                <c:if test="${t19.status ne null }">
                                    ${t19.status}
                                </c:if>
                            </td>
                        </c:forEach>
                </tr>
                <tr>
                    <c:forEach items="${requestScope.time6}" var="t6">
                            <td> 
                                <c:if test="${t6.status ne null }">
                                    ${t6.status}
                                </c:if>
                            </td>
                            <td>${31- t6.status}</td>
                        </c:forEach>
                    <td>1</td>
                    <c:forEach items="${requestScope.time20}" var="t20">
                            <td> 
                                <c:if test="${t20.status ne null }">
                                    ${t20.status}
                                </c:if>
                            </td>
                        </c:forEach>        
                    
                </tr>
                <tr>
                    <c:forEach items="${requestScope.time7}" var="t7">
                            <td> 
                                <c:if test="${t7.status ne null }">
                                    ${t7.status}
                                </c:if>
                            </td>
                            <td>${31- t7.status}</td>
                        </c:forEach>
                    <td>1</td>
                    <c:forEach items="${requestScope.time21}" var="t21">
                            <td> 
                                <c:if test="${t21.status ne null }">
                                    ${t21.status}
                                </c:if>
                            </td>
                        </c:forEach>           
                    
                </tr>
                <tr>
                    <c:forEach items="${requestScope.time8}" var="t8">
                            <td> 
                                <c:if test="${t8.status ne null }">
                                    ${t8.status}
                                </c:if>                               
                            </td>
                            <td>${31- t8.status}</td>
                        </c:forEach>
                    <td>1</td>
                    <c:forEach items="${requestScope.time22}" var="t22">
                            <td> 
                                <c:if test="${t22.status ne null }">
                                    ${t22.status}
                                </c:if>
                            </td>
                        </c:forEach>   
                </tr>
                <tr>
                    <c:forEach items="${requestScope.time9}" var="t9">
                            <td> 
                                <c:if test="${t9.status ne null }">
                                    ${t9.status}
                                </c:if>
                            </td>
                            <td>${31- t9.status}</td>
                        </c:forEach>
                   <td>1</td>
                    <c:forEach items="${requestScope.time23}" var="t23">
                            <td> 
                                <c:if test="${t23.status ne null }">
                                    ${t23.status}
                                </c:if>
                            </td>
                        </c:forEach>    
                </tr>
                <tr>
                    <c:forEach items="${requestScope.time10}" var="t10">
                            <td> 
                                <c:if test="${t10.status ne null }">
                                    ${t10.status}
                                </c:if>
                            </td>
                            <td>${31- t10.status}</td>
                        </c:forEach>
                    <td>1</td>
                    <c:forEach items="${requestScope.time24}" var="t24">
                            <td> 
                                <c:if test="${t24.status ne null }">
                                    ${t24.status}
                                </c:if>
                            </td>
                        </c:forEach>   
                </tr>
                <tr>
                    <c:forEach items="${requestScope.time11}" var="t11">
                            <td> 
                                <c:if test="${t11.status ne null }">
                                    ${t11.status}
                                </c:if>
                            </td>
                            <td>${31- t11.status}</td>
                        </c:forEach>
                    
                </tr>
                <tr>
                    <c:forEach items="${requestScope.time12}" var="t12">
                            <td> 
                                <c:if test="${t12.status ne null }">
                                    ${t12.status}
                                </c:if>
                            </td>
                            <td>${31- t12.status}</td>
                        </c:forEach>
                    
                </tr>
                <tr>
                    <c:forEach items="${requestScope.time13}" var="t13">
                            <td> 
                                <c:if test="${t13.status ne null }">
                                    ${t13.status}
                                </c:if>
                            </td>
                            <td>${31- t13.status}</td>
                        </c:forEach>
                    
                </tr>
                <tr>
                    <c:forEach items="${requestScope.time14}" var="t14">
                            <td> 
                                <c:if test="${t14.status ne null }">
                                    ${t14.status}
                                </c:if>
                            </td>
                            <td>${31- t14.status}</td>
                        </c:forEach>
                    
                </tr>
            </table>
            </div>
            
        </div>






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
                <button class="button button1"><a href="inside/report3.jsp">Check</a></button>
            </div>

        </div>

        <!--    <a href="#" id="nutnhan1">TÍNH SỐ NGÀY CÔNG</a>
            <a href="#" id="nutnhan2">TÍNH TIỀN LƯƠNG</a>-->




        <h1>Danh Sách Trả Công Cuối Tháng</h1>



        <!--<table style="width:100%">
          <tr>
            <th>TT</th> 
            <th>Name</th>
            <th>Chuc vu</th> 
            <th>Salary</th>
            <th>Tình Trạng</th>
        
          </tr>
          <tr>
              <td>1</td>
            <td>Vu Thi Thu Ha</td>
            <td>P.Giam Doc</td>
            <td>200k</td>
            <td>Chưa Nhận</td>
        
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
        </table>-->


    </body>

</html>

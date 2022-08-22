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
            <br>
            <br>
            <br>
            <div class="right">
                <table style="width:30">
                    <tr>
                        <th>Tổng Cộng Ngày Làm</th>
                        <th>Vắng Mặt</th>
                        <th>Nghỉ lễ</th>
                        <th>Tổng Số Nửa Ngày Làm</th>
                        <th>Tổng số lương nhận được</th>
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
                        <c:forEach items="${requestScope.salary1}" var="s1">
                            <c:forEach items="${requestScope.time2}" var="t2">
                                <c:forEach items="${requestScope.time16}" var="t16">
                                    <td> 
                                        <c:if test="${s1.salary ne null }">
                                            ${s1.salary * t2.status  + s1.salary/2 * t16.status}
                                        </c:if>
                                    </td> 
                                </c:forEach>
                            </c:forEach>
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
                        <c:forEach items="${requestScope.salary2}" var="s2">
                            <c:forEach items="${requestScope.time3}" var="t3">
                                <c:forEach items="${requestScope.time17}" var="t17">
                                    <td> 
                                        <c:if test="${s2.salary ne null }">
                                            ${s2.salary * t3.status + s2.salary/2 * t17.status}
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </c:forEach>
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
                        <c:forEach items="${requestScope.salary3}" var="s3">
                            <c:forEach items="${requestScope.time4}" var="t4">
                                <c:forEach items="${requestScope.time18}" var="t18">
                                    <td> 
                                        <c:if test="${s3.salary ne null }">
                                            ${s3.salary * t4.status + s3.salary/2 * t18.status}
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </c:forEach>
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
                        <c:forEach items="${requestScope.salary4}" var="s4">
                            <c:forEach items="${requestScope.time5}" var="t5">
                                <c:forEach items="${requestScope.time19}" var="t19">
                                    <td> 
                                        <c:if test="${s4.salary ne null }">
                                            ${s4.salary * t5.status + s4.salary/2 * t19.status}
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </c:forEach>
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
                        <c:forEach items="${requestScope.salary5}" var="s5">
                            <c:forEach items="${requestScope.time6}" var="t6">
                                <c:forEach items="${requestScope.time20}" var="t20">
                                    <td> 
                                        <c:if test="${s5.salary ne null }">
                                            ${s5.salary * t6.status + s5.salary/2 * t20.status}
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </c:forEach>
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
                        <c:forEach items="${requestScope.salary6}" var="s6">
                            <c:forEach items="${requestScope.time7}" var="t7">
                                <c:forEach items="${requestScope.time21}" var="t21">
                                    <td> 
                                        <c:if test="${s6.salary ne null }">
                                            ${s6.salary * t7.status + s6.salary/2 * t21.status}
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </c:forEach>
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
                        <c:forEach items="${requestScope.salary7}" var="s7">
                            <c:forEach items="${requestScope.time8}" var="t8">
                                <c:forEach items="${requestScope.time22}" var="t22">
                                    <td> 
                                        <c:if test="${s7.salary ne null }">
                                            ${s7.salary * t8.status + s7.salary/2 * t22.status}
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </c:forEach>
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
                        <c:forEach items="${requestScope.salary8}" var="s8">
                            <c:forEach items="${requestScope.time9}" var="t9">
                                <c:forEach items="${requestScope.time23}" var="t23">
                                    <td> 
                                        <c:if test="${s8.salary ne null }">
                                            ${s8.salary * t9.status + s8.salary/2 * t23.status}
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </c:forEach>
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
                        <c:forEach items="${requestScope.salary9}" var="s9">
                            <c:forEach items="${requestScope.time10}" var="t10">
                                <c:forEach items="${requestScope.time24}" var="t24">
                                    <td> 
                                        <c:if test="${s9.salary ne null }">
                                            ${s9.salary * t10.status + s9.salary/2 * t24.status}
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </c:forEach>
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
                        <td>1</td>
                        <c:forEach items="${requestScope.time25}" var="t25">
                            <td> 
                                <c:if test="${t25.status ne null }">
                                    ${t25.status}
                                </c:if>
                            </td>
                        </c:forEach>
                        <c:forEach items="${requestScope.salary10}" var="s10">
                            <c:forEach items="${requestScope.time11}" var="t11">
                                <c:forEach items="${requestScope.time25}" var="t25">
                                    <td> 
                                        <c:if test="${s10.salary ne null }">
                                            ${s10.salary * t11.status + s10.salary/2 * t25.status}
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </c:forEach>
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
                        <td>1</td>
                        <c:forEach items="${requestScope.time26}" var="t26">
                            <td> 
                                <c:if test="${t26.status ne null }">
                                    ${t26.status}
                                </c:if>
                            </td>
                        </c:forEach>
                        <c:forEach items="${requestScope.salary11}" var="s11">
                            <c:forEach items="${requestScope.time12}" var="t12">
                                <c:forEach items="${requestScope.time26}" var="t26">
                                    <td> 
                                        <c:if test="${s11.salary ne null }">
                                            ${s11.salary * t12.status + s11.salary/2 * t26.status}
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </c:forEach>
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
                        <td>1</td>
                        <c:forEach items="${requestScope.time27}" var="t27">
                            <td> 
                                <c:if test="${t27.status ne null }">
                                    ${t27.status}
                                </c:if>
                            </td>
                        </c:forEach>
                        <c:forEach items="${requestScope.salary12}" var="s12">
                            <c:forEach items="${requestScope.time13}" var="t13">
                                <c:forEach items="${requestScope.time27}" var="t27">
                                    <td> 
                                        <c:if test="${s12.salary ne null }">
                                            ${s12.salary * t13.status + s12.salary/2 * t27.status}
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </c:forEach>
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
                        <td>1</td>
                        <c:forEach items="${requestScope.time28}" var="t28">
                            <td> 
                                <c:if test="${t28.status ne null }">
                                    ${t28.status}
                                </c:if>
                            </td>
                        </c:forEach>
                        <c:forEach items="${requestScope.salary13}" var="s13">
                            <c:forEach items="${requestScope.time14}" var="t14">
                                <c:forEach items="${requestScope.time28}" var="t28">
                                    <td> 
                                        <c:if test="${s13.salary ne null }">
                                            ${s13.salary * t14.status + s13.salary/2 * t28.status}
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </c:forEach>
                        </c:forEach>    
                    </tr>
                    <tr>
                        <c:forEach items="${requestScope.time15}" var="t15">
                            <td> 
                                <c:if test="${t15.status ne null }">
                                    ${t15.status}
                                </c:if>
                            </td>
                            <td>${31- t14.status}</td>
                        </c:forEach>
                        <td>1</td>
                        <c:forEach items="${requestScope.time29}" var="t29">
                            <td> 
                                <c:if test="${t29.status ne null }">
                                    ${t29.status}
                                </c:if>
                            </td>
                        </c:forEach>
                        <c:forEach items="${requestScope.salary14}" var="s14">
                            <c:forEach items="${requestScope.time15}" var="t15">
                                <c:forEach items="${requestScope.time29}" var="t29">
                                    <td> 
                                        <c:if test="${s14.salary ne null }">
                                            ${s14.salary * t15.status + s14.salary/2 * t29.status}
                                        </c:if>
                                    </td>
                                </c:forEach>
                            </c:forEach>
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




        <h1>Danh Sách Những Người Nghỉ Có Lý Do Khác</h1>
        <table style="width:100%">
            <tr></tr>
            <th>TT</th>
            <th>Tên Nhân Viên</th>
            <th>From</th>
            <th>To</th>
            <th>Lý Do</th>
            <th>From</th>
            <tr>Ðã Xác Thực</tr>
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

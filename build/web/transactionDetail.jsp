<%-- Document : transactionManagerment Created on : Jun 8, 2023, 12:10:56 PM Author : hp --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction Detail</title><!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">


        <!-- Css Styles -->
        <link rel="stylesheet" href="access/css/transaction.css" type="text/css">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />  
    </head>

    <body>
        <!--        <div id="preloder">
                    <div class="loader"></div>
                </div> -->

        <!-- Offcanvas Menu Section Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="canvas-open">
            <i class="icon_menu"></i>
        </div>
        <div class="offcanvas-menu-wrapper">
            <div class="canvas-close">
                <i class="icon_close"></i>
            </div>
            <nav class="mainmenu mobile-menu">
                <ul>
                    <li><a href="./home">Home</a></li>
                    <form id="roomManagerment" action="roomManagerment" method="post">
                        <li>
                            <a href="javascript:void(0)" onclick="goToRM()">Room management</a>
                        </li>
                    </form>

                    <form id = "transactionManagerment" action="transactionManagerment" method="post">
                        <li>
                            <a href="javascript:void(0)" onclick="gotoTM()">Add transaction</a>
                        <li>
                    </form>
                    <form id = "transactionHistory" action="transactionHistory" method="post">
                        <li>
                            <a href="javascript:void(0)" onclick="gotoTH()">Transaction history</a>
                        <li>
                    </form>
                    <li><a href="#"><i class="fa fa-user"></i> ${sessionScope.useName} </a>
                        <ul class="dropdown">
                            <li><a href="./logout"><i class="fa fa-arrow-circle-o-right"></i> LogOut</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
            <div class="top-social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
            </div>
            <ul class="top-widget">
                <li><i class="fa fa-phone"></i> (12) 345 67890</li>
                <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
            </ul>
        </div>
        <!-- Offcanvas Menu Section End -->

        <!-- Header Section Begin -->
        <header class="header-section">
            <div class="menu-item">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="logo">
                                <a href="#">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="nav-menu">
                                <nav class="mainmenu">
                                    <ul style="display: flex">
                                        <li><a href="./home">Home</a></li>

                                        <form id="roomManagerment" action="roomManagerment" method="post">
                                            <li>
                                                <a href="javascript:void(0)" onclick="goToRM()">Room management</a>
                                            </li>
                                        </form>

                                        <form id = "transactionManagerment" action="transactionManagerment" method="post">
                                            <li>
                                                <a href="javascript:void(0)" onclick="gotoTM()">Add transaction</a>
                                            </li>
                                        </form>
                                        <form id = "transactionHistory" action="transactionHistory" method="post">
                                            <li>
                                                <a href="javascript:void(0)" onclick="gotoTH()">Transaction history</a>
                                            <li>
                                        </form>
                                        <li>
                                            <a href="#"><i class="fa fa-user"></i> ${sessionScope.useName}</a>
                                            <ul class="dropdown">
                                                <li><a href="./logout"><i class="fa fa-arrow-circle-o-right"></i> LogOut</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container">
            <hr width="80%">
            <div class="row">
                <div class="col-lg-5 customer container">
                    <h3 class="transTitle">Customer information</h3>
                    <div>
                        <div class="form-group">
                            <label>Customer Name :</label>
                            <input id ="txtCustomerName" class="form-control" type="text" name="customerName" value="${transaction.getCustomerName()}" readonly>
                            <span id="nameValid" class="text-danger"></span>
                        </div>
                        <div class="form-group">
                            <label>Phone Number :</label>
                            <input id ="txtPhoneNumber" class="form-control" type="text" name="phoneNumber" value="${transaction.getCustomerPhoneNumber()}" readonly min="0">
                            <span id="phoneValid" class="text-danger"></span>
                        </div>
                        <div class="form-group">
                            <label>Check-in Date</label>
                            <input id="txtCheckinDate" class="form-control" type="text" name="transcationDate" value="${transaction.getCheckinDate()}" readonly>
                            <span id="dateValid" class="text-danger"></span>
                        </div>
                        <c:choose>
                            <c:when test="${transaction.getCheckoutStatus() == 1}">
                                <div class="form-group">
                                    <label>Check-out Date</label>
                                    <input id="txtCheckoutDate" class="form-control" type="text" name="transcationDate" value="${transaction.getCheckoutDate()}" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Total price :</label>
                                    <input id="txtTotalPrice" class="form-control" type="text" name="totalPrice" value="${transaction.getPrice()}" readonly>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="form-group">
                                    <label>Check-out Date</label>
                                    <input id="txtCheckoutDate" class="form-control" type="text" name="transcationDate" readonly>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="col-lg-7 bill">
                    <form id="addbill" action="addbill" method="post">
                        <h3 class="transTitle">Bill information</h3>
                        <div class="container">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col" style="text-align: center">code</th>
                                        <th scope="col" style="text-align: center">name</th>
                                        <th scope="col" style="text-align: center">price/hour</th>
                                        <th scope="col" style="text-align: center">price/day</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="roombill" items="${roombill}">
                                        <tr>
                                            <th scope="row" style="vertical-align: middle; text-align: center">${roombill.getRoomCode()}</th>
                                            <td style="vertical-align: middle; text-align: center">${roombill.getName()}</td>

                                            <td style="vertical-align: middle; text-align: center">
                                                ${roombill.getPricePerHour()}
                                            </td>
                                            <td style="vertical-align: middle; text-align: center">
                                                ${roombill.getPricePerDay()}
                                            </td>
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
            <c:if test="${transaction.getCheckoutStatus() == 0}">
                <div class="d-flex justify-content-end">
                    <button type="button" class="btn btn-success" onclick="calTotalPrice()" data-toggle="modal" data-target="#exampleModal">Check-out</button>
                </div>
            </c:if>

            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <form action="checkout" method="post">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Confirm check-out</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="id" value="${transaction.getTransactionID()}">
                                <input type="hidden" id="txthiddenDate" name="checkoutDate">
                                <input type="hidden" id="txthiddenPrice" name="totalPirce">
                                <input type="hidden" name="roomCode" value="<c:forEach var="roombill" items="${roombill}">${roombill.getRoomCode()}||</c:forEach>">
                                    <label>Check-in Date : <span id="txtFCheckinDate"></span></label>
                                    <br>
                                    <label>Check-out Date : <span id="txtFCheckoutDate"></span></label>
                                    <br>
                                    <label>Total time : <span id="txtFTotalTime"></span></label>
                                    <br>
                                    <label>Total price : <span id="txtFTotalPrice"></span> $</label>
                                    <br>
                                    <label id="mess" class="text-danger"></label>    
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button id="btnConfirm" type="button" class="btn btn-primary">Confirm</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Footer Section Begin -->
            <script>
                const calTotalPrice = () => {
                    // Chuỗi thời điểm 1 và thời điểm 2
                    var time1 = document.getElementById("txtCheckinDate").value;
                    var time2 = document.getElementById("txtCheckoutDate").value;

                    // Chuyển đổi chuỗi thời điểm thành đối tượng Date
                    var date1 = new Date(time1);
                    var date2 = new Date(time2);

                    // Tính số miligiây chênh lệch giữa hai thời điểm
                    var diffMs = date2 - date1;

                    // Tính số phút chênh lệch
                    var diffMinutes = Math.floor(diffMs / (1000 * 60));

                    // Tính số giờ và phút
                    var hours = Math.floor(diffMinutes / 60);
                    var minutes = diffMinutes % 60;

                    // Làm tròn số phút lên 1 giờ nếu số phút lớn hơn 30
                    if (minutes > 30) {
                        hours += 1;
                    }

                    // Tính số ngày chênh lệch
                    var diffDays = Math.floor(hours / 24);
                    var diffHours = hours - diffDays * 24;
                    if (hours <= 0) {
                        diffDays = 0;
                        diffHours = 0;
                        document.getElementById("mess").innerHTML="Can't check-out at this time";
                        document.getElementById("btnConfirm").setAttribute("type","button");
                    }else{
                        document.getElementById("mess").innerHTML="";
                        document.getElementById("btnConfirm").setAttribute("type","submit");
                    }
                    let totalPrice = 0;
            <c:forEach var="roombill" items="${roombill}">
                    totalPrice += diffDays *${roombill.getPricePerDay()} + diffHours *${roombill.getPricePerHour()};
            </c:forEach>

                    // In kết quả
                    console.log("Số ngày: " + diffDays);
                    console.log("Số giờ: " + diffHours);
                    document.getElementById("txtFCheckinDate").innerHTML = time1;
                    document.getElementById("txtFCheckoutDate").innerHTML = time2;
                    document.getElementById("txthiddenDate").value = time2;

                    document.getElementById("txtFTotalTime").innerHTML = diffDays + " Day " + diffHours + " Hour";
                    document.getElementById("txtFTotalPrice").innerHTML = totalPrice;
                    document.getElementById("txthiddenPrice").value = totalPrice;
                    // nhét vô modal

                };
            <c:if test="${transaction.getCheckoutStatus() == 0}">
                const timeNow = () => {
                    const currentDate = new Date();
                    const options = {
                        year: 'numeric',
                        month: '2-digit',
                        day: '2-digit',
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit',
                        hour12: false
                    };
                    const currentDateTime = currentDate.toLocaleString('en-US', options);
                    document.getElementById("txtCheckoutDate").value = currentDateTime;
                };

                // Call updateTime() every second to update date and time
                setInterval(timeNow, 1000);
                // Call updateTime() to update date and time initially
                timeNow();
            </c:if>
        </script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="access/js/transaction.js"></script>


    </body>

</html>
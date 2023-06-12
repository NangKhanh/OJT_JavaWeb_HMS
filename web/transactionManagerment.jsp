<%-- Document : transactionManagerment Created on : Jun 8, 2023, 12:10:56 PM Author : hp --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction Managerment</title><!-- Google Font -->
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
                    <li class="active"><a href="#">Transaction management</a>
                    <li><a href="#">Statistical</a></li>
                    </li>
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
                                        <li class="active"><a href="#">Transaction management</a>
                                        <li><a href="#">Statistical</a></li>
                                        </li>
                                        <li><a href="#"><i class="fa fa-user"></i> ${sessionScope.useName} </a>
                                            <ul class="dropdown">
                                                <li><a href="./logout"><i class="fa fa-arrow-circle-o-right"></i>
                                                        LogOut</a></li>
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
            <div class="row">
                <div class="col-lg-5 customer container">
                    <h3 class="transTitle">Customer information</h3>
                    <div>
                        <div class="form-group">
                            <label>Customer Name :</label>
                            <input id ="txtCustomerName" class="form-control" type="text" name="customerName" value="${transaction.getCustomerName()}" required>
                        </div>
                        <div class="form-group">
                            <label>Phone Number :</label>
                            <input id ="txtPhoneNumber" class="form-control" type="number" name="phoneNumber" value="${transaction.getCustomerPhoneNumber()}" required min="0">
                        </div>
                        <div class="form-group">
                            <label>Date :</label>
                            <input id="txtDate" class="form-control" type="date" name="transcationDate" value="${transaction.getDate()}" required>
                        </div>
                        <div class="form-group">
                            <label>Total price :</label>
                            <input id="txtTotalPrice" class="form-control" type="number" name="totalPrice" value="${transaction.getPrice()}" readonly>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 bill">
                    <form id="addbill" action="addbill" method="post">
                        <h3 class="transTitle">Bill information</h3>
                        <div class="form-group d-flex justify-content-center">
                            <select class="d-none" name="roomSelected" id="roomSelect" style="width: 200px;">
                                <option value="-1">
                                    choose room
                                </option>
                                <c:forEach var="room" items="${rooms}">
                                    <option value="${room.getRoomCode()}">${room.getName()}</option>
                                </c:forEach>
                            </select>
                            <button id="addToBillButton" class="btn btn-secondary" type="button" onclick="addBillForm()" style="height: 28px; padding-bottom: 12px">add to bill</button>
                        </div>
                        <div class="container">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">code</th>
                                        <th scope="col">name</th>
                                        <th scope="col">time</th>
                                        <th scope="col">type</th>
                                        <th scope="col">price/Hour</th>
                                        <th scope="col">price/Day</th>
                                        <th scope="col">action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="roombill" items="${roombill}">
                                        <tr>
                                            <th scope="row">${roombill.getRoomCode()}</th>
                                            <td>${roombill.getName()}</td>
                                            <td><input id="time${roombill.getRoomCode()}" class="form-control" style="width: 60px" name="time" type="number" value="1" required min="1"></td>
                                            <td>
                                                <select id="type${roombill.getRoomCode()}" name="type">
                                                    <option value="0">Hour</option>
                                                    <option value="1">Day</option>
                                                </select>
                                            </td>
                                            <td>
                                                ${roombill.getPricePerHour()}
                                            </td><td>
                                                ${roombill.getPricePerDay()}
                                            </td>
                                            <td>
                                                <a href="javascript:void(0)" class="fa fa-rotate-right iconLink"data-toggle="tooltip"
                                                   title="update new information room"></a>
                                                <a href="javascript:void(0)" class="fa fa-trash iconLink" data-toggle="tooltip"
                                                   title="Delete"></a>
                                            </td>
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>

            </div>
        </div>
        <div class="container d-flex justify-content-end">
            <button type="button" class="btn btn-success" >Save transaction</button>
        </div>
    </form>
</div>
<!-- Footer Section Begin -->


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
<script>
    
function addBillForm() {
    //event.preventDefault(); // Ngăn chặn sự kiện mặc định của form

    let customerName = document.getElementById("txtCustomerName").value;
    let phoneNumber = document.getElementById("txtPhoneNumber").value;
    let transactionDate = document.getElementById("txtDate").value;
    let totalPrice = document.getElementById("txtTotalPrice").value;
    let check = document.getElementById("roomSelect").value;
    
    if (check !== "-1") {
        //TT transacation
        let transaction = {customerName: customerName, customerPhoneNumber: phoneNumber, date: transactionDate, totalPrice: totalPrice};
        let transactionData = JSON.stringify(transaction);

        // Tạo một trường ẩn trong form để lưu trữ chuỗi JSON
        let hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "transactionData");
        hiddenField.setAttribute("value", transactionData);

        let formElement = document.getElementById("addbill");
        formElement.appendChild(hiddenField);
        
        let roomBills = [];
        let roomBill = [];
        <c:forEach var="roombill" items="${roombill}">
            // Remove the previ ous declaration of 'roomBill' variable
            // Tạo đối tượng JSON cho mỗi phần tử trong vòng lặp
            roomBill = {
                roomCode: "${roombill.getRoomCode()}",
                name: "${roombill.getName()}",
                time: document.getElementById("time${roombill.getRoomCode()}").value,
                type: document.getElementById("type${roombill.getRoomCode()}").value,
                pricePerHour:"${roombill.getPricePerHour()}",
                pricePerDay: "${roombill.getPricePerDay()}"
            };

            // Thêm đối tượng JSON vào mảng roomBills
            roomBills.push(roomBill);
        </c:forEach>
        let billData = JSON.stringify(roomBills);
        let hiddenField2 = document.createElement("input");
        hiddenField2.setAttribute("type", "hidden");
        hiddenField2.setAttribute("name", "billData");
        hiddenField2.setAttribute("value", billData);
        
        console.log(billData);
        console.log(transactionData)
        formElement.appendChild(hiddenField2);
        //TT bill
        // Gửi form đi
        formElement.submit();
    }

}


</script>
</body>

</html>
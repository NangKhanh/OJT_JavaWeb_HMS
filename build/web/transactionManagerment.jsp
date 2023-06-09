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

                    <form id = "transactionManagerment" action="transactionManagerment" method="post">
                        <li  class="active">
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
                                            <li  class="active">
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
                            <input id ="txtCustomerName" class="form-control" type="text" name="customerName" value="${transaction.getCustomerName()}" required>
                            <span id="nameValid" class="text-danger"></span>
                        </div>
                        <div class="form-group">
                            <label>Phone Number :</label>
                            <input id ="txtPhoneNumber" class="form-control" type="text" name="phoneNumber" value="${transaction.getCustomerPhoneNumber()}" required min="0">
                            <span id="phoneValid" class="text-danger"></span>
                        </div>
                        <div class="form-group">
                            <label>Check-in Date :</label>
                            <input id="txtDate" class="form-control" type="datetime-local" name="transcationDate" value="${transaction.getCheckinDate()}" required>
                            <span id="dateValid" class="text-danger"></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 bill">
                    <form id="addbill" action="addbill" method="post">
                        <h3 class="transTitle">Bill information</h3>
                        <div class="form-group d-flex justify-content-center">
                            <select class="d-none " name="roomSelected" id="roomSelect" style="width: 200px;">
                                <option value="-1" >
                                    choose room
                                </option>
                                <c:forEach var="room" items="${rooms}">
                                    <option value="${room.getRoomCode()}">${room.getName()}</option>
                                </c:forEach>
                            </select>
                            <button id="addToBillButton" class="btn btn-secondary" type="button"
                                    onclick="addBillForm()" style="height: 28px; padding:revert;">add to bill</button>
                        </div>
                        <div class="container">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col" style="text-align: center">code</th>
                                        <th scope="col" style="text-align: center">name</th>
                                        <th scope="col" style="text-align: center">price/Hour</th>
                                        <th scope="col" style="text-align: center">price/Day</th>
                                        <th scope="col" style="text-align: center">action</th>
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
                                            <td style="vertical-align: middle; text-align: center">
                                                <button class="btn btn-danger fa fa-trash iconLink" data-toggle="tooltip" type="button"
                                                        data-key="${roombill.getRoomCode()}"
                                                        title="Remove from the bill" onclick="removeRoom(event)"></button>
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
        <form id="submitTransaction" method="post" action="submitTransaction">
            <div class="container d-flex justify-content-end">
                <button type="button" class="btn btn-success"  style="margin-bottom: 30px" onclick="submitTransaction()">Check-in</button>
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
        let addBillForm = () => {
        //event.preventDefault(); // Ngăn chặn sự kiện mặc định của form

        let customerName = document.getElementById("txtCustomerName").value;
        let phoneNumber = document.getElementById("txtPhoneNumber").value;
        let transactionDate = document.getElementById("txtDate").value;
        let check = document.getElementById("roomSelect").value;

        if (check !== "-1") {
            //TT transacation
            let transaction = {customerName: customerName, customerPhoneNumber: phoneNumber, checkinDate: transactionDate};
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
                roomBill = {
                    roomCode: "${roombill.getRoomCode()}",
                    name: "${roombill.getName()}",
                    pricePerHour: "${roombill.getPricePerHour()}",
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
            console.log(transactionData);
            formElement.appendChild(hiddenField2);
            //TT bill
            // Gửi form đi
            formElement.submit();
        }
    };

    let removeRoom = () =>{
        let customerName = document.getElementById("txtCustomerName").value;
        let phoneNumber = document.getElementById("txtPhoneNumber").value;
        let transactionDate = document.getElementById("txtDate").value;
            //TT transacation
        let transaction = {customerName: customerName, customerPhoneNumber: phoneNumber, checkinDate: transactionDate};
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
        var key = event.target.dataset.key;
        let roomCode = "";
        console.log(key);
        <c:forEach var="roombill" items="${roombill}">
            roomCode = "${roombill.getRoomCode()}";
             console.log(roomCode);
            roomBill = {
                roomCode: "${roombill.getRoomCode()}",
                name: "${roombill.getName()}",
                pricePerHour: "${roombill.getPricePerHour()}",
                pricePerDay: "${roombill.getPricePerDay()}"
                };

            // Thêm đối tượng JSON vào mảng roomBills
            if(key !== roomCode){
                roomBills.push(roomBill);
            }
        </c:forEach>
        let billData = JSON.stringify(roomBills);
        let hiddenField2 = document.createElement("input");
        hiddenField2.setAttribute("type", "hidden");
        hiddenField2.setAttribute("name", "billData");
        hiddenField2.setAttribute("value", billData);
        console.log(billData);
        console.log(transactionData);
        formElement.appendChild(hiddenField2);
        //TT bill
        // Gửi form đi
        formElement.submit();
    };
    
    const validateName = () => {
        let name = document.getElementById("txtCustomerName").value;
        if (!name) {
        document.getElementById("nameValid").innerHTML = "Không thể để trống trường này";
        return false;
        }else {
            document.getElementById("nameValid").innerHTML = "";
            return true;
        }
    };
    
    const valiatePhone = () => {
        let phone = document.getElementById("txtPhoneNumber").value;
        //const regex = /^(\+\d{1,4}\s?)?\d{10}$/;
        const regex = /^[0-9]\d*$/;

        if (!phone) {
            document.getElementById("phoneValid").innerHTML = "Không thể để trống trường này";
            return false;
        } else if (!regex.test(phone)) {
            document.getElementById("phoneValid").innerHTML = "Số điện thoại chỉ có thể chứa các chữ số";
            return false;
        } else {
            document.getElementById("phoneValid").innerHTML = "";
            return true;
        }
    };
    
    const validateDate = () => {
        const today = new Date();
        const check = new Date(today.getFullYear(), today.getMonth(), today.getDate());
        let date = new Date(document.getElementById("txtDate").value);

        if (isNaN(date)) {
          document.getElementById("dateValid").innerHTML = "Không thể để trống trường này";
          return false;
        } else if (date < check) {
          document.getElementById("dateValid").innerHTML = "Không thể nhập ngày giao dịch nhỏ hơn hôm nay";
          return false;
        } else {
          document.getElementById("dateValid").innerHTML = "";
          return true;
        }
    };
    
    let submitTransaction = () => {
      if(validateName()&&valiatePhone()&&validateDate()){
            let customerName = document.getElementById("txtCustomerName").value;
            let phoneNumber = document.getElementById("txtPhoneNumber").value;
            let transactionDate = document.getElementById("txtDate").value;
                //TT transacation
            let transaction = {customerName: customerName, customerPhoneNumber: phoneNumber, checkinDate: transactionDate};
            let transactionData = JSON.stringify(transaction);

                // Tạo một trường ẩn trong form để lưu trữ chuỗi JSON
            let hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "transactionData");
            hiddenField.setAttribute("value", transactionData);

            let formElement = document.getElementById("submitTransaction");
            formElement.appendChild(hiddenField);

            let roomBills = [];
            let roomBill = [];
            let roomCode = "";;
            <c:forEach var="roombill" items="${roombill}">
                roomBill = {
                    roomCode: "${roombill.getRoomCode()}"
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
            console.log(transactionData);
            formElement.appendChild(hiddenField2);
            //TT bill
            // Gửi form đi
            if(roomBills.length !== 0){
                formElement.submit();
                alert("save successfull");
            } else{
                alert("Phải thêm ít nhất một phòng để thực hiện dao dịch");
            }
        }
    };
    </script>
</body>

</html>
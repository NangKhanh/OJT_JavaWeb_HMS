/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function () {
$('#roomSelect').select2();
        });
        function goToRM() {
        document.getElementById("roomManagerment").submit();
                }

let addBillForm = () => {
//event.preventDefault(); // Ngăn chặn sự kiện mặc định của form

let customerName = document.getElementById("txtCustomerName").value;
        let phoneNumber = document.getElementById("txtPhoneNumber").value;
        let transactionDate = document.getElementById("txtDate").value;
        let totalPrice = document.getElementById("txtTotalPrice").value;
        let check = document.getElementById("roomSelect").value;
        if (check !== "-1" && validateTime()) {
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
    roomBill = {
        roomCode: "${roombill.getRoomCode()}",
        name: "${roombill.getName()}",
        time: document.getElementById("time${roombill.getRoomCode()}").value,
        type: document.getElementById("type${roombill.getRoomCode()}").value,
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
        console.log(transactionData)
        formElement.appendChild(hiddenField2);
        //TT bill
        // Gửi form đi
        formElement.submit();
}
};
        //txtTotalPrice
        let reUpdateBill = () => {
let totalPrice = 0;
        let time, type, hour, day;
        if (validateTime()){
<c:forEach var="roombill" items="${roombill}">
    time = parseInt(document.getElementById("time${roombill.getRoomCode()}").value);
    type = parseInt(document.getElementById("type${roombill.getRoomCode()}").value);
    hour = ${roombill.getPricePerHour()};
    day = ${roombill.getPricePerDay()};

    if (type === 0) {
        totalPrice += hour * time;
        document.getElementById("total${roombill.getRoomCode()}").innerHTML = hour * time;
    }
    if (type === 1) {
        totalPrice += day * time;
        document.getElementById("total${roombill.getRoomCode()}").innerHTML = day * time;
    }
    console.log(totalPrice);
</c:forEach>
        document.getElementById("txtTotalPrice").value = totalPrice;
}
};
        let removeRoom = (event) => {
let customerName = document.getElementById("txtCustomerName").value;
        let phoneNumber = document.getElementById("txtPhoneNumber").value;
        let transactionDate = document.getElementById("txtDate").value;
        let totalPrice = document.getElementById("txtTotalPrice").value;
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
        var key = event.target.dataset.key;
        let roomCode = "";
        console.log(key);
        <c:forEach var="roombill" items="${roombill}">
    roomCode = "${roombill.getRoomCode()}";
    console.log(roomCode);
    roomBill = {
        roomCode: "${roombill.getRoomCode()}",
        name: "${roombill.getName()}",
        time: document.getElementById("time${roombill.getRoomCode()}").value,
        type: document.getElementById("type${roombill.getRoomCode()}").value,
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
        const validateTime = () => {
<c:forEach var="roombill" items="${roombill}">
    if(document.getElementById("time${roombill.getRoomCode()}").value <= 0){
        alert("Lưu ý ! thời lượng phải là số dương. Thử lại sau");
        return false;
    }
</c:forEach>
return true;
};
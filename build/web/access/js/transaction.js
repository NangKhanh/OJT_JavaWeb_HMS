/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function goToRM() {
    document.getElementById("roomManagerment").submit();
}

function addBillForm() {
    //event.preventDefault(); // Ngăn chặn sự kiện mặc định của form

    let customerName = document.getElementById("txtCustomerName").value;
    let phoneNumber = document.getElementById("txtPhoneNumber").value;
    let transactionDate = document.getElementById("txtDate").value;
    let totalPrice = document.getElementById("txtTotalPrice").value;
    let check = document.getElementById("checkr").value;

    if (check !== "-1") {
        //TT transacation
        let transaction = {customerName: customerName, customerPhoneNumber: phoneNumber, date: transactionDate, totalPrice: totalPrice};
        let jsonData = JSON.stringify(transaction);

        // Tạo một trường ẩn trong form để lưu trữ chuỗi JSON
        let hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "transactionData");
        hiddenField.setAttribute("value", jsonData);

        let formElement = document.getElementById("addbill");
        formElement.appendChild(hiddenField);
        
        //TT bill
        // Gửi form đi
        formElement.submit();
    }

}


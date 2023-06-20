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
function gotoTM() {
    document.getElementById("transactionManagerment").submit();
}
function gotoTH() {
    document.getElementById("transactionHistory").submit();
}

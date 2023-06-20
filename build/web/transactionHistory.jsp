<%-- Document : roomManagerment Created on : Jun 6, 2023, 10:40:32 AM Author : hp --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction History</title>
        <link rel="stylesheet" href="css/roomManagermetn.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.1.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

    </head>

    <body>
        <!--        <div id="preloder">
                    <div class="loader"></div>
                </div>-->

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
                    <li ><a href="./home">Home</a></li>
                    <form id="roomManagerment" action="roomManagerment" method="post">
                        <li class="active">
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
                    <li><a href="#">Statistical</a></li>
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
                                            <li >
                                                <a href="javascript:void(0)" onclick="goToRM()">Room management</a>
                                            </li>
                                        </form>

                                        <form id = "transactionManagerment" action="transactionManagerment" method="post">
                                            <li>
                                                <a href="javascript:void(0)" onclick="gotoTM()">Add transaction</a>
                                            </li>
                                        </form>
                                        <form id = "transactionHistory" action="transactionHistory" method="post">
                                            <li class="active">
                                                <a href="javascript:void(0)" onclick="gotoTH()">Transaction history</a>
                                            <li>
                                        </form>
                                        <li><a href="#">Statistical</a></li>

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
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-6">
                                <h2 style="color: aliceblue;"> <b>Transaction History</b></h2>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th style="width: 250px">Customer name</th>
                                <th>Phone number</th>
                                <th>Date</th>
                                <th>Total Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="transaction" items="${transactions}">
                                <tr>
                                    <td>${transaction.getCustomerName()}</td>
                                    <td>${transaction.getCustomerPhoneNumber()}</td>
                                    <td>${transaction.getDate()}</td>
                                    <td>${transaction.getPrice()}</td>
                                    <td>
                                        <a href="./transactionDetail?id=${transaction.getTransactionID()}" class="edit"><i
                                                class="fa fa-eye" data-toggle="tooltip"
                                                title="View detail transaction"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix">

                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${currentPage > 1}">
                                    <li class="page-item"><a href="./transactionHistory?currentPage=${currentPage - 1}" class="page-link">Previous</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item disabled"><a class="page-link">Previous</a></li>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach var="page" begin="1" end="${pageNumber}">
                                    <c:choose>
                                        <c:when test="${page == currentPage}">
                                        <li class="page-item active"><a href="./transactionHistory?currentPage=${page}" class="page-link">${page}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li class="page-item"><a href="./transactionHistory?currentPage=${page}" class="page-link">${page}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${currentPage < pageNumber}">
                                    <li class="page-item"><a href="./transactionHistory?currentPage=${currentPage + 1}" class="page-link">Next</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item disabled"><a class="page-link">Next</a></li> 
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Modal HTML -->
        <div id="edit" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="" method="">
                        <input type="hidden" name="currentPage" value="${currentPage}">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit Room Information : ${room.getRoomCode()}</h5>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name ="name" class="form-control" value="${room.getName()}" required>
                            </div>
                            <div class="form-group">
                                <label>Price/Hour</label>
                                <input type="number" name ="pHour" class="form-control" value="${room.getPricePerHour()}" required min="1">
                            </div>
                            <div class="form-group">
                                <label>Price/Day</label>
                                <input type="number" name="pDay" class="form-control" value="${room.getPricePerDay()}" required min="">
                            </div>
                            <div class="d-flex">
                                <c:choose>
                                    <c:when test="${room.getStatus() == 1}">
                                        <input style="margin-right: 5px" type="radio" name="status" value="1" checked > Còn trống 
                                        <input style="margin-left: 20px; margin-right: 5px"  type="radio" name="status" value="0"> Đã cho thuê
                                    </c:when>
                                    <c:when test="${room.getStatus() == 0}">
                                        <input style="margin-right: 5px" type="radio" name="status" value="1" > Còn trống
                                        <input style="margin-left: 20px; margin-right: 5px"  type="radio" name="status" class="" value="0" checked> Đã cho thuê
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" value="close">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function goToRM() {
                document.getElementById("roomManagerment").submit();
            }

            function gotoTM() {
                document.getElementById("transactionManagerment").submit();
            }
        </script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
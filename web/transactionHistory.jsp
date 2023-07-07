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
                                <th>Check-in Date</th>
                                <th>Check-out Date</th>
                                <th>Total Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="transaction" items="${transactions}">
                                <tr>
                                    <td>${transaction.getCustomerName()}</td>
                                    <td>${transaction.getCustomerPhoneNumber()}</td>
                                    <td>${transaction.getCheckinDate()}</td>
                                    <c:choose>
                                        <c:when test="${transaction.getCheckoutStatus() == 1}">
                                            <td>${transaction.getCheckoutDate()}</td>
                                            <td>${transaction.getPrice()}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>not yet</td>
                                            <td>not yet</td>
                                        </c:otherwise>
                                    </c:choose>
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
                                    <li class="page-item"><a href="./transactionHistory?currentPage=1" class="page-link">First</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item disabled"><a class="page-link">First</a></li>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${currentPage > 1}">
                                    <li class="page-item"><a href="./transactionHistory?currentPage=${currentPage - 1}" class="page-link">Previous</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item disabled"><a class="page-link">Previous</a></li>
                                    </c:otherwise>
                                </c:choose>
                                <li class="page-item active"><a href="#" class="page-link">${currentPage}</a></li>
                                <c:choose>
                                    <c:when test="${currentPage < pageNumber}">
                                    <li class="page-item"><a href="./transactionHistory?currentPage=${currentPage + 1}" class="page-link">Next</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item disabled"><a class="page-link">Next</a></li> 
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${currentPage < pageNumber}">
                                    <li class="page-item"><a href="./transactionHistory?currentPage=${pageNumber}" class="page-link">Last</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item disabled"><a class="page-link">Last</a></li> 
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </div>
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
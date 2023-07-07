<%-- Document : roomManagerment Created on : Jun 6, 2023, 10:40:32 AM Author : hp --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Room</title>
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
                                            <li class="active">
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
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-6">
                                <h2 style="color: aliceblue;">Manager <b>Rooms</b></h2>
                            </div>
                            <div class="col-6">
                                <a href="#addRoom" class="btn btn-success" onclick="genCode()" style="background-color: #c88a3f;" data-toggle="modal"><i
                                        class="material-icons">&#xE147;</i> <span>Add New Room</span></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Status</th>
                                <th>Price/Day</th>
                                <th>Price/Hour</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="room" items="${rooms}">
                                <tr>
                                    <td>${room.getRoomCode()}</td>
                                    <td>${room.getName()}</td>
                                    <c:choose>
                                        <c:when test="${room.getStatus() == 1}">
                                            <td>Còn trống</td>
                                        </c:when>
                                        <c:when test="${room.getStatus() == 0}">
                                            <td>Đã cho thuê</td>
                                        </c:when>
                                    </c:choose>
                                    <td>${room.getPricePerDay()}</td>
                                    <td>${room.getPricePerHour()}</td>
                                    <td>
                                        <a href="#edit${room.getRoomCode()}" class="edit" data-toggle="modal"><i
                                                class="material-icons" data-toggle="tooltip"
                                                title="Edit">&#xE254;</i></a>
                                        <c:if test="${room.getStatus() == 1}">
                                            <a href="#delete${room.getRoomCode()}" class="delete" data-toggle="modal"><i
                                                class="material-icons" data-toggle="tooltip"
                                                title="Delete">&#xE872;</i></a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix">

                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${currentPage > 1}">
                                    <li class="page-item"><a href="./roomManagerment?currentPage=${currentPage - 1}" class="page-link">Previous</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="page-item disabled"><a class="page-link">Previous</a></li>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach var="page" begin="1" end="${pageNumber}">
                                    <c:choose>
                                        <c:when test="${page == currentPage}">
                                        <li class="page-item active"><a href="./roomManagerment?currentPage=${page}" class="page-link">${page}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li class="page-item"><a href="./roomManagerment?currentPage=${page}" class="page-link">${page}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${currentPage < pageNumber}">
                                    <li class="page-item"><a href="./roomManagerment?currentPage=${currentPage + 1}" class="page-link">Next</a></li>
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
        <!-- add Modal HTML -->
        <div id="addRoom" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addRoom" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Add a new room</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <!--                                <label>Code</label>-->
                                <input id="txtCode" type="hidden" name="code" class="form-control" readonly required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price/Hour</label>
                                <input type="number" name="pHour" class="form-control" required  min="1">
                            </div>
                            <div class="form-group">
                                <label>Price/Day</label>
                                <input type="number" name="pDay" class="form-control" required  min="1">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <c:forEach var="room" items="${rooms}">
            <div id="edit${room.getRoomCode()}" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editRoom" method="post">
                            <input type="hidden" name="code" value="${room.getRoomCode()}">
                            <input type="hidden" name="currentPage" value="${currentPage}">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Room Information</h5>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" name ="name" class="form-control" value="${room.getName()}" required>
                                </div>
                                <c:choose>
                                    <c:when test="${room.getStatus() == 1}">
                                        <div class="form-group">
                                            <label>Price/Hour</label>
                                            <input type="number" name ="pHour" class="form-control" value="${room.getPricePerHour()}" required min="1">
                                        </div>
                                        <div class="form-group">
                                            <label>Price/Day</label>
                                            <input type="number" name="pDay" class="form-control" value="${room.getPricePerDay()}" required min="1">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="form-group">
                                            <label>Price/Hour</label>
                                            <input type="number" name ="pHour" class="form-control" value="${room.getPricePerHour()}" required min="1" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Price/Day</label>
                                            <input type="number" name="pDay" class="form-control" value="${room.getPricePerDay()}" required min="1" readonly>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <div class="d-none">
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
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-info" value="Save">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- Delete Modal HTML -->
        <c:forEach var="room" items="${rooms}">
            <c:if test="${room.getStatus() == 1}">
                <div id="delete${room.getRoomCode()}" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="deleteRoom" method="post">

                                <div class="modal-header">
                                    <h4 class="modal-title">Delete Room</h4>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <p>Are you sure you want to delete room : ${room.getName()} ?</p>
                                    <p class="text-danger"><small>This action cannot be undone.</small></p>
                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" name="code" value="${room.getRoomCode()}">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                    <input type="submit" class="btn btn-danger" value="Delete">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>

        <!-- Footer Section Begin -->

        <script>
            function genCode() {
                let uniqueString = generateUniqueString();
                console.log("Code:" + uniqueString);
                document.getElementById("txtCode").value = uniqueString;
            }
            function generateUniqueString() {
                let timestamp = Date.now().toString();
                return timestamp;
            }


            function goToRM() {
                document.getElementById("roomManagerment").submit();
            }

            function gotoTM() {
                document.getElementById("transactionManagerment").submit();
            }

            function gotoTH() {
                document.getElementById("transactionHistory").submit();
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
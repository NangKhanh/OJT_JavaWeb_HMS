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
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

    </head>

    <body>
        <div id="preloder">
            <div class="loader"></div>
        </div>

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
                    <li class="active"><a href="./home">Home</a></li>
                    <form id="roomManagerment" action="roomManagerment" method="post">
                        <li>
                            <a href="javascript:void(0)" onclick="goToRM()">Room management</a>
                        </li>
                    </form>
                    <li><a href="#">Statistical</a></li>
                    <li><a href="#">Transaction management</a>
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
                                        <li ><a href="./home">Home</a></li>

                                        <form id="roomManagerment" action="roomManagerment" method="post">
                                            <li class="active">
                                                <a href="javascript:void(0)" onclick="goToRM()">Room management</a>
                                            </li>
                                        </form>
                                        <li><a href="#">Statistical</a></li>
                                        <li><a href="">Transaction management</a>
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
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-6">
                                <h2 style="color: aliceblue;">Manager <b>Rooms</b></h2>
                            </div>
                            <div class="col-6">
                                <a href="#addRoom" class="btn btn-success" data-toggle="modal"><i
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
                                        <a href="#delete${room.getRoomCode()}" class="delete" data-toggle="modal"><i
                                                class="material-icons" data-toggle="tooltip"
                                                title="Delete">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="clearfix">

                        <ul class="pagination">
                            <li class="page-item disabled"><a href="#">Previous</a></li>
                            <li class="page-item active "><a href="#" class="page-link">1</a></li>
                            <li class="page-item"><a href="#" class="page-link">2</a></li>
                            <li class="page-item "><a href="#" class="page-link">3</a></li>
                            <li class="page-item"><a href="#" class="page-link">4</a></li>
                            <li class="page-item"><a href="#" class="page-link">5</a></li>
                            <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addRoom" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Add a new room</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Code</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price/Hour</label>
                                <input type="number" class="form-control" required  min="0">
                            </div>
                            <div class="form-group">
                                <label>Price/Day</label>
                                <input type="number" class="form-control" required  min="0">
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
                                    <input type="number" name ="pHour" class="form-control" value="${room.getPricePerHour()}" required min="0">
                                </div>
                                <div class="form-group">
                                    <label>Price/Day</label>
                                    <input type="number" name="pDay" class="form-control" value="${room.getPricePerDay()}" required min="0">
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
        </c:forEach>

        <!-- Footer Section Begin -->
        <footer class="footer-section">
            <div class="container">
                <div class="footer-text">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="ft-about">
                                <div class="logo">
                                    <a href="#">
                                        <img src="img/footer-logo.png" alt="">
                                    </a>
                                </div>
                                <p>We inspire and reach millions of travelers<br /> across 90 local websites</p>
                                <div class="fa-social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-youtube-play"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 offset-lg-1">
                            <div class="ft-contact">
                                <h6>Contact Us</h6>
                                <ul>
                                    <li>(12) 345 67890</li>
                                    <li>info.colorlib@gmail.com</li>
                                    <li>856 Cordia Extension Apt. 356, Lake, United State</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 offset-lg-1">
                            <div class="ft-newslatter">
                                <h6>New latest</h6>
                                <p>Get the latest updates and offers.</p>
                                <form action="#" class="fn-form">
                                    <input type="text" placeholder="Email">
                                    <button type="button"><i class="fa fa-send"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7">
                            <ul>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Terms of use</a></li>
                                <li><a href="#">Privacy</a></li>
                                <li><a href="#">Environmental Policy</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-5">
                            <div class="co-text">
                                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;
                                    <script>document.write(new Date().getFullYear());</script> All rights reserved |
                                    This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a
                                        href="#" target="_blank">Colorlib</a>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script>
            function goToRM() {
                document.getElementById("roomManagerment").submit();
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
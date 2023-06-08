<%-- Document : transactionManagerment Created on : Jun 8, 2023, 12:10:56 PM Author : hp --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title><!-- Google Font -->
            <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

            <!-- Css Styles -->
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
                                            <li ><a href="./home">Home</a></li>
    
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
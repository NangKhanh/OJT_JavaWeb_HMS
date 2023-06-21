<%-- Document : home Created on : Jun 5, 2023, 2:45:35 PM Author : hp --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
        <!-- Google Font -->
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
                    <li class="active"><a href="#">Home</a></li>
                    <form id="roomManagerment" action="roomManagerment" method="post">
                        <li>
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
                                        <li class="active"><a href="#">Home</a></li>

                                        <form id="roomManagerment" action="roomManagerment" method="post">
                                            <li>
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
            <hr width="80%">
            <div class="">
             <h3 style="text-align: center;">Thống kê doanh số theo tháng trong năm nay</h3>
                <div class="col-12">
                    <canvas id="myChartLine"></canvas>
                </div>
                <div class="">
                    <hr width="80%">
                    <h3 style="text-align: center;">Thống kê doanh số của từng tuần trong tháng của năm nay</h3>
                    <div class="d-flex justify-content-center" style="margin: 20px">
                        Week1:<button style=" width: 40px; margin: 0 20px 0 10px; border: none; background-color:rgb(255, 99, 132)"></button>
                        Week2:<button style=" width: 40px; margin: 0 20px 0 10px; border: none; background-color:rgb(54, 162, 235)"></button>
                        Week3:<button style=" width: 40px; margin: 0 20px 0 10px; border: none; background-color:rgb(255, 205, 86)"></button>
                        Week4:<button style=" width: 40px; margin: 0 20px 0 10px; border: none; background-color:rgb(142, 172, 80)"></button>
                        Week5:<button style=" width: 40px; margin: 0 20px 0 10px; border: none; background-color:rgb(136, 74, 57)"></button>
                    </div>
                    <div class="row" >
                        <c:forEach var="s" items="${statistics}">
                            <div class="col-md-3" style="margin-bottom: 30px">
                                <canvas id ="myChartPie${s.getMonth()}" ></canvas>
                                <div class="d-flex justify-content-center" >
                                    <label>${s.getMonth()}</label>
                                </div>
                            </div>
                        </c:forEach>
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

            function gotoTH() {
                document.getElementById("transactionHistory").submit();
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


        <!-- Js Plugins -->

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        
        <script>
            new Chart(document.getElementById('myChartLine'), {
                type: 'line',
                data: {
                  labels: [<c:forEach var="s" items="${statistics}">'${s.getMonth()}'<c:if test="${s != lastStatistic}">,</c:if></c:forEach>],
                  datasets: [{
                    label: 'Price',
                    data: [<c:forEach var="s" items="${statistics}">${s.getTotal()}<c:if test="${s != lastStatistic}">,</c:if></c:forEach>],
                    fill: false,
                    borderColor: 'rgb(75, 192, 192)',
                    tension: 0.1
                  }]
                },
                options: {
                  scales: {
                    x: {
                      display: true,
                      title: {
                        display: true,
                        text: 'Month'
                      }
                    },
                    y: {
                      display: true,
                      title: {
                        display: true,
                        text: 'Price'
                      }
                    }
                  },
                  plugins: {
                    legend: {
                      display: false
                    }
                  }
                }
              });
              <c:forEach var="s" items="${statistics}">
                new Chart(document.getElementById('myChartPie${s.getMonth()}'), {
                    type: 'polarArea',
                    data: {
                        labels: [
                          'Week 1',
                          'Week 2',
                          'Week 3',
                          'Week 4',
                          'Week 5'
                        ],
                        datasets: [{
                          data: [${s.getWeek1()}, ${s.getWeek2()}, ${s.getWeek3()},${s.getWeek4()},${s.getWeek5()}],
                          backgroundColor: [
                            'rgb(255, 99, 132)',
                            'rgb(54, 162, 235)',
                            'rgb(255, 205, 86)',
                            'rgb(142, 172, 80)',
                            'rgb(136, 74, 57)'
                          ],
                        }]
                      }, options: {
                        plugins: {
                            legend: {
                                display: false
                            },
                            datalabels: {
                                formatter: (value, ctx) => {
                                    let sum = 0;
                                    let dataArr = ctx.chart.data.datasets[0].data;
                                    dataArr.map(data => {
                                        sum += data;
                                    });
                                    let percentage = (value * 100 / sum).toFixed(2) + "%";
                                    return percentage;
                                },
                                color: '#fff'
                            }
                        }
                    }
                  });
            </c:forEach>
        </script>

    </body>

</html>
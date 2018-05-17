<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@page contentType="text/html" pageEncoding="UTF-8"%><!doctype html>
<html lang="pl">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="theme-color" content="#343A40">
        <meta name="description" content="Agregator kursów kryptowalut">
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="manifest" href="manifest.json">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Coinscraper</title>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">
                <img src="images/icons/icon-72x72-white.png" width="30" height="30" class="d-inline-block align-top" alt="">
                Coinscraper
            </a>
        </nav>
        <br>
        <div class="container">
            <ul class="nav nav-pills justify-content-center">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="pill" href="#" onclick="showAll()">Wszystkie</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#" onclick="showFavs()">Ulubione</a>
                </li>
            </ul>

            <div class="tab-content">
                <div id="all" class="container">
                    <br>
                    <div id="accordion">
                        <c:forEach var="currency" items="${list}">
                            <div id="${currency.getSymbol()}" class="card" onclick="displayChart('${currency.getSymbol()}')">
                                <div class="card-header">
                                    <a href="#" class="my-icons" data-toggle="tooltip" title="Dodaj do ulubionych"><span id="star${currency.getSymbol()}" class="icon-star" onclick="toggleFav(this.id)"></span></a>
                                    <a href="#" class="my-icons" data-toggle="tooltip" title="Ustaw alarm"><span id="bell${currency.getSymbol()}" class="icon-bell"></span></a>
                                    <a class="card-link" data-toggle="collapse" href="#collapse${currency.getSymbol()}">
                                        <img src="logo?id=${currency.getSymbol()}" alt=""/> ${currency.getSymbol()} ${currency.getName()}
                                    </a>
                                </div>
                                <div id="collapse${currency.getSymbol()}" class="collapse" data-parent="#accordion">
                                    <div class="card-body">

                                        <div class="card-group">
                                            <div class="card">
                                                <div class="card-header bg-primary text-white">Zmiana średniego kursu</div>
                                                <div class="card-body">
                                                    <div id="containerForChart${currency.getSymbol()}"></div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-header bg-primary text-white">Średni kurs</div>
                                                <div class="card-body text-center h-100" style="display: flex; flex-wrap: flex;">
                                                    <h3 class="m-auto w-100">
                                                        <span class="badge badge-secondary">${currency.getAvgPriceInDollars()}$</span>
                                                        <hr>
                                                        <span class="badge badge-secondary">${currency.getAvgPriceInBitcoin()} BTC</span>
                                                    </h3>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-header bg-primary text-white">Najniższy kurs</div>
                                                <div class="card-body text-center h-100" style="display: flex; flex-wrap: flex;">
                                                    <h3 class="m-auto w-100">
                                                        <span class="badge badge-secondary">${currency.getMinPriceInDollars()}$</span>
                                                        <hr>
                                                        <span class="badge badge-secondary">${currency.getMarketName()}</span>
                                                    </h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <br>
                </div>
            </div>
        </div>
        <footer class="page-footer">
            <div class="footer-copyright bg-dark py-4 text-center"><jsp:useBean id="now" class="java.util.Date" /><fmt:formatDate var="year" value="${now}" pattern="yyyy" />
                ⓒ ${year}
            </div>
        </footer>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/script.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/moment.min.js"></script>
        <script src="js/Chart.min.js"></script>
    </body>
</html>
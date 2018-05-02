<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@page contentType="text/html" pageEncoding="UTF-8"%><!doctype html>
<html lang="pl">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="theme-color" content="#0088ff">
        <meta name="description" content="Agregator kursów kryptowalut">
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="manifest" href="manifest.json">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Coinscraper</title>
    </head>
    <body>
        <br>
        <div class="container">
            <div class="alert alert-success alert-dismissible fade show">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Hello, <strong>world</strong>!
            </div>
            
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
                        <div id="${currency.getSymbol()}" class="card">
                            <div class="card-header">
                                <a href="#" class="my-icons" data-toggle="tooltip" title="Dodaj do ulubionych"><span id="star${currency.getSymbol()}" class="icon-star" onclick="toggleFav(this.id)"></span></a>
                                <a href="#" class="my-icons" data-toggle="tooltip" title="Ustaw alarm"><span id="bell${currency.getSymbol()}" class="icon-bell"></span></a>
                                <a class="card-link" data-toggle="collapse" href="#collapse${currency.getSymbol()}">
                                    <img src="logo?id=${currency.getSymbol()}" alt=""/> ${currency.getSymbol()} ${currency.getName()}
                                </a>
                            </div>
                            <div id="collapse${currency.getSymbol()}" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    Kurs: ${currency.getPriceInDollars()}$
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
            <div class="footer-copyright py-4 text-center"><jsp:useBean id="now" class="java.util.Date" /><fmt:formatDate var="year" value="${now}" pattern="yyyy" />
                ⓒ ${year}
            </div>
        </footer>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/script.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
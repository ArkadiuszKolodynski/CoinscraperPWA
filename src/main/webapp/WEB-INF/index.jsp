<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@page contentType="text/html" pageEncoding="UTF-8"%><!doctype html>
<html lang="pl">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="theme-color" content="#0088ff">
        <meta name="description" content="Agregator kursów krypto walut">
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="manifest" href="manifest.json">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Webscraper-PWA-Client</title>
    </head>
    <body>
        <br>
        <div class="container">
            <div class="alert alert-success alert-dismissible fade show">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Hello, <strong>world</strong>!
            </div>
            
            <ul class="nav nav-pills justify-content-center" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="pill" href="#all">Wszystkie</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#fav">Ulubione</a>
                </li>
            </ul>
            
            <div class="tab-content">
                <div id="all" class="container tab-pane active show">
                    <br><div id="accordion">
                        <c:forEach var = "currency" items = "${list}">
                        <div id="${currency.getSymbol()}" class="card">
                            <div class="card-header">
                                <a href="#" class="my-icons" data-toggle="tooltip" title="Dodaj do ulubionych"><span id="star${currency.getSymbol()}" class="icon-star" onclick="toggleFav(this.id)"></span></a>
                                <a href="#" class="my-icons" data-toggle="tooltip" title="Ustaw alarm"><span id="bell${currency.getSymbol()}" class="icon-bell"></span></a>
                                <a class="card-link" data-toggle="collapse" href="#collapse${currency.getSymbol()}">
                                    <table>
                                        <tr>
                                            <td>${currency.getSymbol()}</td>
                                            <td>${currency.getName()}</td>
                                        </tr>
                                </table>
                                </a>
                            </div>
                            <div id="collapse${currency.getSymbol()}" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div><br>
                </div>
                <div id="fav" class="container tab-pane fade text-center">
                    <br>Nie posiadasz ulubionych!<br>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/script.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
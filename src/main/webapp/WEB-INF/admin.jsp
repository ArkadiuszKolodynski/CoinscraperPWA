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
        <c:choose>
            <c:when test="${password=='correct'}">
                <div class="card mb-4">
                    <div class="card-header bg-primary text-white">Crawler</div>
                    <div class="card-body">
                        <div>
                        Status crawlera: <span class="${running ? "text-success" : "text-danger"}">${running ? "WŁĄCZONY" : "WYŁĄCZONY"}</span>
                        </div>
                        <div class="btn-group">
                            <a href="setcrawlerstate?action=start" class="btn btn-primary${running ? " disabled" : ""}">START</a>
                            <a href="setcrawlerstate?action=restart" class="btn btn-primary${running ? "" : " disabled"}">RESTART</a>
                            <a href="setcrawlerstate?action=stop" class="btn btn-primary${running ? "" : " disabled"}">STOP</a>
                        </div> 
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header bg-primary text-white">Dodawanie giełdy</div>
                    <div class="card-body">
                        <form action="upload" method="post" enctype="multipart/form-data">
                            <label for="file">Wybierz plik:</label>
                            <br>
                            <input id="file" type="file" name="file" size="50">
                            <br><br>
                            <input type="submit" class="btn btn-primary" value="Dodaj">
                        </form>
                    </div>
                </div>
                <ul class="list-group mb-4">
                    <li class="list-group-item active">Storage</li>
                    <li class="list-group-item">Całkowita ilość miejsca na dysku: ${totalSpace}</li>
                    <li class="list-group-item">Ilość wolnego miejsca na dysku: ${freeSpace}</li>
                    <li class="list-group-item">
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped ${color}" style="width:${percentageFreeSpace}%">${percentageFreeSpace}%</div>
                        </div> 
                    </li>
                </ul>
            </c:when>
            <c:when test="${password=='wrong'}">
                <div class="text-center">
                    <h1 class="text-danger">Niepoprawne hasło!</h1>
                    <br>
                    <form class="auth-form" action="admin" method="post">
                        Zaloguj się, aby przejść dalej:
                        <input class="form-control" type="password" placeholder="Hasło" required="" name="password">
                        <input class="btn btn-lg btn-primary btn-block" type="submit" value="Zaloguj">
                    </form>
                </div>
            </c:when>
            <c:otherwise>
                <div class="text-center">
                    <br><br><br>
                    <form class="auth-form" action="admin" method="post">
                        Zaloguj się, aby przejść dalej:
                        <input class="form-control" type="password" placeholder="Hasło" name="password">
                        <input class="btn btn-lg btn-primary btn-block" type="submit" value="Zaloguj">
                    </form>
                </div>
            </c:otherwise>
        </c:choose>
        </div>
        <footer class="page-footer">
            <div class="footer-copyright bg-dark py-4 text-center"><jsp:useBean id="now" class="java.util.Date" /><fmt:formatDate var="year" value="${now}" pattern="yyyy" />
                ⓒ ${year}
            </div>
        </footer>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
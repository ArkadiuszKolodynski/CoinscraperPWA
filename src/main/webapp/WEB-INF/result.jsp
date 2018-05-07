<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@page contentType="text/html" pageEncoding="UTF-8"%><!doctype html>
<html lang="pl">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="theme-color" content="#343A40">
        <meta name="description" content="Agregator kursów kryptowalut">
        <meta http-equiv="refresh" content="10; url=admin" />
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
        <div class="container text-center mt-5">
            <h3>${message}</h3>
            <h6>Za chwilę nastąpi przekierowanie...</h6>
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
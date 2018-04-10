<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="pl">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="favicon.ico" >
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
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
                    <a class="nav-link" onclick="showFavs()" data-toggle="pill" href="#fav">Ulubione</a>
                </li>
            </ul>
            
            <div class="tab-content">
                <div id="all" class="container tab-pane active"><br>
                    <jsp:include page="accordion.jsp" />
                </div>
                <div id="fav" class="container tab-pane fade"><br>
                    <!-- <p>Nie posiadasz ulubionych!</p> -->
                </div>
            </div>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/script.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script defer src="js/fontawesome-all.js"></script>
    </body>
</html>
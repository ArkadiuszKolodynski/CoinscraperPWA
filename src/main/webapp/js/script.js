$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip({
        trigger : 'hover'
    });
    
    setFavs();
});

function toggleFav(element) {
    document.getElementById(element).classList.toggle('star-clicked');
    
    var favourites = JSON.parse(localStorage.favs);
    if (!favourites.includes(element)) {
        favourites.push(element);
        localStorage.favs = JSON.stringify(favourites);
    } else {
        var index = favourites.indexOf(element);
        if (index !== -1) {
            favourites.splice(index, 1);
        }
        localStorage.favs = JSON.stringify(favourites);
    }
}

function showFavs() {
    if (JSON.parse(localStorage.getItem("favs")).length > 0) {
        var path = "accordion.jsp?fav=";
        var fav = JSON.parse(localStorage.getItem("favs"));
        for (var i = 0; i < fav.length; i++) {
            path = path + fav[i] + ',';
        }
        $("#all").load(path);
    } else {
        document.getElementById("all").innerHTML = "<br><p class=\"text-center\">Nie posiadasz ulubionych!</p>";
    }
    setFavs();
}

function showAll() {
    $("#all").load("accordion.jsp");
    setFavs();
}

function setFavs() {
    if (localStorage.getItem("favs") === null) {
        localStorage.setItem("favs", "[]");
    } else {
        var favourites = JSON.parse(localStorage.favs);
        for (var i = 0; i < favourites.length; i++) {
            document.getElementById(favourites[i]).classList.toggle('star-clicked');
        }
    }
}
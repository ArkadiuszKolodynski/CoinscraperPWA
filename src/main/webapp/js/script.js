$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip({
        trigger : 'hover'
    });
    
    if (localStorage.getItem("favs") === null) {
        localStorage.setItem("favs", "[]");
    } else {
        var favourites = JSON.parse(localStorage.favs);
        for (var i = 0; i < favourites.length; i++) {
            document.getElementById(favourites[i]).classList.toggle('star-clicked');
        }
    }
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
    if (localStorage.getItem("favs") === null || localStorage.favs === "[]") {
        document.getElementById("fav").innerHTML = "<br><p class=\"text-center\">Nie posiadasz ulubionych!</p>";
    } else {
        var favourites = JSON.parse(localStorage.favs);
        for (var i = 0; i < favourites.length; i++) {
            var e = document.getElementById(favourites[i].replace("star",""));
//            alert(e.toLocaleString());
            var fav = document.getElementById("fav");
            fav.innerHTML = "<br>";
            fav.appendChild(document.createElement("div"));
            fav.appendChild(e);
//            document.getElementById("fav").
        }
        //document.getElementById("fav").innerHTML = "<br><p>Posiadasz ulubione!</p>";
    }
}

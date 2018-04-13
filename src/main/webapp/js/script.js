$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip({
        trigger : 'hover'
    });
    
    setFavs();
});

$(".icon-bell, .icon-star").click(function(evt) {
    evt.preventDefault();
});

function setFavs() {
    if (localStorage.getItem("favs") === null) {
        localStorage.setItem("favs", "[]");
    } else {
        var favourites = JSON.parse(localStorage.favs);
        for (var i = 0; i < favourites.length; i++) {
            if (document.getElementById(favourites[i]) !== null) {
                document.getElementById(favourites[i]).classList.toggle('star-clicked');
            } else {
                alert(localStorage.favs);
                if (i !== -1) {
                    favourites.splice(i, 1);
                }
                localStorage.favs = JSON.stringify(favourites);
                alert(localStorage.favs);
            }
        }
    }
}

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
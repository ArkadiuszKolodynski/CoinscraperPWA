$(document).ready(function() {
    localStorage.allCurrencies = document.getElementById("accordion").innerHTML;
    setFavs();
    setTooltip();
    preventScroll();;
    
    if ('serviceWorker' in navigator) {
        navigator.serviceWorker
            .register('service-worker.js')
            .then(function() { console.log('Service Worker Registered'); });
    }
});

function setFavs() {
    if (localStorage.getItem("favs") === null) {
        localStorage.setItem("favs", "[]");
    } else {
        var favourites = JSON.parse(localStorage.favs),
                i = favourites.length;
        while (i--) {
            if (document.getElementById(favourites[i]) !== null) {
                document.getElementById(favourites[i]).classList.add("star-clicked");
                $("#" + $.escapeSelector(favourites[i])).parent().attr("title", "Usuń z ulubionych");
            } else {
                favourites.splice(i, 1);
                localStorage.favs = JSON.stringify(favourites);
            }
        }
    }
}

function toggleFav(elementId) {
    document.getElementById(elementId).classList.toggle("star-clicked");
    if ($("#" + $.escapeSelector(elementId)).parent().attr("data-original-title") === "Dodaj do ulubionych") {
        $("#" + $.escapeSelector(elementId)).parent().attr("data-original-title", "Usuń z ulubionych");
    } else {
        $("#" + $.escapeSelector(elementId)).parent().attr("data-original-title", "Dodaj do ulubionych");
    }
    
    var favourites = JSON.parse(localStorage.favs);
    if (!favourites.includes(elementId)) {
        favourites.push(elementId);
        localStorage.favs = JSON.stringify(favourites);
    } else {
        var index = favourites.indexOf(elementId);
        if (index !== -1) {
            favourites.splice(index, 1);
        }
        localStorage.favs = JSON.stringify(favourites);
    }
}

function showFavs() {
    if (localStorage.favs !== "[]") {
        var node = document.createElement("DIV"),
                favourites = JSON.parse(localStorage.favs);
        for (var i = 0; i < favourites.length; i++) {
            node.append(document.getElementById(favourites[i].replace("star", "")));
        }
        document.getElementById("accordion").innerHTML = node.innerHTML;
    } else {
        var element = document.getElementById("accordion");
        element.classList.add("text-center");
        element.innerHTML = "Nie posiadasz ulubionych!";
    }
    
    setTooltip();
    preventScroll();
}

function showAll() {
    var element = document.getElementById("accordion");
    element.classList.remove("text-center");
    element.innerHTML = localStorage.allCurrencies;
    setFavs();
    setTooltip();
    preventScroll();
}

function preventScroll() {
    $("a").click(function(evt) {
        evt.preventDefault();
    });
}

function setTooltip() {
    $('[data-toggle="tooltip"]').tooltip({
        trigger : "hover"
    });
}

function displayChart(elementId) {
    $("#containerForChart" + elementId).load("chart?id=" + elementId);
    document.getElementById(elementId).scrollIntoView();
}

function updateData()
{ 
    $("#accordion").load(window.location.href + " #accordion");
}

setInterval(updateData, 30000);
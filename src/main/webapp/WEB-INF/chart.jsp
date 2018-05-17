<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@page contentType="text/html" pageEncoding="UTF-8"%>
<canvas id="chart<%= request.getParameter("id")%>" height="300" width="300"></canvas>
<script>
    var config = {
        type: 'line',
        maintainAspectRatio: false,
        data: {
            datasets: [{
                    label: 'Kurs <%= request.getParameter("id")%> w $',
                    borderColor: '#007bff',
                    steppedLine: 'default',
                    backgroundColor: 'rgba(0, 123, 255, 0.2)',
                    fill: 'origin',
                    data: [<c:forEach var="currency" items="${values}">
                        {
                            x: new Date('${currency.getDate()}'),
                            y: ${currency.getAvgPrice()}
                        },</c:forEach>
                    ]
                }]
        },
        options: {
            responsive: true,
//            title: {
//                display: true,
//                text: 'Zmiana średniego kursu <%= request.getParameter("id")%> w ostatnich 24h'
//            },
            scales: {
                xAxes: [{
                        display: true,
                        type: 'time',
                        time: {
                            displayFormats: {
                                hour: 'HH:mm',
                                minute: 'HH:mm',
                                second: 'HH:mm:ss'
                            }
                        },
                        ticks: {
                            major: {
                                fontStyle: 'bold'
                            }
                        }
                    }],
                yAxes: [{
                        display: true,
                        ticks: {
                            // Include a dollar sign in the ticks
                            callback: function (value, index, values) {
                                return value + '$';
                            }
                        }
                    }]
            }
        }
    };

    var ctx = document.getElementById('chart<%= request.getParameter("id")%>').getContext('2d');
    window.myLine = new Chart(ctx, config);
</script>

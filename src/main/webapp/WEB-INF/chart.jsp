<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/moment.min.js"></script>
        <script src="js/Chart.min.js"></script>
    </head>
    <body>
        <canvas id="chart<%= request.getParameter("id") %>"></canvas>
        <script>
            var color = Chart.helpers.color;
            var config = {
                type: 'line',
                data: {
                    datasets: [{
                            label: 'Dataset with string point data',
                            borderColor: '#007bff',
                            steppedLine: 'after',
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
                    title: {
                        display: true,
                        text: 'Chart.js Time Point Data'
                    },
                    scales: {
                        xAxes: [{
                                display: true,
                                type: 'time',
                                time: {
                                    displayFormats: {
                                        hour: 'HH:mm'
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

            window.onload = function () {
                var ctx = document.getElementById('chart<%= request.getParameter("id") %>').getContext('2d');
                window.myLine = new Chart(ctx, config);
            };
        </script>
    </body>
</html>

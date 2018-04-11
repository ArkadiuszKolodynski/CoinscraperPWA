<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%><%
    String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String connectionUrl = "jdbc:sqlserver://currenciesdb.cat8w0eapj1d.eu-central-1.rds.amazonaws.com\\currenciesdb:1433";
    String userid = "WebScrapper";
    String password = "";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>                     <br><div id="accordion"><%
    try {
        connection = DriverManager.getConnection(connectionUrl, userid, password);
        statement = connection.createStatement();
        String sql;
        String params = request.getParameter("fav");
        if (params != null) {
            params = params.replaceAll("star", "");
            params = params.substring(0, params.length() - 1);
            params = params.replaceAll(",", "' or Symbol='");
            sql = "select * from Currencies where Symbol='" + params + "';";
        } else {
            sql = "select * from [Currencies].[dbo].[Currencies]";
        }
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
                        <div id="<%=resultSet.getString("symbol")%>" class="card">
                            <div class="card-header">
                                <a href="#" class="my-icons" data-toggle="tooltip" title="Dodaj do ulubionych"><i id="star<%=resultSet.getString("symbol")%>" class="far fa-star" onclick="toggleFav(this.id)"></i></a>
                                <a href="#" class="my-icons" data-toggle="tooltip" title="Ustaw alarm"><i id="bell1" class="far fa-bell"></i></a>
                                <a class="card-link" data-toggle="collapse" href="#collapse<%=resultSet.getString("symbol")%>">
                                    <tr>
                                        <td><%=resultSet.getString("Symbol")%></td>
                                        <td><%=resultSet.getString("Name")%></td>
                                        <!--<td><img src="<%=resultSet.getString("logo")%>" /></td>-->
                                    </tr>
                                </a>
                            </div>
                            <div id="collapse<%=resultSet.getString("symbol")%>" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                </div>
                            </div>
                        </div><%
        }
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</div><br>
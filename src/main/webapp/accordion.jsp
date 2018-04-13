<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%><%
    String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String connectionUrl = "jdbc:sqlserver://currenciesdb.cat8w0eapj1d.eu-central-1.rds.amazonaws.com\\currenciesdb:1433";
    String userid = "WebScrapper";
    String password = "";
    int iterator = 1;
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
        sql = "select top 100 * from [Currencies].[dbo].[Currencies]";
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
                        <div id="<%=resultSet.getString("symbol")%>" class="card">
                            <div class="card-header">
                                <a href="#" class="my-icons" data-toggle="tooltip" title="Dodaj do ulubionych"><span id="star<%=resultSet.getString("symbol")%>" class="icon-star" onclick="toggleFav(this.id)"></span></a>
                                <a href="#" class="my-icons" data-toggle="tooltip" title="Ustaw alarm"><span id="bell<%=resultSet.getString("symbol")%>" class="icon-bell"></span></a>
                                <a class="card-link" data-toggle="collapse" href="#collapse<%=resultSet.getString("symbol")%>">
                                    <table>
                                        <tr>
                                            <td><%=iterator++%>.</td>
                                            <td><%=resultSet.getString("Symbol")%></td>
                                            <td><%=resultSet.getString("Name")%></td>
                                            <!--<td><img src="<%//=resultSet.getString("logo")%>" /></td>-->
                                        </tr>
                                    </table>
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
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String driver = "org.mariadb.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://192.168.56.1:3306/";
    String database = "waluty";
    String userid = "mysql";
    String password = "";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<!DOCTYPE html>
<div id="accordion">
    <%
        try {
            connection = DriverManager.getConnection(connectionUrl + database, userid, password);
            statement = connection.createStatement();
            String sql = "select * from users";
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
    %>
    <div id="1" class="card">
        <div class="card-header">
            <a href="#" class="my-icons" data-toggle="tooltip" title="Dodaj do ulubionych"><i id="star1" class="far fa-star" onclick="toggleFav(this.id)"></i></a>
            <a href="#" class="my-icons" data-toggle="tooltip" title="Ustaw alarm"><i id="bell1" class="far fa-bell"></i></a>
            <a class="card-link" data-toggle="collapse" href="#collapseOne">
                <tr>
                    <td><%=resultSet.getString("symbol")%></td>
                    <td><%=resultSet.getString("nazwa")%></td>
                    <td><%=resultSet.getInt("kurs")%></td>
                </tr>
            </a>
        </div>
        <div id="collapseOne" class="collapse" data-parent="#accordion">
            <div class="card-body">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
            </div>
        </div>
    </div>
    <%
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</div>
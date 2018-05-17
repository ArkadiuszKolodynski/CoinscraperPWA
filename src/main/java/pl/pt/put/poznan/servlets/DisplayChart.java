package pl.pt.put.poznan.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import pl.pt.put.poznan.classes.GraphValues;

public class DisplayChart extends HttpServlet {

    @Resource(name = "jdbc/SQL-Server")
    private DataSource dataSource;
    private final String SQL_QUERY;
    private final List<GraphValues> values;

    public DisplayChart() {
        SQL_QUERY = "SELECT * FROM GraphValues WHERE Symbol LIKE ?";
        values = new ArrayList<>();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            try (Connection connection = dataSource.getConnection()) {
                PreparedStatement statement = connection.prepareStatement(SQL_QUERY);
                statement.setString(1, request.getParameter("id"));
                ResultSet resultSet = statement.executeQuery();
                
                while (resultSet.next()) {
                    values.add(new GraphValues(
                            resultSet.getString("Symbol"),
                            resultSet.getDouble("AveragePrice"),
                            resultSet.getTimestamp("Date")
                    ));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DisplayChart.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("values", values);
        request.getRequestDispatcher("/WEB-INF/chart.jsp").forward(request, response);
        values.clear();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

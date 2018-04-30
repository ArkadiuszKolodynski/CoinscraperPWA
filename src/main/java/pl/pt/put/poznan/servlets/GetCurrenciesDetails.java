package pl.pt.put.poznan.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import pl.pt.put.poznan.classes.Currency;

public class GetCurrenciesDetails extends HttpServlet {
    
    @Resource(name="jdbc/SQL-Server")
    private DataSource dataSource;
    private final String SQL_QUERY;
    private final ArrayList<Currency> currenciesList;

    public GetCurrenciesDetails() {
        this.SQL_QUERY = "SELECT * FROM Currencies LIMIT 100";
        this.currenciesList = new ArrayList<>();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try (Connection connection = dataSource.getConnection(); Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(SQL_QUERY)) {
                while (resultSet.next()) {
                    currenciesList.add(new Currency(resultSet.getString("symbol"), resultSet.getString("name")));
                }
                connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GetCurrenciesDetails.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("list", currenciesList);
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
        currenciesList.clear();
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
        return "GetCurrenciesServlet";
    }
}

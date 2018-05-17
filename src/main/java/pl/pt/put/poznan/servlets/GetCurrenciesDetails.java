package pl.pt.put.poznan.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
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
import pl.pt.put.poznan.classes.Currency;

public class GetCurrenciesDetails extends HttpServlet {

    @Resource(name = "jdbc/SQL-Server")
    private DataSource dataSource;
    private final String SQL_QUERY;
    private final List<Currency> currenciesList;

    public GetCurrenciesDetails() {
        this.SQL_QUERY = "SELECT * FROM TopCurrencies ORDER BY AveragePriceInDollars DESC";
        this.currenciesList = new ArrayList<>();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection connection = dataSource.getConnection(); Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(SQL_QUERY)) {
            while (resultSet.next()) {
                DecimalFormat df = new DecimalFormat("0.#");
                df.setMaximumFractionDigits(8);
                currenciesList.add(new Currency(
                        resultSet.getString("Symbol"),
                        resultSet.getString("Name"),
                        resultSet.getDouble("AveragePriceInDollars"),
                        resultSet.getDouble("MinPriceInDollars"),
                        df.format(resultSet.getDouble("AveragePriceInBitcoin")).replace(",", "."),
                        resultSet.getString("MinPriceMarketName")
                ));
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

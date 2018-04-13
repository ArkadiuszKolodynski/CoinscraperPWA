package pl.pt.put.poznan.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pl.pt.put.poznan.classes.Currency;

public class GetCurrencies extends HttpServlet {
    @SuppressWarnings("null")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = "jdbc:sqlserver://currenciesdb.cat8w0eapj1d.eu-central-1.rds.amazonaws.com\\currenciesdb:1433";
        String user = "WebScrapper";
        String password = "";     
        
        Connection conn = null;
        Statement st;
        ResultSet rs;
        ArrayList<Currency> currenciesList = new ArrayList<>();
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url, user, password);
            st = conn.createStatement();
            String sql = "select top 100 * from [Currencies].[dbo].[Currencies] ORDER BY newid()";
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Currency c = new Currency(rs.getString("symbol"), rs.getString("name"));
                currenciesList.add(c);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(GetCurrencies.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    Logger.getLogger(GetCurrencies.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        }
        
        request.setAttribute("list", currenciesList);
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
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

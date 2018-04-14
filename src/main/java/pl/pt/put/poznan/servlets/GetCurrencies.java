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
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import pl.pt.put.poznan.classes.Currency;

public class GetCurrencies extends HttpServlet {
    @Resource(name="jdbc/SQL-Server")
    private DataSource dataSource;
    
    @SuppressWarnings("null")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = null;
        Statement st;
        ResultSet rs;
        ArrayList<Currency> currenciesList = new ArrayList<>();
   
        try {
            conn = dataSource.getConnection();
            st = conn.createStatement();
            String sql = "select top 100 * from [Currencies].[dbo].[Currencies] ORDER BY newid()";
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Currency c = new Currency(rs.getString("symbol"), rs.getString("name"));
                currenciesList.add(c);
            }
        } catch (SQLException e) {
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

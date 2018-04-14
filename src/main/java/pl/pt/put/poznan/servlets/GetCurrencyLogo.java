package pl.pt.put.poznan.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet(name = "GetCurrencyLogo", urlPatterns = {"/logo"})
public class GetCurrencyLogo extends HttpServlet {

    @Resource(name="jdbc/SQL-Server")
    private DataSource dataSource;
    private static final String SQL_QUERY = "SELECT logo FROM [Currencies].[dbo].[Currencies] WHERE Symbol = ?";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String imageName = request.getParameter("id");

        try (Connection connection = dataSource.getConnection(); PreparedStatement statement = connection.prepareStatement(SQL_QUERY)) {
            statement.setString(1, imageName);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    byte[] content = resultSet.getBytes("logo");
                    response.setContentType(getServletContext().getMimeType(imageName));
                    response.setContentLength(content.length);
                    response.getOutputStream().write(content);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(GetCurrencyLogo.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        return "Loading logos from database";
    }
}

package pl.pt.put.poznan.servlets;

import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SetCrawlerState extends HttpServlet {
    
    private Process p;
    private OutputStream pStdIn;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getParameter("action")) {
            case "start":
                if (!AdminPanel.isCrawlerRunning()) {
                    p = Runtime.getRuntime().exec("mvn -f ../Webscrapper exec:java");
                    pStdIn = p.getOutputStream();
                    request.setAttribute("message", "Trwa uruchamianie crawlera...");
                } else {
                    request.setAttribute("message", "Crawler już działa!");
                }
                break;
            case "restart":
                if (AdminPanel.isCrawlerRunning()) {
                    request.setAttribute("message", "Trwa restartowanie serwera...");
                } else {
                    request.setAttribute("message", "Crawler nie jest uruchomiony!");
                }
                break;
            case "stop":
                if (AdminPanel.isCrawlerRunning()) {
                    request.setAttribute("message", "Trwa zatrzymywanie crawlera...");
                    pStdIn.write("\n".getBytes());
                } else {
                    request.setAttribute("message", "Crawler nie jest uruchomiony!");
                }
                break;
            default:
                request.setAttribute("message", "Wystąpił błąd!");
        }
        request.getRequestDispatcher("WEB-INF/result.jsp").forward(request, response);
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
        return "Set crawler state";
    }

}

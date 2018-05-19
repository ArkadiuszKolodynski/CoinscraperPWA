package pl.pt.put.poznan.servlets;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SetCrawlerState extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getParameter("action")) {
            case "start":
                if (!AdminPanel.crawlerIsRunning()) {
                    Runtime.getRuntime().exec("screen -dmS coinscraper sudo ../Webscrapper/startup.sh");
                    request.setAttribute("message", "Trwa uruchamianie crawlera...");
                } else {
                    request.setAttribute("message", "Crawler już działa!");
                }
                break;
            case "restart":
                if (AdminPanel.crawlerIsRunning()) {
                    Process p = Runtime.getRuntime().exec("screen -S coinscraper -X stuff \"stop^M\"");
                    try {
                        p.waitFor();
                    } catch (InterruptedException ex) {
                        Logger.getLogger(SetCrawlerState.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    Runtime.getRuntime().exec("screen -dmS coinscraper sudo ../Webscrapper/startup.sh");
                    request.setAttribute("message", "Trwa restartowanie serwera...");
                } else {
                    request.setAttribute("message", "Crawler nie jest uruchomiony!");
                }
                break;
            case "stop":
                if (AdminPanel.crawlerIsRunning()) {
                    Runtime.getRuntime().exec("screen -S coinscraper -X stuff \"stop^M\"");
                    request.setAttribute("message", "Trwa zatrzymywanie crawlera...");
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

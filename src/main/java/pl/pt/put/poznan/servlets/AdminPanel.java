package pl.pt.put.poznan.servlets;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminPanel extends HttpServlet {

    private File file;
    private String password;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (null == request.getParameter("password")) {
            request.setAttribute("password", null);
        } else if (request.getParameter("password").equals(password)) {
//            request.getSession().setAttribute("password", "correct");
            request.setAttribute("password", "correct");
            if (crawlerIsRunning()) {
                request.setAttribute("running", true);
            } else {
                request.setAttribute("running", false);
            }
            request.setAttribute("totalSpace", humanReadableByteCount(file.getTotalSpace(), false));
            request.setAttribute("freeSpace", humanReadableByteCount(file.getFreeSpace(), false));
            int percentageFreeSpace = Math.round(file.getFreeSpace() * 100.0f / file.getTotalSpace());
            request.setAttribute("percentageFreeSpace", percentageFreeSpace);
            if (percentageFreeSpace >= 50) {
                request.getSession().setAttribute("color", "bg-success");
            } else if (percentageFreeSpace >= 15 && percentageFreeSpace < 50) {
                request.getSession().setAttribute("color", "bg-warning");
            } else {
                request.getSession().setAttribute("color", "bg-danger");
            }
        } else {
            request.setAttribute("password", "wrong");
        }
        request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
    }

    private String humanReadableByteCount(long bytes, boolean si) {
        int unit = si ? 1000 : 1024;
        if (bytes < unit) {
            return bytes + " B";
        }
        int exp = (int) (Math.log(bytes) / Math.log(unit));
        String pre = (si ? "kMGTPE" : "KMGTPE").charAt(exp - 1) + (si ? "" : "i");
        return String.format("%.1f %sB", bytes / Math.pow(unit, exp), pre);
    }

    public static boolean crawlerIsRunning() {
        try {
//            boolean os = System.getProperty("os.name").contains("Windows");
//            String line;
//            Process p = Runtime.getRuntime().exec(os ? "tasklist.exe" : "ps -e");
//            BufferedReader input =  new BufferedReader(new InputStreamReader(p.getInputStream()));
//            while ((line = input.readLine()) != null) {
//                if (line.contains(os ? "java.exe" : "java")) {
//                    String line2;
//                    Process p2 = Runtime.getRuntime().exec(
//                            os ? 
//                            "wmic process where processid=" + line.split("\\s+")[1] + " get commandline" :
//                            "cat /proc/" + line.split("\\s+")[0] + "/cmdline"
//                    );
//                    BufferedReader input2 = new BufferedReader(new InputStreamReader(p2.getInputStream()));
//                    while ((line2 = input2.readLine()) != null) {
////                        if (line2.contains("pl.pt.put.poznan.webscraper.Crawler")) {
//                        if (line2.contains("Webscrapper")) {
//                            return true;
//                        }
//                    }
//                }
//            }
            String line;
            Process p = Runtime.getRuntime().exec("screen -list");
            BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((line = input.readLine()) != null) {
                if (line.contains("coinscraper")) {
                    return true;
                }
            }
        } catch (IOException ex) {
            Logger.getLogger(AdminPanel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public void init() {
        this.file = new File("/");
        this.password = getInitParameter("password");
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
        return "Admin panel";
    }

}

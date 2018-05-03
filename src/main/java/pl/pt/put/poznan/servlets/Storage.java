package pl.pt.put.poznan.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Storage extends HttpServlet {

    private final File file = new File("/");
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Storage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Storage at " + request.getContextPath() + "</h1>");
            out.println("* Całkowita ilość miejsca na dysku: " + humanReadableByteCount(file.getTotalSpace(), false) + "<br>");
            out.println("* Ilość wolnego miejsca na dysku: " + humanReadableByteCount(file.getFreeSpace(), false) + "<br>");
            out.println("* Procentowa ilość wolnego miesjca na dyksu: " + Math.round(file.getFreeSpace()*100.0f/file.getTotalSpace()) + "%");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    public static String humanReadableByteCount(long bytes, boolean si)
    {
        int unit = si ? 1000 : 1024;
        if (bytes < unit) return bytes + " B";
        int exp = (int) (Math.log(bytes) / Math.log(unit));
        String pre = (si ? "kMGTPE" : "KMGTPE").charAt(exp-1) + (si ? "" : "i");
        return String.format("%.1f %sB", bytes / Math.pow(unit, exp), pre);
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

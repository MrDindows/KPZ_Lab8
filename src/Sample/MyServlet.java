package Sample;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class MyServlet extends javax.servlet.http.HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws javax.servlet.ServletException, IOException
    {

    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws IOException, ServletException
    {
        if (request.getParameter("A1")==null ||
                request.getParameter("B1")==null ||
                request.getParameter("C1")==null ||
                request.getParameter("A2")==null ||
                request.getParameter("B2")==null ||
                request.getParameter("C2")==null)
        {
            request.getRequestDispatcher("calculate.jsp").forward(request, response);
            return;
        }
        double A1, B1, C1, A2, B2, C2;
        try {
            A1 = Double.parseDouble(request.getParameter("A1"));
            B1 = Double.parseDouble(request.getParameter("B1"));
            C1 = Double.parseDouble(request.getParameter("C1"));
            A2 = Double.parseDouble(request.getParameter("A2"));
            B2 = Double.parseDouble(request.getParameter("B2"));
            C2 = Double.parseDouble(request.getParameter("C2"));
        } catch (Exception e) {
            request.setAttribute("error", true);
            request.getRequestDispatcher("calculate.jsp").forward(request, response);
            return;
        }

        if (A1 == 0 && A2 == 0){
            if (B1 == 0 || B2 == 0){
                request.setAttribute("error", true);
            } else if (C1/B1 == C2/B2) {
                request.setAttribute("match", true);
            } else {
                request.setAttribute("parallel", true);
            }
        } else {
            B1 *= A2; C1 *= A2;
            B2 *= A1; C2 *= A1;

            if (B2 == B1) {
                if (C2 == C1) {
                    request.setAttribute("match", true);
                } else {
                    request.setAttribute("parallel", true);
                }
            } else {
                double Y = (C1 - C2) / (B2 - B1);
                double X = (A1==0)?(-C2-B2*Y)/A2:(-C1-B1*Y)/A1;
                request.setAttribute("X", X);
                request.setAttribute("Y", Y);
            }
        }
        request.getRequestDispatcher("calculate.jsp").forward(request, response);
    }
}

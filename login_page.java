import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login_page extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        int flag=0;
        if(email.equals("admin") & pass.equals("admin"))
        {
            RequestDispatcher rd=request.getRequestDispatcher("Admin_Home.jsp");
            rd.forward(request, response);
        }
        else
        {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elearning","root","");
                Statement smt=con.createStatement();
                ResultSet rs=smt.executeQuery("select * from user");
                while(rs.next())
                {
                    if(rs.getString(4).equals(email) & rs.getString(5).equals(pass)){
                        
                        RequestDispatcher rd=request.getRequestDispatcher("User_page.jsp");
                        rd.forward(request, response);
                        flag=1;
                        HttpSession hs=request.getSession();
                        hs.setAttribute("UID", rs.getInt(1)+"");
                        hs.setAttribute("name", rs.getString(2));
                    }
                }
                if(flag!=1)
                {
                    out.print("<html><heead><script>");
                    out.print("window.alert('Enter the valid username and password');");
                    out.print("</script></head></html>");
                }
            } catch (SQLException | NullPointerException | ClassNotFoundException ex) {
                Logger.getLogger(login_page.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

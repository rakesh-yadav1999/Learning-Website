import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class check extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id=0;
        HttpSession hs=request.getSession();
        id=Integer.parseInt((String)hs.getAttribute("UID"));
        int a=0;
        String lang="";
        PrintWriter out=response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        String submit=request.getParameter("Submit");
        if(submit.equals("Submit C")){
            try {
                lang="c";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elearning","root","");
                Statement smt1=con.createStatement();
                ResultSet rs1=smt1.executeQuery("select * from test where language='c' ORDER BY ID desc limit 0,5");
                while(rs1.next()){
                    if(request.getParameter("First").equals(rs1.getString(7)) )
                        a++;
                    else if(request.getParameter("Second").equals(rs1.getString(7)))
                        a++;
                    else if(request.getParameter("Third").equals(rs1.getString(7)))
                        a++;
                    else if(request.getParameter("Forth").equals(rs1.getString(7)))
                        a++;
                    else if(request.getParameter("Five").equals(rs1.getString(7)))
                        a++;
                }
                out.print("<html><heead><script>");
                out.print("window.alert(" + a + ");");
                out.print("</script></head></html>");
                
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(check.class.getName()).log(Level.SEVERE, null, ex);
            } 
        }
        else if(submit.equals("Submit C++")){
            try {
                lang="c++";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elearning","root","");
                Statement smt1=con.createStatement();
                ResultSet rs1=smt1.executeQuery("select * from test where language='c++' ORDER BY ID desc limit 0,5");
                while(rs1.next()){
                    if(request.getParameter("First").equals(rs1.getString(7)) )
                        a++;
                     else if(request.getParameter("Second").equals(rs1.getString(7)))
                        a++;
                    else if(request.getParameter("Third").equals(rs1.getString(7)))
                        a++;
                    else if(request.getParameter("Forth").equals(rs1.getString(7)))
                        a++;
                    else if(request.getParameter("Five").equals(rs1.getString(7)))
                        a++;
                }
                out.print("<html><heead><script>");
                out.print("window.alert(" + a + ");");
                out.print("</script></head></html>");
                
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(check.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else if(submit.equals("Submit Java")){
            try {
                lang="java";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elearning","root","");
                Statement smt1=con.createStatement();
                ResultSet rs1=smt1.executeQuery("select * from test where language='java' ORDER BY ID desc limit 0,5");
                while(rs1.next()){
                    if(request.getParameter("First").equals(rs1.getString(7)) )
                        a++;
                     else if(request.getParameter("Second").equals(rs1.getString(7)))
                        a++;
                    else if(request.getParameter("Third").equals(rs1.getString(7)))
                        a++;
                    else if(request.getParameter("Forth").equals(rs1.getString(7)))
                        a++;
                    else if(request.getParameter("Five").equals(rs1.getString(7)))
                        a++;
                }
                out.print("<html><heead><script>");
                out.print("window.alert(" + a + ");");
                out.print("</script></head></html>");
                
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(check.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elearning","root","");
            PreparedStatement ps=con.prepareStatement("insert into marks values(?,?,?)");
            ps.setInt(1, id);
            ps.setInt(2, a);
            ps.setString(3, lang);
            ps.execute();
        }catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(check.class.getName()).log(Level.SEVERE, null, ex);
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

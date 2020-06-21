import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Email extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, AddressException, MessagingException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String pass="";
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elearning","root","");
        PreparedStatement ps=con.prepareStatement("select password from user where email=?");
        ps.setString(1, request.getParameter("email"));
        ResultSet rs=ps.executeQuery();
        while(rs.next())
            pass=rs.getString(1);
    
        if(pass=="")
        {
            out.print("<html><heead><script>");
            out.print("window.alert('You are not authorized');");
            out.print("</script></head></html>");
        }
        else{
        String host="smtp.gmail.com";
        String user="Localhost";
        String Pass="rakesh123";
        String SSL_FACTORY="javax.net.ssl.SSLSocketFactory";
        String to=request.getParameter("email");
        String from="yadavrikesh12@gmail.com";
        String subject="Passwork recovery program";
        String message=pass;
        boolean sessioDebug=true;
        
        Properties props=System.getProperties();
        props.put("mail.host", host);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp", "true");
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.socketFactory.fallback", "false");
        props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
        
        Session mailSession=Session.getDefaultInstance(props, null);
        mailSession.setDebug(sessioDebug);
        
        Message msg=new MimeMessage(mailSession);
        msg.setFrom(new InternetAddress(from));
        InternetAddress[] address={new InternetAddress(to)};
        msg.setRecipients(Message.RecipientType.TO, address);
        msg.setSubject(subject);
        msg.setContent(message, "Text/html");
       
        Transport transport=mailSession.getTransport("smtp");
        transport.connect(host,user,Pass);
        out.print("<html><heead><script>");
        out.print("window.alert('mail sent successfully');");
        out.print("</script></head></html>");
        transport.sendMessage(msg, msg.getAllRecipients());
        transport.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (MessagingException | ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (MessagingException | ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

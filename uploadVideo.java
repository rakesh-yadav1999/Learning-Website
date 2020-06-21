import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig
public class uploadVideo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("multipart/form-data");
 PrintWriter out = response.getWriter();
 String language=request.getParameter("subject");
 String path="D:\\my projects\\E Learning\\E Learning\\web\\videos";
 Part filePart=request.getPart("path");
 String filename=filePart.getSubmittedFileName();
 OutputStream os=null;
 InputStream is=null;
    switch (language) {
        case "C":
            path+="\\c";
            break;
        case "C++":
            path+="\\cpp";
            break;
        default:
            path+="\\java";
            break;
    }
try {
 os=new FileOutputStream(new File(path+File.separator+filename));
 is=filePart.getInputStream();
 int read=0;

 while ((read = is.read()) != -1) {
 os.write(read);
 }
 out.print("<html><heead><script>");
            out.print("window.alert('Video Uploaded successfully');");
            out.print("</script></head></html>");
 }
 catch(FileNotFoundException e){out.print(e);}
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
    }// </editor-fold>

}

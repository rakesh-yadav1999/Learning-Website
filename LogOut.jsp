<%-- 
    Document   : LogOut
    Created on : 1 Apr, 2020, 4:41:32 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    HttpSession hs=request.getSession();
    hs.setAttribute("name", null);
    hs.setAttribute("UID", null);
    
    RequestDispatcher rd= request.getRequestDispatcher("User_page.jsp");
    rd.forward(request, response);
%>

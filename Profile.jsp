<%-- 
    Document   : Profile
    Created on : 10 Mar, 2020, 8:00:33 PM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    HttpSession hs=request.getSession();
    String name=(String)hs.getAttribute("name");
    if(name==null){
        RequestDispatcher rd=request.getRequestDispatcher("login-page.html");
        rd.forward(request, response); 
    }
    ResultSet rs=null;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elearning","root","");
        Statement smt=con.createStatement();
        rs = smt.executeQuery("select * from user where UID="+hs.getAttribute("UID"));
        while(rs.next())
        {
            
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="author" content="rakesh yadav">
        <meta name="description" content="this is a e Learning site">
        <meta name="keywords" content="e=learning=sites,c language,c++ langage,jva language,prohramming sites"> 
    
        <title>Profile Page</title>

        <!--Font Awesome Links-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" crossorigin="anonymous" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/main.css"/>
        
        <style>
            div h1{
                padding: 10px;
            }
            table{
    margin: 30px auto;
    font-size: 1.4em;
    text-align: center;
    border-collapse: collapse;
    font-family: 'Times New Roman', Times, serif;
    border-radius: 5px 5px 0 0;
    overflow: hidden;
}
table tr{
    border: 1px solid black;
}
table td{
    padding: 10px;
    border: 1px solid black;
}
table th{
    border: 1px solid black;
    color: white;
    padding: 10px;
    background-color: rgb(25, 189, 25);
}
table tr:nth-of-type(even){
    background: lightblue;
}
            </style>
    </head>
    <body>
        <header id="header">
            <div class="container">
                <div id="branding">
                    <h1><i class="fas fa-code"></i> CodeTuts</h1>
                </div>
                <nav id="menu">
                    <ul>
                        <li><a href="User_page.jsp"><i class="fas fa-home"></i> Home</a></li>
                        <li><a href="Lecture_Videos.jsp"><i class="fas fa-video"></i> Videos</a></li>
                        <li><a href="compiler.jsp"><i class="fas fa-file-code"></i> Run Code</a></li>
                        <li><a href="User_Feedback.jsp"><i class="far fa-comment-alt"></i> Feedback</a></li>
                        <li><a href="Test.jsp"><i class="fas fa-vial"></i> Test</a></li>
                        <% if(name!="Guest User"){ %>
                            <li><a href="LogOut.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i> Log Out</a></li>
                        <% } %>
                    </ul>
                </nav>
                <div id="user-info">
                    <p style="color:#1e446b; font-weight:bold; font-family:cursive; font-size:1.5rem;"><i class="fas fa-user"></i> <%=name %></p>
                </div>
            </div>
        </header>
                    
                    <div style="border: 2px solid black; width: 60%; margin: 10px auto;">
                        <h1>User ID : <%=rs.getInt(1) %></h1>
                        <h1>User Name : <%=rs.getString(2) %></h1>
                        <h1>User Mobile no.: <%=rs.getBigDecimal(3) %></h1>
                        <h1>User Email : <%=rs.getString(4) %></h1>
                        <% 
                            }
}   catch(Exception e){}
                        %>
<% 
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elearning","root","");
        Statement smt=con.createStatement();
        ResultSet rs1 = smt.executeQuery("select * from marks where UID="+hs.getAttribute("UID")); 
%>
                        <table>
            <tHead>
            <tr>
                <th>User ID</th>
                <th>Marks</th>
                <th>Language</th>
            </tr>
            </tHead>
            <tbody>
                <% while(rs1.next()){ %>
            <tr>
                <td><%=rs1.getInt(1)%></td>
                <td><%=rs1.getInt(2)%></td>
                <td><%=rs1.getString(3)%></td>
            </tr>
            <% } } catch(Exception e){} %>
            </tbody>
        </table>
        </div>
    </body>
</html>

<%-- 
    Document   : Admin_Home
    Created on : 13 Nov, 2019, 1:41:37 PM
    Author     : HP
--%>
<%! int a=0; %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elearning","root","");
    Statement smt=con.createStatement();
    ResultSet rs=smt.executeQuery("select * from feedback");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Feedback Page</title>
        <link href="css/table.css" rel="stylesheet"/>
        <script type="text/javascript" src="JavaScript/slide.js"></script>
    </head>
    <body>
        <header>
            <div class="container">
                <div id="div1">
	<button id="but1" onclick="slideup()">&times;</button>
	<nav id="navbar">
		<ul>
			<li><a href="Admin_Home.jsp">Home</a></li>
			<hr><li><a href="Video.html">Upload Video</a></li>
			<hr><li><a href="Test.html">Upload Test</a></li>
			<hr><li><a href="Feedback.jsp">View Feedback</a></li>
			<hr><li><a href="Delete.html">Delete user</a></li>
		</ul>
	</nav>
                </div>
                <div id="button"><button id="but" onclick="slide()">&#9776</button></div>
                <div id="branding">
                    <h1>Users Feedback</h1>
                </div>
            </div>
        </header>
        <h1>USER FEEDBACK TABLE</h1>
        <table>
            <tHead>
            <tr>
                <th>User ID</th>
                <th>Feedback</th>
            </tr>
            </tHead>
            <tbody>
                <% while(rs.next()){ a++;%>
            <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
            </tr>
            <% } %>
            </tbody>
        </table>
            <p> The Number Of Feedback is :<%=a %><% a=0; %></p>
    </body>
</html>

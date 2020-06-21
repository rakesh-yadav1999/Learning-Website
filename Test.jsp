<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.String"%>
<%@page import="java.io.File"%>
<%  
    HttpSession hs=request.getSession();
    String name=(String)hs.getAttribute("name");
    String ID=(String)hs.getAttribute("UID");
    if(name==null)
        name="Guest User";
    
    String s[]={"First","Second","Third","Forth","Five"};
    int a=0;
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elearning","root","");
    Statement smt1=con.createStatement();
    ResultSet rs1=smt1.executeQuery("select * from test where language='c' ORDER BY ID desc limit 0,5");
    
    Statement smt2=con.createStatement();
    ResultSet rs2=smt2.executeQuery("select * from test where language='c++'ORDER BY ID desc limit 0,5");
    
    Statement smt3=con.createStatement();
    ResultSet rs3=smt3.executeQuery("select * from test where language='java' ORDER BY ID desc limit 0,5");
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="author" content="rakesh yadav">
        <meta name="description" content="this is a e Learning site">
        <meta name="keywords" content="e=learning=sites,c language,c++ langage,jva language,prohramming sites"> 
    
        <title>Test Page</title>
        
        <script type="text/javascript" src="JavaScript/User_Page.js"></script>

        <!--Font Awesome Links-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/main.css"/>
        <style>
            #languages{
                width: 20%;
                height: auto;
                border-right: 5px solid #1e446b;
                padding-right: 10px;
                background-color: #549de6;
            }
            #languages h1{
                padding: 10px;
                color: white;
            }
            #work{
                display: flex;
            }
        </style>
    </head>

    <body>

        <!--
            ---------------------------------------------------------------------------------------------------------
            Header
            ---------------------------------------------------------------------------------------------------------
        -->
        
        <header id="header">
            <div class="container">
                <div id="branding">
                    <h1><i class="fas fa-code"></i> CodeTuts</h1>
                </div>
                <nav id="menu">
                    <ul>
                        <li><a href="User_page.jsp"><i class="fas fa-home"></i> Home</a></li>
                        <li><a href="Profile.jsp"><i class="far fa-user-circle"></i> Profile</a></li>
                        <li><a href="compiler.jsp"><i class="fas fa-file-code"></i> Run Code</a></li>
                        <li><a href="User_Feedback.jsp"><i class="far fa-comment-alt"></i> Feedback</a></li>
                        <li><a href="Lecture_Videos.jsp"><i class="fas fa-video"></i> Videos</a></li>
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
<div id="work">
        <div id="languages">
            <H1 id="c" onclick="cshow()"> C</H1>
            <h1 id="c+" onclick="cpshow()"> C++</h1>
            <h1 id="java" onclick="jshow()"> JAVA</h1>
        </div>
    
        <div id="test">
            <div style="padding: 10px;" id="cbook">
                <% a=0; %>
                <form action="check" method="post">
                <% while(rs1.next()){ %>
                <div style="padding: 10px;"> 
                    <p><%=rs1.getString(2) %></p>
                    <input type="radio" name="<%=s[a] %>" value="<%=rs1.getString(3) %>"><%=rs1.getString(3) %><br/>
                    <input type="radio" name="<%=s[a] %>" value="<%=rs1.getString(4) %>"><%=rs1.getString(4) %><br/>
                    <input type="radio" name="<%=s[a] %>" value="<%=rs1.getString(5) %>"><%=rs1.getString(5) %><br/>
                    <input type="radio" name="<%=s[a] %>" value="<%=rs1.getString(6) %>"><%=rs1.getString(6) %><br/>
                    <% a++; %>
                </div>
                <% }%>
                <input type="submit" value="Submit C" name="Submit" style="border: none; background: blue;color: white;height: 50px;font-size: 20px;">
                </form>
            </div>
                
                <div style="padding: 10px; display: none;" id="cpbook">
                <% a=0; %>
                <form action="check" method="post">
                <% while(rs2.next()){ %>
                <div style="padding: 10px;"> 
                    <p><%=rs2.getString(2) %></p>
                    <input type="radio" name="<%=s[a] %>" value="<%=rs2.getString(3) %>"><%=rs2.getString(3) %><br/>
                    <input type="radio" name="<%=s[a] %>" value="<%=rs2.getString(4) %>"><%=rs2.getString(4) %><br/>
                    <input type="radio" name="<%=s[a] %>" value="<%=rs2.getString(5) %>"><%=rs2.getString(5) %><br/>
                    <input type="radio" name="<%=s[a] %>" value="<%=rs2.getString(6) %>"><%=rs2.getString(6) %><br/>
                    <% a++; %>
                </div>
                <% } %>
                <input type="submit" value="Submit C++" name="Submit" style="border: none; background: blue;color: white;height: 50px;font-size: 20px;">
                </form>
            </div>
                
                <div style="padding: 10px;display: none;" id="jbook">
                <% a=0; %>
                <form action="check" method="post">
                <% while(rs3.next()){ %>
                <div style="padding: 10px;"> 
                    <p><%=rs3.getString(2) %></p>
                    <input type="radio" name="<%=s[a] %>" value="<%=rs3.getString(3) %>"><%=rs3.getString(3) %><br/>
                    <input type="radio" name="<%=s[a] %>" value="<%=rs3.getString(4) %>"><%=rs3.getString(4) %><br/>
                    <input type="radio" name="<%=s[a] %>" value="<%=rs3.getString(5) %>"><%=rs3.getString(5) %><br/>
                    <input type="radio" name="<%=s[a] %>" value="<%=rs3.getString(6) %>"><%=rs3.getString(6) %><br/>
                    <% a++; %>
                </div>
                <% }%>
                <input type="submit" value="Submit Java" name="Submit" style="border: none; background: blue;color: white;height: 50px;font-size: 20px;">
                </form>
            </div>
        </div>
        </div>
    </body>
</html>   
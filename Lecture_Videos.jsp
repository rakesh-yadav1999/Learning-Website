<%@page import="java.lang.String"%>
<%@page import="java.io.File"%>
<% 
    
    File f=new File("D:/my projects/E Learning/E Learning/web/videos/c");
    String[] file=f.list();
    
    
    File f2=new File("D:/my projects/E Learning/E Learning/web/videos/cpp");
    String[] file2=f2.list();
    
    
    File f3=new File("D:/my projects/E Learning/E Learning/web/videos/java");
    String[] file3=f3.list();
    
    HttpSession hs=request.getSession();
    String name=(String)hs.getAttribute("name");
    String ID=(String)hs.getAttribute("UID");
    if(name==null)
        name="Guest User";
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
    
        <title>Video Page</title>
        
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
<div id="work">
        <div id="languages">
            <H1 id="c" onclick="cshow()"> C</H1>
            <h1 id="c+" onclick="cpshow()"> C++</h1>
            <h1 id="java" onclick="jshow()"> JAVA</h1>
        </div>
        <div id="videos">
            <div>
                <div id="cbook">
                <% for(String s:file){ %>
                <div style="display: flex; padding: 10px;">
                    <video src="./videos/c/<%=s %>" height="200px" width="300px" controls>
                    </video>
                        <p style="padding-left: 10px;"><%=s %></p>
                </div>
                <% } %>
                </div>
                
                <div id="cpbook" style="display: none;">
                <% for(String s:file2){ %>
                <div style="display: flex; padding: 10px;">
                    <video src="./videos/cpp/<%=s %>" height="200px" width="300px" controls>
                    </video>
                        <p style="padding-left: 10px;"><%=s %></p>
                </div>
                <% } %>
                </div>
                
                <div id="jbook" style="display: none;">
                <% for(String s:file3){ %>
                <div style="display: flex; padding: 10px;">
                    <video src="./videos/java/<%=s %>" height="200px" width="300px" controls>
                    </video>
                        <p style="padding-left: 10px;"><%=s %></p>
                </div>
                <% } %>
                </div>
                
            </div>
        </div>
        </div>
    </body>
</html>   
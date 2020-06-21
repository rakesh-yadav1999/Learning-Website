<% 
    HttpSession hs=request.getSession();
    String name=(String)hs.getAttribute("name");
    String ID=(String)hs.getAttribute("UID");
    if(name==null)
        name="Guest User";
%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="author" content="rakesh yadav">
        <meta name="description" content="this is a e Learning site">
        <meta name="keywords" content="e=learning=sites,c language,c++ langage,jva language,prohramming sites"> 
    
        <title>Compiler Page</title>

        <!--Font Awesome Links-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" crossorigin="anonymous" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/main.css"/>
        
        <style>
            #submit{
                background: blue;
                margin: 10px;
                color: white;
                height: 40px;
                border: none;
                font-size: 20px;
            }
        </style>
        <script>
            function test(){
            var code = document.getElementById("input").value;
            window.location.reload("https://www.onlinegdb.com/online_c_compiler");
            document.getElementsById("editor_1").value = code;
        }
        </script>
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
                        <li><a href="Profile.jsp"><i class="far fa-user-circle"></i> Profile</a></li>
                        <li><a href="Lecture_Videos.jsp"><i class="fas fa-video"></i> Videos</a></li>
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
                    
                    <div style="margin: 10px 10px; display: flex; height: 500px;">
                        <textarea placeholder="Enter the Code" name="input" cols="112" rows="20" id="input" autofocus></textarea>
                        <button type="submit" id="submit" onclick="test()"> Run </button>
                        <textarea placeholder="Output" name="output" cols="112" rows="20" id="output" autofocus></textarea>
        </div>
    </body>
</html>
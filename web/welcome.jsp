<%-- 
    Document   : welcome
    Created on : Jun 26, 2017, 12:22:07 PM
    Author     : AshishAashu
--%>

<%@page import="bean.LoginBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!int flag=0;%>
<!DOCTYPE html>
<%
  /*Cookie[] ck=request.getCookies();  
  for(Cookie c:ck){
      if(c.getName().equals("user")){
          if(c.getValue().equals("p")){
              flag=1;
              break;
          }
      }
  }*/
  if(LoginBean.getLin()==null){
      response.sendRedirect("errorpage.jsp");
  }
  else{
%>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <title>Welcome:Admin</title>
        <style>
            #logout:hover{
                background: #ffcc33;
            }
            .ul{
                list-style-type: none;
                display:block;
            }
            .ul li{
                display:block;
                float:left;
                font-family: cursive;
                font-kerning: normal;
                margin:0px 10px 0px 10px;
                padding:2px 5px 2px 5px;
            }
            .ul li:hover{
                cursor: default;
                background: #E217CC;
                color:white;
                font-family: cursive;
            }
            .content{
                display:block;
                margin-top:20px;
            }
            
        </style>
        <script src="jquery-3.2.1.min.js"></script>
        <script>
            function call(x){
                $("#makerdiv").css('position','inherit');
                $('#content').html("<img src='loading.gif'/>");
                if(x=='AD'){
                    $.get("AddDept.jsp",function(data){
                        $('#content').html(data);
                    });                    
                }
                if(x=='AT'){
                    $.get("Addteacher.jsp",function(data){
                        $('#content').html(data);
                    });                    
                }
                if(x=='AC'){
                    $.get("Addcourse.jsp",function(data){
                        $('#content').html(data);
                    });                    
                }
                if(x=='VD'){
                    $.get("ViewDept.jsp",function(data){
                        $('#content').html(data);
                    });
                }
                if(x=='VT'){
                    $.get("ViewTeacher.jsp",function(data){
                        $('#content').html(data);
                    });
                }
                if(x=='VC'){
                    $.get("viewcourse.jsp",function(data){
                        $('#content').html(data);
                    });
                }
                if(x=='AR'){
                    $.get("room.jsp",function(data){
                        $('#content').html(data);
                    });
                }
                if(x=='GT'){
                    $.get("FinalTimeTable",function(data){
                        $('#content').html(data);
                    });
                }
                if(x=='VR'){
                    $.get("viewclassroom.jsp",function(data){
                        $('#content').html(data);
                    });
                }
                
            }
        </script>
    </head>
    <body class="container-fluid">
    <center>
        <div style="display:inline-block;" class="panel panel-body">
            <nav class="nav navbar-nav">
                <ul class="ul">
                    <li onclick="call('AD')">Add Department</li>
                    <li onclick="call('AT');">Add Teacher</li>
                    <li onclick="call('AC');">Add Course</li>
                    <li onclick="call('AR');">Add Room</li>
                    <li onclick="call('VD');">View Department</li>
                    <li onclick="call('VT');">View Teacher</li>
                    <li onclick="call('VC');">View Course</li>
                    <li onclick="call('VR');">View Room</li>
                    <li onclick="call('GT');">Get Table</li>
                    <a href="logout.jsp" text-decoration="none"><li style="color: red;" id="logout">Logout</li></a>
                </ul>
                
            </nav>
        </div>
    
    
        <div id="content" class="container-fluid">
            
            
        </div>
    </center> 
    
    <div style="position: absolute;bottom: 0;" class="container-fluid" id="makerdiv">
        <p class="text-danger" >By - <span class="text-primary">Ashish Kumar Kaushal , 2<sup>nd</sup> MCA , Sr.No. : 611/15</span></p>
    </div>
    </body>
</html>
 <%}%>
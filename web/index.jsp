<%@page import="bean.LoginBean"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! int flag=0;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/animate.min.css">
        <title>Time Table:Login</title>
    </head>
    <body>
    <center>
        <%
            try{
                if(request.getParameter("sub").equals("login")&&!request.getParameter("id").equals(null)&&!request.getParameter("pass").equals(null)){
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con=DriverManager.getConnection("jdbc:oracle:thin://@localhost:1521:XE","ashish","ashish");
                    Statement st=con.createStatement();
                    String sql="select * from R_USER where id="+request.getParameter("id")+" and pass="+request.getParameter("pass");
                    ResultSet rs=st.executeQuery(sql);
                    if(rs.next()){
                       flag=1;
                    }
                    else{
                        flag=2;
                    }
                }
                else 
                    flag=0;
            }catch(Exception e){System.out.println(e);}    
        %>
        <%
            if(flag==1)
            {
                /*Cookie ck=new Cookie("user","p");
                response.addCookie(ck);*/
                LoginBean.setLin("p");
                flag=0;
                response.sendRedirect("welcome.jsp");
            }
            else if(flag==2){
                out.println("<h2 style='color:red;'>Login Fail....!!! Plz try again.</h2>");
            }
            %>
       <div class="container-fluid" >
           <div class="page-header">
               <h2 class="animated flipInY"><font face="verdana" color="#E74C3C">Time Table Management</font></h2>
               <h3 class="text-capitalize text-danger">Please <strong class="text-success"><u>Login</u></strong> here :</h3>
           </div>
        <div class="row container-fluid">
            <form action="" class="form-horizontal" method="post">
                <div class="form-group">
                    <label for="id" class="col-lg-4 control-label text-right text-danger">User Id :</label>
                    <div class="col-lg-4">
                        <input type="text" placeholder="Enter User Id" class="form-control" name="id" required/>
                    </div>    
                </div>  
                
                <div class="form-group">
                    <label for="pass" class="col-lg-4 control-label text-right text-danger">Password :</label>
                    <div class="col-lg-4">
                        <input type="password" placeholder="Enter Password" class="form-control" name="pass" required/>
                    </div>
                </div>   
                <div class="form-group">
                    <div class="col-lg-4 col-lg-offset-4">
                        <input type="submit" value="login" class="btn btn-success" name="sub"/>
                    </div>    
                </div>
            </form>
        </div>
       </div>  
       
    </center> 
    <div style="position: fixed;bottom: 0;" class="container-fluid">
        <p class="text-danger">By - <span class="text-primary">Ashish Kumar Kaushal , 2<sup>nd</sup> MCA , Sr.No. : 611/15</span></p>
    </div>
    </body>
</html>

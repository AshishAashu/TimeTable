<%-- 
    Document   : logout
    Created on : Jul 24, 2017, 4:05:39 PM
    Author     : AshishAashu
--%>

<%@page import="bean.LoginBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    session.invalidate();
%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
        <script>
            window.onload=function(){
                alert("Logout Successful...");
            };
        </script>
    </head>
         <%
            /*Cookie[] ck=request.getCookies();
            for(int i=0;i<ck.length;i++){
                if(ck[i].getName().equals("user")){
                    ck[i].setValue("");
                    ck[i].setMaxAge(0);
                    break;
                }
            }*/
            LoginBean.setLin(null);
            response.sendRedirect("index.jsp");
        %>  
</html>

<%-- 
    Document   : viewclassroom
    Created on : Jul 25, 2017, 9:15:16 AM
    Author     : AshishAashu
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Use.EsConnection" %>
<style>
    table tr th{
        color:red;
    }
</style>
<div class="table-responsive">
    <table class="table table-striped"  cellspacing="0" cellpadding="5px" width="90%">
        <thead>
        <tr>
            <th class="text-center"><u>Room Id</u> </th>
            <th class="text-center"><u>Room Dept.</u> </th>
            <th class="text-center"><u>Alloted For</u></th>
        </tr>
        </thead>
        <tbody>
<%! Connection con;%>
<%
    try{
        con=EsConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select distinct * from room");
        while(rs.next()){
%>    
        <tr>
            <td align="center"><%=rs.getString(1)%></td>
            <td align="center"><%=rs.getString(2)%></td>
            <td align="center"><%=rs.getString(3)%></td>
        </tr>
        <%
            }
        } 
        catch(Exception e){System.out.println(e);}
        %>   
        </tbody>
    </table>    
</div>


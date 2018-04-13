<%-- 
    Document   : ViewTeacher
    Created on : Jul 9, 2017, 5:39:01 PM
    Author     : AshishAashu
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Use.EsConnection" %>
<style>
    table tr th{
        color:red;
    }
</style>
<div class="table-responsive">
    <table class="table table-striped" cellspacing="0" cellpadding="5px" width="90%">
        <thead>
        <tr>
            <th class="text-center"><u>Teacher Id</u></th>
            <th class="text-center"><u>Teacher Name</u> </th>
            <th class="text-center"><u>Teacher Dept</u> </th>
            <th class="text-center"><u>Teacher Address</u> </th>
            <th class="text-center"><u>Total Assign Classes</u> </th>    
        </tr>
        </thead>
        <tbody>
<%! Connection con;%>
<%
    try{
        con=EsConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select distinct * from teacher");
        while(rs.next()){
%>    
        <tr>
            <td align="center"><%=rs.getString(1)%></td>
            <td align="center"><%=rs.getString(2)%></td>
            <td align="center"><%=rs.getString(3)%></td>
            <td align="center"><%=rs.getString(4)%></td>
            <td align="center"><%=rs.getString(6)%></td>
        </tr>
        <%
            }
        } 
        catch(Exception e){System.out.println(e);}
        %> 
        </tbody>
    </table>    
</div>
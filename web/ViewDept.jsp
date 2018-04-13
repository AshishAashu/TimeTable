<%-- 
    Document   : ViewDept
    Created on : Jul 27, 2017, 12:47:25 PM
    Author     : AshishAashu
--%>

<%@page import="Use.EsConnection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    table tr th{
        color:red;
    }
</style>
<div class="table-responsive" >
    <table class="table table-striped" cellspacing="0" cellpadding="5px" >
        <thead>
        <tr>
            <th class="text-center"><u>Department Name</u></th>   
        </tr>
        </thead>
        <tbody>
<%! Connection con;%>
<%
    try{
        con=EsConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from department");
        while(rs.next()){
%>    
        <tr>
            <td align="center"><%=rs.getString(1)%></td>
        </tr>
        <%
            }
        } 
        catch(Exception e){System.out.println(e);}
        %> 
        </tbody>
    </table>    
</div>

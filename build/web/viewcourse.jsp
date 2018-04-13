<%-- 
    Document   : viewcourse
    Created on : Jul 9, 2017, 11:41:30 PM
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
    <table class="table table-striped" cellspacing="0" cellpadding="5px" width="90%">
        <thead>
        <tr>
            <th class="text-justify"><u>Course Id</u></th>
            <th class="text-center"><u>Course Name</u> </th>
            <th class="text-center"><u>Branch Name</u></th>
            <th class="text-center"><u>Branch Year</u> </th>
            <th class="text-center"><u>Course Dept</u> </th>
            <th class="text-center"><u>Assign Teacher Id</u> </th>
            <th class="text-center"><u>Theory</u></th>
            <th class="text-center"><u>Practicals</u></th>
        </tr>
        </thead>
<%! Connection con;%>
<%
    try{
        con=EsConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select distinct * from course");
        while(rs.next()){
%>    
        <tr>
            <td align="center"><%=rs.getString(1)%></td>
            <td align="center"><%=rs.getString(2)%></td>
            <td align="center"><%=rs.getString(3)%></td>
            <td align="center"><%=rs.getString(4)%></td>
            <td align="center"><%=rs.getString(5)%></td>
            <td align="center"><%=rs.getString(6)%></td>
            <td align="center"><%=rs.getString(7)%></td>
            <td align="center"><%=rs.getString(8)%></td>
        </tr>
        <%
            }
        } 
        catch(Exception e){System.out.println(e);}
        %>    
    </table>    
</div>

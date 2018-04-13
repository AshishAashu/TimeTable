
<%@page import="java.util.ArrayList"%>
<%@page import="bean.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Use.*"%>
<%
    Bean bean1=(Bean)session.getAttribute("teacherbean");
              ArrayList<Teacher> teachers=bean1.getT();
              ArrayList<ClassRoom> classrooms=bean1.getC();
              ArrayList<Courses> courses=bean1.getA();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
        $("document").ready(function(){
           $("#savetable").click(function(){
             $.get("savetable",function(data){
               alert(data);  
             }); 
           });
        });
    </script>
    <style>
        
        table{
            width:100%;
        }
    </style>    
    <body>
    <center>
           
        <div>
            <%for(Courses c:courses){%>
            <hr>
            <h2 style="color:green;">Time Table<%=c.brid%></h2>
            <hr>
            
        <table border="1px solid black" cellspacing="0" cellpadding="5px">
            <%
              for(int m=0;m<6;m++){ 
            %>
            <tr>
            <%
                  for(int n=0;n<7;n++){              
            %>    
            <td ><%
                      if(c.coursetable[m][n]==null)
                          out.println("-----------");
                          else
                      out.println(c.coursetable[m][n]);%></td>             
            
            <%
                  }
              
            %>
        </tr>
              <%
              }
            
              
              %>
        </table>
        <%}%>
        <br>
        <hr>
        <h2 style="color: cadetblue;">Teacher Chart</h2>
        <hr>
        <br>
              <%
                for(Teacher teacher:teachers){
              %>
              <table border="1px solid black" cellspacing="0" cellpadding="5px">
                  <th colspan="7"><%out.println(teacher.getTid());%></th>
                 <% for(int i=0;i<6;i++){%>
                 <tr>
                     <%for(int j=0;j<7;j++){%>
                     <td>
                         <%
                         if(teacher.Teacherchart[i][j]==null){
                             out.println("-----------");
                             continue;
                         }    
                         
                            out.println(teacher.Teacherchart[i][j]);
                         %>
                     </td>                     
                     <%}%>
                 </tr> 
                 <%
                 }  
                 %>    
              </table>
              <hr>
              <br>
                 <%
                     }
                %>
                <br>
                <hr>
                <h2 style="color: violet;">ClassRoom Chart</h2>
                <hr>
                <br>
                <%
                for(ClassRoom classroom:classrooms){
              %>
              <table border="1px solid black" cellspacing="0" cellpadding="5px">
                  <th colspan="7"><%out.println(classroom.getRid());%></th>
                 <% for(int i=0;i<6;i++){%>
                 <tr>
                     <%for(int j=0;j<7;j++){%>
                     <td>
                         <%
                         if(classroom.classchart[i][j]==null){
                             out.println("-----------");
                             continue;
                         }    
                         
                            out.println(classroom.classchart[i][j]);
                         %>
                     </td>                     
                     <%}%>
                 </tr> 
                 <%
                 }  
                 %>    
              </table>
              <hr>
              <br>
                 <%
                     }
                %>
        </div>
        <div>
            <button style="width:100px;height:40px;font-size: 20px;background: wheat;" id="savetable">Save</button></a>
        </div>
    </center>
    </body>
</html>

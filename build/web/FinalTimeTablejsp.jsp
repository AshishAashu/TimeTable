
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
    
    <center>
           
        <div class="container">
            <%for(Courses c:courses){%>
            <div class="page-header">
                <h3 style="color:green;">Time Table : (<%= c.getBrname() %>,<%= c.getYear() %>)</h3>
            </div>
            <div class="table-responsive">   
        <table class="table table-bordered" cellspacing="0" cellpadding="5px">
            <%
              for(int m=0;m<6;m++){ 
            %>
            <tr>
            <%
                  for(int n=0;n<7;n++){              
            %>    
            <td width="13%"><%
                      if(c.coursetable[m][n]==null)
                          out.println("----------");
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
        <hr>
        <%}%>
        </div>
        
        <div class="page-header">
        <h2 style="color: cadetblue;"><u>Teacher Chart</u></h2>
        </div>
        <hr>
        <div class="table-responsive">
              <%
                for(Teacher teacher:teachers){
              %>
              <table class="table table-bordered" cellspacing="0" cellpadding="5px">
                  <th colspan="7" class="text-center"><span style="color:purple;"><%out.println(teacher.getTid());%></span></th>
                 <% for(int i=0;i<6;i++){%>
                 <tr>
                     <%for(int j=0;j<7;j++){%>
                     <td width="13%">
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
        </div>       
                
                
                <div class="page-header">
                <h2 style="color: violet;"><u>ClassRoom Chart</u></h2>
                </div>
                <hr>
                <div class="table-responsive">
                
                <%
                for(ClassRoom classroom:classrooms){
              %>
              <table  class="table table-bordered"cellspacing="0" cellpadding="5px">
                  <th colspan="7" class="text-center"><span style="color:purple;"><%out.println(classroom.getRid());%></span></th>
                 <% for(int i=0;i<6;i++){%>
                 <tr>
                     <%for(int j=0;j<7;j++){%>
                     <td width="13%">
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
        </div>
        <div>
            <button class="btn btn-danger btn-sm" id="savetable">Save</button><br><br>
        </div>
    </center>
    

<%-- 
    Document   : Addteacher
    Created on : Jun 26, 2017, 1:28:33 PM
    Author     : AshishAashu
--%>

<%@page import="java.sql.*"%>
<%@page import="Use.EsConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!Connection con;%>   
<script>
    $(document).ready(function(){
        $("#tid").focusout(function(){
            $.get("checkteachavail?tid="+$("#tid").val(),function(data){
                if(data==1){
                    $("#tid").val(null);
                    $("#tid").focus();
                    $("#addt").attr("disabled",true);
                    $("#msg").html("<h4 style='color:red;'>Entered teacher id Already Added....</h4>");
                }
                else{
                    $("#addt").attr("disabled",false);
                    $("#msg").html("");
                }
            });
            
        });
    });
</script>
<!DOCTYPE html>
<div class="page-header panel-danger">
    <h3 class="text-primary">Fill Form to add <strong class="text-success"><u>Teacher</u></strong> : </h3>
</div>
<div class="row">
<form action="/Time/addteacher" class="form-horizontal">
    <div class="form-group">
        <label for="tid" class="col-lg-4 control-label text-right text-info">Id : </label>
        <div class="col-lg-7">
            <input type="text" name="tid" placeholder="Enter Teacher id" id="tid" class="form-control" required/>
        </div>    
    </div>        
    <div class="form-group">
        <label for="tname" class="col-lg-4 control-label text-right text-info">    
            Name :
        </label>
        <div class="col-lg-7">
            <input type="text" name="tname" placeholder="Enter Teacher name" class="form-control" required/>
        </div>
    </div>    
    <div class="form-group">
        <label for="tdept" class="col-lg-4 control-label text-right text-info"> Department : </label>
        <div class="col-lg-7">
            <select id="dept" name="tdept" onchange="setTeacher();" class="form-control"><option value="null">--Select Department--</option>
                    <%
                        try{
                            con=EsConnection.getConnection();
                            Statement st=con.createStatement();
                            ResultSet rs=st.executeQuery("select distinct * from department");
                            while(rs.next()){
                                
                    %>
                    <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                    <%
                            }
                            con.close();
                        }catch(Exception e){}
                    %>
                </select>
                </div>    
    </div> 
    <div class="form-group">
            <label for="tadd" class="col-lg-4 control-label text-right text-info"> 
                Address : 
            </label>
        <div class="col-lg-7">
                <input type="text" name="tadd" placeholder="Enter Teacher Address" class="form-control" required/>
        </div>    
    </div> 
    
    <div class="form-group">
        
        <div class="col-lg-2 col-lg-offset-4">
            <input type="submit" value="Add Teacher" id="addt" class="btn btn-success" disabled/>
        </div>    
    </div> 
    
        <div id="msg" class="col-lg-7 col-lg-offset-4">
        </div>    
     
    
</form>
</div>

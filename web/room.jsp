<%-- 
    Document   : room
    Created on : Jul 9, 2017, 11:53:19 PM
    Author     : AshishAashu
--%>

<%@page import="java.sql.*"%>
<%@page import="Use.EsConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! Connection con;%>
<script>
    $(document).ready(function(){
        $("#rid").focusout(function(){
            $.get("checkroomavail?rid="+$("#rid").val(),function(data){
                if(data==1){
                    $("#rid").val(null);
                    $("#rid").focus();
                    $("#addr").attr("disabled",true);
                    $("#msg").html("<h4 style='color:red;'>Entered room id Already Added....</h4>");
                }
                else{
                    $("#addr").attr("disabled",false);
                    $("#msg").html("");
                }
            });
            
           
        });
    });
</script>
<div class="page page-header panel-warning">
    <h3 class="text-primary">Fill Form to add <strong class="text-success"><u>Room</u></strong> :</h3>
</div>  
<div class="row">
    <form action="addroom" class="form-horizontal">
    <div class="form-group">
        <label for="roomid" class="col-lg-4 control-label text-right text-info">Room Id :</label>
        <div class="col-lg-7" >
            <input type="text" name="roomid" placeholder="Enter Room id" id="rid" class="form-control" required/>
        </div>
    </div>
    <div class="form-group">
        <label for="rdept" class="col-lg-4 control-label text-right text-info">Department : </label>
        <div class="col-lg-7" >
            <select id="dept" name="rdept" class="form-control"><option value="null">--Select Department--</option>
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
        <label for="af" class="col-lg-4 control-label text-right text-info">
                Alloted For :
        </label>
        <div class="col-lg-7" class="form-control">
            <select name="af" class="form-control">
                <option value="T">Theory</option>
                <option value="P">Practical</option>
            </select>
        </div>
    </div>        
        
        
   <div class="form-group">
        <div class="col-lg-7 col-lg-offset-4">
            <input type="submit" value="Add Room" id="addr"class=" btn btn-success" disabled/>
        </div> 
   </div>    
        
    <div id="msg" class="col-lg-7 col-lg-offset-4"></div>
        
    </form>   
</div>              
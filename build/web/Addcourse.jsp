<script src="jquery-3.2.1.min.js"></script>
<script>
    $(document).ready(function(){
        
     $("#cid").focusout(function(){
            
            $.get("checkcourseavail?cid="+$("#cid").val(),function(data){
                if(data==1){
                    $("#cid").val(null);
                    $("#cid").focus();
                    $("#msg").html("<h4 style='color:red;'>Entered course id Already Added....</h4>");
                }
                else{
                    $("#msg").html("");
                }
            });
            
     });   
    });
    function setTeacher(){
        alert($("#dept").val());
        if($("#dept").val()==null)
            alert("Please select course");
        else{
            $.get("assignteacher.jsp?dept="+$("#dept").val(),function(data){
                $("#assignthr").html(data);
            });
        }
    }
    function enablebtn(){
        $("#adbtn").attr("disabled",false);
    }
</script> 

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Use.EsConnection" %>
<%! Connection con;%>
<div class="page page-header panel-success">
    <h3 class="text-primary">Fill Form to add <strong class="text-success"><u>Course</u></strong> : </h3>
</div>
<div class="row">
<form action="/Time/addcourse" class="form-horizontal">
    <div class="form-group">
        <label for="Cid" class="col-lg-4 control-label text-right text-info">Course Id : </label>
        <div class="col-lg-7">
            <input type="text" name="Cid" id="cid" placeholder="Enter Course id" class="form-control" required/>
        </div>    
    </div>
    <div class="form-group">
        <label for="Cid" class="col-lg-4 control-label text-right text-info">Course Name : </label>
        <div class="col-lg-7">
            <input type="text" name="Cname" placeholder="Enter Course name" class="form-control" required/>
        </div>
    </div>
    <div class="form-group">
        <label for="Cid" class="col-lg-4 control-label text-right text-info">Branch Name : </label>
        <div class="col-lg-7">
            <select name="brname" class="form-control" >
                <%
                        try{
                            con=EsConnection.getConnection();
                            Statement st=con.createStatement();
                            ResultSet rs=st.executeQuery("select distinct * from branch");
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
        <label for="Cid" class="col-lg-4 control-label text-right text-info">Year : </label>
        <div class="col-lg-7">
            <select name="Cy" class="form-control" >
                    <option>1<sup>st</sup></option>
                    <option>2<sup>nd</sup></option>
                    <option>3<sup>rd</sup></option>
                    <option>4<sup>th</sup></option>
            </select>
        </div>
        
    </div>
            
    <div class="form-group">
        <label for="Cid" class="col-lg-4 control-label text-right text-info">Department : </label>
        <div class="col-lg-7">
            <select id="dept" name="Cdept" onchange="setTeacher();" class="form-control" ><option value="null">--Select Department--</option>
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
        <label  class="col-lg-4 control-label text-right text-info">Assign Teacher : </label>
        <div class="col-lg-7" id="assignthr">
            <select class="form-control" ><option>--Select Teacher--</option></select>
        </div>
    </div>
    <div class="form-group">
        <label for="theory" class="col-lg-4 control-label text-right text-info">Theory Lec. : </label>
         <div class="col-lg-7">
             <input type="number" name="theory" placeholder="Enter Theories" class="form-control" required/>
         </div>
    </div>
    <div class="form-group">
        <label for="practicals" class="col-lg-4 control-label text-right text-info">Practicals : </label>
        <div class="col-lg-7">
            <input type="number" name="practicals" placeholder="Enter practicals" class="form-control" required/>
        </div>
    </div>
    <div class="form-group">
        <label for="branchid" class="col-lg-4 control-label text-right text-info">Branchid : </label>
        <div class="col-lg-7">
            <input type="text" name="branchid" placeholder="Enter Branch id" class="form-control" required/>
        </div>
    </div>
    <div class="form-group">
      
       <div class="col-lg-2 col-lg-offset-4">
           <input type="submit" value="Add Course"  id="adbtn" class="btn btn-success" disabled/>
       </div>
    </div>
    <div id="msg">
    </div>
                   
</form>
</div>
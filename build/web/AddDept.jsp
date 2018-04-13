<%-- 
    Document   : AddDept
    Created on : Jul 27, 2017, 12:10:44 PM
    Author     : AshishAashu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    $(document).ready(function(){
        $("#deptid").focusout(function(){
            $.get("checkdeptavail?deptid="+$("#deptid").val(),function(data){
                if(data==1){
                    $("#deptid").val(null);
                    $("#deptid").focus();
                    $("#adddept").attr("disabled",true);
                    $("#msg").html("<h4 style='color:red;'>Entered Department Already Added....</h4>");
                }
                else{
                    $("#msg").html("<h4 style='color:red;'>Entered Department Available....</h4>");
                    $("#adddept").attr("disabled",false);
                }
            });
            
        });
    });
</script>
<div class="page-header panel-danger">
    <h3 class="text-primary">Fill Form to add <strong class="text-success"><u>Department</u></strong> : </h3>
</div>
<div class="row">
<form action="/Time/adddept" class="form-horizontal">
    <div class="form-group">
        <label for="deptid" class="col-lg-4 control-label text-right text-info">Dept Name  : </label>
        <div class="col-lg-4">
            <input type="text" name="deptid" placeholder="Enter Department name" id="deptid" class="form-control" required/>
            
        </div> 
        <div id="msg" class="col-lg-7 col-lg-offset-2">
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-2 col-lg-offset-4">
            <input type="submit" value="Add department" id="adddept" class="btn btn-success" disabled style="display: inline-block;float: left;"/>
        </div>    
    </div> 
        
     
    
</form>
</div>

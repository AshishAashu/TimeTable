/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.ArrayList;
import java.lang.reflect.*;
import Use.CourseAssign;
public class Courses {
    public String[][] coursetable={{null,null,null,null,null,null,null},{null,null,null,null,null,null,null},{null,null,null,null,null,null,null},
        {null,null,null,null,null,null,null},{null,null,null,null,null,null,null},{null,null,null,null,null,null,null}}; 
    public String brname,year,brid;
    public Courses(String  brname,String year,String brid){
        this.brname=brname;
        this.brid=brid;
        this.year=year;
    }

    public String getBrname() {
        return brname;
    }

    public String getYear() {
        return year;
    }

    public String getBrid() {
        return brid;
    }
    
    
}

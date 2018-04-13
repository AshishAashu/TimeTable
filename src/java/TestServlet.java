/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Use.*;
import bean.Bean;
import bean.Courses;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AshishAashu
 */
@WebServlet(urlPatterns = {"/test"})
public class TestServlet extends HttpServlet {

    @Override
  protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //public static void main(String[] args){
        Statement st=null;
        ResultSet rs;
        String sql;
        CourseAssign c = null;
        Teacher t=null;
        ClassRoom classroom=null;
        ArrayList<String> depts=new ArrayList();
        Bean bean=new Bean(); 
        int index[]={0,1,4},index1=0,index2=0,s,i1,totaltheory=0,teacherindex=0,classindex=0;
        ArrayList<CourseAssign> a=new ArrayList<CourseAssign>();
        ArrayList<CourseAssign> ca=new ArrayList<CourseAssign>();
        ArrayList<Teacher> teachers=new ArrayList();
        ArrayList<ClassRoom> classrooms=new ArrayList<ClassRoom>();
        Courses course;
        ArrayList<Courses> courses=new ArrayList<Courses>();
        ArrayList<String> branchids=new ArrayList<String>();
        Connection con;
        for(int m=0;m<6;m++){
            for(int n=0;n<7;n++){
                FinalTable.ftable[m][n]=null;
            } 
        }
        try{
            con=EsConnection.getConnection();
            sql="select distinct branchid from course";
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
                branchids.add(rs.getString(1));
            }
            sql="select distinct dname from department";
            rs=st.executeQuery(sql);
            while(rs.next()){
                depts.add(rs.getString(1));
            }
        }catch(Exception e){}
        
        try{
            for(String d:depts){
                sql="select * from room where department='"+d+"'";
                rs=st.executeQuery(sql);
                while(rs.next()){
                    classrooms.add(new ClassRoom(rs.getString(1),rs.getString(2),rs.getString(3)));
                }
            }
        }catch(Exception e){}
        System.out.println("b:"+branchids.size());
        for(String brid:branchids){
            
        a.clear();
        try{
            con=EsConnection.getConnection();
            sql="select * from course where branchid='"+brid+"'";
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
                a.add(new CourseAssign(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
                        rs.getString(6),rs.getString(7),rs.getString(8)));
                
            }
        }catch(Exception e){}
        System.out.println("d:"+depts.size());
        
        course=new Courses(a.get(0).getBrname(),a.get(0).getYear(),brid);
        
        
        System.out.println("c:"+classrooms.size());
        /*for(ClassRoom cr:classrooms){
            
            System.out.println(cr.getRaf()+","+cr.getRdept()+","+cr.getRid());
        }*/
        
        System.out.println(a.size());   
        
        for(s=0;s<a.size();s++){
            c=a.get(s);
            totaltheory+=Integer.parseInt(c.getTh());
            if(teachers.isEmpty()){
                teachers.add(new Teacher(c.getCteach()));
            }
            else{
                int find=0;
                for(Teacher t1:teachers){
                    if(t1.getTid().equals(c.getCteach())){
                        find=1;
                        break;
                    }
                }
                if(find==0){
                    teachers.add(new Teacher(c.getCteach()));
                }
            }
                       
        }
        for(s=0;s<a.size();s++){
            c=a.get(s);
            int flag=0;
            if(Integer.parseInt(c.getPrt())>0){
            for(Teacher t1:teachers){
                if(t1.getTid().equals(c.getCteach())){
                    t=t1;
                    System.out.println(t.getTid()+","+c.getCteach());
                    break;
                    
                }
            }
            for(ClassRoom cr:classrooms){
                if(cr.getRaf().equals("P")&&cr.getRdept().equals(c.getCdept())){
                    classroom=cr;
                    break;
                }    
            }
            System.out.println(classrooms.size()+"=c,t:"+teachers.size());
                index2=index[(int)(3*Math.random())];
                index1=(int)(6*Math.random());
                while(flag==0){
                    
                    if(index1==5&&index2>3){
                        index2=index[(int)(3*Math.random())];
                        index1=(int)(6*Math.random());
                        continue;
                    }
                       
                    else if(t.Teacherchart[index1][index2]==null&&t.Teacherchart[index1][index2+1]==null&&
                            t.Teacherchart[index1][index2+2]==null&&classroom.classchart[index1][index2]==null
                            &&classroom.classchart[index1][index2+1]==null&&classroom.classchart[index1][index2+2]==null&&
                            course.coursetable[index1][index2]==null&&course.coursetable[index1][index2+1]==null&&
                            course.coursetable[index1][index2+2]==null){
                        
                        classroom.classchart[index1][index2]=c.getCname()+","+c.getBrname()+","+c.getCteach()+","+c.getYear()+","+"(Lab)";
                        classroom.classchart[index1][index2+1]="(Lab)";
                        classroom.classchart[index1][index2+2]="(Lab)";    
                        t.Teacherchart[index1][index2]=c.getBrname()+","+c.getYear()+","+c.getCname()+","+classroom.getRid();
                        t.Teacherchart[index1][index2+1]="(Lab)";
                        t.Teacherchart[index1][index2+2]="(Lab)";
                        course.coursetable[index1][index2]=c.getCname()+","+c.getCteach()+","+classroom.getRid()+","+"(Lab)";
                        course.coursetable[index1][index2+1]="(Lab)";
                        course.coursetable[index1][index2+2]="(Lab)";  
                           
                        flag=1;
                            
                    }
                            
                    else{
                        index2=index[(int)(3*Math.random())];
                        index1=(int)(6*Math.random());
                    }
                    
                }
            }
        }            
        while(!a.isEmpty()){
            c=a.get((int)(a.size()*Math.random()));
            if(c.getTh().equals("0")){
                a.remove(c);
                continue;
            }
            int flag=0;
            if(Integer.parseInt(c.getTh())>0){
                for(Teacher t1:teachers){
                    if(t1.getTid().equals(c.getCteach())){
                        t=t1;
                        //System.out.println(t.getTid()+","+c.getCteach());
                    }
                }
                /*for(ClassRoom cr:classrooms){
                    if(cr.getRaf().equals("T")&&cr.getRdept().equals(c.getCdept())){
                        classroom=cr;
                    }    
                }*/
                ClassRoom cr=classrooms.get((int)(classrooms.size()*Math.random()));
                while(flag==0){
                    if(cr.getRaf().equals("T")&&cr.getRdept().equals(c.getCdept())){
                        classroom=cr;
                        //System.out.println("g:"+cr.getRaf()+","+cr.getRdept()+","+c.getCdept());
                        flag=1;
                    }
                    else{
                        cr=classrooms.get((int)(classrooms.size()*Math.random()));
                    }
                }
            }
            else{
                continue;
            }
            flag=0;
            index2=(int)(7*Math.random());
            index1=(int)(6*Math.random());
            while(flag==0){
                if(index1==5&&index2>3){
                    index2=(int)(7*Math.random());
                    index1=(int)(6*Math.random());
                    continue;
                }
                        
                else if(t.Teacherchart[index1][index2]==null&&classroom.classchart[index1][index2]==null&&
                        course.coursetable[index1][index2]==null){
                    classroom.classchart[index1][index2]=c.getCname()+","+c.getBrname()+","+c.getCteach()+","+c.getYear();
                    t.Teacherchart[index1][index2]=c.getBrname()+","+c.getYear()+","+c.getCname()+","+classroom.getRid();
                    course.coursetable[index1][index2]=c.getCname()+",\n"+c.getCteach()+","+classroom.getRid()+"(Theory)";
                    flag=1;
                    c.setTh(""+(Integer.parseInt(c.getTh())-1));
                
                }
                else{
                    if(index2<6){
                        ++index2;
                    } 
                    else{
                        index2=(int)(7*Math.random());
                        index1=(int)(6*Math.random());
                    }
                }
             }
            
            }
        System.out.println(course);
            courses.add(course);
        }
        for(Courses c1:courses){
            System.out.println(c1.getBrid());
            for(int i=0;i<6;i++){
            for(int j=0;j<7;j++){
                System.out.print(courses.get(0).coursetable[i][j]+"     ");
            }
            System.out.printf("\n");
        }
        }
        
        /*for(int i=0;i<6;i++){
            for(int j=0;j<7;j++){
                System.out.print(courses.get(0).coursetable[i][j]+"     ");
            }
            System.out.printf("\n");
        }*/
        bean.setT(teachers);
        bean.setC(classrooms);
        bean.setA(courses);
        HttpSession session=req.getSession();
        session.setAttribute("teacherbean", bean);
        session.setAttribute("classbean", bean);
        session.setAttribute("coursesbean", bean);
        resp.sendRedirect("TestResult.jsp");
    }
    
}

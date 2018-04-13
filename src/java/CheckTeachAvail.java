/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Use.EsConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AshishAashu
 */
@WebServlet(urlPatterns = {"/checkteachavail"})
public class CheckTeachAvail extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int flag=0;
        Connection con;
        try{
            con=EsConnection.getConnection();
            Statement st=con.createStatement();
            String sql="select id from teacher";
            ResultSet rs=st.executeQuery(sql);
            while(rs.next()){
                if(rs.getString(1).equals(req.getParameter("tid"))){
                    flag=1;
                    break;
                }
                
            }
        }
        catch(Exception e){System.out.println(e);}
        PrintWriter pw=resp.getWriter();
        pw.println(flag);
    }
}

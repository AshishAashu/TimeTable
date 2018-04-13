/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Use.EsConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AshishAashu
 */
@WebServlet(urlPatterns = {"/adddept"})
public class AddDept extends HttpServlet {
     @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try{
        Connection con=EsConnection.getConnection();
        String sql="insert into department values (?)";
        PreparedStatement pst=con.prepareStatement(sql);
        pst.setString(1, req.getParameter("deptid"));
        pst.executeUpdate();
        pst.close();
        resp.sendRedirect("welcome.jsp");
        }catch(Exception e){} 
    }
}

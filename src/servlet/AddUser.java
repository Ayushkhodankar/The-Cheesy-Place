package servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.UserDao;
import model.User;


@WebServlet("/adduser")
public class AddUser extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		ServletContext context=getServletContext(); 
		String driver=context.getInitParameter("Driver");
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("name");
		String email=request.getParameter("email"); 
		String mobno=request.getParameter("mobno");
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass"); 
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("index.html");
		
		
			User u=new User(name, email, mobno, uname, pass);
			if(name.length()>1 && uname.length()>1 && email.length()>5 && (pass.length()>3 && pass.length()<7) && (mobno.length()>3 && mobno.length()<10))
			{
			try {
				
				int y=UserDao.insertUser(u,driver);
				
				if(y>0)
					{
					
					dispatcher.include(request, response);
				    
					}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
			else{
				
				dispatcher.include(request,response);
				out.print("<br/><br/><br/><p style='color:'red''>Sorry Re-Enter Your Details</p>");
				
			}
	}

}

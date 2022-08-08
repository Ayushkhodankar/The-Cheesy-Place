package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.UserDao;
import model.User;


@WebServlet("/login")
public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		ServletContext context=getServletContext(); 
		String driver=context.getInitParameter("Driver");
		
		String uname=request.getParameter("uname");
		String pass=request.getParameter("psw");
		
		User u=new User(uname, pass);

		try {
			if(UserDao.loginUser(u, driver,uname,pass))
			{
				
			       
				HttpSession session=request.getSession();  
				session.setAttribute("uname",uname);  
   
			    
		           response.sendRedirect("pizza.jsp");
			       
			       
			}
			if(uname.equals("admin")&& pass.equals("abc123"))
			{
				HttpSession session1=request.getSession();  
				session1.setAttribute("uname",uname);
		           response.sendRedirect("admin.jsp");
		           
		     
			}
			else
			{
				RequestDispatcher dispatcher=request.getRequestDispatcher("index.html");
				dispatcher.include(request,response);
				out.print("<br/><br/><br/><p style='color:'red''>sorry re-enter username password</p>");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

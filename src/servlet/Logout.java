package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			        response.setContentType("text/html");  
			        PrintWriter out=response.getWriter();  
			          
		         request.getRequestDispatcher("pizza.html").include(request, response);  
			          
		         /*   HttpSession session=request.getSession(false);  
		         session.invalidate();  
		         
		         HttpSession session1=request.getSession(false);  
		         session1.invalidate();					
				if(session1==null || session==null)
				{
					
				}*/

			
		         response.sendRedirect("index.html");

	}

}

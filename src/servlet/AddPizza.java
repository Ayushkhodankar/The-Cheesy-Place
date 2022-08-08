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

import controller.ProductDao;
import controller.UserDao;
import model.Pizza;

@WebServlet("/addpizza")
public class AddPizza extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ServletContext context=getServletContext(); 
		String driver=context.getInitParameter("Driver");
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String pizza_name=request.getParameter("pizza_name");
		String pizza_desc=request.getParameter("pizza_desc"); 
		String pizza_price=request.getParameter("pizza_price");
		
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("add-product.html");
		
		
			Pizza p=new Pizza(pizza_name, pizza_desc, pizza_price);
			
			try {
				
				int k=ProductDao.addPizza(p, driver);
				
				if(k>0)
					{
					
					dispatcher.include(request, response);
				    
					}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
			
	
	

}

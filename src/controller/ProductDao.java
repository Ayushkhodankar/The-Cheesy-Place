package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Pizza;
import model.User;

public class ProductDao {
	
	static Connection getConnection(String driver) throws ClassNotFoundException, SQLException
	{
	
	 
	Class.forName(driver);
	System.out.println("Driver Registered");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/cafedb","root","abc123");
	System.out.println("Connection successfully");
	return con;
	}
	
	public static int addPizza(Pizza p,String driver) throws ClassNotFoundException, SQLException
	{
	
	Connection con=UserDao.getConnection(driver);
	System.out.println("Conection Established Successfully");
	
	PreparedStatement ps=con.prepareStatement("insert into pizza_items(pizza_name, pizza_desc, pizza_price) values(?,?,?)");
	ps.setString(1,p.getPizza_name());
	ps.setString(2,p.getPizza_desc());
	ps.setString(3,p.getPizza_price());
	
	
	int k=ps.executeUpdate();

	con.close();
	
	return k;
	}

}

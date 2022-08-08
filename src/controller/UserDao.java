package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;

import com.mysql.cj.jdbc.Driver;

import model.User;

public class UserDao {

	static Connection getConnection(String driver) throws ClassNotFoundException, SQLException
	{
	
	 
	Class.forName(driver);
	System.out.println("Driver Registered");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/cafedb","root","abc123");
	System.out.println("Connection successfully");
	return con;
	}
	
	public static int insertUser(User u,String driver) throws ClassNotFoundException, SQLException
	{
	
	Connection con=UserDao.getConnection(driver);
	System.out.println("Conection Established Successfully");
	
	PreparedStatement ps=con.prepareStatement("insert into reg_user( name, email, mobno, uname, pass) values(?,?,?,?,?)");
	ps.setString(1,u.getName());
	ps.setString(2,u.getEmail());
	ps.setString(3,u.getMobno());
	ps.setString(4,u.getUname());
	ps.setString(5,u.getPass());
	
	int y=ps.executeUpdate();

	con.close();
	
	return y;
	}
	
	public static boolean loginUser(User u,String driver,String uname,String pass) throws ClassNotFoundException, SQLException
	{
		boolean status=false;
	Connection con=getConnection(driver);  
    PreparedStatement ps=con.prepareStatement("select * from reg_user where uname=? and pass=?");  
    ps.setString(1,u.getUname());  
    ps.setString(2,u.getPass());  
    
    ResultSet rs=ps.executeQuery();
    status=rs.next();
	return status;  
	}
	
	
}

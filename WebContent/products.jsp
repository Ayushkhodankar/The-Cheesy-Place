<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Products Page - Dashboard Template</title>
    <!--

    Template 2108 Dashboard

	http://www.tooplate.com/view/2108-dashboard

    -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/tooplate.css">
</head>

<body id="reportsPage" class="bg02">
    <div class="" id="home">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-xl navbar-light bg-light">
                        <a class="navbar-brand" href="admin.html">
                            <i class="fas fa-3x fa-tachometer-alt tm-site-icon"></i>
                            <h1 class="tm-site-title mb-0">Dashboard</h1>
                        </a>
                        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mx-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="admin.jsp">Dashboard
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                                <!-- <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                        Reports
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Daily Report</a>
                                        <a class="dropdown-item" href="#">Weekly Report</a>
                                        <a class="dropdown-item" href="#">Yearly Report</a>
                                    </div>
                                </li> -->
                                <li class="nav-item active">
                                    <a class="nav-link" href="#">Products</a>
                                </li>
                                 <li class="nav-item active">
                                <a class="nav-link" href="add-product.html">Add Products</a>
                            </li>

                                <!-- <li class="nav-item">
                                    <a class="nav-link" href="accounts.html">Accounts</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                        Settings
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Profile</a>
                                        <a class="dropdown-item" href="#">Billing</a>
                                        <a class="dropdown-item" href="#">Customize</a>
                                    </div>
                                </li> -->
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link d-flex" href="index.html">
                                        <i class="far fa-user mr-2 tm-logout-icon"></i>
                                        <span>Logout</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- row -->
         <!--    <div class="row tm-content-row tm-mt-big">
                <div class="col-xl-8 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        <div class="row">
                            <div class="col-md-8 col-sm-12">
                                <h2 class="tm-block-title d-inline-block">Products</h2>

                            </div>
                           <!--  <div class="col-md-4 col-sm-12 text-right">
                                <a href="add-product.html" class="btn btn-small btn-primary">Add New Product</a>
                            </div> -->
                        </div>
                         <%
String id = request.getParameter("id");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3307/";
String dbName = "cafedb";
String userId = "root";
String password = "abc123";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%> 
                        <div class="table-responsive">
                            <table class="table table-hover table-striped tm-table-striped-even mt-3" style="background: white;">
                                <thead>
                                    <tr class="tm-bg-gray">
                                        <th scope="col">ID No.</th>
                                        <th scope="col">Name</th>
                                        <th scope="col" class="text-center">Price</th>
                                        <th scope="col" class="text-center">Description</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                 <% try{ 
						connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
						statement=connection.createStatement();
						String sql ="SELECT * FROM pizza_items";

						resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
						%>
                                    <tr>
                                       <td class="tm-product-name"> <%=resultSet.getString("id") %></td>
                                        <td class="tm-product-name"> <%=resultSet.getString("pizza_name") %></td>
                                        <td class="text-center"><%=resultSet.getString("pizza_price") %></td>
                                        <td class="text-center"><%=resultSet.getString("pizza_desc") %></td>
                               
                                    </tr>
                                      <% 
						}

					} catch (Exception e) {
						e.printStackTrace();
						}
						%>
						
						 <div class="table-responsive">
                            <table class="table table-hover table-striped tm-table-striped-even mt-3" style="background: white;">
                                <thead>
                                    <tr class="tm-bg-gray">
                                        <th scope="col">ID No.</th>
                                        <th scope="col">Name</th>
                                        <th scope="col" class="text-center">Price</th>
                                        <th scope="col" class="text-center">Description</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                 <% try{ 
						connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
						statement=connection.createStatement();
						String sql ="SELECT * FROM pizza_items";

						resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
						%>
                                    <tr>
                                       <td class="tm-product-name"> <%=resultSet.getString("id") %></td>
                                        <td class="tm-product-name"> <%=resultSet.getString("pizza_name") %></td>
                                        <td class="text-center"><%=resultSet.getString("pizza_price") %></td>
                                        <td class="text-center"><%=resultSet.getString("pizza_desc") %></td>
                               
                                    </tr>
                                      <% 
						}

					} catch (Exception e) {
						e.printStackTrace();
						}
						%>
                                    
                                   
                                </tbody>
                            </table>
                        </div>

                       
                    </div>
                </div>

             
            </div>
            <footer class="row tm-mt-small">
                <div class="col-12 font-weight-light">
                    <p class="d-inline-block tm-bg-black text-white py-2 px-4">
                        Copyright &copy; 2018. Created by
                        <a href="http://www.tooplate.com" class="text-white tm-footer-link">Tooplate</a> |  Distributed by <a href="https://themewagon.com" class="text-white tm-footer-link">ThemeWagon</a>
                    </p>
                </div>
            </footer>
        </div>
    </div>
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
        $(function () {
            $('.tm-product-name').on('click', function () {
                window.location.href = "edit-product.html";
            });
        })
    </script>
</body>

</html>
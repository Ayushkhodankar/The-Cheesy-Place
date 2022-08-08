<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dashboard Admin Template by Tooplate.com</title>
    <!--

    Template 2108 Dashboard

	http://www.tooplate.com/view/2108-dashboard

    -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/fullcalendar.min.css">
    <!-- https://fullcalendar.io/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/tooplate.css">
    
    <style>
body {
  background-image: url('img/pizza.jpg');
  

}
</style>
</head>

<body id="reportsPage">
    <div class="" id="home">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-xl navbar-light bg-light">
                        <a class="navbar-brand" href="#">
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
                                    <a class="nav-link active" href="#">Dashboard
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                              
                                <li class="nav-item">
                                    <a class="nav-link" href="products.jsp">Products</a>
                                </li>
                                
                                 <li class="nav-item active">
                                <a class="nav-link" href="add-product.html">Add Products</a>
                            </li>

                               
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
            <div class="row tm-content-row tm-mt-big">
            
                <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                    <div class="card">
                      <div class="card-body text-center">
                        <h5 class="mb-2 text-dark font-weight-normal">Orders</h5>
                        <h2 class="mb-4 text-dark font-weight-bold">932.00</h2>
                        <div class="dashboard-progress dashboard-progress-1 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-lightbulb icon-md absolute-center text-dark"></i></div>
                        <p class="mt-4 mb-0">Completed</p>
                        <h3 class="mb-0 font-weight-bold mt-2 text-dark">5443</h3>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                    <div class="card">
                      <div class="card-body text-center">
                        <h5 class="mb-2 text-dark font-weight-normal">Registered Users</h5>
                        <h2 class="mb-4 text-dark font-weight-bold">756,00</h2>
                        <div class="dashboard-progress dashboard-progress-2 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-account-circle icon-md absolute-center text-dark"></i></div>
                        <p class="mt-4 mb-0">Increased since yesterday</p>
                        <h3 class="mb-0 font-weight-bold mt-2 text-dark">50%</h3>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3  col-lg-6 col-sm-6 grid-margin stretch-card">
                    <div class="card">
                      <div class="card-body text-center">
                        <h5 class="mb-2 text-dark font-weight-normal">Stocks Available</h5>
                        <h2 class="mb-4 text-dark font-weight-bold">100,38</h2>
                        <div class="dashboard-progress dashboard-progress-3 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-eye icon-md absolute-center text-dark"></i></div>
                        <p class="mt-4 mb-0">Increased since yesterday</p>
                        <h3 class="mb-0 font-weight-bold mt-2 text-dark">35%</h3>
                      </div>
                    </div>
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
                    <table class="table table-hover table-striped  mt-3"  style="background: white;">
                        <thead>
                            <tr class="tm-bg-gray">
                            <br><br>
                             
                                <th scope="col">Id No.</th>
                                <th scope="col"  >Name</th>
                                <th scope="col" >E-Mail</th>
                                <th scope="col" >Mobile No.</th>
                                <th scope="col" >UserName</th>
                                <th scope="col" >Password</th>
                              
                            </tr>
                        </thead>
                        
                        <tbody>
                      <% try{ 
						connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
						statement=connection.createStatement();
						String sql ="SELECT * FROM reg_user";

						resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
						%>
                            <tr>
                             
                        <td><%=resultSet.getString("id") %></td>
						<td><%=resultSet.getString("name") %></td>
						<td><%=resultSet.getString("email") %></td>
						<td><%=resultSet.getString("mobno") %></td>
						<td><%=resultSet.getString("uname") %></td>
						<td><%=resultSet.getString("pass") %></td>

                                
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
                <!-- <div class="tm-col tm-col-big">
                    <div class="bg-white tm-block h-100">
                        <h2 class="tm-block-title">Calendar</h2>
                        <div id="calendar"></div>
                        <div class="row mt-4">
                            <div class="col-12 text-right">
                                <a href="#" class="tm-link-black">View Schedules</a>
                            </div>
                        </div>

                    </div>
                </div> -->
                <!-- <div class="tm-col tm-col-small">
                    <div class="bg-white tm-block h-100">
                        <h2 class="tm-block-title">Upcoming Tasks</h2>
                        <ol class="tm-list-group">
                            <li class="tm-list-group-item">List of tasks</li>
                            <li class="tm-list-group-item">Lorem ipsum doloe</li>
                            <li class="tm-list-group-item">Read reports</li>
                            <li class="tm-list-group-item">Write email</li>
                            
                            <li class="tm-list-group-item">Call customers</li>
                            <li class="tm-list-group-item">Go to meeting</li>
                            <li class="tm-list-group-item">Weekly plan</li>
                            <li class="tm-list-group-item">Ask for feedback</li>
                            
                            <li class="tm-list-group-item">Meet Supervisor</li>
                            <li class="tm-list-group-item">Company trip</li>
                        </ol>
                    </div>
                </div> -->
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
    <script src="js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script src="js/utils.js"></script>
    <script src="js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="js/fullcalendar.min.js"></script>
    <!-- https://fullcalendar.io/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="js/tooplate-scripts.js"></script>
    <script>
        let ctxLine,
            ctxBar,
            ctxPie,
            optionsLine,
            optionsBar,
            optionsPie,
            configLine,
            configBar,
            configPie,
            lineChart;
        barChart, pieChart;
        // DOM is ready
        $(function () {
            updateChartOptions();
            drawLineChart(); // Line Chart
            drawBarChart(); // Bar Chart
            drawPieChart(); // Pie Chart
            drawCalendar(); // Calendar

            $(window).resize(function () {
                updateChartOptions();
                updateLineChart();
                updateBarChart();
                reloadPage();
            });
        })
    </script>
</body>
</html>
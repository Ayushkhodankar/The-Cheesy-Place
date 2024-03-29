<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<html>
<head>
<title>The Cheesy Place</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
<link rel="stylesheet" href="http://static.sasongsmat.nu/fonts/vegetarian.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">    


<script src="js/menu.js"></script>
<script type="text/javascript">



</script>
 
<style>
body, html {height: 100%}
body,h1,h2,h3,h4,h5,h6 {font-family: "Amatic SC", sans-serif}
.menu {display: none}
.bgimg {
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url("img/pizza.jpg");
  min-height: 90%;
}

.non-veg-indian-vegetarian:before {content: "\22a1";color:red;}
.veg-vegetarian:before {content: "\24cb";color:red;}
.vegetarianicon {font-family:"vegetarian";color:red;}
</style>

</head>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top w3-hide-small">
  <div class="w3-bar w3-xlarge w3-black w3-opacity w3-hover-opacity-off" id="myNavbar">
    <a href="#" class="w3-bar-item w3-button">HOME</a>
    <a href="#menu" class="w3-bar-item w3-button">MENU</a>
    <a href="#about" class="w3-bar-item w3-button">ABOUT</a>
    <a href="#myMap" class="w3-bar-item w3-button">CONTACT</a>
    <a href="checkout.jsp" class="w3-bar-item w3-button" ><span class="bi bi-cart"></span></a>
    <a href="logout" style=" float: right;" class="w3-bar-item w3-button">LOGOUT</a>
  </div>
</div>
<!-- Header with image -->
<header class="bgimg w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-bottomleft w3-padding">
    <span class="w3-tag w3-xlarge">Open from 10am to 12pm</span>
  </div>
  <div class="w3-display-middle w3-center">
    <span class="w3-text-white w3-hide-small" style="font-size:100px">the<br>CHEESY PLACE</span>
    <span class="w3-text-white w3-hide-large w3-hide-medium" style="font-size:60px"><b>the<br>CHEESY PLACE</b></span>
    <p><a href="#menu" class="w3-button w3-xxlarge w3-black">Let me see the menu</a></p>
  </div>
</header>

<!-- Menu Container -->
<div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="menu">
  <div class="w3-content">
  
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px; color: white;">THE MENU</h1>
    <div class="w3-row w3-center w3-border w3-border-dark-grey">
      <a href="javascript:void(0)" onclick="openMenu(event, 'Pizza');" id="myLink">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red" style="color: white">Pizza</div>
      </a>
      <a href="javascript:void(0)" onclick="openMenu(event, 'Pasta');">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red" style="color: white">Pasta</div>
      </a>
      <a href="javascript:void(0)" onclick="openMenu(event, 'Starter');">
        <div class="w3-col s4 tablink w3-padding-large w3-hover-red" style="color: white">Beverages</div>
      </a>
    </div>
    

    
   
    <div id="Pizza" class="w3-container menu w3-padding-32 w3-white" style="">
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
Statement statement1 = null;
ResultSet resultSet = null;
ResultSet resultSet1 = null;
%>
    
    <% try{ 
						connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);%>
					<%	statement=connection.createStatement();
						String sql ="SELECT * FROM pizza_items";

						resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
						%>
    
      <h1><b> <%=resultSet.getString("pizza_name") %></b> <span class="w3-right w3-tag w3-dark-grey w3-round">&#8377; <%=resultSet.getString("pizza_price") %></span></h1>
      <span class="w3-text-grey"><%=resultSet.getString("pizza_desc") %></span> <button style="float: right;">Add to cart</button>
      <hr>
    <% 
						}

					} catch (Exception e) {
						e.printStackTrace();
						}
						%>



    <div id="Pasta" class="w3-container menu w3-padding-32 w3-white">
    
    <% try{ 
						
						statement1=connection.createStatement();
						String sql1 ="SELECT * FROM pasta_items";

						resultSet1 = statement1.executeQuery(sql1);
							while(resultSet1.next()){
						%>
      <h1><b> <%=resultSet.getString("pasta_name") %></b> <span class="w3-right w3-tag w3-dark-grey w3-round">&#8377;  <%=resultSet.getString("pasta_price") %></span></h1>
      <span class="w3-text-grey"><%=resultSet.getString("pasta_desc") %></span> <button style="float: right;">Add to cart</button>
      <hr>
      
      <% 
						}

					} catch (Exception e) {
						e.printStackTrace();
						}
						%>
						
						 <h1><b><span class="veg-indian-vegetarian"></span>Spiced Tomato Twist</b> <span class="w3-tag w3-grey w3-round">Popular</span> <span class="w3-right w3-tag w3-dark-grey w3-round">&#8377;  149</span></h1>
      <span class="w3-text-grey">Tangy Red Sause Pasta Infused With Spices,Topped With Onion & Red Capsicum</span> <button style="float: right;">Add to cart</button>
      <hr>
      
      
   
      <h1><b><span class="veg-indian-vegetarian"></span>Cheesy Comfort</b> <span class="w3-right w3-tag w3-dark-grey w3-round">&#8377; 169</span></h1>
      <span class="w3-text-grey">White Cheese Pasta Topped With Onion,Green & Red Capsicum & Sweet Corn</span> <button style="float: right;">Add to cart</button>
      <hr>
      
      <h1><b><span class="veg-indian-vegetarian"></span>Creamy Mushroom</b> <span class="w3-right w3-tag w3-dark-grey w3-round">&#8377;  199</span></h1>
      <span class="w3-text-grey">Rich Creamy Mushroom Sauce Flavoured With Garlic & parsley</span> <button style="float: right;">Add to cart</button>
      <hr>

      <h1><b><span class="non-veg-indian-vegetarian"></span>Seafood pasta</b> <span class="w3-right w3-tag w3-dark-grey w3-round">&#8377; 269</span></h1>
      <span class="w3-text-grey">Salmon, shrimp, lobster, garlic</span> <button style="float: right;">Add to cart</button>
    </div>


    <div id="Starter" class="w3-container menu w3-padding-32 w3-white">
      <h1><b>Lemon Mint Mojito</b><span class="w3-right w3-tag w3-dark-grey w3-round">&#8377; 149</span></h1>
      <span class="w3-text-grey">Classic Mojito</span>  <button style="float: right;">Add to cart</button>
      <hr>
   
      <h1><b>Jamutini</b> <span class="w3-right w3-tag w3-dark-grey w3-round">&#8377;  139</span></h1>
      <span class="w3-text-grey">Fresh Blast Of Jamun With A Hint OF Refreshing Mint</span>  <button style="float: right;">Add to cart</button>
      <hr>
      
      <h1><b>Fresh Lime</b> <span class="w3-right w3-tag w3-dark-grey w3-round">&#8377;  119</span></h1>
      <span class="w3-text-grey">Sweet Salted Or Mixed With Water Or Soda</span> <button style="float: right;">Add to cart</button>
      <hr>
      
      <h1><b>Lipton Iced Tea</b> <span class="w3-right w3-tag w3-dark-grey w3-round">&#8377; 89</span></h1>
      <span class="w3-text-grey">Classic Lipton Green Tea</span> <button style="float: right;">Add to cart</button>
    </div><br>

  </div>
</div>

 

<!-- About Container -->
<div class="w3-container w3-padding-64 w3-red w3-grayscale w3-xlarge" id="about">
  <div class="w3-content">
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px">About</h1>
    <p>The Cheesy Place Pizza is all about quality you can trust.Our sole mission is making the freshest, tastiest and funnest Pizza around.<br/>

Our classic pan pizza will always be a fan favourite, with a soft and chewy crust perfectly balancing out the healthy tomato pure and mozzarella.
<br/>
Our authentic Italian crust for those who would prefer a light and airy crust to more fully enjoy the toppings. Thin, light and delicious.
<br/>
Our newest addition of Puree sauces will blow your mind. Chose between a spicy buffalo, sweet bbq, tangy chipotle can creamy makhni to perfectly compliment your toppings and crust. 

<br/><br/>Our suggestions of combinations might be helpful but ultimately the power lies with you.

Our outlets designed by leading architects to reflect our philosophy of being open and inviting, while putting our customer comfort on priority.

Everywhere we go, we hear ‘Your pizza is the tastiest pizza around, why aren’t you open in my location’. The answer is simple, every outlet opened is a promise to our customer, and not one we </p>
    <p><strong>The Chef?</strong>  Mr. Anthony Felix Gemignani<img src="img/download.jpg" style="width:150px" class="w3-circle w3-right" alt="Chef"></p>
    <p>We are proud of our interiors.</p>
    <img src="img/pizzaimg.jpg" style="width:100%" class="w3-margin-top w3-margin-bottom" alt="Restaurant">
    <h1><b>Opening Hours</b></h1>
    
    <div class="w3-row">
      <div class="w3-col s6">
        <p>Monday 10.00 - 23.00</p>
        <p>Tuesday 10.00 - 23.00</p>
        <p>Wednesday 10.00 - 23.00</p>
        <p>Thursday 10:00 - 23:00</p>
      </div>
      <div class="w3-col s6">
        <p>Friday 10:00 - 22:00</p>
        <p>Saturday 10:00 - 22:00</p>
        <p>Sunday Closed</p>
      </div>
    </div>
    
  </div>
</div>

<!-- Image of location/map -->
<img src="img/map1.jpg" class="w3-image w3-greyscale" style="width:100%;" id="myMap">

<!-- Contact -->
<div class="w3-container w3-padding-64 w3-blue-grey w3-grayscale-min w3-xlarge">
  <div class="w3-content">
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px">Contact</h1>
    <p>Find us at <br/>The Cheesy Place,Times Square,New York<br> Call us at 05050515-122330</p>
    <p><span class="w3-tag">FYI!</span> We offer full-service catering for any event, large or small. We understand your needs and we will cater the food to satisfy the biggerst criteria of them all, both look and taste.</p>
    <p class="w3-xxlarge"><strong>Book</strong> a table By Just Registering to our Site</p>
    <form action="/action_page.php" target="_blank">
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Name" required name="Name"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="number" placeholder="How many people" required name="People"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="datetime-local" placeholder="Date and time" required name="date" value="2020-11-16T20:00"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Message \ Special requirements" required name="Message"></p>
      <p><button class="w3-button w3-light-grey w3-block" type="submit">SEND MESSAGE</button></p>
    </form>
  </div>
</div>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-48 w3-xxlarge">
  <p>	&#169;Powered by <a href="https://www.pizzahut.co.in" title="the cheesy place" target="_blank" class="w3-hover-text-green">the cheesy place</a></p>
</footer>

	



</body>
</html>

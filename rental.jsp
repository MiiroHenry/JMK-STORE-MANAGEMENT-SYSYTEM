<%@ page import="java.sql.*" %>  
<%@ page import="enc.Encrypt" %>

<!DOCTYPE html>
<html>
<title>Rental management system</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="styles.css">
<style type="text/css">
	.design{
 font-family: Georgia, serif;font-size: 18px;font-weight: bold;color: #FFF8DC;letter-spacing: 1.4px;border-bottom: solid 0px #006600;text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;color: #fff;text-align: center;
  -webkit-animation: glow 1s ease-in-out infinite alternate; -moz-animation: glow 1s ease-in-out infinite alternate;
  animation: glow 1s ease-in-out infinite alternate;
	}
	.main{
		font-family: Georgia, serif;font-size: 18px;font-weight: bold;letter-spacing: 1.4px;border-bottom: solid 1px #006600;text-transform: uppercase;     text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;color: #fff;text-align: center;
  -webkit-animation: glow 1s ease-in-out infinite alternate; -moz-animation: glow 1s ease-in-out infinite alternate;
  animation: glow 1s ease-in-out infinite alternate;
	}
	.management{
		border-radius:50px;font-family: Georgia, serif;font-size: 18px;font-weight: bold;color: #fff;letter-spacing: 1.4px;border-bottom: solid 1px #006600;text-transform: uppercase;background: #222;margin: 50px auto;
	text-align: center;text-shadow: -1px -1px 0px rgba(255,255,255,0.3), 1px 1px 0px rgba(0,0,0,0.8);
	color: #fff;opacity: 0.4;
	}
	.load{
		 width: 90%;border-radius:50px; border-color: #e3e3e3;
border-width: 20px;border-style: groove;
	}
</style>
<head>
	<body style="background-color: #1E1802;">
<table border="1" height="600" class="load"align="center" cellspacing="10">
  <tr style="width: 90%;border-left: 5px;border-right: 5px;border-top: 5px;border-bottom: 5px;" height="50">
    <th class="management">
      <img src="download.png" alt="Image" height="42" width="42">
      JMK TRADING STORES MADDU!

</th>
 <th style="border-radius:50px;background-image: url(image.jpg);">
 <form align="right"><input type="submit" id="logout" name="logout" value="Logout " style="border-radius:50px;color: #FFF8DC;background-color: #85144b;font-family: Georgia, serif;font-size: 20px;"  href="logout.jsp"><p align="center"style="color: white;font-size: 18px;">Customer is our best friend<p></form>
</th>
  </tr>
  <tr>
    <td style="border-radius:50px;width: 20%;background-color: #85144b;" height="200" >
  <div >
  <h3 align="center" class="main">Dashboard</h3>
  <ul>
  <a href="register1.jsp" class="design"target="blank">New Employee</a><br>
  <a href="payments.jsp" class="design"target="blank">Payments</a><br>
  <a href="products.jsp" class="design"target="blank">Products</a><br>
  <a href="sales1.jsp" class="design" target="blank">Sales</a><br>
  <a href="#" class="design">Bills</a><br>
  <a href="#" class="design">Payments</a><br>
  <a href="#" class="design">Bills</a><br>
  <a href="#" class="design">Accounts</a>
  
  </ul>
</div>
    </td>
    <td style="border-radius:50px;background-image: url(hawa.jpg);" class="Image">
</td></tr>
</table>  
</body>
</html>

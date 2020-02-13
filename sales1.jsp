<%@ page import="java.sql.*" %>  
<%@ page import="enc.Encrypt" %>
<%
try
{
    Class.forName("com.mysql.jdbc.Driver"); //load driver
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root",""); //create connection
    
    if(request.getParameter("save")!=null) //check save button click event not null
    {
		String carnumber,bossname,bossphonenumber,amount,bosslocation,pricesold,balance,date,storenumber;
		
		carnumber=request.getParameter("car_number"); //car_number
		bossname=request.getParameter("boss_name"); //boss_name
		bossphonenumber=request.getParameter("boss_phonenumber");//boss_phonenumber
		amount=request.getParameter("a_amount");//a_amount
		bosslocation=request.getParameter("boss_location");//boss_location
		pricesold=request.getParameter("price_sold"); //price_sold
		balance=request.getParameter("b_balance"); //b_balance
        date=request.getParameter("d_date"); //d_date 
        storenumber=request.getParameter("store_number"); //store_number
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into sales(carnumber,bossname,bossphonenumber,amount,bosslocation,pricesold,balance,storenumber,totalamount) values(?,?,?,?,?,?,?,?,?)"); //sql insert query
		pstmt.setString(1,carnumber);
		pstmt.setString(2,bossname);
		pstmt.setString(3,bossphonenumber);
		pstmt.setString(4,amount);
		pstmt.setString(5,bosslocation);
		pstmt.setString(6,pricesold);
		pstmt.setString(7,balance);
		//pstmt.setString(8,date);
		pstmt.setString(8,storenumber);
         pstmt.setInt(9,Integer.parseInt(amount)*Integer.parseInt(pricesold));

		pstmt.executeUpdate(); //execute query 
		
		request.setAttribute("successMsg","Sales added Successfully...! Please login to view details"); //sales added success messeage

		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Sales</title>

<style type="text/css">
body{
	background-color: #FAFAFA;
}
.form-style-9{
	max-width: 450px;
	background: #FAFAFA;
	padding: 30px;
	margin: 50px auto;
	box-shadow: 1px 1px 25px rgba(0, 0, 0, 0.35);
	border-radius: 10px;
	border: 6px solid #305A72;
}
.form-style-9 ul{
	padding:0;
	margin:0;
	list-style:none;
}
.form-style-9 ul li{
	display: block;
	margin-bottom: 10px;
	min-height: 35px;
}
.form-style-9 ul li  .field-style{
	box-sizing: border-box; 
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box; 
	padding: 8px;
	outline: none;
	border: 1px solid #B0CFE0;
	-webkit-transition: all 0.30s ease-in-out;
	-moz-transition: all 0.30s ease-in-out;
	-ms-transition: all 0.30s ease-in-out;
	-o-transition: all 0.30s ease-in-out;

}.form-style-9 ul li  .field-style:focus{
	box-shadow: 0 0 5px #B0CFE0;
	border:1px solid #B0CFE0;
}
.form-style-9 ul li .field-split{
	width: 49%;
}
.form-style-9 ul li .field-full{
	width: 100%;
}
.form-style-9 ul li input.align-left{
	float:left;
}
.form-style-9 ul li input.align-right{
	float:right;
}
.form-style-9 ul li textarea{
	width: 100%;
	height: 100px;
}
.form-style-9 ul li input[type="button"], 
.form-style-9 ul li input[type="submit"] {
	-moz-box-shadow: inset 0px 1px 0px 0px #3985B1;
	-webkit-box-shadow: inset 0px 1px 0px 0px #3985B1;
	box-shadow: inset 0px 1px 0px 0px #3985B1;
	background-color: #216288;
	border: 1px solid #17445E;
	display: inline-block;
	cursor: pointer;
	color: #FFFFFF;
	padding: 8px 18px;
	text-decoration: none;
	font: 12px Arial, Helvetica, sans-serif;
}
.form-style-9 ul li input[type="button"]:hover, 
.form-style-9 ul li input[type="submit"]:hover {
	background: linear-gradient(to bottom, #2D77A2 5%, #337DA8 100%);
	background-color: #28739E;
}
	.design{
 font-family: Georgia, serif;font-size: 18px;font-weight: bold;color: #FFF8DC;letter-spacing: 1.4px;border-bottom: solid 0px #006600;
	}
	.flex-container {
  display: flex;
  flex-wrap: nowrap;
  
  border-radius: 50px
}

.flex-container > div {
  /*background-color: rgb(128,128,128);*/
  width: 100px;
  margin: 10px;
  text-align: center;
  line-height: 15px;
  font-size: 30px;
}
</style>
<script>	
	
		function validate()
				{
			var car_number= /^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; 
			var _bossname= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z
			var _bossphonenumber= /^[0-9]+$/; 
			var _amount= /^[0-9]+$/; 
			var _bosslocation=/^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var _pricesold= /^[0-9]+$/;
			var _balance= /^[0-9]+$/;
			var _date;
			var _storenumber= /^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/

			var cnumber = document.getElementById("cnumber"); //textbox id cnumber
            var bname = document.getElementById("bname"); //textbox id bname
            var bphone=document.getElementById("bphone");
            var a_mount=document.getElementById("a_mount");
            var blocation=document.getElementById("blocation");
            var psold = document.getElementById("psold"); //textbox id psold
            var b_alance = document.getElementById("b_alance"); //textbox id b_alance
            var d_ate=document.getElementById("d_ate");
            var snumber=document.getElementById("snumber");
			
			if(!car_number.test(cnumber.value) || cnumber.value=='') 
            {
				alert(" Car number must be Alphabet and numbers Only....!");
                cnumber.focus();
                cnumber.style.background = '#f08080';
                return false;                    
            }
			if(!_bossname.test(bname.value) || bname.value=='') 
            {
				alert(" boss name must be Alphabet Only....!");
                bname.focus();
                bname.style.background = '#f08080';
                return false;                    
            }
            if(!_bossphonenumber.test(bphone.value) || bphone.value=='') 
            {
				alert("username must numbers Only....!");
                bphone.focus();
                bphone.style.background = '#f08080';
                return false;                    
            }
            if(!_amount.test(a_mount.value) || a_mount.value=='') 
            {
				alert("Address must be numbers Only....!");
                a_mount.focus();
                a_mount.style.background = '#f08080';
                return false;                    
            }
            if(!_bosslocation.test(blocation.value) || blocation.value=='') 
            {
				alert("Phonenumber must be Alphabet Only....!");
                blocation.focus();
               blocation.style.background = '#f08080';
                return false;                    
            }
			if(!_pricesold.test(psold.value) || psold.value=='') 
            {
				alert("Price must be number....!");
                psold.focus();
                psold.style.background = '#f08080';
                return false;                    
            }
			if(!_balance.test(b_alance.value) || b_alance.value=='') 
            {
				alert("Balance Must be numbers Only");
                b_alance.focus();
               b_alance.style.background = '#f08080';
                return false;                    
            }

			if(!_date.test(d_ate.value) || d_ate.value=='') 
            {
				alert(" Date only allowed");
                d_ate.focus();
                d_ate.style.background = '#f08080';
                return false;                    
            }
            if(!_storenumber.test(snumber.value) || snumber.value=='') 
            {
				alert("Store number  Must Be numbers");
                snumber.focus();
                snumber.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>
</head>
<body>
<table border="1" style="border-radius:50px; width: 70%;color: #BDB76B; border-top: 5px;border-bottom: 5px;border-left: 5px;border-right: 5px; background-color: #2F4F4F" align="center" height="50">
  <th style="border-radius:50px;">
  	<div class="flex-container">
  <div><a href="register1.jsp" class="design"target="blank" style="color: white;">Employee</a></div>
  <div><a href="payments.jsp" class="design"target="blank"style="color: white;">Payments</a></div>
  <div><a href="products.jsp" class="design"target="blank"style="color: white;">Products</a></div>
  <div><a href="sales1.jsp" class="design" target="blank"style="color: white;">Sales</a></div>
  <div><a href="viewsales.jsp" class="design"style="color: white;" target="blank">View Sales</a></div>
  <div><a href="#" class="design"style="color: white;">Bills</a></div>  
  <!--<div><a href="#" class="design"style="color: white;">Payments</a></div>
  
  <div><a href="#" class="design"style="color: white;">Accounts</a></div>-->
  </div>
  </th>
</table>
<form class="form-style-9" method="post" onsubmit="return validate();" style="border-radius: 50px">
	<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
					</p>
	<p align="center" style=" font-family: Georgia, serif;font-size: 18px;font-weight: bold;color: 	rgb(128,128,128);">Add sales</p>
<ul>
<li>
    <input type="text" name="car_number" style=" border-radius: 50px" class="field-style field-split align-left" placeholder="CarNumber" id="cnumber" />
    <input type="text" name="boss_name" style=" border-radius: 50px"class="field-style field-split align-right" placeholder="BossName" id="bname" />
    <input type="text" name="boss_phonenumber" style=" border-radius: 50px"class="field-style field-split align-left" placeholder="BossPhone" id="bphone" />
    <input type="text" name="a_amount" style=" border-radius: 50px"class="field-style field-split align-right" placeholder="Amount" id="a_mount" />
    <input type="text" name="boss_location" style=" border-radius: 50px"class="field-style field-split align-left" placeholder="BossLocation" id="blocation" />
    <input type="text" name="price_sold" style=" border-radius: 50px"class="field-style field-split align-right" placeholder="PriceSold" id="psold" />
     <input type="text" name="b_balance" style=" border-radius: 50px"class="field-style field-split align-left" placeholder="RemainingBalance" id="b_alance" />
     <input type="date" name="d_date" style=" border-radius: 50px"class="field-style field-split align-right" placeholder="Date" id="d_ate" />
</li>
<li>
<input type="text" name="store_number" style=" border-radius: 50px"class="field-style field-full align-none" placeholder="StoreNumber" id="snumber" />
</li>
<li align="right">
<input style="background-color: #DC143C; color: white; border-radius: 50px;font-size: 21px;" type="reset" value="Reset" name="reset" />
<input style="background-color: #2F4F4F; border-radius: 50px" type="submit" value="Save"name="save" />
</li>
</ul>
</form>
</body>
</html>
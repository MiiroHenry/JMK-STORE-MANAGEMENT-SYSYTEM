<%@ page import="java.sql.*" %>  
<%@ page import="enc.Encrypt" %>
<%
try
{
    Class.forName("com.mysql.jdbc.Driver"); //load driver
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root",""); //create connection

    if(request.getParameter("save")!=null) //check save button click event not null
    {
		String fname,lname,address,phone,refname,area_of_birth,amount_taken,date_taken,pay_back_date,price_agreed,product_to_pay,nin,	refphone;
		
		fname=request.getParameter("f_name"); //car_number
		lname=request.getParameter("l_name"); //boss_name
		address=request.getParameter("a_ddress");//boss_phonenumber
		phone=request.getParameter("p_hone");//a_amount
		refname=request.getParameter("ref_name");//boss_location
		area_of_birth=request.getParameter("area_ofbirth"); //price_sold
		amount_taken=request.getParameter("amounttaken"); //b_balance
        date_taken=request.getParameter("datetaken"); //d_date 
        pay_back_date=request.getParameter("pay_backdate"); //store_number
        price_agreed=request.getParameter("priceagreed"); //price_sold
		product_to_pay=request.getParameter("product_topay"); //b_balance
        nin=request.getParameter("Nin"); //d_date 
        refphone=request.getParameter("ref_phone"); //store_number
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into credits(fname,lname,address,phone,refname,area_of_birth,amount_taken,date_taken,pay_back_date,price_agreed,product_to_pay,nin,refphone,killograms_to_pay) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)"); //sql insert query
		pstmt.setString(1,fname);
		pstmt.setString(2,lname);
		pstmt.setString(3,address);
		pstmt.setString(4,phone);
		pstmt.setString(5,refname);
		pstmt.setString(6,area_of_birth);
		pstmt.setString(7,amount_taken);
		pstmt.setString(8,date_taken);
		pstmt.setString(9,pay_back_date);
		pstmt.setString(10,price_agreed);
		pstmt.setString(11,product_to_pay);
        pstmt.setString(12,nin);
        pstmt.setString(13,refphone);
        pstmt.setInt(14,Integer.parseInt(amount_taken)/Integer.parseInt(price_agreed));
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
<title>Credit portal</title>

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
			var _f_name= /^[a-z A-Z]+$/;//pattern allowed alphabet a-z or A-Z 
			var _l_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z
			var _a_ddress= /^[a-z A-Z]+$/;//pattern allowed alphabet a-z or A-Z
			var _p_hone= /^[0-9]+$/; //numbers only
			var _ref_name=/^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var _of_birth= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var _amount_taken= /^[0-9]+$/;
			var _date_taken;
			var _pay_back_date;
			//var _of_birth= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var _pricea_greed= /^[0-9]+$/;
			var _p_product_topay=/^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var _n_Nin= /^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/
			var _ref_phone= /^[0-9]+$/;

			var f_f_name = document.getElementById("f_f_name"); //textbox id cnumber
            var l_l_name = document.getElementById("l_l_name"); //textbox id bname
            var a_a_ddress=document.getElementById("a_a_ddress");
            var p_p_hone=document.getElementById("p_p_hone");
            var r_ref_name=document.getElementById("r_ref_name");
            var area_of_birth = document.getElementById("area_of_birth"); //textbox id psold
            var amount_taken = document.getElementById("amount_taken"); //textbox id b_alance
            var date_taken=document.getElementById("date_taken");
            var pay_back_date=document.getElementById("pay_back_date");
            var pricea_greed = document.getElementById("pricea_greed"); //textbox id b_alance
            var p_product_topay=document.getElementById("p_product_topay");
            var n_Nin=document.getElementById("n_Nin");
            var r_ref_phone=document.getElementById("r_ref_phone");
			
			if(!_f_name.test(f_f_name.value) || f_f_name.value=='') 
            {
				alert(" Car number must be Alphabet and numbers Only....!");
                f_f_name.focus();
                f_f_name.style.background = '#f08080';
                return false;                    
            }
			if(!_l_name.test(l_l_name.value) || l_l_name.value=='') 
            {
				alert(" boss name must be Alphabet Only....!");
                l_l_name.focus();
                l_l_name.style.background = '#f08080';
                return false;                    
            }
            if(!_a_ddress.test(a_a_ddress.value) || a_a_ddress.value=='') 
            {
				alert("username must numbers Only....!");
                a_a_ddress.focus();
                a_a_ddress.style.background = '#f08080';
                return false;                    
            }
            if(!_p_hone.test(p_p_hone.value) || p_p_hone.value=='') 
            {
				alert("Address must be numbers Only....!");
                p_p_hone.focus();
                p_p_hone.style.background = '#f08080';
                return false;                    
            }
            if(!_ref_name.test(r_ref_name.value) || r_ref_name.value=='') 
            {
				alert("Phonenumber must be Alphabet Only....!");
                r_ref_name.focus();
                r_ref_name.style.background = '#f08080';
                return false;                    
            }
			if(!_of_birth.test(area_of_birth.value) || area_of_birth.value=='') 
            {
				alert("Price must be number....!");
                area_of_birth.focus();
                area_of_birth.style.background = '#f08080';
                return false;                    
            }
			if(!_amount_taken.test(amount_taken.value) || amount_taken.value=='') 
            {
				alert("amount Must be numbers Only");
                amount_taken.focus();
              amount_taken.style.background = '#f08080';
                return false;                    
            }

			if(!_date_taken.test(date_taken.value) || date_taken.value=='') 
            {
				alert(" Date only allowed");
                date_taken.focus();
                date_taken.style.background = '#f08080';
                return false;                    
            }
            if(!_pay_back_date.test(snumber.value) || pay_back_date.value=='') 
            {
				alert("Store number  Must Be numbers");
                pay_back_date.focus();
                pay_back_date.style.background = '#f08080';
                return false;                    
            }
            if(!_pricea_greed.test(pricea_greed.value) || pricea_greed.value=='') 
            {
				alert("Store number  Must Be numbers");
               pricea_greed.focus();
                pricea_greed.style.background = '#f08080';
                return false;                    
            }
            if(!_p_product_topay.test(p_product_topay.value) || p_product_topay.value=='') 
            {
				alert("Store number  Must Be numbers");
               p_product_topay.focus();
                p_product_topay.style.background = '#f08080';
                return false;                    
            }
           if(!_n_Nin.test(n_Nin.value) || n_Nin.value=='') 
            {
				alert("Store number  Must Be numbers");
               n_Nin.focus();
                n_Nin.style.background = '#f08080';
                return false;                    
            }
            if(!_ref_phone.test(r_ref_phone.value) || r_ref_phone.value=='') 
            {
				alert("Store number  Must Be numbers");
               r_ref_phone.focus();
                r_ref_phone.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>
</head>
<body>
<table border="1" style="border-radius:50px; width: 70%;color: #BDB76B; border-top: 5px;border-bottom: 5px;border-left: 5px;border-right: 5px; background-color: #2F4F4F" align="center" height="50">
  <th style="border-radius:50px;">
  	<div class="flex-container">
  <div><a href="register1.jsp" class="design"target="blank" style="color: white;">New Employee</a></div>
  <div><a href="payments.jsp" class="design"target="blank"style="color: white;">Payments</a></div>
  <div><a href="products.jsp" class="design"target="blank"style="color: white;">Products</a></div>
  <div><a href="sales1.jsp" class="design" target="blank"style="color: white;">Sales</a></div>
  <div><a href="viewsales.jsp" class="design"style="color: white;" target="blank">View Sales</a></div>
  <div><a href="#" class="design"style="color: white;">Payments</a></div>
  <div><a href="#" class="design"style="color: white;">Bills</a></div>  
  <div><a href="#" class="design"style="color: white;">Accounts</a></div>
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
    <input type="text" name="f_name" style=" border-radius: 50px" class="field-style field-split align-left" placeholder="Firstname" id="f_f_name" />
    <input type="text" name="l_name" style=" border-radius: 50px"class="field-style field-split align-right" placeholder="Lastname" id="l_l_name" />
    <input type="text" name="a_ddress" style=" border-radius: 50px"class="field-style field-split align-left" placeholder="Address" id="a_a_ddress" />
    <input type="text" name="p_hone" style=" border-radius: 50px"class="field-style field-split align-right" placeholder="Phonenumber" id="p_p_hone" />
    <input type="text" name="ref_name" style=" border-radius: 50px"class="field-style field-split align-left" placeholder="Next of kin" id="r_ref_name" />
    <input type="text" name="area_ofbirth" style=" border-radius: 50px"class="field-style field-split align-right" placeholder="Area of birth" id="area_of_birth" />
     <input type="text" name="amounttaken" style=" border-radius: 50px"class="field-style field-split align-left" placeholder="Borrowed amount" id="amount_taken" />
     <input type="date" name="datetaken" style=" border-radius: 50px"class="field-style field-split align-right" placeholder="Date taken" id="date_taken" />
     <input type="date" name="pay_backdate" style=" border-radius: 50px"class="field-style field-split align-right" placeholder="Pay back date" id="pay_back_date" />
     <input type="text" name="priceagreed" style=" border-radius: 50px"class="field-style field-split align-left" placeholder="Agreed price" id="pricea_greed" />
     <input type="text" name="product_topay" style=" border-radius: 50px"class="field-style field-split align-left" placeholder="Product to pay" id="p_product_topay" />
     <input type="text" name="Nin" style=" border-radius: 50px"class="field-style field-split align-left" placeholder="National id number" id="n_Nin" />
</li>
<li>
<input type="text" name="ref_phone" style=" border-radius: 50px"class="field-style field-full align-none" placeholder="Kin Phonenumber" id="r_ref_phone" />
</li>
<li align="right">
<input style="background-color: #DC143C; color: white; border-radius: 50px;font-size: 21px;" type="reset" value="Reset" name="reset" />
<input style="background-color: #2F4F4F; border-radius: 50px" type="submit" value="Save"name="save" />
</li>
</ul>
</form>
</body>
</html>
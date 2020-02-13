<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/dbuser";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%	
String fname = request.getParameter("fname");
String lname=request.getParameter("lname");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String refname=request.getParameter("refname");
String area_of_birth = request.getParameter("area_of_birth");
String amount_taken=request.getParameter("amount_taken");
String date_taken=request.getParameter("date_taken");
String pay_back_date=request.getParameter("pay_back_date");
String price_agreed=request.getParameter("price_agreed");
String product_to_pay=request.getParameter("product_to_pay");
String nin=request.getParameter("nin");
String refphone=request.getParameter("refphone");

if(area_of_birth != null)
{
Connection con = null;
PreparedStatement ps = null;
String personID =area_of_birth;
try
{	
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update credits set fname=?,lname=?,address=?,phone=?,refname=?,area_of_birth=?,amount_taken=?,date_taken=?,pay_back_date=?,price_agreed=?,product_to_pay=?,nin=?,refphone=? where area_of_birth=?="+area_of_birth;
ps = con.prepareStatement(sql);
ps.setString(1,fname);
ps.setString(2, lname);
ps.setString(3, address);
ps.setString(4, phone);
ps.setString(5, refname);
ps.setString(6,area_of_birth);
ps.setString(7, amount_taken);
ps.setString(8, date_taken);
ps.setString(9, pay_back_date);
ps.setString(10, price_agreed);
ps.setString(11,product_to_pay);
ps.setString(12, nin);
ps.setString(13, refphone);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
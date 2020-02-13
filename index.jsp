<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String area_of_birth = request.getParameter("area_of_birth");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "dbuser";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<body>
<h1>Retrieve data from database in jsp</h1>
<table border="1">	
<tr>
<td>fname</td>
<td>lname</td>
<td>address</td>
<td>phone</td>
<td>refname</td>
<td>area_of_birth</td>
<td>amount_taken</td>
<td>date_taken</td>
<td>pay_back_date</td>
<td>price_agreed</td>
<td>product_to_pay</td>
<td>nin</td>
<td>refphone</td>
<td>update</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from credits";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>	
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("lname") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("phone") %></td>
<td><%=resultSet.getString("refname") %></td>
<td><%=resultSet.getString("area_of_birth") %></td>
<td><%=resultSet.getString("amount_taken") %></td>
<td><%=resultSet.getString("date_taken") %></td>
<td><%=resultSet.getString("pay_back_date") %></td>
<td><%=resultSet.getString("price_agreed") %></td>
<td><%=resultSet.getString("product_to_pay") %></td>
<td><%=resultSet.getString("nin") %></td>
<td><%=resultSet.getString("refphone") %></td>
<td><a href="update.jsp?area_of_birth=<%=resultSet.getString("area_of_birth")%>">Edit</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>

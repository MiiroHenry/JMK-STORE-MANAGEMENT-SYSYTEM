<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from credits where area_of_birth='"+area_of_birth+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<form method="post" action="update-process.jsp">
<input type="hidden" name="area_of_birth" value="<%=resultSet.getString("area_of_birth") %>">
<input type="text" name="area_of_birth" value="<%=resultSet.getString("area_of_birth") %>">
<br>	
fname:<br>
<input type="text" name="fname" value="<%=resultSet.getString("fname") %>">
<br>
lname:<br>
<input type="text" name="lname" value="<%=resultSet.getString("lname") %>">
<br>
phone:<br>
<input type="text" name="phone" value="<%=resultSet.getString("phone") %>">
<br>
refname:<br>
<input type="text" name="refname" value="<%=resultSet.getString("refname") %>">
<br>
area_of_birth:<br>
<input type="text" name="area_of_birth" value="<%=resultSet.getString("area_of_birth") %>">
<br>
amount_taken:<br>
<input type="text" name="amount_taken" value="<%=resultSet.getString("amount_taken") %>">
<br>
date_taken:<br>
<input type="text" name="date_taken" value="<%=resultSet.getString("date_taken") %>">
<br>
pay_back_date:<br>
<input type="text" name="pay_back_date" value="<%=resultSet.getString("pay_back_date") %>">
<br>
price_agreed:<br>
<input type="text" name="price_agreed" value="<%=resultSet.getString("price_agreed") %>">
<br>
product_to_pay:<br>
<input type="text" name="product_to_pay" value="<%=resultSet.getString("product_to_pay") %>">
<br>
nin:<br>
<input type="text" name="nin" value="<%=resultSet.getString("nin") %>">
<br>
refphone:<br>
<input type="text" name="refphone" value="<%=resultSet.getString("refphone") %>">
<br><br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
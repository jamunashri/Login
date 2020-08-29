<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "jamunashri";
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
String sql ="select * from employee where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="design.css"></head>
<body>
<div align=right><a href="login.jsp"><button type="submit">Logout</button></a></div>
 <div class="nav">
<div align=center>
<h1>Update a User </h1>
<form method="post" action="updateProcess.jsp">
 <table style="with: 80%">
 	<tr>
 	<td>Id</td>
	<td><input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<input type="text" name="id" value="<%=resultSet.getString("id") %>"></td>
	</tr>
    <tr>
     <td>First Name</td>
     <td><input type="text" name="first_name" value="<%=resultSet.getString("first_name") %>" required /></td>
    </tr>
    <tr>
     <td>Last Name</td>
     <td><input type="text" name="last_name" value="<%=resultSet.getString("last_name") %> "required /></td>
    </tr>
    <tr>
     <td>UserName</td>
     <td><input type="text" name="username"  value="<%=resultSet.getString("username") %>"required/></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" value="<%=resultSet.getString("password") %>"required /></td>
    </tr>
     
   </table>
 <br>  
 <a href="updateProcess.jsp"><button type="submit" value="submit">Submit <br> </button></a>  
     <br>
   <a href="view.jsp"><br>
   <button type="button" class="Back">Back!</button></a>
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</div>
</div>
</body>
</html>
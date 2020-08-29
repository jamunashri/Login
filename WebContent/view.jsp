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
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="design.css"></head>
<body>
<div align=right><a href="login.jsp"><button type="submit">Logout</button></a></div>
<div align="center">

<h1>USERS</h1>
<table border="1">
<tr>

<td>First Name</td>
<td>Last Name</td>
<td>User Name</td>
<td>Password</td>
<td> Action </td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from employee";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("first_name") %></td>
<td><%=resultSet.getString("last_name") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("password") %></td>
<td><a href="update.jsp?id=<%=resultSet.getString("id")%>"><button type="button" class="Update" >Update</button></a></td>
<td><a href="delete.jsp?id=<%=resultSet.getString("id") %>"><button type="button"  class="delete"onclick="if (confirm('Are you sure you want to delete?')) { form.action='/Config?pg=FIBiller&amp;cmd=delete'; } else { return false; }" >Delete</button></a></td>
</tr>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


</table>
</div>

</body>
</html>
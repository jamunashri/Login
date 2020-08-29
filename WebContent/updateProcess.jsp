<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
<% String driverName = "com.mysql.cj.jdbc.Driver";%>
<% String url = "jdbc:mysql://localhost:3306/jamunashri";%>
<% String user = "root";%>
<% String psw = "";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="design.css">
<title>Login page</title>
</head>
<body>
<div align=right><a href="login.jsp"><button type="submit" value="submit" >Logout</button></a></div>
<div class="nav">

 <div align="center">
 <h2> Updated</h2>
<%
String id = request.getParameter("id");
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String username=request.getParameter("username");
String password=request.getParameter("password");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update employee set id=?,first_name=?,last_name=?,username=?,password=?where id="+id;

ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, first_name);
ps.setString(3, last_name);
ps.setString(4, username);
ps.setString(5, password);

int i = ps.executeUpdate();
if(i > 0)
{

//out.print("Record Updated Successfully");
/* response.sendRedirect("listview.jsp"); */
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
<br>
<br>
<a href="view.jsp"><button type="submit">View</button> <br> </a>
<br>
<a href="update.jsp"><button type="submit" value="submit" >Back</button> <br> </a>
 </div>
 </div>
</body>
</html>
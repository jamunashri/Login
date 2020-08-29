<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="design.css">
<meta charset="ISO-8859-1">
<title>Register page</title>
</head>
<body>
<div align=right><a href="login.jsp"><button type="submit">Logout</button></a></div>
<div class="nav">

 <div align="center">
 <%-- <h3><%= request.getAttribute("errorMessage") %> </h3> --%>
   <h3>${employee.error} </h3>  
  <form action="<%= request.getContextPath() %>/register" method="post">
<table>
    <tr>
     <td>First Name</td>
     <td><input type="text" name="first_name" required/></td>
    </tr>
    <tr>
     <td>Last Name</td>
     <td><input type="text" name="last_name" required/></td>
    </tr>
     
    <tr>
     <td>UserName</td>
     <td><input type="text" name="username" required/></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" required/></td>
    </tr>
   </table><br>
  <button type="submit" >Register</button> <br>
  </form>
 <br>
  <a href="loginSuccess.jsp"><button type="submit">Back</button></a>
 </div>
 </div>
</body>
</html>
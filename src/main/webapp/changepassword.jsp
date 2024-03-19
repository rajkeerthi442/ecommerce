<%@page import="onlineshopping.dbconnector" %>
<%@page import="java.sql.*" %>
<%@ include file="changedetailsheader.jsp" %>
<%@ include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changedetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("notmatch".equals(msg)){
%>

<h3 class="alert">New password and Confirm password does not match!</h3>
<%} %>
<%
if("wrong".equals(msg)){ %>

<h3 class="alert">Your old Password is wrong!</h3>
<%} %>
<%
if("done".equals(msg)){ %>

<h3 class="alert">Password change successfully!</h3>
<%} %>
<%
if("invalid".equals(msg)){ %>
<h3 class="alert">Something went wrong! Try again!</h3>

<%} %>
<form action="changepasswordaction.jsp" method="post">
<h3>Enter Old Password</h3>
 <input class="input-style" type="password" name="oldpassword" placeholder="enter your old password" required>
  <hr>
 <h3>Enter New Password</h3>
  <input class="input-style" type="password" name="newpassword" placeholder="enter your new password" required>
 <hr>
<h3>Enter Confirm Password</h3>
 <input class="input-style" type="password" name="confirmpassword" placeholder="enter your confirm password" required>
<hr>
 <button class="button" type="submit">save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>
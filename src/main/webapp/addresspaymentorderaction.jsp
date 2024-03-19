<%@page import="onlineshopping.dbconnector" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String mobileNumber=request.getParameter("mobilenumber");
String paymentmethod=request.getParameter("paymentmethod");
String transactionId="";
transactionId=request.getParameter("transactionid");
String status="bill";
try{
	
	Connection con=dbconnector.getcon();
	PreparedStatement ps=con.prepareStatement("update users set address=?,city=?,state=?,country=?,mobileNumber=?  where email=?");
	ps.setString(1,address);
	ps.setString(2,city);
	ps.setString(3,state);
	ps.setString(4,country);
	ps.setString(5,mobileNumber);
	ps.setString(6,email);
	ps.executeUpdate();
	PreparedStatement  ps1=con.prepareStatement("update cart  set address=?,city=?,state=?,country=?,mobileNumber=?,orderdate=now(),deliverydate=date_add(orderDate,INTERVAL 7 day),paymentmethod=?,transactionId=?,status=? where email=? and address is null");
	ps1.setString(1, address);
	ps1.setString(2, city);
	ps1.setString(3, state);
	ps1.setString(4, country);
	ps1.setString(5, mobileNumber);
	ps1.setString(6, paymentmethod);
	ps1.setString(7, transactionId);
	ps1.setString(8, status);
	ps1.setString(9, email);
	ps1.executeUpdate();
	response.sendRedirect("bill.jsp");
	
	
	
}
catch(Exception e){
	System.out.println(e);
	
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buy Shopping Cart</title>
</head>
<body>
Buy Shopping Cart
<%
	String product = request.getParameter("product");
	String amountAsString = request.getParameter("amount");
	Integer amount = Integer.parseInt(amountAsString);
	session.setAttribute("product", product);
	session.setAttribute("amount",amount);
	%>
	
	Dear <%=session.getAttribute("user") %>, you have ordered <%session.getAttribute("amount"); %>
	<%=session.getAttribute("product")%><p>
	
	Please provide your credit card: <p>
	<form method = "POST" action = "confirmation.jsp">
	<input type = "text" size="16" name = "credit"/>
	<input type = "submit" value ="Submit"</form>

</body>
</html>
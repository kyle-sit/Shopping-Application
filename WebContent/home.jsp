<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body>
Welcome to our Shopping Application, <%	
		out.println(session.getAttribute("username")); %>!

	<p>
		<b>Menu</b>
		<%--
			if (session.getAttribute("role").equals("owner")) {
		--%>
	
	
	<li><a href="categories.jsp">Categories</a></li>
	<li><a href="products.jsp">Products</a></li>
	<%--
		} else {
	--%>

	<li><a href="productOrder.jsp">Shopping Cart</a></li>
	<li><a href="productsBrowsing.jsp">Browse Products</a></li>
	<%--} --%>
	</p>
</body>
</html>
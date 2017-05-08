<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping app login</title>
</head>
<body>

	Welcome! Please log in:
	<p>

		<%
			if (session.getAttribute("loginError").equals(true)) {

				out.println("The provided name " + session.getAttribute("wrongName") + " is not known.");
			}
		%>
	
	
	<form method="GET" action="loginCheck.jsp">
		<br> Username: <input type="text" size="20" name="username" />
		</p>
		<input type="SUBMIT" value="Submit" />
	</form>

</body>
</html>
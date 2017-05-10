<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign-up Info</title>
</head>
<body>

	<%-- Import the java.sql package --%>
	<%@ page import="java.sql.*"%>
	<%-- -------- Open Connection Code -------- --%>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		//ResultSet rs = null;

		try {
			// Registering Postgresql JDBC driver with the DriverManager
			Class.forName("org.postgresql.Driver");

			// Open a connection to the database using DriverManager
			conn = DriverManager.getConnection(
					"jdbc:postgresql://localhost:5432/CSE135_DB?" + "user=postgres&password=postgres");
	%>

	<%-- -------- SELECT Statement Code -------- --%>
	<%
		// Create the statement
			Statement statement = conn.createStatement();
			pstmt = conn.prepareStatement("INSERT INTO userPerson (name, role, age, state) VALUES (?, ?, ?, ?)");
			
			/*if(request.getParameter("username") == null || request.getParameter("age") == null){
				response.sendRedirect("signupError.jsp");
			}*/
			String  username = request.getParameter("username");
			String  role 	= request.getParameter("role");
			String  state	= request.getParameter("state");
			
		
			session.setAttribute("username", username);
			session.setAttribute("role", role);
			pstmt.setString(1, username);
			pstmt.setString(2, role);
			pstmt.setInt(3, Integer.parseInt(request.getParameter("age")));
			pstmt.setString(4, state);
			
			int rowCount = pstmt.executeUpdate();

			pstmt = conn.prepareStatement("INSERT INTO Cart (name, total price, buyer, date) VALUES (?, ?, ?, ?)");

			pstmt.setString(1, username);
			pstmt.setString(3, username);
			pstmt.setInt(2, 0);
			pstmt.setString(4, “May”);

			session.setAttribute(“cart”, username);
			rowCount = pstmt.executeUpdate();			

			session.setAttribute("signupSuccess", true);
			response.sendRedirect("home.jsp");
			%>
			
			
			<%-- -------- Close Connection Code -------- --%>
	<%
				// Close the ResultSet
					//rs.close();

					// Close the Statement
					statement.close();

					// Close the Connection
					conn.close();
				} catch (SQLException e) {

					// Wrap the SQL exception in a runtime exception to propagate
					// it upwards
					response.sendRedirect("signupError.jsp");
					//throw new RuntimeException(e);
				} finally {
					// Release resources in a finally block in reverse-order of
					// their creation

/*					if (rs != null) {
						try {
							rs.close();
						} catch (SQLException e) {
						} // Ignore
						rs = null;
					}*/
					if (pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException e) {
						} // Ignore
						pstmt = null;
					}
					if (conn != null) {
						try {
							conn.close();
						} catch (SQLException e) {
						} // Ignore
						conn = null;
					}
				}
			%>
</body>
</html>
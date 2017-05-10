<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Products</title>
</head>
<body>


	<%-- Import the java.sql package --%>
	<%@ page import="java.sql.*"%>
	<%-- -------- Open Connection Code -------- --%>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

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
			//PreparedStatement ps = conn.prepareStatement("SELECT name FROM Products WHERE name LIKE '?%'");
			// Use the created statement to SELECT
			// the student attributes FROM the Student table.
			
			String productName = request.getParameter(“productName”);
			Integer quantity = Integer.parseInt(request.getParameter(“quantity”));
			//ps.setString(1, searchName);
			rs = statement.executeQuery(“INSERT INTO CartItems (product, quantity, cart) VALUES (“ + productName + “, “ + quantity + “, “ + session.getAttribute("username") + “)”);
			
			rs = statement.executeQuery(SELECT * FOM CartItems WHERE Cart = “ + session.getAttribute(“cart”));
			%>
			 <%-- -------- Iteration Code -------- --%>
	            <%
	                // Iterate over the ResultSet
	                while (rs.next()) {
	            %>

	            
	                <%-- Get the product --%>
	                	
	                	
	                    <form method=“GET” action=“deleteOrder.jsp”>
    			    <br><%=rs.getString(“product”)%> <%=rs.getInt(“quantity”)%></br>
			    <button type="submit">Remove</button>
			    </form>
	                    <%—- <a href='productOrder.jsp'><%=rs.getString("name")%></a> -—%>
	                <%} %>

			
			<%-- -------- Close Connection Code -------- --%>
	<%
				 //Close the ResultSet
					rs.close();

					// Close the Statement
					statement.close();

					// Close the Connection
					conn.close();
				} catch (SQLException e) {

					// Wrap the SQL exception in a runtime exception to propagate
					// it upwards
					response.sendRedirect("productsError.jsp");
					//throw new RuntimeException(e);
				} finally {
					// Release resources in a finally block in reverse-order of
					// their creation

					if (rs != null) {
						try {
							rs.close();
						} catch (SQLException e) {
						} // Ignore
						rs = null;
					}
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
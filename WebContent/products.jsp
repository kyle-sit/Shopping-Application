<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
</head>
<body>
	<h2>Products</h2>
	<table>
		<tr>
			<td valign="top"></td>
			<td>
				<%-- Import the java.sql package --%> <%@ page import="java.sql.*"%>
				<%-- -------- Open Connection Code -------- --%> <%
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                // Registering Postgresql JDBC driver with the DriverManager
                Class.forName("org.postgresql.Driver");

                // Open a connection to the database using DriverManager
                conn = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/CSE135_DB?" +
                    "user=postgres&password=postgres");
            %> 
            <%-- -------- INSERT Code -------- --%> <%
               		 String action = request.getParameter("action");
               		 // Check if an insertion is requested
               		 if (action != null && action.equals("insert")) {

                    		// Begin transaction
                    		conn.setAutoCommit(false);

                    		// Create the prepared statement and use it to
                    		// INSERT student values INTO the students table.
                    		pstmt = conn.prepareStatement("INSERT INTO Products (name, SKU, category, price) VALUES (?, ?, ?, ?)");

                    		pstmt.setInt(2, Integer.parseInt(request.getParameter("sku")));
			pstmt.setInt(4, Integer.parseInt(request.getParameter("price")));
                    		pstmt.setString(1, request.getParameter("name"));
                    		pstmt.setString(3, request.getParameter("category"));
     
                   		 int rowCount = pstmt.executeUpdate();

                    		// Commit transaction
                    		conn.commit();
                    		conn.setAutoCommit(true);
               		 } 
			//---------- DELETE Code ----------
			else if(	action != null && action.equals("delete")) {	
				 // Begin transaction
                    			conn.setAutoCommit(false);

                    			// Create the prepared statement and use it to delete products the Products table.
                    			pstmt = conn.prepareStatement("DELETE FROM Products WHERE sku = ?");

                    			pstmt.setInt(1, Integer.parseInt(request.getParameter("sku")));
     
                   		 	int rowCount = pstmt.executeUpdate();

                    			// Commit transaction
                    			conn.commit();
                    			conn.setAutoCommit(true);
			}	
			//-- -------- UPDATE Code -------- --
			else if(	action != null && action.equals("update")) {	
				 // Begin transaction
                    			conn.setAutoCommit(false);

                    			// Create the prepared statement and use it to update products the Products table.
                    			pstmt = conn.prepareStatement("UPDATE Products SET name = ?, category = ?, price = ? WHERE SKU = ?");

				pstmt.setInt(4, Integer.parseInt(request.getParameter("sku")));
                    			pstmt.setString(1, request.getParameter("pname"));
                    			pstmt.setString(2, request.getParameter("category"));
				pstmt.setInt(4, Integer.parseInt(request.getParameter("price")));
     
                   		 	int rowCount = pstmt.executeUpdate();

                    			// Commit transaction
                    			conn.commit();
                    			conn.setAutoCommit(true);
			}	

			%> <%-- -------- SELECT Statement Code -------- --%> <%
               		 // Create the statement
               		 Statement statement = conn.createStatement();

               		 // Use the created statement to SELECT
               		 // the product attributes FROM the Product table.
               		 rs = statement.executeQuery("SELECT * FROM Products");
               		
           		 %> <!-- Add an HTML table header row to format the results -->
				<table border="1">
					<tr>
						<th>Name</th>
						<th>SKU</th>
						<th>Category</th>
						<th>Price</th>
					</tr>

					<tr>
						<form action="products.jsp" method="POST">
							<input type="hidden" name="action" value="insert" />
							<th><input value="" name="name" size="10" /></th>
							<th><input value="" name="sku" size="15" /></th>
							<th><input value="" name="category" size="15" /></th>
							<th><input value="" name="price" size="15" /></th>
							<th><input type="submit" value="Insert" /></th>
						</form>
					</tr>



					<%-- Iterate over the ResultSet --%>
					<% while( rs.next() ) { %>
					<tr>
						<form action="products.jsp" method="POST">
							<input type="hidden" name="action" value="update" /> <input
								type="hidden" name="sku" value="<%=rs.getInt("sku")%>" />

							<td><input value="<%=rs.getString("name")%>" name="pname" />
							</td>
							<td><input value="<%=rs.getInt("SKU")%>" name="sku" /></td>
							<td><input value="<%=rs.getString("category")%>"
								name="category" /></td>
							<td><input value="<%=rs.getInt("price")%>" name="price" /></td>
							<td><input type="submit" value="update"></td>
						</form>

						<form action="products.jsp" method="POST">
							<input type="hidden" name="action" value="delete" /> <input
								type="hidden" name="sku" value="<%=rs.getInt("sku")%>" />
							<td><input type="submit" value="delete" /></td>
						</form>
					</tr>
					<% } %>
					<form method="GET" action="searchProducts.jsp">
						<br> Search: <input type="text" name="search" />
						</p>
						<input type="SUBMIT" value="Submit" />
					</form><br>





					<%-- -------- Close Connection Code -------- --%>
					<%
                // Close the ResultSet
                rs.close();

                // Close the Statement
                statement.close();

                // Close the Connection
                conn.close();
            } catch (SQLException e) {

                // Wrap the SQL exception in a runtime exception to propagate
                // it upwards
                throw new RuntimeException(e);
            }
            finally {
                // Release resources in a finally block in reverse-order of
                // their creation

                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) { } // Ignore
                    rs = null;
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) { } // Ignore
                    pstmt = null;
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) { } // Ignore
                    conn = null;
                }
            }
            %>
				</table>
			</td>
		</tr>
	</table>

</body>
</html>
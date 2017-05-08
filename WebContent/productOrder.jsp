<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Order</title>
</head>
<body>
<table>
    <tr>
 
        <td>
            <%-- Import the java.sql package --%>
            <%@ page import="java.sql.*"%>
            <%-- -------- Open Connection Code -------- --%>
            <%
            
            Connection conn = null;
           // PreparedStatement pstmt = null;
           // ResultSet rs = null;
            
            try {
                // Registering Postgresql JDBC driver with the DriverManager
                Class.forName("org.postgresql.Driver");

                // Open a connection to the database using DriverManager
                conn = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/CSE135_DB?" +
                    "user=postgres&password=postgres");
            %>
            
           Welcome <%=session.getAttribute("user")%><p>
           <form method = "GET" action = "buyShoppingCart.jsp">
           Product:
           <select name = "product">
           	<option value = "coffee">coffee</option>
           	</select>
           	<p>
           	Amount: <input type = "text" size = "4" name = "amount"/></p>
           	<input type = "submit" value = "Click to Order"/>
           	</form>
    

          


            <%-- -------- Close Connection Code -------- --%>
            <%
                // Close the ResultSet
            //    rs.close();

                // Close the Statement
               //statement.close();

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

              /*  if (rs != null) {
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
                }*/
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
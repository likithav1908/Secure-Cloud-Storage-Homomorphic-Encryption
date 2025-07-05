<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Sign Up Action</title>
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirm_password");

            if (password.equals(confirmPassword)) {
                try {
                    // Database connection and inserting user logic would go here
                    // Example code to show the process (assuming a MySQL database)

                    // Load JDBC driver
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/homomorphic", "root", "root");

                    // Insert user into the database
                    String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
                    PreparedStatement preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setString(1, username);
                    preparedStatement.setString(2, email);
                    preparedStatement.setString(3, password);

                    int rowsInserted = preparedStatement.executeUpdate();
                    if (rowsInserted > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert(\" '" + username + "' Register Successfully \")");
                        out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("usersignin.jsp");
                        rd.include(request, response);
                    } else {
                        out.println("<h3>Sign Up Failed!</h3>");
                    }
                    connection.close();
                } catch (Exception e) {
                    out.println("<h3>Error: " + e.getMessage() + "</h3>");
                }
            } else {
                out.println("<h3>Passwords do not match!</h3>");
            }
        %>
      
    </body>
</html>

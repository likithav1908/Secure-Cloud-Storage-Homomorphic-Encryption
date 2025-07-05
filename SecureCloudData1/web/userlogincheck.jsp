<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign In Action</title>
</head>
<body>
    <%
        String username_email = request.getParameter("username_email");
        String password = request.getParameter("password");

        try {
            // Database connection logic
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/homomorphic", "root", "root");

            // Validate the user credentials
            String sql = "SELECT * FROM users WHERE (username = ? OR email = ?) AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username_email);
            preparedStatement.setString(2, username_email);
            preparedStatement.setString(3, password);

            ResultSet resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                 String email=resultSet.getString("email");
    session.setAttribute("user", username_email);
     session.setAttribute("email1",email);
                 out.println("<script type=\"text/javascript\">");
                        out.println("alert(\"WELCOME '" + username_email + "'\")");
                        out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp");
                        rd.include(request, response);
            } else {
                out.println("<h3>Invalid credentials! Please try again.</h3>");
            }
            connection.close();
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    %>
    <p><a href="sign_in.jsp">Back to Sign In</a></p>
</body>
</html>

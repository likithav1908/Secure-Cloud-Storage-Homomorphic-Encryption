<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>File Download</title>
    <style>
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        table th, table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        .container1 {
            width: 80%;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            margin-left: 260px;
            margin-top: 150px;
        }
        button {
            padding: 10px;
            margin: 5px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
        .button-container {
            display: flex;
            justify-content: space-evenly;
        }
          .download-link {
            text-decoration: none;  /* Remove underline from the link */
            color: #333;  /* Default color of the text */
            font-size: 16px;  /* Font size for the text */
        }

        /* Style the icon */
        .download-link i {
            font-size: 50px; /* Increase the size of the icon */
            color: green;  /* Change icon color to blue */
            margin-right: 10px; /* Add space between the icon and text */
        }

        /* Hover effect for the icon */
        .download-link i:hover {
            color: #0056b3;  /* Change the icon color on hover */
        }

        /* Hover effect for the link */
        .download-link:hover {
            color: green;  /* Change the text color on hover */
        }
    </style>
</head>
<body>
    <jsp:include page="user.jsp"/>
    <div class="container1">
        <h1>Download Files</h1>
        <table class="table table-bordered bg-white">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>User Name</th>
                    <th>Email</th>
                    <th>File Name</th>
                    <th>Download</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Statement stmt = null;
                    ResultSet rs = null;
                    Connection con = null;
                    try {
                        // Load the database driver and establish a connection
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/homomorphic", "root", "root");

                        // Prepare and execute the SQL query
                        stmt = con.createStatement();
                        String sql = "SELECT * FROM request"; // Replace with your actual query
                        rs = stmt.executeQuery(sql);

                        // Loop through the result set and display data in the table
                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("username");
                            String email = rs.getString("email");
                            String fileName = rs.getString("file_name");

                            // Assuming the files are stored in a directory on the server (change path as needed)
                            String filePath = "C:/uploads/" + fileName; // Replace with your actual file path
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= name %></td>
                    <td><%= email %></td>
                    <td><%= fileName %></td>
                    <td>
                        <!-- Corrected Download link -->
                      <a href="download.jsp?fileName=<%= fileName %>" class="download-link">  <i class="fa fa-download"></i></a>
                      
                    </td>
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        out.println("Error: " + e.getMessage());
                    } catch (ClassNotFoundException e) {
                        out.println("Database driver error: " + e.getMessage());
                    } finally {
                        // Ensure resources are closed to prevent memory leaks
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (con != null) con.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>

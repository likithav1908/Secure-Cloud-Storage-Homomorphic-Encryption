<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
        .container1{
            width: 500px;
            margin-left: 400px;
            margin-top: 150px;
        }
        button {
            padding: 10px;
            margin: 5px;
            background-color: red; /* Green */
            color: white;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        /* Hover effect */
        button:hover {
            background-color: #45a049;
        }

        /* Button container style */
        .button-container {
            display: flex;
            justify-content: space-evenly;
        }
    </style>
    <body>
        <jsp:include page="cloud.jsp"/>
        <div class="container1">
            <h1 style="margin-left: 200px;">ViewRequestCloud</h1>
            <table class="table table-bordered bg-white">
                <thead>
                    <tr>
                         <th>Id</th>
                        <th>User Name</th>
                        <th>Email</th>
                        <th>File Name</th>
                        <th>Status</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        Statement stmt = null;
                        ResultSet rs = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/homomorphic", "root", "root");

                        try {
                            stmt = con.createStatement();
                            String sql = "SELECT * FROM request"; // Replace with your actual query
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                int id = rs.getInt("id"); // Get order ID
                                String name = rs.getString("username");
                                String email = rs.getString("email");
                                String file = rs.getString("file_name");
                                String status = rs.getString("status");
                               
                              
                    %>
                    <tr>
                        <td><%= id%></td>
                        <td><%= name%></td>
                        <td><%= email%></td>
                        <td><%= file%></td>
                        <td><%= status%></td>
                       

                    </tr>
                    <%
                            }
                        } catch (SQLException e) {
                            out.println("Error: " + e.getMessage());
                        } finally {
                            try {
                                if (rs != null) {
                                    rs.close();
                                }
                                if (stmt != null) {
                                    stmt.close();
                                }
                                if (con != null) {
                                    con.close();
                                }
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

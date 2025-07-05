<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, java.sql.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Get session data
    String username = (String) session.getAttribute("user");
    String email = (String) session.getAttribute("email1");

    // Database connection setup
    Connection con = null;
    PreparedStatement ps = null;
    String dbURL = "jdbc:mysql://localhost:3306/homomorphic";
    String dbUser = "root";
    String dbPass = "root";
    String uploadDirectory = "C:/uploads/";  // Ensure this path exists and is writable

    // Check if request is a multipart (file upload) request
    if (ServletFileUpload.isMultipartContent(request)) {
        // Configure file upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            // Parse the request to get file items
            List<FileItem> formItems = upload.parseRequest(request);
            String fileName = null;

            // Iterate over form items (fields in the form)
            for (FileItem item : formItems) {
                if (!item.isFormField()) {
                    // If the item is a file field
                    fileName = new File(item.getName()).getName(); // Get the file name
                    String filePath = uploadDirectory + File.separator + fileName; // Save file with its name

                    // Write the file to the server
                    File storeFile = new File(filePath);
                    item.write(storeFile);  // Save the file to disk
                } else {
                    // If the item is a form field (e.g., username, email)
                    if ("username".equals(item.getFieldName())) {
                        username = item.getString();
                    } else if ("email".equals(item.getFieldName())) {
                        email = item.getString();
                    }
                }
            }

            // If a file was uploaded, store only the file name in the database
            if (fileName != null) {
                // Establish database connection
                try {
                    con = DriverManager.getConnection(dbURL, dbUser, dbPass);
                    String sql = "INSERT INTO user_files (username, email, file_name) VALUES (?, ?, ?)";
                    ps = con.prepareStatement(sql);
                    ps.setString(1, username);
                    ps.setString(2, email);
                    ps.setString(3, fileName);  // Store only the file name

                    // Execute the insert statement
                    int rows = ps.executeUpdate();
                    if (rows > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert(\"File uploaded and data saved successfully!\")");
                        out.println("</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("upload.jsp");
                        rd.include(request, response);
                    } else {
                        out.println("<h3>Error saving data to the database.</h3>");
                    }
                } catch (SQLException e) {
                    out.println("<h3>Database connection failed: " + e.getMessage() + "</h3>");
                } finally {
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                }
            } else {
                out.println("<h3>Error: File not uploaded. Please try again.</h3>");
            }

        } catch (Exception ex) {
            out.println("<h3>Error occurred while uploading file: " + ex.getMessage() + "</h3>");
        }
    } else {
        out.println("<h3>Form must be submitted as multipart form data.</h3>");
    }
%>

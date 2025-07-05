<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="application/octet-stream" %>
<%@ page language="java" %>

<%
    // Get the file name from the request parameter
    String fileName = request.getParameter("fileName");

    try {
        if (fileName != null && !fileName.isEmpty()) {
            // URL decode the file name to handle special characters and spaces
            fileName = java.net.URLDecoder.decode(fileName, "UTF-8");

            // Define the path to the file (replace with your actual file path)
            String filePath = "C:/uploads/" + fileName;  // Direct absolute path to file

            File file = new File(filePath);

            // Check if the file exists before proceeding
            if (file.exists()) {
                // Set response headers for file download
                response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                response.setContentType("application/octet-stream");

                // Transfer file using FileInputStream and OutputStream
                FileInputStream inStream = new FileInputStream(file);
                     OutputStream outStream = response.getOutputStream();

                    byte[] buffer = new byte[1024];
                    int bytesRead;

                    // Write the file content to the response output stream
                    while ((bytesRead = inStream.read(buffer)) != -1) {
                        outStream.write(buffer, 0, bytesRead);
                    }

                    // Ensure that the output stream is flushed
                    outStream.flush();
                
            } else {
                out.println("Error: The requested file does not exist.");
            }
        } else {
            out.println("Error: Invalid or missing file name parameter.");
        }
    } catch (Exception e) {
        // Catch any other unexpected errors
        e.printStackTrace();
        out.println("Error: Invalid file request or an unexpected error occurred.");
    }
%>

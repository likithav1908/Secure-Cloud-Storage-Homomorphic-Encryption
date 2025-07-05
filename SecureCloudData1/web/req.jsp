<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="pick.mail"%>
<%@ page import="java.util.Random"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="java.security.MessageDigest"%>
<%
    String requestid = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String file = request.getParameter("file"); // Correct variable name (from 'phone' to 'file')

    System.out.println(email);

    // Generate a 4-digit OTP
    Random r = new Random();
    String otp = Integer.toString(r.nextInt(10000));  
    otp = String.format("%04d", Integer.parseInt(otp));

    // Create an instance of the mail class to send OTP
    pick.mail m = new pick.mail(); 
    String subject = "One Time Password";
    String message = "OTP: " + otp;

    // Send the email (ensure correct credentials and settings)
    m.sendFromGMail("otpsendermessage", "tsqomkanhqigptsg", email, subject, message);

    // Store values in the session
    session.setAttribute("name", name);
    session.setAttribute("otp", otp);
    System.out.println("OTP: " + otp);

    try {
        // Load the MySQL driver
        Class.forName("com.mysql.jdbc.Driver");
        
        // Establish the database connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/homomorphic", "root", "root");

        // Create an update statement to change the status
        String updateQuery = "UPDATE request SET status = ? WHERE id = ?";
        PreparedStatement ps = con.prepareStatement(updateQuery);
        
        // Set parameters for the PreparedStatement
        ps.setString(1, "OTP Sended");  // Status can be "pending" or any value you desire
        ps.setString(2, requestid);  // Use the 'id' to locate the record
        
        // Execute the update query
        ps.executeUpdate();

        out.println("<script>alert('OTP Sent to mail id and status updated successfully');</script>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error sending OTP or updating status: " + e.getMessage() + "');</script>");
    }

    // Forward to the next page
    RequestDispatcher rd = request.getRequestDispatcher("sendkey.jsp");
    rd.include(request, response);
%>

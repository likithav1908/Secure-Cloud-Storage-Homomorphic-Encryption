import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.WebServlet;

public class LoginController extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get username and password from the form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Example hardcoded credentials
        String validUsername = "cloud";
        String validPassword = "cloud";
        
        // Check if credentials are valid
        if (username != null && password != null && username.equals(validUsername) && password.equals(validPassword)) {
            // Redirect to a welcome page or user dashboard
            response.sendRedirect("cloudhome.jsp");
        } else {
            // If authentication fails, show error message
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("cloudlogin.jsp").forward(request, response);
        }
    }
}

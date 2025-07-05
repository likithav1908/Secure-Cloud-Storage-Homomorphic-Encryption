<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pick.mail"%>
<%@page import="java.util.Random"%>
<%
                 String key=request.getParameter("key");
                    String id=(String)session.getAttribute("otp");
                    String name=(String)session.getAttribute("name");
                    int a=Integer.parseInt(key);
                    int b=Integer.parseInt(id);
                        System.out.println(a);
                        System.out.println(b);
                    if(a==b){
    out.println("<script>"
            +"alert('OTP Matched')"
            +"</script>");
    RequestDispatcher rd=request.getRequestDispatcher("downloadfile.jsp");
    rd.include(request, response); }
           else{
    out.println("<script>"
            +"alert('Your OTP Is Incorrect')"
            +"</script>");
    RequestDispatcher rd=request.getRequestDispatcher("orderstatus.jsp");
    rd.include(request, response);
            }
            

%>
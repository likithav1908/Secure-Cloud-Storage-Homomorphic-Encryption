<%@page import="java.sql.*"%>
<%try{
              String id=request.getParameter("id");
            String name=request.getParameter("name");
            String email=request.getParameter("email");
          String file=request.getParameter("file");
         
            String  i="Waiting";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/homomorphic","root","root");
           PreparedStatement ps=con.prepareStatement("insert into request(id,username,email,file_name,status)values('"+id+"','"+name+"','"+email+"','"+file+"','"+i+"')");
             System.out.println(ps); 
             ps.executeUpdate();
                out.println("<script type=\"text/javascript\">"); 			
            out.println("alert(\"Request Send Cloud \")");
            out.println("</script>"); 
            RequestDispatcher rd=request.getRequestDispatcher("downloadrequest.jsp");
            rd.include(request, response);  
            }
        catch(Exception e){
            System.out.println(e);
            out.println("<script type=\"text/javascript\">"); 			
            out.println("alert(\"Please Try Again.\")");
            out.println("</script>"); 
            RequestDispatcher rd=request.getRequestDispatcher("downloadrequest.jsp");
            rd.include(request, response);  
        }
    
%>
<%-- 
    Document   : orderstatus
    Created on : 26 Oct, 2024, 10:42:41 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">

 <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <style>
  .card {
                margin-top: 10px;
                border-radius: 15px;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                overflow: hidden;
                background: #fff;
                width: 400px;
                height: 300px;
                margin-left: 400px;
                margin-top: 200px;
      
            }

            .card-header {
                background-color: rgb(0, 0, 255);
              color: #fff;
                padding: 5px;
                font-size: 24px;
                font-weight: 10px;
                text-align: center;
            }

            .card-body {
                padding: 30px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-control {
                border-radius: 8px;
                border: 1px solid #ddd;

                font-size: 16px;
                transition: all 0.3s ease;
            }

            .form-control:focus {
                border-color: #3498db;
                box-shadow: 0 0 8px rgba(52, 152, 219, 0.3);
            }

            .btn-primary {
                background-color: #3498db;
                border: none;
                font-size: 16px;
                font-weight: 600;
                padding: 12px 20px;
                border-radius: 8px;
                width: 100%;
                transition: all 0.3s ease-in-out;
            }

            .btn-primary:hover {
                background-color: #2980b9;
                cursor: pointer;
            }

            .card-footer {
                background-color: #f8f9fa;
                text-align: center;
                padding: 15px;
            }

            .card-footer a {
                color: #3498db;
                font-weight: 600;
                text-decoration: none;
            }

            .card-footer a:hover {
                text-decoration: underline;
            }

            /* Loader */
            #ftco-loader.show {
                display: none;
            }
            .container{
                margin-top: 10px;
            }


</style>

    <body>
        <jsp:include page="user.jsp"/>
           <!--<div class="container">-->
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h2>File Download OTP</h2>
                        </div>
                        <div class="card-body">
                            <form action="req1.jsp" method="post">
                                <div class="form-group">
                                    <label for="username">OTP</label>
                                    <input type="number" class="form-control" id="username" name="key" required>
                                </div>
                                
                                <button type="submit" class="btn btn-primary btn-block">Submit</button><br>

                                <!-- Display error messages -->
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

    
    </body>
           

</html>

<%-- 
    Document   : cloud
    Created on : 21 Nov, 2024, 6:15:50 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
        }
        
        /* Sidebar styles */
        .sidebar {
            width: 250px;
            background-color: #333;
            height: 100vh; /* Full screen height */
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
        }

        .sidebar-nav {
            list-style-type: none;
            padding: 0;
        }

        .sidebar-nav .nav-item {
            margin: 15px 0;
        }

        .sidebar-nav .nav-item a {
            text-decoration: none;
            color: white;
            padding: 10px 20px;
            display: block;
            transition: background-color 0.3s;
        }

        .sidebar-nav .nav-item a:hover {
            background-color: #575757;
        }

        .sidebar-nav .nav-item.active a {
            background-color: #4CAF50;
        }

        .sidebar-nav .nav-item a i {
            margin-right: 10px; /* Add space between the icon and the text */
            font-size: 18px; /* Adjust the icon size */
        }

        .sidebar-nav .nav-item a:hover i {
            color: #4CAF50; /* Change icon color on hover */
        }

        /* Content area */
        .content {
            margin-left: 260px; /* Adjust for sidebar width */
            padding: 20px;
            width: calc(100% - 260px);
        }

        .container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
            text-align: center;
        }
    </style>
    <body>
            <aside class="sidebar">
        <ul class="sidebar-nav">
             <li class="nav-item active">
                <a href="index.html" class="nav-link">
                    <i class="fa fa-cloud"></i> WELCOME CLOUD</a>
              
            </li>
<!--            <li class="nav-item">
                <a href="index.html" class="nav-link">
                    <i class="fa fa-address-book"></i> Authorized User
                </a>
            </li>-->
            <li class="nav-item">
                <a href="viewrequest.jsp" class="nav-link">
                    <i class="fa fa-table"></i> View Request
                </a>
            </li>
            <li class="nav-item">
                <a href="viewallfiles.jsp" class="nav-link">
                    <i class="fa fa-table"></i> View All Files
                </a>
            </li>
            <li class="nav-item">
                <a href="sendkey.jsp" class="nav-link">
                    <i class="fa fa-key"></i> Send Key
                </a>
            </li>
               <li class="nav-item">
                   <a href="viewalluser.jsp" class="nav-link">
                    <i class="fa fa-users"></i>View All User
                </a>
            </li>
               <li class="nav-item">
                <a href="cloudlogin.jsp" class="nav-link">
                    <i class="fa fa-sign-out"></i> Logout
                </a>
            </li>
        </ul>
    </aside>
        
    </body>
</html>

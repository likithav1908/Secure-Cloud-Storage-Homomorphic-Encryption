<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Cloud Sign In</title>
    <style>
        body {
            font-family: 'Work Sans', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 50px 15px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 450px;
            margin-top: 100px;
            margin-left: 350px;
        }

        .form-container label {
            font-weight: 500;
            margin-bottom: 5px;
            color: #333;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .form-container button[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .form-container button[type="submit"]:hover {
            background-color: #218838;
        }

        .form-container a {
            text-decoration: none;
            color: #007bff;
        }

        .form-container a:hover {
            text-decoration: underline;
        }

        .error {
            color: #ff0000;
            background-color: #ffe6e6;
            padding: 10px;
            border-radius: 5px;
            margin-top: 20px;
            text-align: center;
        }

        /* Navbar styling */
        nav {
            background-color: #343a40;
            height: 70px;
        }

        .navbar-nav .nav-item .nav-link {
            color: #fff;
        }

        .navbar-nav .nav-item .nav-link:hover {
            color: #28a745;
        }
    </style>
</head>

<body style="background-color: blue;">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active"><a href="index.html" class="nav-link">Home</a></li>
                    <li class="nav-item"><a href="usersignin.jsp" class="nav-link">User</a></li>
                    <li class="nav-item"><a href="cloudlogin.jsp" class="nav-link">Cloud</a></li>
                    <li class="nav-item cta"><a href="usersignup.jsp" class="nav-link"><span>Get started</span></a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Content -->
    <div class="content">
        <div class="container">
            <div class="form-container">
                <h2>Cloud Sign In</h2>
                <form action="cloudlogin.jsp" method="POST">
                    <input type="text" name="username" class="input-field" placeholder="Username" required>
                    <input type="password" name="password" class="input-field" placeholder="Password" required>
                    <button type="submit">Sign In</button>
                </form>

                <%-- Login logic handled within this page --%>
                <%
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");

                    // Hardcoded credentials for validation (in a real app, use a database)
                    String validUsername = "cloud";
                    String validPassword = "cloud";

                    // If credentials are provided and are valid, redirect to a success page
                    if (username != null && password != null) {
                        if (username.equals(validUsername) && password.equals(validPassword)) {
                            // Redirect to welcome page after successful login
                            response.sendRedirect("cloudhome.jsp");
                            return; // Make sure to stop further execution
                        } else {
                            // Authentication failed, set error message
                            request.setAttribute("errorMessage", "Invalid username or password.");
                        }
                    }
                %>

                <%-- Show error message if authentication fails --%>
                <c:if test="${not empty errorMessage}">
                    <div class="error">${errorMessage}</div>
                </c:if>
            </div>
        </div>
    </div>

</body>

</html>

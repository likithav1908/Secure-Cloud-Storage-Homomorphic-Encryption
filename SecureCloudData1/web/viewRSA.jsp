<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, java.security.*, javax.crypto.*, javax.crypto.spec.SecretKeySpec, java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="user.jsp"/>
<%
    String fileName = request.getParameter("file");
    String encryptedData = ""; // Variable to hold the encrypted result

    try {
        // Load the file (use the file name passed as parameter)
        File file = new File("C:/uploads/" + fileName);
        FileInputStream fileInputStream = new FileInputStream(file);
        byte[] fileData = new byte[(int) file.length()];
        fileInputStream.read(fileData);
        fileInputStream.close(); // Close the input stream after reading the file

        // Generate a symmetric AES key for encrypting the file data
        KeyGenerator keyGen = KeyGenerator.getInstance("AES");
        keyGen.init(256); // AES key size (can also use 128 or 192 bits)
        SecretKey secretKey = keyGen.generateKey();

        // Encrypt the file data using AES
        Cipher aesCipher = Cipher.getInstance("AES");
        aesCipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] encryptedFileData = aesCipher.doFinal(fileData);

        // Encode the encrypted file data in Base64 for easier display
        String encryptedFileBase64 = Base64.getEncoder().encodeToString(encryptedFileData);

        // Now encrypt the AES key with RSA
        // Generate RSA key pair
        KeyPairGenerator rsaKeyGen = KeyPairGenerator.getInstance("RSA");
        rsaKeyGen.initialize(2048);  // Use a 2048-bit RSA key size
        KeyPair rsaKeyPair = rsaKeyGen.generateKeyPair();

        PublicKey rsaPublicKey = rsaKeyPair.getPublic();

        // Encrypt the AES key using RSA
        Cipher rsaCipher = Cipher.getInstance("RSA");
        rsaCipher.init(Cipher.ENCRYPT_MODE, rsaPublicKey);
        byte[] encryptedAESKey = rsaCipher.doFinal(secretKey.getEncoded());

        // Encode the RSA-encrypted AES key in Base64 for easier display
        String encryptedAESKeyBase64 = Base64.getEncoder().encodeToString(encryptedAESKey);

        // Combine the encrypted file data and the encrypted AES key to return
        encryptedData = "Encrypted File Data (Base64): " + encryptedFileBase64 + "<br/>" +
                        "Encrypted AES Key (Base64): " + encryptedAESKeyBase64;

    } catch (Exception e) {
        encryptedData = "Error: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>RSA and AES Encryption</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                color: #333;
                margin: 0;
                padding: 20px;
            }

            h2 {
                color: #4CAF50;
                text-align: center;
                margin-top: 20px;
            }

            .container {
                max-width: 800px;
                margin-left: 300px;
                padding: 20px;
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                overflow: auto; /* Ensures the content is scrollable if it overflows */
                position: relative; /* Needed for the close button positioning */
                max-height: 600px; /* Limits the container height to ensure scrolling */
            }

            p {
                font-size: 14px;
                line-height: 1.6;
                white-space: pre-wrap;
                word-wrap: break-word;
                overflow-wrap: break-word;
            }

            .btn {
                padding: 10px 20px;
                font-size: 14px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                text-decoration: none;
                display: inline-block;
               
            }

            .btn:hover {
                background-color: #45a049;
                color: black;
            }

            .back-btn {
                text-align: center;
            }

            .back-btn a {
                font-size: 16px;
                 color: white;
                text-decoration: none;
                padding: 5px 10px;
                border: 1px solid #4CAF50;
                border-radius: 4px;
                margin-top: 750px;
                margin-right: 200px;
            }

            .back-btn a:hover {
                background-color: #4CAF50;
                color: #000;
            }

            /* Close Button Style */
            .close-btn {
                position: absolute;
                top: 10px;
                right: 10px;
                background-color: #f44336;
                color: white;
                font-size: 20px;
                border: none;
                border-radius: 50%;
                width: 30px;
                height: 30px;
                text-align: center;
                cursor: pointer;
            }

            .close-btn:hover {
                background-color: #d32f2f;
            }
        </style>
    </head>
    <body>
        <div class="container">
           
            <h2>RSA Encrypted Data</h2>
            <p><%= encryptedData %></p>
           
          
        </div>
               <div class="back-btn">
                   <a href="userviewfiles.jsp" class="btn">Back User View Files</a>
            </div>
    </body>
</html>

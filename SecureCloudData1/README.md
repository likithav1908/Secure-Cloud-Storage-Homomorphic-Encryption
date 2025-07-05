# 🔐 Secure Cloud Storage System using Homomorphic Encryption

This project demonstrates a secure and privacy-preserving cloud storage system using advanced cryptographic techniques. Users can upload encrypted files, and administrators can manage file access — all while ensuring that sensitive data remains confidential using homomorphic encryption methods such as **RSA**, **Paillier**, and **ElGamal**.

---

## 🛡️ Key Features

- 🔒 Encrypt files before upload using chosen encryption algorithm
- 👤 User and Admin login system with file upload/download privileges
- 🗂️ Manage user access requests and file sharing securely
- 🔐 Supports three encryption algorithms: RSA, Paillier (homomorphic), and ElGamal
- 📋 File tracking, viewing, and access control via Admin dashboard

---

##  Encryption Algorithms Used

1. **RSA (Rivest–Shamir–Adleman)**
   - Asymmetric encryption
   - Used for encrypting metadata and small data portions

2. **Paillier Cryptosystem**
   - Homomorphic encryption that allows computations on ciphertexts
   - Supports addition of encrypted values without decryption

3. **ElGamal Encryption**
   - Public-key cryptosystem with semantic security
   - Useful for randomized encryption with forward secrecy

---

## 🧰 Technologies Used

| Layer        | Tools/Technologies                          |
|--------------|---------------------------------------------|
| Frontend     | JSP, HTML, CSS                              |
| Backend      | Java (Servlets), JDBC                       |
| Database     | MySQL or Oracle                             |
| Encryption   | Java implementations of RSA, Paillier, ElGamal |
| Server       | Apache Tomcat                               |
| Versioning   | Git, GitHub                                 |

---

## 📁 Project Structure

SecureCloudData1/
├── build/ # Build-generated files (optional)
├── nbproject/ # NetBeans project config
├── src/ # Java source code
│ ├── controller/ # Servlet files (Login, Upload, etc.)
│ ├── encryption/ # RSA, Paillier, ElGamal logic
│ └── model/ # DBConnection, file models
├── web/ # JSP files (UI)
│ ├── login.jsp
│ ├── upload.jsp
│ ├── viewallfiles.jsp
│ ├── viewalluser.jsp
│ ├── viewrequest.jsp
│ └── ... (other JSPs)
├── build.xml # Apache Ant build file
├── README.md # Project documentation


---

## ⚙️ How to Run the Project

### 1. Set Up Environment
- Install **Java JDK (8 or higher)**
- Install **Apache Tomcat** server (8.5 or higher)
- Install **MySQL** or **Oracle DB**
- Use **Eclipse** or **NetBeans** for development

### 2. Database Configuration
- Create a new database (e.g., `secure_cloud`)
- Run the SQL script provided in `DB/schema.sql`
- Update DB credentials in `DBConnection.java`

### 3. Deploy and Run
- Import the project into Eclipse or NetBeans
- Configure Tomcat and deploy the project
- Access the web app at:

http://localhost:8080/SecureCloudData1/


---

## 👤 User Roles

### 🧑‍💼 Admin
- View all users
- Manage file upload requests
- Approve/deny file access
- View logs and audit activities

### 👩‍💻 User
- Register and log in
- Upload files using selected encryption method
- Request access to files
- Download and decrypt files

---

## 📷 Screenshots (Optional)
> *(Add screenshots here like login page, upload interface, admin dashboard if available)*

---

## 📈 Future Enhancements

- 🔐 Hybrid RSA encryption for better performance
- ☁️ Integration with AWS S3 / Google Cloud for actual storage
- 📧 Email verification and OTP login
- 📜 Activity logs and analytics
- 🔍 Searchable encrypted data using advanced cryptographic indexing

---

## 🙋‍♀️ Author

**Likitha V**  
GitHub: [@likithav1908](https://github.com/likithav1908)

---

## 📜 License

This project is licensed under the **MIT License**.  
Feel free to use, modify, and share for academic or research purposes.

---

## ⭐️ Support

If you found this project helpful, give it a ⭐️ on GitHub and share it with others!



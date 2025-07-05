package pick;

import java.util.*;
import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.*;
import javax.mail.internet.*;

public class mail {

    public void sendFromGMail(String from, String pass, String to, String subject, String message1) {
        final String username = from;
        final String password = pass;
        
        Properties prop = new Properties();
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(prop, new javax.mail.Authenticator() { 
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Customize the email body
            String body = "Dear User,\n\n";
            body += message1; // Include the message from the caller
          

            // Create and send the email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(body); // Set the email body

            // Send the email
            Transport.send(message);
            System.out.println("Email sent successfully!");
            

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
    
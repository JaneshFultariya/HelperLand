package helperland.service;


import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Service;

@Service
public class EmailService {
	
//
//	Properties prop = System.getProperties();
//	prop.put("mail.smtp.auth", true);
//	prop.put("mail.smtp.starttls.enable", "true");
//	prop.put("mail.smtp.host", "smtp.mailtrap.io");
//	prop.put("mail.smtp.port", "25");
//	prop.put("mail.smtp.ssl.trust", "smtp.mailtrap.io");
	
	
	
	public static void SendEmail() {
		Properties prop = new Properties();
		prop.put("mail.smtp.auth", true);
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.mailtrap.io");
		prop.put("mail.smtp.port", "25");
		prop.put("mail.smtp.ssl.trust", "smtp.mailtrap.io");
		
		
		Session session = Session.getInstance(prop, new Authenticator() {
		    @Override
		    protected PasswordAuthentication getPasswordAuthentication() {
		        return new PasswordAuthentication("f773758cd3ae4c", "4bef7c8b37b133");
		    }
		});
		
		session.setDebug(true);
		
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("helperland@gmail.com"));
			message.setRecipients(
					  Message.RecipientType.TO, InternetAddress.parse("ljcupssip@gmail.com"));
					message.setSubject("Mail Subject");

					String msg = "This is my first email using JavaMailer";
					message.setText(msg);
//					MimeBodyPart mimeBodyPart = new MimeBodyPart();
//					mimeBodyPart.setContent(msg, "text/html; charset=utf-8");
//
//					Multipart multipart = new MimeMultipart();
//					multipart.addBodyPart(mimeBodyPart);
//
//					message.setContent(multipart);

					Transport.send(message);
					
					System.out.println("Success");
					
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] arr) {
		SendEmail();
	}
}

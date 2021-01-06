package login;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

public class LoginSendMail {
		private String code;
	
	 public String getCode() {
			return code;
		}

	public void findIdMail(/*String email*/) {//파라미터 다른 오버로드 생성자들로 바꿀건지 고민
		//파라미터로 받아오면 지울부분!
		  String email = "";
		  
	      char ranChar1 = (char) ((int)(Math.random()*(90-65+1))+65); 
	      char ranChar2 = (char) ((int)(Math.random()*(90-65+1))+65); 
	      char ranChar3 = (char) ((int)(Math.random()*(90-65+1))+65);
	      char ranChar4 = (char) ((int)(Math.random()*(90-65+1))+65);
	      int ranNum1 = (int)(Math.random()*(9-1+1))+1;
	      int ranNum2 = (int)(Math.random()*(9-1+1))+1;
	      int ranNum3 = (int)(Math.random()*(9-1+1))+1;
	      int ranNum4 = (int)(Math.random()*(9-1+1))+1;

	      code =new String(""+ ranChar1 +ranChar2 +ranNum1 +ranNum2 + ranChar3+ranNum3 +ranChar4 +ranNum4 );
	      
	      
	        String user = "bookmanagerbit@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
	        String password = "";   // 패스워드(비워둠)

	        // SMTP 서버 정보를 설정
	        Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com"); 
	        prop.put("mail.smtp.port", 465); 
	        prop.put("mail.smtp.auth", "true"); 
	        prop.put("mail.smtp.ssl.enable", "true"); 
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	        
	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });

	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(user));

	            //수신자메일주소
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 

	            // Subject
	            message.setSubject("아이디 찾기 인증번호 안내"); //메일 제목

	            // Text
	            message.setText("아이디 찾기 인증번호는"+code+"입니다 ");    //메일 내용

	            // send the message
	            Transport.send(message); ////전송
	           System.out.println( "아이디 인증번호 발송 완료!"+code);
	           
	        } catch (AddressException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (MessagingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	    }
	
	public void findPWMail(String id,String email,String getPassword) {
	      
	        String user = "bookmanagerbit@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
	        String password =  "";   // 패스워드(비워둠)

	        // SMTP 서버 정보를 설정한다.
	        Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com"); 
	        prop.put("mail.smtp.port", 465); 
	        prop.put("mail.smtp.auth", "true"); 
	        prop.put("mail.smtp.ssl.enable", "true"); 
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	        
	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });

	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(user));

	            //수신자메일주소
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 

	            // Subject
	            message.setSubject("비트도서관 비밀번호 찾기  안내"); //메일 제목

	            // Text
	            message.setText(id+"님의 비밀번호는 "+getPassword+"입니다 ");    //메일 내용

	            // send the message
	            Transport.send(message); //전송
	           System.out.println( "비밀번호 찾기 인증번호 발송 완료!"+getPassword);
	           
	        } catch (AddressException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (MessagingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	    }
	

}

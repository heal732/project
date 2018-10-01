package kr.co.vol;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

public class Snippet {
	public static void naverMailSend(String email,String tmpPw,HttpServletRequest request,String id) {
	        String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
	        final String user = "xogns159"; 
	        final String password = "dkdltldkdn";       
	        String path=request.getContextPath();
	        System.out.println("받아온 이메일: "+email);
	        // SMTP 서버 정보를 설정한다.
	        Properties props = new Properties();
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", 587);
	        props.put("mail.smtp.auth", "true");
	        
	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });
	
	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(user));
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
	
	            // 메일 제목
	            message.setSubject("임시 비밀번호 발급");
	
	            // 메일 내용
	      
	            StringBuffer str= new StringBuffer();
	            str.append("<div style='width:120px;padding:10px;border-top:1px solid #e4e4e4;border-left:1px solid #e4e4e4;border-right:1px solid #e4e4e4;background-color:#f4f4f4;font-size:14px;font-weight:bold;'>비밀번호안내</div>");
	        	str.append("<div style='border-top:1px solid #e4e4e4;'></div>");
	        	str.append("<div style='padding:20px;'>");				
	        	str.append("<strong style='color:#000;'>");
	        	str.append(id);
	        	str.append("</strong> 회원님 안녕하세요<br>회원님의 임시비밀번호는 다음과 같습니다.</div>");
	        	str.append("<div style='padding:20px;border:1px solid #e4e4e4;'>");				
	        	str.append("<table cellpadding='0' cellspacing='0' border='0' style='width:100%;'>");					
	        	str.append("<tbody><tr>");
	        	str.append("<td width='120' height='25' style='font-size:14px;font-weight:bold;vertical-align:middle;'>아이디</td>");
	        	str.append("<td style='font-size:14px;border-left:1px solid #e4e4e4;padding-left:20px;vertical-align:middle;'>");
	        	str.append(id);
	        	str.append("</tr><tr>");
	        	str.append("<td width='120' height='25' style='font-size:14px;font-weight:bold;vertical-align:middle;'>비밀번호</td>");	      
	        	str.append("<td style='font-size:14px;border-left:1px solid #e4e4e4;padding-left:20px;vertical-align:middle;'>");
	        	str.append(tmpPw);
	        	str.append("</td>");
	        	str.append("</tr></tbody></table></div>");
	        	str.append("<div style='text-align:center;padding-top:20px;'>");
	        	str.append("<a href='http://192.168.0.77:8090/vol/' target='_blank' rel='noreferrer noopener'>");
	        	str.append("<img src='http://192.168.0.77:8090");
	        	str.append(path);
	        	str.append("/resources/images/");
	        	str.append("volunteer_btn.png' style='width:300px;'></a></div>");
	        	 message.setContent(str.toString(),"text/html; charset=utf-8");
	            // send the message
	            Transport.send(message);
	            System.out.println("Success Message Send");

	
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        }
	    }
}


//package com.yedam.member.command;
//
//import java.io.IOException;
//import java.net.PasswordAuthentication;
//import java.util.Properties;
//import java.util.Random;
//
//import javax.mail.Message;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.websocket.Session;
//
//import com.sun.jdi.connect.Transport;
//import com.yedam.common.Command;
//import com.yedam.member.service.MemberService;
//import com.yedam.member.service.MemberServiceMybatis;
//import com.yedam.member.vo.MemberVO;
//
//public class FindPwd implements Command {
//
//	@Override
//	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String name = req.getParameter("name");
//		String email = req.getParameter("email");
//		String id = req.getParameter("id");
//
//		MemberService service = new MemberServiceMybatis();
//
//		MemberVO fPwd = service.findPwd(name, email, id);
//
//		// fId 가 뭔가를 반환받았다면(즉, 아이디를 받환받았다면)
//		if (fPwd == null) {
//			// 에러 메시지 출력 후 다시 findIdForm화면으로
//			req.setAttribute("error", "해당하는 계정이 없는데요");
//			return "member/findIdForm.tiles";
//		}
//
//		final String fromEmail = "asdasdsadsad@gmail.com"; // replace with your email
//		final String password = "asdsad123"; // replace with your email password
//		final String toEmail = fPwd.getMemEmail();
//
//		////////////////////////////////////////////////////////////////////////////////////////////
//
//		Properties props = new Properties();
//		props.put("mail.smtp.host", "smtp.gmail.com"); // for gmail
//		props.put("mail.smtp.port", "587");
//		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.starttls.enable", "true");
//
//		////////////////////////////////////////////////////////////////////////////////////////////
//
//		// 인증 번호 생성기
//		StringBuffer temp = new StringBuffer();
//		Random rnd = new Random();
//		for (int i = 0; i < 10; i++) {
//			int rIndex = rnd.nextInt(3);
//			switch (rIndex) {
//			case 0:
//				// a-z
//				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
//				break;
//			case 1:
//				// A-Z
//				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
//				break;
//			case 2:
//				// 0-9
//				temp.append((rnd.nextInt(10)));
//				break;
//			}
//		}
//		String AuthenticationKey = temp.toString();
//		System.out.println(AuthenticationKey);
//
//		////////////////////////////////////////////////////////////////////////////////////////////
//
//		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(fromEmail, password);
//			}
//		});
//
//		////////////////////////////////////////////////////////////////////////////////////////////
//		////////////////////////////////////////////////////////////////////////////////////////////
//
//		// email 전송
//		try {
//			MimeMessage msg = new MimeMessage(session);
//			msg.setFrom(new InternetAddress(fromEmail, "Yedammmmmmmmmmm"));
//			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
//
//			// 메일 제목
//			msg.setSubject("안녕하세요 예담 인증 메일입니다.");
//			// 메일 내용 (바디)
//			msg.setText("인증 번호는 :" + temp);
//
//			Transport.send(msg);
//			System.out.println("이메일 전송 완료!");
//
//		} catch (Exception e) {
//			e.printStackTrace();// TODO: handle exception
//		}
//
//		////////////////////////////////////////////////////////////////////////////////////////////
//
//		return "";
//	}
//}
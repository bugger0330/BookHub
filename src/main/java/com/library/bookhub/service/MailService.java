package com.library.bookhub.service;

import java.util.concurrent.ThreadLocalRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.mail.internet.MimeMessage;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@Transactional
public class MailService {
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	
	// 인증 번호
	private static String generatedCode;
	
	// 메일 발송
	public void sendCodeByEmail(String receiver) throws Exception {
		// 인증코드 생성
		int code = ThreadLocalRandom.current().nextInt(100000,1000000); // 랜덤 생성
		generatedCode = ""+code;
		log.info("전송된 인증 번호 : "+generatedCode);
		
		String sender = "BookHub";
		String title = "BookHub 인증코드";
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		message.addRecipients(MimeMessage.RecipientType.TO, receiver); // 받은 이
		message.setSubject(title); // 제목 설정
		message.setFrom(sender); // 보내는 사람 설정
		
		// 메일 내용 설정
		String msgOfEmail= "";
		msgOfEmail += "<div style='margin:20px;'>";
        msgOfEmail += "<br>";
        msgOfEmail += "<div  align='center' style='border:1px solid black; font-family:verdana';>";
        msgOfEmail += "<h3 style='color:blue;'>이메일 인증 번호입니다.</h3>";
        msgOfEmail += "<div style='font-size:130%'>";
        msgOfEmail += "<strong>"+ generatedCode + "</strong><div><br/> ";
        msgOfEmail += "</div>";
		
		message.setText(msgOfEmail, "utf-8", "html");
		
		javaMailSender.send(message); // 전송
		
	}
	
	// 인증 번호 확인
	public int confirmCodeByEmail(String code) {
		
		if (code.equals(generatedCode)) {
            log.info("인증 번호 일치 --");
            return 1;
        }else {
            log.error("인증 번호 불일치 --");
            return 0;
        }
	}
	
	
}

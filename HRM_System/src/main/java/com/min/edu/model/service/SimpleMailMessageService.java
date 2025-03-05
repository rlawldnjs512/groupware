package com.min.edu.model.service;

import java.util.Random;

import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;




@Service
public class SimpleMailMessageService {

    private final MailSender mailSender;

    public SimpleMailMessageService(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    // 이메일 보내기 메소드
    public void sendEmail(String emailAddress) {

        // 랜덤 인증번호 생성
        String authCode = generateRandomAuthCode();

        SimpleMailMessage msg = new SimpleMailMessage();
        // 받는 사람 이메일
        msg.setTo(emailAddress);
        // 이메일 제목
        msg.setSubject("비밀번호 재설정");
        // 이메일 내용 (인증번호 포함)
        msg.setText("비밀번호 재설정을 위한 인증번호는 " + authCode + "입니다.");

        try {
            // 메일 보내기
            this.mailSender.send(msg);
            System.out.println("이메일 전송 성공!");
        } catch (MailException e) {
            throw e;
        }
    }

    // 랜덤 인증번호 생성 메소드
    private String generateRandomAuthCode() {
        Random random = new Random();
        StringBuilder authCode = new StringBuilder();
        
        // 인증번호 6자리 랜덤 숫자 생성
        for (int i = 0; i < 6; i++) {
            authCode.append(random.nextInt(10)); // 0~9 사이의 숫자
        }
        
        return authCode.toString();
    }
}









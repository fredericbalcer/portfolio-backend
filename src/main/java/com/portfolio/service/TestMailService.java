package com.portfolio.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class TestMailService {

    private final JavaMailSender mailSender;

    public TestMailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendTestEmail() {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo("TON_EMAIL_TEST@gmail.com"); // mets ton email de test
        message.setSubject("Test Mail Railway");
        message.setText("Ceci est un mail de test depuis Railway !");
        mailSender.send(message);
    }
}

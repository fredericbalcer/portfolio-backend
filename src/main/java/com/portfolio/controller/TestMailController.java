package com.portfolio.controller;

import com.portfolio.service.TestMailService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestMailController {

    private final TestMailService testMailService;

    public TestMailController(TestMailService testMailService) {
        this.testMailService = testMailService;
    }

    @GetMapping("/api/test-mail")
    public String testMail() {
        try {
            testMailService.sendTestEmail();
            return "Mail envoyé ! Vérifie ta boîte.";
        } catch (Exception e) {
            e.printStackTrace();
            return "Erreur lors de l'envoi : " + e.getMessage();
        }
    }
}

package com.portfolio.service;

import org.springframework.stereotype.Service;

import com.portfolio.dto.ContactDTO;
import com.portfolio.model.ContactMessage;
import com.portfolio.repository.ContactMessageRepository;

@Service
public class ContactService {

    private final ContactMessageRepository repository;
    private final EmailService emailService;

    public ContactService(ContactMessageRepository repository,
                          EmailService emailService) {
        this.repository = repository;
        this.emailService = emailService;
    }

    public void handleContact(ContactDTO dto) {

        // 1. Sauvegarde en DB
        ContactMessage message = new ContactMessage();
        message.setName(dto.getName());
        message.setEmail(dto.getEmail());
        message.setMessage(dto.getMessage());

        repository.save(message);

        // 2. Envoi du mail
//        String subject = "📩 Nouveau message depuis le portfolio";
//        String body =
//                "Nom : " + dto.getName() + "\n"
//              + "Email : " + dto.getEmail() + "\n\n"
//              + "Message :\n"
//              + dto.getMessage();

//        emailService.sendContactEmail(
//                "frederic.balcer@skynet.be",
//                subject,
//                body
//        );
    }
}

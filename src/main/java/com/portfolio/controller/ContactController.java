package com.portfolio.controller;

import com.portfolio.dto.ContactDTO;
import com.portfolio.service.ContactService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@CrossOrigin("*")
@RestController
@RequestMapping("/api")
public class ContactController {

    private final ContactService contactService;

    public ContactController(ContactService contactService) {
        this.contactService = contactService;
    }

    @PostMapping("/contact")
    public ResponseEntity<String> sendContact(@Valid @RequestBody ContactDTO contactDTO) {

        contactService.handleContact(contactDTO);

        return ResponseEntity.ok("Message reçu !");
    }
}

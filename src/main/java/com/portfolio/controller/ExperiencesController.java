package com.portfolio.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.portfolio.model.Experiences;
import com.portfolio.repository.ExperiencesRepository;

@RestController
@RequestMapping("/api/experiences")
@CrossOrigin(origins = "*")
public class ExperiencesController {
    private final ExperiencesRepository experiencesRepository;

    public ExperiencesController(ExperiencesRepository experiencesRepository) {
        this.experiencesRepository = experiencesRepository;
    }

    @GetMapping
    public List<Experiences> getAllExperiences() {
        return experiencesRepository.findAll();
    }
}


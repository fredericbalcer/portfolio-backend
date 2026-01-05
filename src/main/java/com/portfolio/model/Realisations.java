package com.portfolio.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Realisations {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String description;

    @ManyToOne
    @JoinColumn(name = "experience_id")
    @JsonBackReference
    private Experiences experiences;
    
    @OneToMany(mappedBy = "realisation", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<SkillUsages> skills;


	public Realisations() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Experiences getExperiences() {
		return experiences;
	}

	public void setExperiences(Experiences experiences) {
		this.experiences = experiences;
	}
	
	
}
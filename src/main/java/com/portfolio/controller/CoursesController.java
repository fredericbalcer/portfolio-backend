package com.portfolio.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.portfolio.model.Courses;
import com.portfolio.repository.CoursesRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class CoursesController {
	
	private final CoursesRepository coursesRepository;

    public CoursesController(CoursesRepository coursesRepository) {
        this.coursesRepository = coursesRepository;
    }

    @GetMapping("/courses")
    public List<Courses> getAllCourses() {
        return coursesRepository.findByCheckedTrue();
    }	
    
    @GetMapping("/allcourses")
    public List<Courses> getCourses() {
        return coursesRepository.findByCheckedFalse();
    }	    

    @PutMapping("/courses/{id}/uncheck")
    public ResponseEntity<Void> uncheckCourse(@PathVariable Long id) {

        Courses course = coursesRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Course not found"));

        course.setChecked(false);
        coursesRepository.save(course);

        return ResponseEntity.noContent().build();
    }

    @PutMapping("/courses/{id}/check")
    public ResponseEntity<Void> checkCourse(@PathVariable Long id) {

        Courses course = coursesRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Course not found"));

        course.setChecked(true);
        coursesRepository.save(course);

        return ResponseEntity.noContent().build();
    }

}

package com.portfolio.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.portfolio.model.Courses;

public interface CoursesRepository extends JpaRepository<Courses, Long>{

	List<Courses> findByCheckedTrue();
	List<Courses> findByCheckedFalse();
}

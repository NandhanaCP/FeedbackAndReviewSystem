package com.nandhana.demo.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.nandhana.demo.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Long> {
}

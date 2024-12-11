package com.nandhana.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nandhana.demo.model.Review;
import com.nandhana.demo.repository.ReviewRepository;

import java.util.List;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    public List<Review> getAllReviews() {
        return reviewRepository.findAll();
    }

    public void saveReview(Review review) {
        reviewRepository.save(review);
    }
    public void approveReview(Long reviewId) {
        Review review = reviewRepository.findById(reviewId).orElse(null);
        if (review != null) {
            review.setApproved(true);  // Assuming there's an 'approved' flag in your Review entity
            reviewRepository.save(review);
        }
    }

    // Delete a review from the database
    public void deleteReview(Long reviewId) {
        reviewRepository.deleteById(reviewId);
    }
}


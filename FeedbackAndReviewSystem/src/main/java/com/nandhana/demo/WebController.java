package com.nandhana.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nandhana.demo.model.Review;
import com.nandhana.demo.service.ReviewService;

import java.util.List;

@Controller
public class WebController {

    @Autowired
    private ReviewService reviewService;

    @GetMapping("/")
    public String index(Model model) {
        // Fetch all reviews
        List<Review> reviews = reviewService.getAllReviews();

        // Calculate average rating
        double averageRating = reviews.stream()
                                      .mapToInt(Review::getRating)
                                      .average()
                                      .orElse(0);

        // Pass data to the model
        model.addAttribute("reviews", reviews);
        model.addAttribute("averageRating", averageRating);
        return "submitReview"; // Render the JSP page
    }

    @PostMapping("/submitReview")
    public String submitReview(@RequestParam int rating, @RequestParam String comments, Model model) {
        // Save the review
        Review review = new Review();
        review.setRating(rating);
        review.setComments(comments);
        reviewService.saveReview(review);

        // Fetch updated reviews
        return "redirect:/"; // Reload the page with updated reviews
    }
    @GetMapping("/adminPage")
    public String showAdminPage(Model model) {
        List<Review> reviews = reviewService.getAllReviews();
        model.addAttribute("reviews", reviews);
        return "adminPage";
    }


    // Approve review (for example, updating status or flagging as approved)
    @RequestMapping("/approveReview")
    public String approveReview(@RequestParam("reviewId") Long reviewId) {
        reviewService.approveReview(reviewId);  // Implement logic to approve a review
        return "redirect:/adminPage";  // Redirect to admin page after approval
    }

    // Delete review
    @RequestMapping("/deleteReview")
    public String deleteReview(@RequestParam("reviewId") Long reviewId) {
        reviewService.deleteReview(reviewId);  // Implement logic to delete the review
        return "redirect:/adminPage";  // Redirect to admin page after deletion
    }
}


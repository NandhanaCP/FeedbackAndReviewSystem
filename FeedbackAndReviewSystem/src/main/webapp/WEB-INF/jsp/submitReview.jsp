<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nandhana.demo.model.Review" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Review</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <!-- Admin login button -->
    <div class="admin-login">
        <form action="/adminPage" method="get">
            <button type="submit">Admin Login</button>
        </form>
    </div>

    <div class="container">
        <h1>Submit Your Review</h1>

        <!-- Form for submitting reviews -->
        <form action="/submitReview" method="post">
            <label for="rating">Rating (1-5):</label>
            <input type="number" id="rating" name="rating" min="1" max="5" required>
            <br>
            <label for="comments">Comments:</label>
            <textarea id="comments" name="comments" required></textarea>
            <br>
            <button type="submit">Submit</button>
        </form>

        <!-- Display average rating -->
        <h2>Average Rating: <%= request.getAttribute("averageRating") %></h2>

        <!-- Reviews table -->
        <h2>All Reviews</h2>
        <table>
            <tr>
                <th>Rating</th>
                <th>Comments</th>
            </tr>
            <%
                // Retrieve the reviews from the request attribute
                List<Review> reviews = (List<Review>) request.getAttribute("reviews");
                if (reviews != null) {
                    for (Review review : reviews) {
            %>
                        <tr>
                            <td><%= review.getRating() %></td>
                            <td><%= review.getComments() %></td>
                        </tr>
            <%
                    }
                }
            %>
        </table>
    </div>
</body>
</html>

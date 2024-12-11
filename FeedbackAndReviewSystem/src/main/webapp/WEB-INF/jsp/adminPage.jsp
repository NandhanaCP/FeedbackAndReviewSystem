<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nandhana.demo.model.Review" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Review Management</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>Admin - Review Management</h1>

        <!-- Table displaying all reviews -->
        <table>
            <tr>
                <th>Rating</th>
                <th>Comments</th>
                <th>Approval Status</th>
                <th>Actions</th>
            </tr>
            <%
                List<Review> reviews = (List<Review>) request.getAttribute("reviews");
                if (reviews != null) {
                    for (Review review : reviews) {
            %>
                        <tr>
                            <td><%= review.getRating() %></td>
                            <td><%= review.getComments() %></td>
							<td><%= review.isApproved() ? "Approved" : "Pending" %></td>
                            <td>
                                <% if (!review.isApproved()) { %>
                                    <form action="<%= request.getContextPath() %>/approveReview" method="post" style="display:inline;">
                                        <input type="hidden" name="reviewId" value="<%= review.getId() %>">
                                        <button type="submit">Approve</button>
                                    </form>
                                <% } %>
                                <form action="<%= request.getContextPath() %>/deleteReview" method="post" style="display:inline;">
                                    <input type="hidden" name="reviewId" value="<%= review.getId() %>">
                                    <button type="submit">Delete</button>
                                </form>
                            </td>
                        </tr>
            <%
                    }
                }
            %>
        </table>
    </div>
</body>
</html>

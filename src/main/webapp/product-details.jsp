<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fashonstore.dao.ProductDAO, com.fashonstore.model.Product" %>
<%
    // 1. Get the product ID from the URL (e.g., ?id=1)
    String idParam = request.getParameter("id");
    Product product = null;

    if (idParam != null && !idParam.isEmpty()) {
        try {
            int productId = Integer.parseInt(idParam);
            // 2. Fetch that specific product from the database
            ProductDAO dao = new ProductDAO();
            product = dao.getProductById(productId);
        } catch (NumberFormatException e) {
            // Handle the case where someone types text instead of a number in the URL
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FashionStore - Product Details</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; }
        header { background: #333; color: #fff; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center; }
        header a { color: #fff; text-decoration: none; margin-left: 15px; font-weight: bold; }
        
        .container { max-width: 1000px; margin: 40px auto; padding: 20px; background: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .product-wrapper { display: flex; flex-wrap: wrap; gap: 40px; align-items: center; }
        
        .product-image { flex: 1; min-width: 300px; text-align: center; }
        .product-image img { max-width: 100%; border-radius: 8px; object-fit: cover; }
        
        .product-info { flex: 1; min-width: 300px; }
        .product-info h1 { font-size: 2.5em; margin-bottom: 10px; color: #333; }
        .product-info p { font-size: 1.1em; color: #555; line-height: 1.6; margin-bottom: 20px; }
        .price { color: #28a745; font-size: 2em; font-weight: bold; margin-bottom: 30px; }
        
        .btn { background: #007bff; color: white; padding: 15px 30px; text-decoration: none; border-radius: 5px; font-weight: bold; font-size: 1.2em; display: inline-block; transition: background 0.3s; }
        .btn:hover { background: #0056b3; }
        .btn-back { background: #6c757d; margin-right: 10px; }
        .btn-back:hover { background: #5a6268; }
        
        .error-message { text-align: center; padding: 50px; color: #dc3545; }
    </style>
</head>
<body>

    <header>
        <h2>FashionStore</h2>
        <!-- Navigation Bar Start -->
<nav style="background: #333; color: #fff; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 5px rgba(0,0,0,0.2);">
    <div class="logo">
        <h2 style="margin: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">FashionStore</h2>
    </div>
    
    <div class="nav-links" style="display: flex; align-items: center;">
        <a href="index.jsp" style="color: #fff; text-decoration: none; margin-left: 20px; font-weight: 500;">Home</a>
        
        <% 
            // 1. Check if the session contains the 'userName' set during LoginServlet
            String loggedInUser = (String) session.getAttribute("userName");
            
            if (loggedInUser == null) { 
        %>
            <!-- 2. Show these ONLY if NO ONE is logged in -->
            <a href="login.jsp" style="color: #fff; text-decoration: none; margin-left: 20px; font-weight: 500;">Login</a>
            <a href="register.jsp" style="color: #fff; text-decoration: none; margin-left: 20px; font-weight: 500;">Register</a>
        <% 
            } else { 
        %>
            <!-- 3. Show these ONLY when a user IS logged in -->
            <span style="color: #00d4ff; margin-left: 20px; font-weight: bold;">
                Welcome, <%= loggedInUser %>!
            </span>
            <a href="logout" style="color: #ffcc00; text-decoration: none; margin-left: 15px; font-weight: bold; border: 1px solid #ffcc00; padding: 5px 10px; border-radius: 4px;">
                Logout
            </a>
        <% 
            } 
        %>
        
        <a href="cart.jsp" style="color: #fff; text-decoration: none; margin-left: 20px; font-weight: 500; display: flex; align-items: center;">
            🛒 Cart
        </a>
    </div>
</nav>
<!-- Navigation Bar End -->
    </header>

    <div class="container">
        <% 
            // 3. If the product was found in the DB, display its details
            if (product != null) { 
        %>
            <div class="product-wrapper">
                <div class="product-image">
                    <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                </div>
                <div class="product-info">
                    <h1><%= product.getName() %></h1>
                    <div class="price">$<%= product.getPrice() %></div>
                    <p><strong>Description:</strong><br> <%= product.getDescription() %></p>
                    
                    <div style="margin-top: 20px;">
                        <a href="index.jsp" class="btn btn-back">Back to Store</a>
                        
                        <%-- THIS IS THE CRITICAL LINK: It sends the ID to your new AddToCartServlet --%>
                        <a href="add-to-cart?id=<%= product.getId() %>" class="btn">Add to Cart</a>
                    </div>
                </div>
            </div>
        <% 
            } else { 
            // 4. If someone tampered with the URL or the product doesn't exist
        %>
            <div class="error-message">
                <h2>Oops! Product not found.</h2>
                <p>We couldn't find the item you are looking for.</p>
                <a href="index.jsp" class="btn">Return to Homepage</a>
            </div>
        <% } %>
    </div>

</body>
</html>
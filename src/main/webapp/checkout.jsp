<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.fashonstore.model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Confirmed | FashionStore</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #0f0f0f;
            --card-bg: #1a1a1a;
            --text-main: #ffffff;
            --text-muted: #a0a0a0;
            --accent: #d4af37;
        }

        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-main);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .success-container {
            text-align: center;
            background: var(--card-bg);
            padding: 60px;
            border: 1px solid #222;
            max-width: 500px;
            width: 90%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* 1. The Gold Badge Animation */
        .icon-reveal {
            width: 80px;
            height: 80px;
            background-color: var(--accent);
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 30px;
            transform: scale(0);
            /* The bezier curve gives it a very subtle, luxurious bounce */
            animation: popIn 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.1) forwards; 
        }

        /* 2. The Checkmark Fade */
        .solid-check {
            width: 40px;
            height: 40px;
            fill: var(--bg-color); /* Dark check matching the background */
            opacity: 0;
            animation: fadeIn 0.6s ease 0.4s forwards;
        }

        /* 3. The Staggered Slide-Up Effect */
        .fade-up {
            opacity: 0;
            transform: translateY(25px);
            animation: slideUp 0.7s ease forwards;
        }
        
        /* Delays for each element to slide up one after the other */
        .delay-1 { animation-delay: 0.2s; }
        .delay-2 { animation-delay: 0.4s; }
        .delay-3 { animation-delay: 0.6s; }
        .delay-4 { animation-delay: 0.8s; }

        @keyframes popIn {
            100% { transform: scale(1); }
        }
        @keyframes fadeIn {
            100% { opacity: 1; }
        }
        @keyframes slideUp {
            100% { opacity: 1; transform: translateY(0); }
        }

        h1 {
            font-family: 'Playfair Display', serif;
            font-size: 2.5rem;
            margin: 10px 0;
            letter-spacing: 1px;
        }

        .order-summary {
            width: 100%;
            text-align: left;
            border-top: 1px solid #333;
            padding-top: 20px;
            margin-top: 20px;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            font-size: 0.85rem;
            margin-bottom: 12px;
            color: var(--text-muted);
        }

        .btn-home {
            display: inline-block;
            margin-top: 40px;
            padding: 15px 40px;
            background: var(--accent);
            color: black;
            text-decoration: none;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-size: 0.8rem;
            transition: 0.3s;
        }

        .btn-home:hover {
            background: white;
        }
    </style>
</head>
<body>

<div class="success-container">
    
    <!-- New Solid Badge Animation -->
    <div class="icon-reveal">
        <svg viewBox="0 0 24 24" class="solid-check">
            <path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4L9 16.2z"/>
        </svg>
    </div>

    <h1 class="fade-up delay-1">Confirmed</h1>
    <p class="fade-up delay-2" style="color: var(--text-muted);">Your collection is being prepared.</p>

    <div class="order-summary fade-up delay-3">
        <%
            List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");
            double grandTotal = 0;
            
            if (cartItems != null && !cartItems.isEmpty()) {
                for (CartItem item : cartItems) {
                    double itemTotal = item.getProduct().getPrice() * item.getQuantity();
                    grandTotal += itemTotal;
        %>
            <div class="summary-item">
                <span><%= item.getProduct().getName() %> (x<%= item.getQuantity() %>)</span>
                <span>₹<%= (int)itemTotal %></span>
            </div>
        <% 
                }
            } else {
        %>
            <div class="summary-item">
                <span>No recent items found.</span>
            </div>
        <% } %>
        
        <div class="summary-item" style="color: var(--text-main); font-weight: 600; font-size: 1.1rem; margin-top: 15px;">
            <span>Total Amount</span>
            <span>₹<%= (int)grandTotal %></span>
        </div>
    </div>

    <!-- Replace index.jsp with CompleteOrderServlet when your backend is ready -->
    <a href="CompleteOrderServlet" class="btn-home fade-up delay-4">Return to Gallery</a>
</div>

</body>
</html>
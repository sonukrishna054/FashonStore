<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.fashonstore.model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Bag | FashionStore</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #0f0f0f;
            --card-bg: #1a1a1a;
            --text-main: #ffffff;
            --text-muted: #a0a0a0;
            --accent: #d4af37; /* Gold accent */
        }

        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-main);
        }

        header {
            padding: 1.5rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #222;
        }

        .logo {
            font-family: 'Playfair Display', serif;
            font-size: 1.8rem;
            color: var(--accent);
            text-decoration: none;
            letter-spacing: 2px;
        }

        .cart-container {
            max-width: 1200px;
            margin: 60px auto;
            padding: 0 5%;
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 50px;
        }

        h1 {
            font-family: 'Playfair Display', serif;
            font-size: 2.5rem;
            margin-bottom: 40px;
            grid-column: 1 / -1;
        }

        /* Cart Items */
        .cart-items {
            border-top: 1px solid #333;
        }

        .cart-item {
            display: flex;
            align-items: center;
            padding: 30px 0;
            border-bottom: 1px solid #222;
        }

        .cart-item img {
            width: 120px;
            height: 160px;
            object-fit: cover;
            margin-right: 30px;
        }

        .item-details {
            flex-grow: 1;
        }

        .item-details h3 {
            font-family: 'Playfair Display', serif;
            margin: 0 0 10px;
            font-size: 1.4rem;
        }

        /* Quantity Selector Styling */
        .qty-form {
            display: flex;
            align-items: center;
            margin: 15px 0;
        }

        .qty-label {
            font-size: 0.75rem;
            color: var(--text-muted);
            margin-right: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .qty-input {
            width: 50px;
            background: transparent;
            border: 1px solid #444;
            color: white;
            text-align: center;
            padding: 5px;
            font-family: 'Poppins';
            outline: none;
        }

        .qty-input:focus {
            border-color: var(--accent);
        }

        .btn-update {
            background: none;
            border: none;
            color: var(--accent);
            cursor: pointer;
            font-size: 0.7rem;
            margin-left: 15px;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-update:hover {
            color: white;
        }

        .btn-remove {
            color: #ff4444;
            font-size: 0.7rem;
            text-decoration: none;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 10px;
            display: inline-block;
        }

        .item-price {
            font-size: 1.3rem;
            color: var(--accent);
            font-weight: 400;
        }

        /* Order Summary */
        .order-summary {
            background: var(--card-bg);
            padding: 40px;
            height: fit-content;
            border: 1px solid #222;
        }

        .order-summary h2 {
            font-family: 'Playfair Display', serif;
            margin-top: 0;
            font-size: 1.8rem;
            border-bottom: 1px solid #333;
            padding-bottom: 20px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin: 25px 0;
            font-size: 0.9rem;
            color: var(--text-muted);
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            padding-top: 25px;
            border-top: 1px solid #333;
            font-size: 1.5rem;
            color: var(--text-main);
            font-weight: 600;
        }

        .btn-checkout {
            display: block;
            width: 100%;
            padding: 18px 0;
            background: var(--accent);
            color: black;
            text-align: center;
            text-decoration: none;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-top: 40px;
            transition: 0.3s;
            border: 1px solid var(--accent);
        }

        .btn-checkout:hover {
            background: transparent;
            color: var(--accent);
        }

        .empty-msg {
            text-align: center;
            grid-column: 1 / -1;
            padding: 120px 0;
        }
    </style>
</head>
<body>

<header>
    <a href="index.jsp" class="logo">FASHIONSTORE</a>
    <nav>
        <a href="index.jsp" style="color: white; text-decoration: none; text-transform: uppercase; font-size: 0.75rem; letter-spacing: 1px;">Continue Shopping</a>
    </nav>
</header>

<div class="cart-container">
    <h1>Your Bag</h1>

    <%
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        double total = 0;
        if (cart == null || cart.isEmpty()) {
    %>
        <div class="empty-msg">
            <p style="color: var(--text-muted); font-size: 1.2rem; font-family: 'Playfair Display';">Your collection is currently empty.</p>
            <a href="index.jsp" style="color: var(--accent); text-decoration: none; border-bottom: 1px solid var(--accent); padding-bottom: 5px; text-transform: uppercase; font-size: 0.8rem; letter-spacing: 1px;">Discover the Collection</a>
        </div>
    <%
        } else {
    %>
        <div class="cart-items">
            <%
                for (CartItem item : cart) {
                    double subtotal = item.getProduct().getPrice() * item.getQuantity();
                    total += subtotal;
            %>
                <div class="cart-item">
                    <img src="<%= item.getProduct().getImageUrl() %>" alt="<%= item.getProduct().getName() %>">
                    <div class="item-details">
                        <h3><%= item.getProduct().getName() %></h3>
                        
                        <!-- Quantity Selection Form -->
                        <form action="UpdateQuantityServlet" method="post" class="qty-form">
                            <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
                            <span class="qty-label">Quantity</span>
                            <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" max="10" class="qty-input">
                            <button type="submit" class="btn-update">Update</button>
                        </form>

                        <a href="RemoveItemServlet?id=<%= item.getProduct().getId() %>" class="btn-remove">Remove</a>
                    </div>
                    <div class="item-price">
                        ₹<%= (int)subtotal %>
                    </div>
                </div>
            <% } %>
        </div>

        <div class="order-summary">
            <h2>Order Summary</h2>
            <div class="summary-row">
                <span>Subtotal</span>
                <span>₹<%= (int)total %></span>
            </div>
            <div class="summary-row">
                <span>Shipping</span>
                <span style="text-transform: uppercase; font-size: 0.7rem; letter-spacing: 1px;">Complimentary</span>
            </div>
            <div class="total-row">
                <span>Total</span>
                <span>₹<%= (int)total %></span>
            </div>

            <%-- Login Gate for Checkout --%>
            <% if (session.getAttribute("userName") != null) { %>
                <a href="checkout.jsp" class="btn-checkout">Complete Order</a>
            <% } else { %>
                <a href="login.jsp?error=please_login" class="btn-checkout">Sign In to Checkout</a>
            <% } %>
        </div>
    <% } %>
</div>

</body>
</html>
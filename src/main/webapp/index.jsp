<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.fashonstore.model.Product, com.fashonstore.dao.ProductDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FashionStore | Premium Collection</title>
    <!-- Importing Premium Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #0f0f0f;
            --card-bg: #1a1a1a;
            --text-main: #ffffff;
            --text-muted: #a0a0a0;
            --accent: #d4af37; /* Gold accent for luxury feel */
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-main);
        }

        /* Navbar Styling */
        header {
            padding: 1.5rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(0,0,0,0.9);
            position: sticky;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid #222;
        }

        .logo {
            font-family: 'Playfair Display', serif;
            font-size: 1.8rem;
            letter-spacing: 2px;
            color: var(--accent);
            text-decoration: none;
        }

        nav a {
            color: var(--text-main);
            text-decoration: none;
            margin-left: 2rem;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: 0.3s;
        }

        nav a:hover {
            color: var(--accent);
        }

        /* High-End Welcome Banner */
        .welcome-banner {
            width: 100%;
            background: #111; 
            padding: 50px 5%;
            text-align: center;
            border-bottom: 1px solid #222;
            box-sizing: border-box; /* Ensures padding doesn't break full width */
        }

        .welcome-banner h2 {
            font-family: 'Playfair Display', serif;
            font-size: 3.5rem; 
            color: var(--accent); 
            margin: 0 0 10px 0;
            letter-spacing: 2px;
            font-weight: 700;
        }

        .welcome-banner p {
            color: var(--text-muted);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 4px;
            margin: 0;
        }

        /* Hero Section */
        .hero {
            text-align: center;
            padding: 80px 5% 50px;
        }

        .hero h1 {
            font-family: 'Playfair Display', serif;
            font-size: 4.5rem;
            margin: 0;
            letter-spacing: -1px;
        }

        .hero p {
            color: var(--text-muted);
            font-size: 1.1rem;
            margin-top: 10px;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        /* Product Grid */
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 5% 100px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 40px;
        }

        .product-card {
            background: var(--card-bg);
            transition: transform 0.5s cubic-bezier(0.165, 0.84, 0.44, 1);
        }

        .product-card:hover {
            transform: translateY(-15px);
        }

        .product-image-wrapper {
            overflow: hidden;
            height: 500px;
        }

        .product-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.8s ease;
        }

        .product-card:hover img {
            transform: scale(1.05);
        }

        .product-info {
            padding: 25px;
            text-align: center;
        }

        .product-info h3 {
            font-family: 'Playfair Display', serif;
            margin: 0 0 10px;
            font-size: 1.6rem;
            font-weight: 700;
        }

        .price {
            color: var(--accent);
            font-size: 1.3rem;
            font-weight: 400;
            margin-bottom: 25px;
        }

        /* Button Styling */
        .btn-add {
            display: inline-block;
            width: 100%;
            background: var(--accent);
            color: #000;
            text-decoration: none;
            padding: 15px 0;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 2px;
            transition: all 0.3s ease;
            border: 1px solid var(--accent);
            box-sizing: border-box;
        }

        .btn-add:hover {
            background: transparent;
            color: var(--accent);
        }

        /* Footer from Canva Design */
        .contact-footer {
            background: #000;
            padding: 80px 5%;
            text-align: center;
            border-top: 1px solid #222;
        }

        .contact-footer h2 { 
            font-family: 'Playfair Display', serif; 
            font-size: 2.2rem;
            margin-bottom: 30px;
        }

        .contact-footer p { 
            color: var(--text-muted); 
            margin: 8px 0; 
            font-size: 0.9rem;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>

    <header>
        <a href="index.jsp" class="logo">FASHIONSTORE</a>
        <nav>
            <a href="index.jsp">Home</a>
            <% 
                if(session.getAttribute("userName") == null) { 
            %>
                <a href="register.jsp">Register</a>
                <a href="login.jsp">Login</a>
            <% 
                } else { 
            %>
                <a href="cart.jsp">My Bag</a>
                <a href="LogoutServlet" style="color: var(--accent);">Logout</a>
            <% } %>
        </nav>
    </header>

    <!-- NEW FULL-WIDTH WELCOME BANNER -->
    <% 
        if(session.getAttribute("userName") != null) { 
            String currentName = (String) session.getAttribute("userName");
    %>
        <div class="welcome-banner">
            <h2>Welcome, <%= currentName %></h2>
            <p>Your Exclusive Collection Awaits</p>
        </div>
    <% } %>

    <section class="hero">
        <p>Exclusive Collection</p>
        <h1>We Offer</h1>
    </section>

    <div class="container">
        <% 
            ProductDAO dao = new ProductDAO();
            List<Product> products = dao.getAllProducts();
            if (products != null) {
                for(Product p : products) {
        %>
            <div class="product-card">
                <div class="product-image-wrapper">
                    <img src="<%= p.getImageUrl() %>" alt="<%= p.getName() %>">
                </div>
                <div class="product-info">
                    <h3><%= p.getName() %></h3>
                    <div class="price">₹<%= (int)p.getPrice() %></div>
                    
                    <a href="AddToCartServlet?id=<%= p.getId() %>" class="btn-add">Add to Bag</a>
                </div>
            </div>
        <% 
                }
            } 
        %>
    </div>

    <section class="contact-footer">
        <h2>Contact Information</h2>
        <p>123 Anywhere St., Any City, ST 12345</p>
        <p>hello@fashionstore.com</p>
        <p>+91 98765 43210</p>
    </section>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FashionStore | Member Access</title>
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
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-main);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            padding: 2rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
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
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .login-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 5%;
        }

        .login-card {
            width: 100%;
            max-width: 400px;
            background: var(--card-bg);
            padding: 50px 40px;
            border: 1px solid #333;
            text-align: center;
        }

        .login-card h2 {
            font-family: 'Playfair Display', serif;
            font-size: 2.2rem;
            margin-bottom: 30px;
            letter-spacing: 1px;
        }

        .form-group {
            margin-bottom: 25px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: var(--text-muted);
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        input {
            width: 100%;
            padding: 12px 0;
            background: transparent;
            border: none;
            border-bottom: 1px solid #444;
            color: white;
            font-family: 'Poppins', sans-serif;
            font-size: 1rem;
            outline: none;
            transition: border-color 0.3s;
        }

        input:focus {
            border-bottom-color: var(--accent);
        }

        .btn-login {
            width: 100%;
            padding: 15px;
            background: var(--accent);
            color: black;
            border: none;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 2px;
            cursor: pointer;
            margin-top: 20px;
            transition: 0.3s;
        }

        .btn-login:hover {
            background: white;
        }

        .error-msg {
            color: #ff4444;
            font-size: 0.85rem;
            margin-bottom: 20px;
        }

        .footer-link {
            margin-top: 25px;
            font-size: 0.9rem;
            color: var(--text-muted);
        }

        .footer-link a {
            color: var(--accent);
            text-decoration: none;
        }
    </style>
</head>
<body>

    <header>
        <a href="index.jsp" class="logo">FASHIONSTORE</a>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="register.jsp">Register</a>
        </nav>
    </header>

    <div class="login-wrapper">
        <div class="login-card">
            <h2>Member Access</h2>

            <% 
                String error = request.getParameter("error");
                if ("invalid".equals(error)) { 
            %>
                <div class="error-msg">Invalid credentials. Please try again.</div>
            <% } else if ("please_login".equals(error)) { %>
                <div class="error-msg">Please sign in to proceed to checkout.</div>
            <% } %>

            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" required>
                </div>
                
                <button type="submit" class="btn-login">Sign In</button>
            </form>

            <div class="footer-link">
                New to the collection? <a href="register.jsp">Create Account</a>
            </div>
        </div>
    </div>

</body>
</html>
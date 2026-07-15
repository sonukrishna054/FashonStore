<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FashionStore - Order Confirmed!</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; text-align: center; }
        header { background: #333; color: #fff; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center; }
        header a { color: #fff; text-decoration: none; margin-left: 15px; font-weight: bold; }
        
        .container { max-width: 600px; margin: 80px auto; padding: 40px; background: white; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        .success-icon { font-size: 80px; color: #28a745; margin-bottom: 20px; }
        h1 { color: #333; }
        p { color: #555; font-size: 1.2em; line-height: 1.6; margin-bottom: 30px; }
        
        .btn { background: #007bff; color: white; padding: 15px 30px; text-decoration: none; border-radius: 5px; font-weight: bold; font-size: 1.1em; display: inline-block; transition: 0.3s; }
        .btn:hover { background: #0056b3; }
    </style>
</head>
<body>

    <header>
        <h2>FashionStore</h2>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </nav>
    </header>

    <div class="container">
        <div class="success-icon">✅</div>
        <h1>Order Confirmed!</h1>
        <p>Thank you for shopping at FashionStore. Your order has been successfully placed and is being processed.</p>
        <p><em>An email receipt would normally be sent here!</em></p>
        
        <a href="index.jsp" class="btn">Return to Store</a>
    </div>

</body>
</html>
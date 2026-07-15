package com.fashonstore.servlet; // Make sure this matches your package

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CompleteOrderServlet")
public class CompleteOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Get the current user's session
        HttpSession session = request.getSession();
        
        // 2. Remove the cart from the session entirely
        if (session.getAttribute("cart") != null) {
            session.removeAttribute("cart");
        }
        
        // (In the future, you would also save the order details to your database here)
        
        // 3. Send them back to the homepage
        response.sendRedirect("index.jsp");
    }
}
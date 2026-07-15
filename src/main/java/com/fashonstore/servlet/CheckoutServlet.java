package com.fashonstore.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Get the user's session
        HttpSession session = request.getSession();
        
        // 2. Clear the cart from memory (Simulating a successful purchase)
        session.removeAttribute("cart");
        
        // 3. Send them to the success page
        response.sendRedirect("order-confirmation.jsp");
    }
}
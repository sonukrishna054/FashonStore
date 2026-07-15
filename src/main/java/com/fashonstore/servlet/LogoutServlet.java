package com.fashonstore.servlet; // Make sure this matches your package structure

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Get the current session (passing 'false' means don't create a new one if it doesn't exist)
        HttpSession session = request.getSession(false);
        
        // 2. If a session exists, destroy it completely
        if (session != null) {
            session.invalidate(); // This wipes the "userName" and the "cart"
        }
        
        // 3. Redirect the user back to the homepage (or login page)
        response.sendRedirect("index.jsp");
    }
}
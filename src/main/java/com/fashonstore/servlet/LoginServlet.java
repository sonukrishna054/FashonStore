package com.fashonstore.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.fashonstore.db.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection con = DBConnection.getConnection()) {
            // Updated query to make sure we get the 'name' column from your database
            String query = "SELECT id, name, email FROM users WHERE email = ? AND password = ?";
            
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, email);
                ps.setString(2, password);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        // Create the session
                        HttpSession session = request.getSession(true);
                        
                        // CRITICAL: This key 'userName' must match the JSP exactly
                        session.setAttribute("userName", rs.getString("name"));
                        session.setAttribute("userId", rs.getInt("id"));

                        // Send to homepage
                        response.sendRedirect("index.jsp");
                    } else {
                        // Fail: back to login
                        response.sendRedirect("login.jsp?error=invalid");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=server_error");
        }
    }
}
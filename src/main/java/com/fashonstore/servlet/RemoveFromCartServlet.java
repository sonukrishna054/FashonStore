package com.fashonstore.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.fashonstore.model.CartItem;

// This URL tells Tomcat to listen for the "Remove" button clicks
@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Catch the ID of the product they clicked "Remove" on
        String idStr = request.getParameter("id");
        
        if (idStr != null) {
            int productId = Integer.parseInt(idStr);
            HttpSession session = request.getSession();
            
            // 2. Grab the current cart from memory
            @SuppressWarnings("unchecked")
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            
            if (cart != null) {
                // 3. The Magic Line: Delete the item from the list if its ID matches
                cart.removeIf(item -> item.getProduct().getId() == productId);
                
                // 4. Save the updated list back to the session
                session.setAttribute("cart", cart);
            }
        }
        
        // 5. Send them right back to the cart so they can see the item is gone!
        response.sendRedirect("cart.jsp");
    }
}

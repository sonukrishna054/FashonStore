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

@WebServlet("/UpdateQuantityServlet")
public class UpdateQuantityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            for (CartItem item : cart) {
                if (item.getProduct().getId() == productId) {
                    item.setQuantity(newQuantity);
                    break;
                }
            }
        }
        
        // Send them back to the cart to see the updated total
        response.sendRedirect("cart.jsp");
    }
}
package com.fashonstore.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.fashonstore.dao.ProductDAO;
import com.fashonstore.model.Product;
import com.fashonstore.model.CartItem;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id");
        
        if (idStr != null) {
            int productId = Integer.parseInt(idStr);
            ProductDAO dao = new ProductDAO();
            Product productToAdd = dao.getProductById(productId);
            
            if (productToAdd != null) {
                HttpSession session = request.getSession();
                
                // 1. We are now storing CartItems, not just Products
                @SuppressWarnings("unchecked")
                List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
                
                if (cart == null) {
                    cart = new ArrayList<>();
                }
                
                // 2. Check if the product is already in the cart
                boolean itemExists = false;
                for (CartItem item : cart) {
                    if (item.getProduct().getId() == productId) {
                        // 3. If found, just increase the quantity by 1!
                        item.setQuantity(item.getQuantity() + 1);
                        itemExists = true;
                        break;
                    }
                }
                
                // 4. If it is a brand new item, add it with a quantity of 1
                if (!itemExists) {
                    cart.add(new CartItem(productToAdd, 1));
                }
                
                session.setAttribute("cart", cart);
            }
        }
        
        response.sendRedirect("cart.jsp");
    }
}
package com.fashonstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.fashonstore.db.DBConnection;
import com.fashonstore.model.Product;

public class ProductDAO {

    // Method to fetch all products from the database
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM products";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                // Convert each database row into a Java Product object
                Product product = new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getString("image_url")
                );
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
//Method to fetch a single product by its ID
public Product getProductById(int id) {
 Product product = null;
 String query = "SELECT * FROM products WHERE id = ?";

 try (Connection con = DBConnection.getConnection();
      PreparedStatement ps = con.prepareStatement(query)) {
     
     ps.setInt(1, id);
     try (ResultSet rs = ps.executeQuery()) {
         if (rs.next()) {
             product = new Product(
                 rs.getInt("id"),
                 rs.getString("name"),
                 rs.getString("description"),
                 rs.getDouble("price"),
                 rs.getString("image_url")
             );
         }
     }
 } catch (Exception e) {
     e.printStackTrace();
 }
 return product;
}
}
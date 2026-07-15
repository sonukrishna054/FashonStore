package com.fashonstore.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // 1. Double check your password is correct here!
    private static final String URL = "jdbc:mysql://localhost:3306/fashionstore_db?allowPublicKeyRetrieval=true&useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "Sandy@2004"; 

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("❌ ERROR: MySQL Driver JAR is missing!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ ERROR: Connection failed! Wrong password, or MySQL is off.");
            e.printStackTrace();
        }
        return con;
    }

    // 2. THIS IS THE NEW TEST METHOD
    public static void main(String[] args) {
        System.out.println("Testing Database Connection...");
        Connection conn = getConnection();
        
        if (conn != null) {
            System.out.println("✅ SUCCESS! Java and MySQL are perfectly connected!");
        } else {
            System.out.println("❌ FAILED. Read the red errors above.");
        }
    }
}
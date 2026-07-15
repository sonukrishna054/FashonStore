package com.fashonstore.model;

public class Product {
    private int id;
    private String name;
    private String description;
    private double price;
    private String imageUrl;

    // The Constructor: used to create a Product object with data from the database
    public Product(int id, String name, String description, double price, String imageUrl) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.imageUrl = imageUrl;
    }

    // Getters: These allow our JSP page to "get" the information to display it
    public int getId() { return id; }
    public String getName() { return name; }
    public String getDescription() { return description; }
    public double getPrice() { return price; }
    public String getImageUrl() { return imageUrl; }
}
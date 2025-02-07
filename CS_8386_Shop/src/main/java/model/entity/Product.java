package model.entity;

import java.sql.Timestamp;

public class Product {
    private int productID;
    private int brandID;
    private String name;
    private double price;
    private int stock;
    private String description;
    private String imageURL;
    private Timestamp productCreatedDate;
    private Timestamp productUpdatedDate;

    public Product(int productID, int brandID, String name, double price, int stock, String description, String imageURL, Timestamp productCreatedDate, Timestamp productUpdatedDate) {
        this.productID = productID;
        this.brandID = brandID;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.description = description;
        this.imageURL = imageURL;
        this.productCreatedDate = productCreatedDate;
        this.productUpdatedDate = productUpdatedDate;
    }

    public int getProductID() { return productID; }
    public void setProductID(int productID) { this.productID = productID; }
    public int getBrandID() { return brandID; }
    public void setBrandID(int brandID) { this.brandID = brandID; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getImageURL() { return imageURL; }
    public void setImageURL(String imageURL) { this.imageURL = imageURL; }
    public Timestamp getProductCreatedDate() { return productCreatedDate; }
    public void setProductCreatedDate(Timestamp productCreatedDate) { this.productCreatedDate = productCreatedDate; }
    public Timestamp getProductUpdatedDate() { return productUpdatedDate; }
    public void setProductUpdatedDate(Timestamp productUpdatedDate) { this.productUpdatedDate = productUpdatedDate; }

    @Override
    public String toString() {
        return "Product{" +
                "productID=" + productID +
                ", brandID=" + brandID +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", description='" + description + '\'' +
                ", imageURL='" + imageURL + '\'' +
                ", productCreatedDate=" + productCreatedDate +
                ", productUpdatedDate=" + productUpdatedDate +
                '}';
    }
}

package model;

import java.time.LocalDateTime;

public class Product {
    //
    private int productID;
    private int brandID;
    private String name;
    private double price;
    private int stock;
    private String description;
    private String imageURL;
    private LocalDateTime product_createdDate;
    private LocalDateTime product_updateDate;


    public Product(int productID, int brandID, String name, double price, int stock, String description, String imageURL) {
        this.productID = productID;
        this.brandID = brandID;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.description = description;
        this.imageURL = imageURL;
    }

    public Product(int productID, int brandID, String name, double price, int stock, String description, String imageURL, LocalDateTime product_createdDate, LocalDateTime product_updateDate) {
        this.productID = productID;
        this.brandID = brandID;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.description = description;
        this.imageURL = imageURL;
        this.product_createdDate = product_createdDate;
        this.product_updateDate = product_updateDate;
    }

    public LocalDateTime getProduct_createdDate() {
        return product_createdDate;
    }

    public void setProduct_createdDate(LocalDateTime product_createdDate) {
        this.product_createdDate = product_createdDate;
    }

    public LocalDateTime getProduct_updateDate() {
        return product_updateDate;
    }

    public void setProduct_updateDate(LocalDateTime product_updateDate) {
        this.product_updateDate = product_updateDate;
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
                '}';
    }
}

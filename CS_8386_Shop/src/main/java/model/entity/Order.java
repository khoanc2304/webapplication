package model.entity;

import java.sql.Timestamp;

public class Order {
    private int orderID;
    private int userID;
    private Timestamp orderDate;
    private double totalPrice;
    private String orderStatus;

    public Order(int orderID, int userID, Timestamp orderDate, double totalPrice, String orderStatus) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.orderStatus = orderStatus;
    }

    public int getOrderID() { return orderID; }
    public void setOrderID(int orderID) { this.orderID = orderID; }
    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }
    public Timestamp getOrderDate() { return orderDate; }
    public void setOrderDate(Timestamp orderDate) { this.orderDate = orderDate; }
    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }
    public String getOrderStatus() { return orderStatus; }
    public void setOrderStatus(String orderStatus) { this.orderStatus = orderStatus; }

    @Override
    public String toString() {
        return "Order{" +
                "orderID=" + orderID +
                ", userID=" + userID +
                ", orderDate=" + orderDate +
                ", totalPrice=" + totalPrice +
                ", orderStatus='" + orderStatus + '\'' +
                '}';
    }
}

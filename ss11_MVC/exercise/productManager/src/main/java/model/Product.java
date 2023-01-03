package model;

public class Product {
    private int id;
    private String name;
    private double price;
    private String describe;
    private String brand;

    public Product() {
    }

    public Product(int id, String name, double price, String describe, String brand) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.describe = describe;
        this.brand = brand;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }
}

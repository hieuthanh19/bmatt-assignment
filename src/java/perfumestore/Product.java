/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

import java.util.Date;

/**
 *
 * @author Nhat Thanh
 */
public class Product {

    private int product_id;
    private String name;
    private Double volume;
    private int categoty_id;
    private int brand_id;
    private Double original_price;
    private Double current_price;
    private String description;
    private int product_status;
    private String brandName;
    private String category_name;

    public Product(int product_id, String name, Double volume, int categoty_id, int brand_id, Double original_price, Double current_price, String description, int product_status, String brandName, String category_name) {
        this.product_id = product_id;
        this.name = name;
        this.volume = volume;
        this.categoty_id = categoty_id;
        this.brand_id = brand_id;
        this.original_price = original_price;
        this.current_price = current_price;
        this.description = description;
        this.product_status = product_status;
        this.brandName = brandName;
        this.category_name = category_name;
    }

    public int getProduct_id() {
        return product_id;
    }

    public String getName() {
        return name;
    }

    public Double getVolume() {
        return volume;
    }

    public int getCategoty_id() {
        return categoty_id;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public Double getOriginal_price() {
        return original_price;
    }

    public Double getCurrent_price() {
        return current_price;
    }

    public String getDescription() {
        return description;
    }

    public int getProduct_status() {
        return product_status;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setVolume(Double volume) {
        this.volume = volume;
    }

    public void setCategoty_id(int categoty_id) {
        this.categoty_id = categoty_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public void setOriginal_price(Double original_price) {
        this.original_price = original_price;
    }

    public void setCurrent_price(Double current_price) {
        this.current_price = current_price;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setProduct_status(int product_status) {
        this.product_status = product_status;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }
}

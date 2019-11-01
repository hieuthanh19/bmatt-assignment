/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

import java.io.InputStream;

/**
 *
 * @author MyPC
 */
public class order_items {

     private int order_id;
    private int product_id;
    private int quatity;
    private double product_price;

    public order_items(int order_id, int product_id, int quatity, double product_price) {
        this.order_id = order_id;
        this.product_id = product_id;
        this.quatity = quatity;
        this.product_price = product_price;
    }

    order_items(InputStream in) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getOrder_id() {
        return order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public int getQuatity() {
        return quatity;
    }

    public double getProduct_price() {
        return product_price;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setQuatity(int quatity) {
        this.quatity = quatity;
    }

    public void setProduct_price(double product_price) {
        this.product_price = product_price;
    }
    
}

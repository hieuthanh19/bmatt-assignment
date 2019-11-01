/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

/**
 *
 * @author MyPC
 */
public class deliveryInfo {
    private int delivery_id;
    private int order_id;
    private String receiver_name;
    private String address;
    private int payment_method;
    private int delivery_method;
    private int delivery_status;
    

    public deliveryInfo(int delivery_id, int order_id, String receiver_name, String address,
                        int payment_method, int delivery_method,int delivery_status) {
        this.delivery_id = delivery_id;
        this.order_id = order_id;
        this.receiver_name = receiver_name;
        this.address = address;
        this.payment_method = payment_method;
        this.delivery_method = delivery_method;
        this.delivery_status = delivery_status;
    }

    public int getDelivery_id() {
        return delivery_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public String getReceiver_name() {
        return receiver_name;
    }

    public String getAddress() {
        return address;
    }

    public int getPayment_method() {
        return payment_method;
    }

    public int getDelivery_method() {
        return delivery_method;
    }

    public int getDelivery_status() {
        return delivery_status;
    }

    public void setDelivery_id(int delivery_id) {
        this.delivery_id = delivery_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public void setReceiver_name(String receiver_name) {
        this.receiver_name = receiver_name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPayment_method(int payment_method) {
        this.payment_method = payment_method;
    }

    public void setDelivery_method(int delivery_method) {
        this.delivery_method = delivery_method;
    }

    public void setDelivery_status(int delivery_status) {
        this.delivery_status = delivery_status;
    }
    
    
}

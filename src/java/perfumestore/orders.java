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
public class orders {
   private int order_id;
   private int user_id;
   private int order_status;
   private String create_at;
   private int staff_id;
   
   public orders(int order_id, int user_id, int order_status, String create_at,int staff_id){
       this.order_id = order_id;
       this.user_id = user_id;
       this.order_status = order_status;
       this.create_at = create_at;
       this.staff_id = staff_id;
   }

    public int getOrder_id() {
        return order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public int getOrder_status() {
        return order_status;
    }

    public String getCreate_at() {
        return create_at;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setOrder_status(int order_status) {
        this.order_status = order_status;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }
    
   
}

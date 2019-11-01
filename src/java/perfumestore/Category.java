/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

/**
 *
 * @author Nhat Thanh
 */
public class Category {
    private int category_id;
    private String category_name;
    private int category_status;

    public Category(){}
    
    /**
     * Create new Category
     * @param category_id
     * @param category_name
     * @param category_status 
     */
    public Category(int category_id, String category_name, int category_status) {
        this.category_id = category_id;
        this.category_name = category_name;
        this.category_status = category_status;
    }

    public int getCategory_id() {
        return category_id;
    }
    
    public void setCategory_id(int category_id) throws Category_Exception {
        if (category_id <= 0) {
            throw new Category_Exception("Category ID must be greater than 0");
        }
        this.category_id = category_id;
    }

    public String getCategory_name() {
        return category_name;
    }
    
    public void setCategory_name(String category_name) throws Category_Exception {
        if(this.category_name.length() > 100){
           throw new Category_Exception("Please enter short category's name");
        }
        this.category_name = category_name;
    }
    
    public int getCategory_status() {
        return category_status;
    }
    
    public void setCategory_status(int category_status) throws Category_Exception {
        if (category_status < 0 || category_status > 1) {
            throw new Category_Exception("Category status must be either 0 or 1");
        }
        this.category_status = category_status;
    }  
}

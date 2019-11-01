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
public class Product_Image_Exception extends Exception{
    /**
     * Create new product image exception
     * @param message 
     */
    public Product_Image_Exception(String message) {
        super(message + "Product Image exception: ");
    }    
}

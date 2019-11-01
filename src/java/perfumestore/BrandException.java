/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

/**
 *
 * @author DELL
 */
public class BrandException extends Exception {
    
    /**
     * Create new brand exception
     * 
     * @param msg 
     */
    public BrandException(String msg) {
        super("Brand Exception: " + msg);
    }
}

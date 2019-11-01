/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

/**
 *
 * @author ThanhKH
 */
public class favList {

    int user_id;
    int product_id;

    /**
     * Create new favorite list
     *
     * @param user_id
     * @param product_id
     */
    public favList(int user_id, int product_id) {
        this.user_id = user_id;
        this.product_id = product_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) throws favListException {
        if (user_id < 0) {
            throw new favListException("User ID must be greater than 0");
        }
        this.user_id = user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) throws favListException {
        if (product_id < 0) {
            throw new favListException("Product ID must be greater than 0");
        }
        this.product_id = product_id;
    }

}

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
public class UserException extends Exception {

    /**
     * Create new user exception
     *
     * @param msg
     */
    public UserException(String msg) {
        super("User Exception: " + msg);
    }
}

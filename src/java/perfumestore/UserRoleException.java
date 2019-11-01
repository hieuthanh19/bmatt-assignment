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
public class UserRoleException extends Exception {
    /**
     * Create new UserRoleException
     * @param msg 
     */
    public UserRoleException(String msg) {
        super("User Role Exception: " + msg);
    }
}

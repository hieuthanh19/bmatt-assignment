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
public class AccountException extends Exception {

    /**
     * Create new account exception
     *
     * @param msg
     */
    public AccountException(String msg) {
        super("Account Exception: " + msg);
    }
}

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
public class favListException extends Exception {

    /**
     * Create new favorite list exception
     *
     * @param msg
     */
    public favListException(String msg) {
        super("Favorite List Exception: " + msg);
    }
}

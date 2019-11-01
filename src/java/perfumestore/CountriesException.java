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
public class CountriesException extends Exception {
    public CountriesException(String smg)  {
        super("Countries Exception: " + smg);
    }
}

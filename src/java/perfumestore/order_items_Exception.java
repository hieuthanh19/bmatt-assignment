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
public class order_items_Exception extends Exception
{
      public order_items_Exception(String message)  
    {
        super("order_itemsException" + message); 
    }
}

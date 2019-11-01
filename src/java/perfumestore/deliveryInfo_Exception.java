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
public class deliveryInfo_Exception  extends Exception
{
      public deliveryInfo_Exception(String message)  
    {
        super("deliveryInfoException" + message); 
    }
}

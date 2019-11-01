/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

import connection.GetConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


/**
 *
 * @author MyPC
 */
public class order_items_Model {
    private Connection con;
    private PreparedStatement pst;
    private Statement st;
    private ResultSet rs;
    private String str;
    private ArrayList<order_items> Sel = new ArrayList<order_items>();

    /**
     * Create order model
     * @throws SQLException
     */
    public order_items_Model() throws SQLException {
        try {
            con = GetConnection.getConnection();
            st = con.createStatement();
            pst = null;
            rs = null;
            str = "";
        } catch (Exception e) {
            throw new SQLException("PLEASE CONNECT TO DATABASE BEFORE START");
        }
    }
    
        public void InsertItems(int order_id, int product_id, int quantity, double product_price) throws SQLException {
        String sqlStr = "INSERT INTO `order_items`(`product_id`, `quantity`, `product_price`,`order_id`) VALUES (?,?,?,?)";
        con = GetConnection.getConnection();
        st = con.createStatement();

        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setInt(4,order_id );
        pst.setInt(1,product_id );
        pst.setInt(2,quantity );
        pst.setDouble(3,product_price );

        pst.executeUpdate();
    }
     public void UpdateItems(int order_id, int product_id, int quantity, double product_price) throws SQLException {
        String sqlStr = "UPDATE `order_items` SET `product_id`=?,`quantity`=?,`product_price`=? WHERE`order_id`=?,";
        con = GetConnection.getConnection();
        st = con.createStatement();

        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setInt(4,order_id );
        pst.setInt(1,product_id );
        pst.setInt(2,quantity );
        pst.setDouble(3,product_price );
        pst.executeUpdate();
        
    }
    
    public ArrayList<order_items> SelectItems() throws SQLException {
        try {
            con = GetConnection.getConnection();
            st = con.createStatement();
            str = "SELECT * FROM `order_items`";
            rs = st.executeQuery(str);
                while (rs.next()) {
                    int order_id = rs.getInt("order_id");
                    int product_id = rs.getInt("product_id");
                    int quantity = rs.getInt("quantity");
                    double product_price = rs.getDouble("product_price");
  
                    Sel.add(new order_items(order_id,product_id,quantity,product_price));       
                }
            }
        catch (Exception e) {}
        return Sel;
    }     
    public boolean deleteItems(int order_id) {
        try {
            str = "DELETE FROM `order_items` WHERE `order_items`=?";
            pst = con.prepareStatement(str);
            pst.setInt(1, order_id);
            pst.executeUpdate();
            return true;
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}



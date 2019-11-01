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
public class delivery_Model {
    private Connection con;
    private PreparedStatement pst;
    private Statement st;
    private ResultSet rs;
    private String str;
    private ArrayList<deliveryInfo> del = new ArrayList<deliveryInfo>();
    /**
     * Create order model
     * @throws SQLException
     */
    public delivery_Model() throws SQLException {
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

        public void Insertdelivery(int dilivery_id,int order_id, String receiver_name, String address,int payment_method,int dilivery_method,int delivery_status) throws SQLException {
        String sqlStr = "INSERT INTO `deliveryinfo`(`order_id`, `receiver_name`, `address`, `payment_method`, `delivery_method`, `delivery_status`,`delivery_id`, VALUES (?,?,?,?,?,?,?)";
        con = GetConnection.getConnection();
        st = con.createStatement();

        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setInt(7,dilivery_id );
        pst.setInt(1,order_id );
        pst.setString(2,receiver_name );
        pst.setString(3,address );
        pst.setInt(4,payment_method);
        pst.setInt(5,dilivery_method);
        pst.setInt(6,delivery_status);

        pst.executeUpdate();
    }
    public void Updatedelivery(int dilivery_id,int order_id, String receiver_name, String address,int payment_method,int dilivery_method,int delivery_status) throws SQLException {
         String sqlStr = "UPDATE `deliveryinfo` SET `receiver_name`=?,`address`=?,`payment_method`=?,`delivery_method`=?,`delivery_status`=? WHERE `delivery_id`=?,`order_id`=?,";
        con = GetConnection.getConnection();
        st = con.createStatement();

        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setInt(6,dilivery_id );
        pst.setInt(7,order_id );
        pst.setString(1,receiver_name );
        pst.setString(2,address );
        pst.setInt(3,payment_method);
        pst.setInt(4,dilivery_method);
        pst.setInt(5,delivery_status);
        pst.executeUpdate();
    }
    
    public ArrayList<deliveryInfo> selectDelivery() throws SQLException {
        try {
            con = GetConnection.getConnection();
            st = con.createStatement();
            str = "SELECT * FROM `deliveryinfo`";
            rs = st.executeQuery(str);
                while (rs.next()) {
                    int dilivery_id = rs.getInt("dilivery_id");
                    int order_id = rs.getInt("order_id");
                    String receiver_name = rs.getString("receiver_name");
                    String address = rs.getString("address");
                    int payment_method = rs.getInt("payment_method");
                    int dilivery_method = rs.getInt("dilivery_method");
                    int delivery_status = rs.getInt("delivery_status");
  
                    del.add(new deliveryInfo (dilivery_id,order_id,receiver_name,address,payment_method,dilivery_method,delivery_status));       
                }
            }
        catch (Exception e) {}
        return del;
    }     
    public boolean deleteDelivery(int order_id) {
        try {
            str = "DELETE FROM `deliveryinfor` WHERE `order_id`=?";
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
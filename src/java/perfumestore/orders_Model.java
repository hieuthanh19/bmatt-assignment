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
import javax.security.auth.login.AccountException;

/**
 *
 * @author MyPC
 */
public class orders_Model {
    private Connection con;
    private PreparedStatement pst;
    private Statement st;
    private ResultSet rs;
    private String str;

    /**
     * Create order model
     * @throws SQLException
     */
    public orders_Model() throws SQLException {
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

    /**
     * Load order from database to array list
     * @return
     * @throws SQLException
     */
    public ArrayList<orders> loadOrder() throws SQLException {
        ArrayList<orders> orders = new ArrayList<orders>();
        try {
            con = GetConnection.getConnection();
            st = con.createStatement();
            str = "SELECT * FROM [orders]";
            rs = st.executeQuery(str);
            if (rs.isBeforeFirst()) {
                while (rs.next()) {
                    int order_id = rs.getInt("order_id");
                    int user_id = rs.getInt("user_id");
                    int order_status = rs.getInt("order_status");
                    String create_at = rs.getString("create_at");
                    int staff_id = rs.getInt("staff_id");               
                }
            }
        } catch (SQLException e) {
            throw e;
        }
        return orders;
    }
    
    /**
     * Load all order
     * @return
     * @throws SQLException 
     */
    public ArrayList<orders> loadOrderAll() throws SQLException {
        ArrayList<orders> orders = new ArrayList<orders>();
        try {
            con = GetConnection.getConnection();
            st = con.createStatement();
            str = "SELECT * FROM `orders`";
            rs = st.executeQuery(str);
            if (rs.isBeforeFirst()) {
                while (rs.next()) {
                    int order_id = rs.getInt("order_id");
                    int user_id = rs.getInt("user_id");
                    int order_status = rs.getInt("order_status");
                    String create_at = rs.getString("create_at");
                    int staff_id = rs.getInt("staff_id");  
                    orders.add(new orders(order_id,user_id,order_status,create_at,staff_id));                   
                }
            }
        } catch (SQLException e) {
            throw e;
        }
        return orders;
    }
    
    /**
     * load order to table
     * @param table
     * @param frame
     * @param arr
     * @param dtm 
     */
    /*
    public void loadOrdersToOrder_items(JTable table, Frame frame, ArrayList<Order> arr,DefaultTableModel dtm, ArrayList<Table> tables){       
        dtm = (DefaultTableModel) table.getModel();
        dtm.setRowCount(0);
        for (int i = 0; i < arr.size(); i++) {
            Object[] row ={arr.get(i).getOid(),getTableName(tables, arr.get(i).getTid()),arr.get(i).getDate(),arr.get(i).getTotal()};
            dtm.addRow(row);
        }
    }
    */
    
    /**
     * get table name 
     * @param tables
     * @param tid
     * @return 
     */
    /*
    public String getTableName(ArrayList<Table> tables, int tid){
        for (int i = 0; i < tables.size(); i++) {
            if (tables.get(i).getTid()==tid) {
                return tables.get(i).gettName();
            }
        }
        return null;
    }
    */

    /**
     * Insert new order
     * @param order_id
     * @param user_id
     * @param order_status
     * @param create_at
     * @param staff_id
     * @return
     * @throws SQLException
     */
    public int insertOrder(int order_id, int user_id, int order_status, String create_at,int staff_id) throws SQLException {
        int id;
        try {
            str = "INSERT INTO `orders`(`order_id`, `user_id`, `order_status`, `created_at`) VALUES (?,?,?,?,?)";
            con = GetConnection.getConnection();
            st = con.createStatement();
            pst = con.prepareStatement(str, Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, order_id);
            pst.setInt(2, user_id);
            pst.setInt(3, order_status);
            pst.setString(4, create_at);
            pst.setInt(5,staff_id);
            pst.executeUpdate();
            //rs = pst.getGeneratedKeys();
            //rs.next();
        } catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return id = rs.getInt(1);
    }

    /**
     * Update order
     * @param order_id
     * @param user_id
     * @param order_status
     * @param create_at
     * @param staff_id
     * @return
     * @throws SQLException
     * @throws AccountException
     */
    public boolean updateOrder(int order_id, int user_id, int order_status, String create_at,int staff_id) throws SQLException, AccountException {
        try {
            str = "UPDATE `orders` SET `order_id`=?,`user_id`=?,`order_status`=?,`created_at`=? WHERE `order_id`=?";
            pst = con.prepareStatement(str);
            pst.setInt(5, order_id);
            pst.setInt(1, user_id);
            pst.setInt(2, order_status);
            pst.setString(3, create_at);
            pst.setInt(4,staff_id);
            pst.executeUpdate();
            return true;
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Delete order
     * @param oid
     * @return
     */
    public boolean deleteOrder(int order_id) {
        try {
            str = "DELETE FROM `orders` WHERE `order_id`=?";
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
    
    /**
     * Get new detail order id
     * @param arr
     * @return 
     */
    /*
    public int getNewDOID(ArrayList<Order> arr) {
        int doid = 0;
        for (int i = 0; i < arr.size(); i++) {
            doid = arr.get(i).getDoid();
        }
        doid = doid + 1;
        return doid;
    }*/
    
    /**
     * date to string format
     * @param date
     * @return 
     */
    /*
    public String dateToString(Date date) {
        SimpleDateFormat dfm = new SimpleDateFormat("yyyy-MM-dd");
        String dateformat = dfm.format(date);
        return dateformat;
    }
*/
}

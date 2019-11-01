/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;


import connection.GetConnection;
import java.awt.Frame;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Nhat Thanh
 */
public class Product_Image_Model {
    //attributes and arraylist
    private ArrayList<Product_Image> product_image = new ArrayList<Product_Image>();
    private Connection con;
    private static GetConnection getCon;
    private PreparedStatement pst;
    private Statement st;
    private ResultSet rs;
    private String str;

   /**
     * Create new Category Model
     * @throws SQLException
     */
    public Product_Image_Model() throws SQLException {
        try {
            //connect to DB
            getCon = new GetConnection();
            con = getCon.getConnection();
            st = con.createStatement();
            pst = null;
            rs = null;
            str = "";
        } catch (Exception e) {
            //if data is not exist
            throw new SQLException("PLEASE CONNECT TO DATABASE BEFORE START");
        }
    }

    /**
     * Load product image from database
     * @return
     * @throws SQLException 
     */
    public ArrayList<Product_Image> loadProduct_Image() throws SQLException {
        ArrayList<Product_Image> product_image = new ArrayList<Product_Image>();
        try {
            con = getCon.getConnection();
            st = con.createStatement();
            //Create sql select all
            str = "SELECT * FROM `product_img`";
            rs = st.executeQuery(str);
            if (rs.isBeforeFirst()) {
                while (rs.next()) {
                    //set value to select
                    int img_id = rs.getInt("img_id");
                    int product_id = rs.getInt("product_id");
                    String url = rs.getString("url");
                    int product_img_status = rs.getInt("product_img_status");
                    product_image.add(new Product_Image(img_id, product_id, url, product_img_status));
                }
            }
        } catch (Exception e) {
        }
        return product_image;
    }  
    
    /**
     * load date to table
     * @param table
     * @param frame
     * @param arr 
     */
    public void loadProductImageToTable(JTable table, Frame frame, ArrayList<Product_Image> arr){       
        DefaultTableModel dtm = (DefaultTableModel) table.getModel();
        dtm.setRowCount(0);
        //loop to scan data all table
        for (int i = 0; i < arr.size(); i++) {
            Object[] row ={arr.get(i).getImg_id(),arr.get(i).getProduct_id(),arr.get(i).getUrl(), arr.get(i).getProduct_img_status()};
            dtm.addRow(row);
        }
    }   

    /**
     * insert new product image
     * @param img_id
     * @param product_id
     * @param url
     * @param product_image_status
     * @return
     * @throws SQLException 
     */
    public int insertProductImg(int img_id, int product_id, String url, int product_image_status) throws SQLException {
        try {
            //link load from Product Image database in SQL Server
            str = "INSERT INTO `product_img`(`product_id`, `url`, `product_img_status`, `img_id`) VALUES (?,?,?,?)";
            con = GetConnection.getConnection();
            st = con.createStatement();
            //create query
            pst = con.prepareStatement(str, Statement.RETURN_GENERATED_KEYS);
            //set value
            pst.setInt(4, img_id);
            pst.setInt(1, product_id);
            pst.setString(2, url);
            pst.setInt(3, product_image_status);
            //execute query
            pst.executeUpdate();
            rs = pst.getGeneratedKeys();
            rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    /**
     * Get product image from product_image_id
     * @param product_img_id
     * @return product image if success. Otherwise, null
     */
    public Product_Image getProduct_Image(int product_img_id) {
        for (int i = 0; i < product_image.size(); i++) {
            if (product_image.get(i).getImg_id()== product_img_id) {
                return product_image.get(i);
            }
        }
        return null;
    }
    
    /**
     * update information of Product Image
     * @param img_id
     * @param product_id
     * @param url
     * @param product_img_status
     * @return
     * @throws SQLException
     * @throws Category_Exception 
     */
    public boolean updateAccount(int img_id, int product_id, String url, int product_img_status) throws SQLException, Category_Exception {
        try {
            //link load from Product Image database in SQL Server
            str = "UPDATE `product_img` SET `product_id`=?,`url`=?,`product_img_status`=? WHERE `img_id`=?";
            //create query
            pst = con.prepareStatement(str);
            //set values
            pst.setInt(4, img_id);
            pst.setInt(1, product_id);
            pst.setString(2, url);
            pst.setInt(3, product_img_status);
            //excute query
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }        
        return false;
    } 
}
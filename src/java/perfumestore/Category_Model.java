/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

import connection.GetConnection;
import java.awt.Frame;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Nhat Thanh
 */
public class Category_Model {

    //attributes and arraylist
    private ArrayList<Category> category = new ArrayList<Category>();
    private Connection con;
    private static GetConnection getCon;
    private PreparedStatement pst;
    private Statement st;
    private ResultSet rs;
    private String str;

    /**
     * Create new Category Model
     *
     * @throws SQLException
     */
    public Category_Model() throws SQLException {
        try {
            //connect to DB
            getCon = new GetConnection();
            con = getCon.getConnection();
            st = con.createStatement();
            pst = null;
            rs = null;
            str = "";
        } catch (Exception e) {
            throw new SQLException("PLEASE CONNECT TO DATABASE BEFORE START");
        }
    }

    /**
     * Load Category from database
     *
     * @return
     * @throws SQLException
     */
    public ArrayList<Category> loadCategory() throws SQLException {
        ArrayList<Category> category = new ArrayList<Category>();
        try {
            con = getCon.getConnection();
            st = con.createStatement();
            //Create sql select all
            str = "SELECT * FROM `category`";
            //execute query
            rs = st.executeQuery(str);
            if (rs.isBeforeFirst()) {
                while (rs.next()) {
                    //set value to select
                    int category_id = rs.getInt("category_id");
                    String category_name = rs.getString("category_name");
                    int category_status = rs.getInt("category_status");
                    category.add(new Category(category_id, category_name, category_status));
                }
            }
        } catch (Exception e) {
        }
        return category;
    }

    /**
     * load date to table
     *
     * @param table
     * @param frame
     * @param arr
     */
    //public void loadCategoryToTable(JTable table, Frame frame, ArrayList<Category> arr){       
    //   DefaultTableModel dtm = (DefaultTableModel) table.getModel();
    //    dtm.setRowCount(0);
    //   //loop to scan data all table
    //    for (int i = 0; i < arr.size(); i++) {
    //        Object[] row ={arr.get(i).getCategory_id(),arr.get(i).getCategory_name(),arr.get(i).getCategory_status()};
    //        dtm.addRow(row);
    //    }
    //}
    /**
     * insert new category
     *
     * @param category_id
     * @param category_name
     * @param category_status
     * @return
     * @throws SQLException
     */
    public int insertCategory(int category_id, String category_name, int category_status) throws SQLException {
        try {
            //link load from Category database in SQL Server
            str = "INSERT INTO `category`(`category_name`, `category_status`, `category_id`) VALUES (?,?,?)";
            //create query
            pst = con.prepareStatement(str, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setInt(3, category_id);
            pst.setString(1, category_name);
            pst.setInt(2, category_status);
            //execute query
            pst.executeUpdate();
            rs = pst.getGeneratedKeys();
            rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) throws SQLException, Category_Exception {
        Category_Model a = new Category_Model();
        //a.update(1, "VNient", 1);
        System.out.println(a.insertCategory(5, "lesbian", 1));
    }

    /**
     * Get category from category_id
     *
     * @param category_id
     * @return Category if success. Otherwise, null
     */
    public Category getCategory(int category_id) {
        for (int i = 0; i < category.size(); i++) {
            if (category.get(i).getCategory_id() == category_id) {
                return category.get(i);
            }
        }
        return null;
    }

    /**
     * update information of Category
     *
     * @param category_id
     * @param category_name
     * @param category_status
     * @return
     * @throws SQLException
     * @throws Category_Exception
     */
    public boolean updateCategory(int category_id, String category_name, int category_status) throws SQLException, Category_Exception {
        try {
            //link load from Category database in SQL Server
            str = "UPDATE `category` SET `category_name`=?,`category_status`=? WHERE `category_id`=?";
            con = GetConnection.getConnection();
            st = con.createStatement();
            //create query
            pst = con.prepareStatement(str);
            //set values

            pst.setString(1, category_name);
            pst.setInt(2, category_status);
            pst.setInt(3, category_id);
            //excute query
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * get All Category
     *
     * @return category list
     */
    public ArrayList<Category> getAll_Category() {
        try {
            String sqlStr = "";
            sqlStr += " SELECT * ";
            sqlStr += " FROM `category`";
            //sqlStr += " WHERE a.l_ma = b.l_ma ";
            sqlStr += " ORDER BY category_id";
            this.st = this.con.createStatement();
            this.rs = this.st.executeQuery(sqlStr);
            category = new ArrayList<Category>();
            while (rs.next()) {
                int category_id = rs.getInt("category_id");
                String category_name = rs.getString("category_name");
                int category_status = rs.getInt("category_status");
                category.add(new Category(category_id, category_name, category_status));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Category_Model.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this.category;
    }
}

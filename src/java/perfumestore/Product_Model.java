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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nhat Thanh
 */
public class Product_Model {

    //attributes and arrayproduct
    private ArrayList<Product> product = new ArrayList<Product>();
    private Connection con;
    private static GetConnection getCon;
    private PreparedStatement pst;
    private Statement st;
    private ResultSet rs;    
    private String tblName = "products";
   // private String[] tblCols = {"product_id"};

    /**
     * Create new Product Model
     *
     * @throws SQLException
     */
    public Product_Model() throws SQLException {
        try {
            //connect to DB
            getCon = new GetConnection();
            con = getCon.getConnection();
            st = con.createStatement();
            pst = null;
            rs = null;
            
        } catch (Exception e) {
            throw new SQLException("PLEASE CONNECT TO DATABASE BEFORE START");
        }
    }

    /**
     * Load product from database
     *
     * @return
     * @throws SQLException
     */
    public ArrayList<Product> loadProduct() throws SQLException {
        ArrayList<Product> product = new ArrayList<Product>();
        try {
            con = getCon.getConnection();
            st = con.createStatement();
            String sqlStr = "";
            //Create sql select all
            sqlStr += "SELECT a.*, b.brand_name, c.category_name "
                    + "FROM `products` as a, brand as b, category as c "
                    + "WHERE a.category_id = c.category_id AND a.brand_id = b.brand_id "
                    + "ORDER BY a.product_id";
            //execute query
            rs = st.executeQuery(sqlStr);
            if (rs.isBeforeFirst()) {
                while (rs.next()) {
                    //set value to select
                    int product_id = rs.getInt("product_id");
                    String name = rs.getString("name");
                    double volume = rs.getDouble("volume");
                    int category_id = rs.getInt("category_id");
                    int brand_id = rs.getInt("brand_id");
                    double original_price = rs.getDouble("original_price");
                    double current_price = rs.getDouble("current_price");
                    String description = rs.getString("description");
                    int product_status = rs.getInt("product_status");
                    String brandName = rs.getString("brand_name");
                    String category_name = rs.getString("category_name");
                    //output attribute of product
                    product.add(new Product(product_id, name, volume, category_id, brand_id, original_price, current_price, description, product_status, brandName, category_name));
                }
            }
        } catch (Exception e) {
        }
        return product;
    }

//    /**
//     * load date to table
//     * @param table
//     * @param frame
//     * @param arr 
//     */
//    public void loadProductToTable(JTable table, Frame frame, ArrayList<Product> arr) {
//        DefaultTableModel dtm = (DefaultTableModel) table.getModel();
//        dtm.setRowCount(0);
//        //loop to scan data all table
//        for (int i = 0; i < arr.size(); i++) {
//            Object[] row = {arr.get(i).getProduct_id(), arr.get(i).getName(), arr.get(i).getVolume(), arr.get(i).getCategoty_id(), arr.get(i).getBrand_id(),
//                arr.get(i).getOriginal_price(), arr.get(i).getCurrent_price(), arr.get(i).getDescription(), arr.get(i).getDescription()};
//            dtm.addRow(row);
//        }
//    }
    /**
     * Check whether product ID exist or not
     *
     * @param product_id
     * @return true if exist, false if not
     * @throws SQLException
     */
    public boolean isIdExist(int product_id) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        
        //create sql string
        String sqlStr = "select * from " + tblName + " where product_id = ? limit 1";
        //creaste query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setInt(1, product_id);
        //eecute query
        rs = pst.executeQuery();
        //if result found
        if (rs.next() != false) {
            pst.close();
            return true;
        }
        pst.close();
        return false;
    }

    /**
     * insert new product
     *
     * @param product_id
     * @param name
     * @param volume
     * @param category_id
     * @param brand_id
     * @param original_price
     * @param current_price
     * @param description
     * @param product_status
     * @return
     * @throws SQLException
     */
    public int insertProduct(int product_id, String name, double volume, int category_id, int brand_id, double original_price, double current_price, String description, int product_status) throws SQLException {
        try {
            String sqlStr = "";
            //link load from Motel database in SQL Server
            sqlStr = "INSERT INTO `products`(`name`, `volumne`, `category_id`, `brand_id`, `original_price`, `current_price`, `description`, `product_status`, `product_id`) VALUES (?,?,?,?,?,?,?,?,?)";
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setInt(9, product_id);
            pst.setString(1, name);
            pst.setDouble(2, volume);
            pst.setInt(3, category_id);
            pst.setInt(4, brand_id);
            pst.setDouble(5, original_price);
            pst.setDouble(6, current_price);
            pst.setString(7, description);
            pst.setInt(8, product_status);
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
     * Get product from product_id
     *
     * @param product_id
     * @return Category if success. Otherwise, null
     */
    public Product getProduct(int product_id) {
        for (int i = 0; i < product.size(); i++) {
            if (product.get(i).getProduct_id() == product_id) {
                return product.get(i);
            }
        }
        return null;
    }

    /**
     * update information of Product
     *
     * @param product_id
     * @param name
     * @param volume
     * @param category_id
     * @param brand_id
     * @param original_price
     * @param current_price
     * @param description
     * @param product_status
     * @return
     * @throws SQLException
     * @throws Product_Exception
     */
    public boolean updateAccount(int product_id, String name, double volume, int category_id, int brand_id, double original_price, double current_price, String description, int product_status) throws SQLException, Product_Exception {
        try {
            String sqlStr = "";
            //link load from Product database in SQL Server
            sqlStr = "UPDATE `products` SET `name`=?,`volumne`=?,`category_id`=?,`brand_id`=?,`original_price`=?,"
                    + "`current_price`=?,`description`=?,`product_status`=?,`created_at`=? WHERE `product_id`=?";
            //create query
            pst = con.prepareStatement(sqlStr);
            //set values
            pst.setInt(9, product_id);
            pst.setString(1, name);
            pst.setDouble(2, volume);
            pst.setInt(3, category_id);
            pst.setInt(4, brand_id);
            pst.setDouble(5, original_price);
            pst.setDouble(6, current_price);
            pst.setString(7, description);
            pst.setInt(8, product_status);
            //excute query
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * calcalate discount of product
     *
     * @param ogirinal_price
     * @param current_price
     * @return percent (0.01,,,,)
     */
    public double Calculate_Discount(double ogirinal_price, double current_price) {
        double discount = 1 - (current_price / ogirinal_price);
        return discount;
    }

    /**
     * Get product base on page
     *
     * @param page
     * @param search
     * @param sortColumn
     * @param productsPerPage
     * @return
     */
    public ArrayList<Product> getPaging(int page, String search, String sortColumn, int productsPerPage) {
        try {
            String sqlStr = "";
            sqlStr += " SELECT a.*, b.brand_name, c.category_name ";
            sqlStr+= " FROM `products` as a, `brand` as b, `category` as c ";
            sqlStr += " WHERE a.category_id = c.category_id AND a.brand_id = b.brand_id ";
            sqlStr += " ORDER BY a.product_id ";

            if (search != "") {
                //sqlStr += " AND (a.sp_ten like '%" + search + "%' OR b.l_ten like '%" + search + "%') ";
            }

            if (sortColumn != "") {
                //thuc hien sap xep
            }

            //phan trang
            int totalProduct = getNumberOfProduct(search, sortColumn);
            int totalPages = (int) Math.ceil(totalProduct / (float) productsPerPage);
            int index = (page - 1) * productsPerPage;

            sqlStr += " LIMIT " + index + ", " + productsPerPage;

            this.st = this.con.createStatement();
            this.rs = this.st.executeQuery(sqlStr);
            product = new ArrayList<Product>();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                String name = rs.getString("name");
                Double volume = rs.getDouble("volume");
                int category_id = rs.getInt("category_id");
                int brand_id = rs.getInt("brand_id");
                Double original_price = rs.getDouble("original_price");
                Double current_price = rs.getDouble("current_price");
                String description = rs.getString("description");
                int product_status = rs.getInt("product_status");
                String brandName = rs.getString("brand_name");
                String category_name = rs.getString("category_name");

                product.add(new Product(product_id, name, volume, category_id, brand_id, original_price, current_price, description, product_status, brandName, category_name));
                product.get(product.size() - 1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product_Model.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this.product;
    }

    /**
     * Get total number of products
     *
     * @param search
     * @param sortColumn
     * @return
     * @throws SQLException
     */
    public int getNumberOfProduct(String search, String sortColumn) throws SQLException {
        String sqlStr = "";
        sqlStr += " SELECT count(*) as soLuong ";
        sqlStr += " FROM `products`";
        //sqlStr += " WHERE a.l_ma = b.l_ma ";
        if (!search.isEmpty()) {
            //  sqlStr += " AND (a.sp_ten like '%" + search + "%' OR b.l_ten like '%" + search + "%') ";
        }
        this.st = this.con.createStatement();
        this.rs = this.st.executeQuery(sqlStr);
        rs.next();
        return rs.getInt("soLuong");
    }

}

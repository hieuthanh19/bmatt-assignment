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

    public Product loadMyProduct(int id) throws SQLException {

        Product ob = new Product();
        try {
            String str;
            con = getCon.getConnection();
            st = con.createStatement();
            str = "SELECT * FROM `products` WHERE `product_id` = " + id;
            rs = st.executeQuery(str);
            while (rs.next()) {
                String name = rs.getString("Name");
                double volume = rs.getDouble("Volume");
                int category_id = rs.getInt("Category_Id");
                int brand_id = rs.getInt("Brand_Id");
                double original_price = rs.getDouble("Original_Price");
                double current_price = rs.getDouble("Current_Price");
                String description = rs.getString("Description");
                int product_status = rs.getInt("Product_Status");
                //Date created_at = rs.getDate("Created_At");
                ob = new Product(id, name, volume, category_id, brand_id, original_price, current_price, description, product_status);
                //product.add(new Product(product_id, name, volume, category_id, brand_id, original_price, current_price, description, product_status, created_at));
                //return ob;
            }
        } catch (Exception e) {
        }
        return ob;
    }

    /**
     * load list information by brand_id
     * @param brand_id
     * @return
     * @throws SQLException 
     */
    public ArrayList<Product> loadProductList(int brand_id) throws SQLException {
        ArrayList<Product> lst = new ArrayList<Product>();
        Product ob = new Product();
        try {
            String str;
            con = getCon.getConnection();
            st = con.createStatement();
            str = "SELECT * FROM `products` WHERE `brand_id` = " + brand_id;
            rs = st.executeQuery(str);
            while (rs.next()) {
                String name = rs.getString("Name");
                double volume = rs.getDouble("Volume");
                int category_id = rs.getInt("Category_Id");
                int id = rs.getInt("product_id");
                double original_price = rs.getDouble("Original_Price");
                double current_price = rs.getDouble("Current_Price");
                String description = rs.getString("Description");
                int product_status = rs.getInt("Product_Status");
                //Date created_at = rs.getDate("Created_At");
                ob = new Product(id, name, volume, category_id, brand_id, original_price, current_price, description, product_status);
                lst.add(ob);
                //return ob;
            }
        } catch (Exception e) {
        }
        return lst;
    }

    /**
     * Remove all redundant white space
     *
     * @param description
     * @return
     */
    public String formatDescription(String description) {
        String trimmed = description.trim();
        return trimmed.replaceAll("\\s+", "");

    }

    /**
     * Format string for displaying
     *
     * @param string
     * @param maxLength
     * @return
     */
    public String formatStringForDisplaying(String string, int maxLength) {
        if (string == null) {
            return "Empty Description!";
        }

        String[] stringArr = string.split(" ");
        String result = "";

        //loop
        for (int i = 0; i < stringArr.length; i++) {
            //
            if (i == 0) {
                result += stringArr[0];
                if (result.length() > maxLength) {
                    result += "...";
                    break;

                }
            } else {

                if (result.length() + stringArr[i].length() <= maxLength) {
                    result += " " + stringArr[i];
                } else {

                    result += "...";
                    break;
                }

            }

        }
        return result;
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
    public int insertProduct(String name, double volume, int category_id, int brand_id, double original_price, double current_price, String description, int product_status) throws SQLException {
        try {
            String sqlStr = "";
            //link load from Motel database in SQL Server
            sqlStr = "INSERT INTO `products`(`name`, `volume`, `category_id`, `brand_id`, `original_price`, `current_price`, `description`, `product_status`) VALUES (?,?,?,?,?,?,?,?)";
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values            
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
            return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    /**
     * Get product from product_id
     *
     * @param product_id
     * @return Product if success. Otherwise, null
     */
    public Product getProduct(int product_id) {
        try {
            //connect to DB
            con = getCon.getConnection();
            //create sql string
            String sqlStr = "SELECT a.*, b.brand_name, c.category_name "
                    + " FROM `products` as a, brand as b, category as c "
                    + " WHERE a.category_id = c.category_id AND a.brand_id = b.brand_id AND a.product_id = ? "
                    + " ORDER BY a.product_id";
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setInt(1, product_id);
            //excute query
            rs = pst.executeQuery();
            //get data
            while (rs.next()) {
                //set value to select               
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
                Product result = new Product(product_id, name, volume, category_id, brand_id, original_price, current_price, description, product_status, brandName, category_name);
                pst.close();
                return result;
            }
            pst.close();
            return null;

        } catch (SQLException ex) {
            Logger.getLogger(Product_Model.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
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
    public boolean updateProduct(int product_id, String name, double volume, int category_id, int brand_id, double original_price, double current_price, String description, int product_status) throws SQLException, Product_Exception {
        try {
            String sqlStr = "";
            //link load from Product database in SQL Server
            sqlStr = "UPDATE `products` SET `name`=?,`volume`=?,`category_id`=?,`brand_id`=?,`original_price`=?,"
                    + "`current_price`=?,`description`=?,`product_status`=? WHERE `product_id`=?";
            //create query
            pst = con.prepareStatement(sqlStr);
            //set values

            pst.setString(1, name);
            pst.setDouble(2, volume);
            pst.setInt(3, category_id);
            pst.setInt(4, brand_id);
            pst.setDouble(5, original_price);
            pst.setDouble(6, current_price);
            pst.setString(7, description);
            pst.setInt(8, product_status);
            pst.setInt(9, product_id);
            //excute query
            pst.executeUpdate();
            pst.close();
            return true;
        } catch (SQLException e) {
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
     * Get product base on conditions
     *
     * @param page
     * @param search
     * @param sort
     * @param productsPerPage
     * @param categoryId
     * @param brandId
     * @param volume_start
     * @param volume_end
     * @param priceStart
     * @param priceEnd
     * @return
     */
    public ArrayList<Product> getPaging(int page, String search, int sort, int productsPerPage, int categoryId, int brandId, double volume_start, double volume_end, double priceStart, double priceEnd) {
        try {
            con = GetConnection.getConnection();

            String sqlStr = "";
            sqlStr += " SELECT a.*, b.brand_name, c.category_name ";
            sqlStr += " FROM `products` as a, `brand` as b, `category` as c ";
            sqlStr += " WHERE a.category_id = c.category_id AND a.brand_id = b.brand_id AND a.product_status AND a.`product_status` != 0 ";

            if (categoryId != 0) {
                sqlStr += " AND a.category_id = " + categoryId + " ";
            }
            if (brandId != 0) {
                sqlStr += " AND a.brand_id = " + brandId + " ";
            }
            //get volume range
            sqlStr += " AND (a.volume > " + volume_start + " ";
            sqlStr += " AND a.volume <= " + volume_end + ") ";
            //get price range
            sqlStr += "  AND (a.current_price > " + priceStart + " ";
            sqlStr += "  AND a.current_price < " + priceEnd + ") ";

            if (!search.isEmpty()) {
                sqlStr += " AND (a.name like '%" + search + "%' OR c.category_name like '%" + search + "%' OR b.brand_name like '%" + search + "%') ";
            }

            if (sort != 0) {
                sqlStr += " ORDER BY a.current_price ";
                if (sort == 1) {
                    sqlStr += " ASC ";
                }
                if (sort == 2) {

                    sqlStr += " DESC ";
                }
            } else {
                sqlStr += " ORDER BY a.product_id ";
            }

            //phan trang
            int totalProduct = getNumberOfProduct(page, search, sort, productsPerPage, categoryId, brandId, volume_start, volume_end, priceStart, priceEnd);
            int totalPages = (int) Math.ceil(totalProduct / (float) productsPerPage);
            int index = (page - 1) * productsPerPage;

            sqlStr += " LIMIT " + index + ", " + productsPerPage;

            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            rs = pst.executeQuery();
            ArrayList<Product> productList = new ArrayList<>();
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
                productList.add(new Product(product_id, name, volume, category_id, brand_id, original_price, current_price, description, product_status, brandName, category_name));
                productList.get(productList.size() - 1);
            }
            pst.close();
            return productList;
        } catch (SQLException ex) {
            Logger.getLogger(Product_Model.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

    /**
     * Get total number of products
     *
     * @param search
     * @return
     * @throws SQLException
     */
    public int getNumberOfProduct(int page, String search, int sort, int productsPerPage, int categoryId, int brandId, double volume_start, double volume_end, double priceStart, double priceEnd) throws SQLException {
        con = GetConnection.getConnection();

        String sqlStr = "";
        sqlStr += " SELECT COUNT(*) as number_of_products";
        sqlStr += " FROM `products` as a, `brand` as b, `category` as c ";
        sqlStr += " WHERE a.category_id = c.category_id AND a.brand_id = b.brand_id AND a.product_status AND a.`product_status` != 0 ";

        if (categoryId != 0) {
            sqlStr += " AND a.category_id = " + categoryId + " ";
        }
        if (brandId != 0) {
            sqlStr += " AND a.brand_id = " + brandId + " ";
        }
        //get volume range
        sqlStr += " AND (a.volume > " + volume_start + " ";
        sqlStr += " AND a.volume <= " + volume_end + ") ";
        //get price range
        sqlStr += "  AND (a.current_price > " + priceStart + " ";
        sqlStr += "  AND a.current_price < " + priceEnd + ") ";

        if (!search.isEmpty()) {
            sqlStr += " AND (a.name like '%" + search + "%' OR c.category_name like '%" + search + "%' OR b.brand_name like '%" + search + "%') ";
        }

        if (sort != 0) {
            sqlStr += " ORDER BY a.current_price ";
            if (sort == 1) {
                sqlStr += " ASC ";
            }
            if (sort == 2) {

                sqlStr += " DESC ";
            }
        } else {
            sqlStr += " ORDER BY a.product_id ";
        }
        this.st = this.con.createStatement();
        this.rs = this.st.executeQuery(sqlStr);
        rs.next();

        return rs.getInt("number_of_products");
    }

    /**
     * Get all product
     *
     * @return
     */
    public ArrayList<Product> getAllProduct() {
        try {
            //connect to DB
            con = getCon.getConnection();
            //create sql string
            String sqlStr = "SELECT a.*, b.brand_name, c.category_name "
                    + " FROM `products` as a, brand as b, category as c "
                    + " WHERE a.category_id = c.category_id AND a.brand_id = b.brand_id"
                    + " ORDER BY a.product_id";
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);

            //excute query
            rs = pst.executeQuery();

            ArrayList<Product> resultList = new ArrayList<>();
            //get data
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
                resultList.add(new Product(product_id, name, volume, category_id, brand_id, original_price, current_price, description, product_status, brandName, category_name));
            }
            pst.close();
            return resultList;

        } catch (SQLException ex) {
            Logger.getLogger(Product_Model.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}

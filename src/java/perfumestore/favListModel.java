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
 * @author ThanhKH
 */
public class favListModel {
    //attributes

    private static Connection con;
    private static GetConnection getCon;
    private static PreparedStatement pst;
    private static ResultSet rs;
    private static UserModel userM;
    private static Product_Model productM;
    //table info
    private static String tblName = "favlist";
    private static String[] tblCols = {"user_id", "product_id"};

    /**
     * Create new Favorite List Model
     */
    public favListModel() throws SQLException {
        getCon = new GetConnection();
        userM = new UserModel();
        productM = new Product_Model();
    }

    /**
     * Insert new FavoriteMovie in DB
     *
     * @param user_id client id
     * @param product_id movie ID
     * @return c_id if success, -1 if not
     * @throws SQLException
     */
    public int insert(int user_id, int product_id) throws SQLException {
        //check if Client ID and Movie ID valid
        if (productM.isIdExist(product_id) && userM.isIdExist(user_id)) {
            //connect to DB
            con = getCon.getConnection();
            //Create sql string
            String sqlStr = "insert into " + tblName + " (" + tblCols[0];
            //set cols in sqlStr
            for (int i = 1; i < tblCols.length; i++) {
                sqlStr += ", " + tblCols[i];
                if (i == tblCols.length - 1) {
                    sqlStr += ") ";
                }
            }
            //set insert values
            sqlStr += "values (?";
            //set cols in sqlStr
            for (int i = 1; i < tblCols.length; i++) {
                sqlStr += ", ?";
                if (i == tblCols.length - 1) {
                    sqlStr += ") ";
                }
            }
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setInt(1, user_id);
            pst.setInt(2, product_id);

            //execute query
            pst.executeUpdate();
            //get account ID
            rs = pst.getGeneratedKeys();
            rs.next();
            pst.close();
            return user_id;
        } else {
            return -1;
        }
    }

    /**
     * Update values of FavoriteMovie
     *
     * @param p_id product ID
     * @param u_id user ID
     * @throws SQLException
     */
    public void update(int p_id, int u_id) throws SQLException {
        if (userM.isIdExist(u_id) && productM.isIdExist(p_id)) {
            //connect to DB
            con = getCon.getConnection();
            //create sql string
            String sqlStr = "UPDATE " + tblName + " SET " + tblCols[0];
            for (int i = 1; i < tblCols.length; i++) {
                sqlStr += " =?, " + tblCols[i];
                if (i == tblCols.length - 1) {
                    sqlStr += " =?";
                }
            }
            sqlStr += " WHERE" + tblCols[0] + "= ?";
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setInt(1, u_id);
            pst.setInt(2, p_id);
            pst.setInt(3, u_id);
            //execute query
            pst.executeUpdate();
            pst.close();
        }
    }

    /**
     * Get favorite movies from client ID
     *
     * @param uId user ID
     * @return
     * @throws SQLException
     */
    public ArrayList<favList> getFavortieMovie(int uId) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        //create sql string
        String sqlStr = "SELECT * FROM " + tblName + " WHERE " + tblCols[0] + "=?";
        //create query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        //set values
        pst.setInt(1, uId);
        //excute query
        rs = pst.executeQuery();
        //get return data
        ArrayList<favList> resultList = new ArrayList<>();
        while (rs.next() != false) {
            int u_id = rs.getInt("user_id");
            int p_id = rs.getInt("product_id");
            //add to result list
            resultList.add(new favList(u_id, p_id));
        }
        return resultList;

    }

    /**
     * Check if a movie is in favorite movie list
     *
     * @param userId user ID
     * @param productId product ID
     * @return true if exist, false if not
     * @throws SQLException
     */
    public boolean isInFavoriteList(int userId, int productId) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        //create sql string
        String sqlStr = "SELECT * FROM " + tblName + " WHERE " + tblCols[0] + "=? AND " + tblCols[1] + "=?";
        //create query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        //set values
        pst.setInt(1, userId);
        pst.setInt(2, productId);
        //excute query
        rs = pst.executeQuery();
        //get return data
        return rs.next();
    }

    /**
     * Delete a client's favorite movie
     *
     * @param userId Client ID
     * @param productId product ID
     * @throws SQLException
     */
    public void deleteFavMovie(int userId, int productId) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        //create sql string
        String sqlStr = "DELETE FROM " + tblName + " WHERE " + tblCols[0] + "=? AND " + tblCols[1] + "=?";
        //create query
        pst = con.prepareStatement(sqlStr);
        //set values
        pst.setInt(1, userId);
        pst.setInt(2, productId);
        //excute query
        pst.executeUpdate();
    }
}

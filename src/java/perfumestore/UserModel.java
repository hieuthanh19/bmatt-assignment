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

/**
 *
 * @author ThanhKH
 * latest update: 24/10/2019
 */
public class UserModel {
    //attributes

    private static Connection con;
    private static GetConnection getCon;
    private static PreparedStatement pst;
    private static ResultSet rs;
    private static AccountModel accM;
    //table info
    private static String tblName = "users";
    private static String[] tblCols = {"user_id", "full_name", "address", "phone", "email", "profile_picture", "account_id", "user_status", "created_at"};

    /**
     * Create new User Model
     */
    public UserModel() {
        getCon = new GetConnection();
        accM = new AccountModel();
    }

    /**
     * Check whether User ID exist or not
     *
     * @param u_id user ID
     * @return true if exist, false if not
     * @throws SQLException
     */
    public boolean isIdExist(int u_id) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        //create sql string
        String sqlStr = "select * from " + tblName + " where " + tblCols[0] + "= ? limit 1";
        //creaste query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setInt(1, u_id);
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
     * Insert new User to DB
     *
     * @param full_name user name
     * @param address
     * @param phone
     * @param email user email
     * @param profile_picture
     * @param account_id account ID
     * @param user_status
     * @return user ID if success, -1 if not
     * @throws SQLException
     */
    public int insert(String full_name, String address, String phone, String email, String profile_picture, int account_id, int user_status) throws SQLException {
        //check if ID valid
        if (accM.isIdExist(account_id)) {
            //connect to DB
            con = getCon.getConnection();
            //create sql string            
            String sqlStr = "insert into " + tblName + " (" + tblCols[1];
            //set cols in sqlStr
            for (int i = 2; i < tblCols.length - 1; i++) {
                sqlStr += ", " + tblCols[i];
                if (i == tblCols.length - 2) {
                    sqlStr += ") ";
                }
            }
            //set insert values
            sqlStr += "values (?";
            //set cols in sqlStr
            for (int i = 2; i < tblCols.length - 1; i++) {
                sqlStr += ", ?";
                if (i == tblCols.length - 2) {
                    sqlStr += ") ";
                }
            }
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setString(1, full_name);
            pst.setString(2, address);
            pst.setString(3, phone);
            pst.setString(4, email);
            pst.setString(5, profile_picture);
            pst.setInt(6, account_id);
            pst.setInt(7, user_status);
            //execute query
            pst.executeUpdate();
            //get account ID
            rs = pst.getGeneratedKeys();
            rs.next();
            int c_id = rs.getInt(1);
            pst.close();
            return c_id;
        } else {
            return -1;
        }
    }

    /**
     * Update info of a User using user ID
     *
     * @param user_id user ID
     * @param full_name full name
     * @param phone phone number
     * @param email email
     * @param profile_picture path of profile_picture
     * @param account_id account ID
     * @param user_status 0: banned, 1: active
     * @param address address
     * @throws SQLException
     * @throws perfumestore.UserException
     */
    public void update(int user_id, String full_name, String address, String phone, String email, String profile_picture, int account_id, int user_status) throws SQLException, UserException {
        //valid: acc_id and c_id must exist in DB
        if (accM.isIdExist(account_id) && isIdExist(user_id)) {
            con = getCon.getConnection();
            //Create sql string
            String sqlStr = "UPDATE " + tblName + " SET " + tblCols[1];
            for (int i = 2; i < tblCols.length - 1; i++) {
                sqlStr += " =?, " + tblCols[i];
                if (i == tblCols.length - 2) {
                    sqlStr += " =?";
                }
            }
            sqlStr += " WHERE " + tblCols[0] + " = ?";
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setString(1, full_name);
            pst.setString(2, address);
            pst.setString(3, phone);
            pst.setString(4, email);
            pst.setString(5, profile_picture);
            pst.setInt(6, account_id);
            pst.setInt(7, user_status);
            pst.setInt(8, user_id);
            //excute query
            pst.executeUpdate();
            pst.close();
        } else {
            throw new UserException("User ID or Account ID is not exist!");
        }
    }
    
    /**
     * Update User using account ID
     * @param full_name
     * @param address
     * @param phone
     * @param email
     * @param profile_picture
     * @param account_id
     * @param user_status
     * @throws SQLException
     * @throws UserException 
     */
     public void update(String full_name, String address, String phone, String email, String profile_picture, int account_id, int user_status) throws SQLException, UserException {
        //valid: acc_id and c_id must exist in DB
        if (accM.isIdExist(account_id)) {
            con = getCon.getConnection();
            //Create sql string
            String sqlStr = "UPDATE " + tblName + " SET " + tblCols[1];
            for (int i = 2; i < tblCols.length - 1; i++) {
                sqlStr += " =?, " + tblCols[i];
                if (i == tblCols.length - 2) {
                    sqlStr += " =?";
                }
            }
            sqlStr += " WHERE " + tblCols[6] + " = ?";
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setString(1, full_name);
            pst.setString(2, address);
            pst.setString(3, phone);
            pst.setString(4, email);
            pst.setString(5, profile_picture);
            pst.setInt(6, account_id);
            pst.setInt(7, user_status);
            pst.setInt(8, account_id);
            //excute query
            pst.executeUpdate();
            pst.close();
        } else {
            throw new UserException("User ID or Account ID is not exist!");
        }
    }

    /**
     * Get User info from account ID
     *
     * @param accId account ID
     * @return User or null
     * @throws SQLException
     * @throws perfumestore.UserException
     */
    public User getUser(int accId) throws SQLException, UserException {
        //check whether Account ID is exist
        if (accM.isIdExist(accId)) {
            //connect to DB
            con = getCon.getConnection();
            //create sql string
            String sqlStr = "SELECT * FROM " + tblName + " WHERE " + tblCols[6] + "= ?";
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setInt(1, accId);
            //excute query
            rs = pst.executeQuery();
            //get data
            while (rs.next() != false) {
                int user_id = rs.getInt(tblCols[0]);
                String full_name = rs.getString(tblCols[1]);
                String address = rs.getString(tblCols[2]);
                String phone = rs.getString(tblCols[3]);
                String email = rs.getString(tblCols[4]);
                String profile_picture = rs.getString(tblCols[5]);
                int account_id = rs.getInt(tblCols[6]);
                int user_status = rs.getInt(tblCols[7]);
                String created_at = rs.getString(tblCols[8]);
                //create new Client
                User result = new User(user_id, full_name, address, phone, email, profile_picture, account_id, created_at, user_status);
                pst.close();
                return result;
            }
        } else {
            pst.close();
            throw new UserException("Account ID is not exist!");
        }
        return null;
    }
}

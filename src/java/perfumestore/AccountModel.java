/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

import connection.GetConnection;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
 * @author ThanhKH
 */
public class AccountModel {

    //attributes
    private static Connection con;
    private static GetConnection getCon;
    private static PreparedStatement pst;
    private static ResultSet rs;
    private static UserRoleModel roleM = new UserRoleModel();

    //table info
    private static String tblName = "accounts";
    private static String[] tblCols = {"account_id", "username", "password", "account_status", "role_id"};

    /**
     * Create new Account Model
     */
    public AccountModel() {
        getCon = new GetConnection();
    }

    /**
     * Check if given username is duplicate
     *
     * @param account_username
     * @return true is exist, false if not
     * @throws SQLException
     */
    public boolean isUsernameExist(String account_username) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        //Create sql string
        String sqlStr = "select " + tblCols[1] + " from " + tblName + " where " + tblCols[1] + "= ? limit 1";
        //crete query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, account_username);
        //execute query
        rs = pst.executeQuery();
        //if result found
        if (rs.next() != false) {
            pst.close();
            return true;
        }
        return false;

    }

    /**
     * Create md5 string
     *
     * @param input string
     * @return
     */
    public String getMd5(String input) {
        try {

            // Static getInstance method is called with hashing MD5 
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest 
            //  of an input digest() return array of byte 
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation 
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value 
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } // For specifying wrong message digest algorithms 
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Check if password is correct
     *
     * @param password account password
     * @param username account username
     * @return true if password is correct. Otherwise, false
     * @throws SQLException
     */
    public boolean isPasswordCorrect(String password, String username) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        //Create sql string
        String sqlStr = "select " + tblCols[1] + " from " + tblName + " where " + tblCols[0] + "= ?";
        //crete query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, username);
        //execute query
        rs = pst.executeQuery();
        //if result found
        if (rs.next() != false) {
            //get password from server
            String acc_password = rs.getString(tblCols[2]);
            //compare with input
            if (acc_password.equals(getMd5(password))) {
                pst.close();
                return true;
            }
        }
        pst.close();
        return false;
    }

    /**
     * Check whether an ID is exist
     *
     * @param account_id account ID
     * @return true if ID exist in DB. Otherwise, false
     * @throws SQLException
     */
    public boolean isIdExist(int account_id) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        //create sql string
        String sqlStr = "select " + tblCols[0] + "  from " + tblName + " where " + tblCols[0] + "= ?  limit 1";
        //creaste query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setInt(1, account_id);
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
     * Insert new Account into DB
     *
     * @param account_username user name
     * @param account_password password
     * @param role_id 1: user, 2: mod, 3: manager, 4: admin
     * @param acc_status status of an account. 0 is under banned and 1 is normal
     * @return acc_id or -1 if error
     * @throws SQLException
     * @throws perfumestore.AccountException
     */
    public int insert(String account_username, String account_password, int acc_status, int role_id) throws SQLException, AccountException {
        //check if username is valid or not
        if (!isUsernameExist(account_username) && roleM.isIdExist(role_id)) {
            //connect to DB
            con = getCon.getConnection();
            //Create sql string
            String sqlStr = "insert into " + tblName + " (" + tblCols[1];
            //set cols in sqlStr
            for (int i = 2; i < tblCols.length; i++) {
                sqlStr += ", " + tblCols[i];
                if (i == tblCols.length - 1) {
                    sqlStr += ") ";
                }
            }
            //set insert values
            sqlStr += "values (?";
            //set cols in sqlStr
            for (int i = 2; i < tblCols.length; i++) {
                sqlStr += ", ?";
                if (i == tblCols.length - 1) {
                    sqlStr += ") ";
                }
            }
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setString(1, account_username);
            pst.setString(2, getMd5(account_password));
            pst.setInt(3, acc_status);
            pst.setInt(4, role_id);
            //execute query
            pst.executeUpdate();
            //get account ID
            rs = pst.getGeneratedKeys();
            rs.next();
            int acc_id = rs.getInt(1);
            pst.close();
            return acc_id;
        } else {
            pst.close();
            return -1;
        }

    }

    /**
     * Update information of Account
     *
     * @param account_id
     * @param account_password
     * @param role_id
     * @param acc_status status of an account. 0 is under banned and 1 is normal
     * @throws SQLException
     * @throws perfumestore.AccountException
     */
    public void update(int account_id, String account_password, int acc_status, int role_id) throws SQLException, AccountException {
        //valid: account ID must exist in DB
        if (isIdExist(account_id)) {
            con = getCon.getConnection();
            //Create sql string
            String sqlStr = "UPDATE " + tblName + " SET " + tblCols[2] + " =?,"
                    + tblCols[3] + " =?,"
                    + tblCols[4] + " =?"
                    + " WHERE " + tblCols[0] + " = ?";
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setString(1, getMd5(account_password));
            pst.setInt(2, acc_status);
            pst.setInt(3, role_id);
            pst.setInt(4, account_id);
            //excute query
            pst.executeUpdate();
            pst.close();
        }//invalid 
        else {
            pst.close();
            throw new AccountException("Account ID is not exist!");
        }
    }

    /**
     * Get account from username and password
     *
     * @param username account username
     * @param password account password
     * @return Account if success. Otherwise, null
     * @throws SQLException
     * @throws AccountException
     */
    public Account verifyAccount(String username, String password) throws SQLException, AccountException {
        //connect to DB
        con = getCon.getConnection();
        //Create sql string
        String sqlStr = "select * from " + tblName + " where " + tblCols[1] + "= ?";
        //crete query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, username);
        //execute query
        rs = pst.executeQuery();
        //if result found
        if (rs.next() != false) {
            int acc_id = rs.getInt(tblCols[0]);
            String acc_username = rs.getString(tblCols[1]);
            String acc_password = rs.getString(tblCols[2]);
            int acc_status = rs.getInt(tblCols[3]);
            int role_id = rs.getInt(tblCols[4]);
            //check if password is correct
            if (acc_password.equals(getMd5(password))) {
                Account a = new Account(acc_id, acc_username, acc_password, acc_status, role_id);
                pst.close();
                return a;
            }
        }
        pst.close();
        return null;
    }

    /**
     * Get account from account ID
     *
     * @param accId
     * @return
     */
    public Account getAccount(int accId) {
        try {
            //connect to DB
            con = getCon.getConnection();
            //Create sql string
            String sqlStr = "select * from " + tblName + " where " + tblCols[0] + "= ?";
            //crete query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, accId);
            //execute query
            rs = pst.executeQuery();
            //if result found
            if (rs.next() != false) {
                int acc_id = rs.getInt(tblCols[0]);
                String acc_username = rs.getString(tblCols[1]);
                String acc_password = rs.getString(tblCols[2]);
                int acc_status = rs.getInt(tblCols[3]);
                int role_id = rs.getInt(tblCols[4]);
                //check if password is correct
                Account a = new Account(acc_id, acc_username, acc_password, acc_status, role_id);
                pst.close();
                return a;
            }
            pst.close();
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(AccountModel.class.getName()).log(Level.SEVERE, null, ex);

            return null;
        }
    }

    /**
     * Get account using password encrypted by MD5
     *
     * @param username
     * @param passwordMD5 password encrypted using MD5
     * @return
     */
    public Account getAccount(String username, String passwordMD5) {
        try {
            //connect to DB
            con = GetConnection.getConnection();
            //Create sql string
            String sqlStr = "select * from " + tblName + " where " + tblCols[1] + "= ? AND " + tblCols[2] + "= ?";
            //crete query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            pst.setString(1, username);
            pst.setString(2, passwordMD5);
            //execute query
            rs = pst.executeQuery();
            //if result found
            if (rs.next() != false) {
                int acc_id = rs.getInt(tblCols[0]);
                String acc_username = rs.getString(tblCols[1]);
                String acc_password = rs.getString(tblCols[2]);
                int acc_status = rs.getInt(tblCols[3]);
                int role_id = rs.getInt(tblCols[4]);
                //check if password is correct
                Account a = new Account(acc_id, acc_username, acc_password, acc_status, role_id);
                pst.close();
                return a;
            }
            pst.close();
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(AccountModel.class.getName()).log(Level.SEVERE, null, ex);

            return null;
        }
    }

    /**
     * Get all account
     *
     * @return
     */
    public ArrayList<Account> getAllAccount() {
        try {
            //connect to DB
            con = getCon.getConnection();
            //Create sql string
            String sqlStr = "select * from " + tblName;
            //crete query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);

            //execute query
            rs = pst.executeQuery();

            ArrayList<Account> resultList = new ArrayList<>();
            //if result found
            while (rs.next()) {
                int acc_id = rs.getInt(tblCols[0]);
                String acc_username = rs.getString(tblCols[1]);
                String acc_password = rs.getString(tblCols[2]);
                int acc_status = rs.getInt(tblCols[3]);
                int role_id = rs.getInt(tblCols[4]);
                //check if password is correct
                resultList.add(new Account(acc_id, acc_username, acc_password, acc_status, role_id));
            }
            pst.close();
            return resultList;
        } catch (SQLException ex) {
            Logger.getLogger(AccountModel.class.getName()).log(Level.SEVERE, null, ex);

            return null;
        }
    }

//    public static void main(String[] args){
//        try {
//            AccountModel accM = new AccountModel();
//            accM.insert("admin", "admin", 1, 4);
//        } catch (SQLException ex) {
//            Logger.getLogger(AccountModel.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (AccountException ex) {
//            Logger.getLogger(AccountModel.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}

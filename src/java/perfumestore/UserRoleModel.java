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
 * @author DELL
 */
public class UserRoleModel {

    //attributes
    private static Connection con;
    private static GetConnection getCon;
    private static PreparedStatement pst;
    private static ResultSet rs;

    //table info
    private static String tblName = "user_role";
    private static String[] tblCols = {"role_name", "user_role_status"};

    /**
     * Create new UserRoleModel
     *
     */
    public UserRoleModel() {
        getCon = new GetConnection();
    }

    /**
     * check if the role_id exists
     *
     * @param role_id
     * @return
     * @throws SQLException
     */
    public boolean isIdExist(int role_id) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        //create sql string
        String sqlStr = "SELECT * FROM " + tblName + " WHERE role_id = ? LIMIT 1";
        //creaste query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setInt(1, role_id);
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
     * insert user role
     *
     * @param role_name
     * @param user_role_status
     * @return
     * @throws SQLException
     */
    public int insert(String role_name, int user_role_status) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        //create sql string
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
        pst.setString(1, role_name);
        pst.setInt(2, user_role_status);
        //execute query
        pst.executeUpdate();
        //get Actor ID
        rs = pst.getGeneratedKeys();
        rs.next();
        int d_id = rs.getInt(1);
        pst.close();
        return d_id;
    }

    /**
     * update user role
     *
     * @param role_id
     * @param role_name
     * @param user_role_status
     * @throws SQLException
     * @throws UserRoleException
     */
    public void update(int role_id, String role_name, int user_role_status) throws SQLException, UserRoleException {
        if (isIdExist(role_id)) {
            //connect to DB
            con = getCon.getConnection();
            //create sql string
            String sqlStr = "UPDATE FROM " + tblName + " SET " + tblCols[0] + " =?,"
                    + tblCols[1] + " =? "
                    + " WHERE role_id = ?";
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setInt(1, role_id);
            pst.setInt(2, user_role_status);
            pst.setString(3, role_name);
            //execute query
            pst.executeUpdate();
            pst.close();
        } else {
            throw new UserRoleException("Role ID is not exist!");
        }
    }

    /**
     * Get User Role info from role_id
     *
     * @param rId
     * @return
     * @throws SQLException
     */
    public UserRole getUserRole(int roleId) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        //create sql string
        String sqlStr = "SELECT * FROM " + tblName + " WHERE role_id = ?";
        //create query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        //set values
        pst.setInt(1, roleId);
        //excute query
        rs = pst.executeQuery();
        //get return data
        while (rs.next()) {
            int role_id = rs.getInt("role_id");
            String role_name = rs.getString("role_name");
            int user_role_status = rs.getInt("user_role_Status");
            //add to result list
            UserRole result = new UserRole(role_id, role_name, user_role_status);
            pst.close();
            return result;
        }
        return null;
    }

    /**
     * Get all user role
     * @return 
     */
    public ArrayList<UserRole> getAllUserRole() {
        try {
            //connect to DB
            con = getCon.getConnection();
            //create sql string
            String sqlStr = "SELECT * FROM " + tblName;
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);

            //excute query
            rs = pst.executeQuery();
            ArrayList<UserRole> userRoleList = new ArrayList<>();
            //get return data
            while (rs.next()) {
                int role_id = rs.getInt("role_id");
                String role_name = rs.getString("role_name");
                int user_role_status = rs.getInt("user_role_Status");
                //add to result list
                userRoleList.add(new UserRole(role_id, role_name, user_role_status));
            }
            pst.close();
            return userRoleList;

        } catch (SQLException ex) {
            Logger.getLogger(UserRoleModel.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}

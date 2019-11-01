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
 * @author DELL
 */
public class BrandModel {

    //attributes
    private static Connection con;
    private static GetConnection getCon;
    private static PreparedStatement pst;
    private static ResultSet rs;
    private static CountriesModel countryM;

    //table info
    private static String tblName = "brand";
    private static String[] tblCols = {"brand_name", "country_code", "created at", "brand_status"};

    /**
     * Create new BrandModel
     */
    BrandModel() {
        getCon = new GetConnection();
        countryM = new CountriesModel();
    }

    /**
     * check if the brand_id exists
     *
     * @param brand_id
     * @return
     * @throws SQLException
     */
    public boolean isIdExist(int brand_id) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        //create sql string
        String sqlStr = "SELECT * FROM " + tblName + " WHERE brand_id = ? LIMIT 1 ";
        //creaste query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setInt(1, brand_id);
        //eecute query
        rs = pst.executeQuery();
        //if result found
        if (rs.next() != false) {
            return true;
        }
        return false;
    }

    /**
     * insert brand
     *
     * @param brand_name
     * @param created_at
     * @param brand_status
     * @return
     * @throws SQLException
     */
    public int insert(String brand_name, int country_code, String created_at, int brand_status) throws SQLException {
        if (countryM.isCodeExist(country_code)) {
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
            pst.setString(1, brand_name);
            pst.setInt(2, country_code);
            pst.setString(3, created_at);
            pst.setInt(4, brand_status);
            //execute query
            pst.executeUpdate();
            //get Actor ID
            rs = pst.getGeneratedKeys();
            rs.next();
            int d_id = rs.getInt(1);
            pst.close();
            return d_id;
        } else {
            return -1;
        }
    }

    /**
     * update brand
     *
     * @param brand_id
     * @param brand_name
     * @param country_code
     * @param created_at
     * @param brand_status
     * @throws SQLException
     * @throws BrandException
     */
    public void update(int brand_id, String brand_name, int country_code, String created_at, int brand_status) throws SQLException, BrandException {
        if (!isIdExist(country_code)) {
            throw new BrandException("Brand ID is not exist!");
        } else {
            //connect to DB
            con = getCon.getConnection();
            //create sql string
            String sqlStr = "UPDATE FROM " + tblName + " SET " + tblCols[0] + " =?,"
                    + tblCols[1] + " =? " + tblCols[2] + " =? " + tblCols[3] + " =? "
                    + " WHERE brand_id = ?";
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setInt(1, brand_id);
            pst.setString(2, brand_name);
            pst.setInt(3, country_code);
            pst.setString(4, created_at);
            pst.setInt(5, brand_status);
            //execute query
            pst.executeUpdate();
            pst.close();
        }
    }

    public Brand getBrand(String brandName) throws SQLException, BrandException {
        //connect to DB
        con = getCon.getConnection();
        //create sql string
        String sqlStr = "SELECT * FROM " + tblName + " WHERE " + tblCols[0] + "= ?";
        //create query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        //set values
        pst.setString(1, brandName);
        //excute query
        rs = pst.executeQuery();
        //get data
        while (rs.next()) {
            int brand_id = rs.getInt("brand_id");
            String brand_name = rs.getString("brand_name");
            int country_code = rs.getInt("country_code");
            String created_at = rs.getString("created at");
            int brand_status = rs.getInt("brand_status");
            Brand result = new Brand(brand_id, brand_name, country_code, created_at, brand_status);
            pst.close();
            return result;
        }
        return null;
    }
}

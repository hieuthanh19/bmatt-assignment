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
 * @author DELL
 */
public class CountriesModel {

    //attributes
    private static Connection con;
    private static GetConnection getCon;
    private static PreparedStatement pst;
    private static ResultSet rs;

    //table info
    private static String tblName = "countries";
    private static String[] tblCols = {"name", "country_status"};

    /**
     * Create new BrandModel
     */
    CountriesModel() {
        getCon = new GetConnection();
    }

    /**
     * check if the country_code exists
     *
     * @param country_code
     * @return
     * @throws SQLException
     */
    public boolean isCodeExist(int country_code) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        //create sql string
        String sqlStr = "SELECT country_code FROM " + tblName + " WHERE country_code = ? LIMIT 1";
        //creaste query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        pst.setInt(1, country_code);
        //eecute query
        rs = pst.executeQuery();
        //if result found
        if (rs.next() != false) {
            return true;
        }
        return false;
    }

    /**
     * insert country
     *
     * @param country_name
     * @param country_status
     * @return
     * @throws SQLException
     */
    public int insert(String country_name, int country_status) throws SQLException {
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
        pst.setString(1, country_name);
        pst.setInt(2, country_status);
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
     * update country
     *
     * @param country_code
     * @param country_name
     * @param country_status
     * @throws SQLException
     * @throws CountriesException
     */
    public void update(int country_code, String country_name, int country_status) throws SQLException, CountriesException {
        if (isCodeExist(country_code)) {
            //connect to DB
            con = getCon.getConnection();
            //create sql string
            String sqlStr = "UPDATE FROM " + tblName + " SET " + tblCols[0] + " =?,"
                    + tblCols[1] + " =? "
                    + " WHERE country_code = ?";
            //create query
            pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
            //set values
            pst.setInt(1, country_code);
            pst.setString(2, country_name);
            pst.setInt(3, country_status);
            //execute query
            pst.executeUpdate();
            pst.close();
        } else {
            throw new CountriesException("Country Code is not exist!");
        }
    }

    public Countries getCountries(String Name) throws SQLException {
        //connect to DB
        con = getCon.getConnection();
        //create sql string
        String sqlStr = "SELECT * FROM " + tblName + " WHERE " + tblCols[0] + "=?";
        //create query
        pst = con.prepareStatement(sqlStr, Statement.RETURN_GENERATED_KEYS);
        //set values
        pst.setString(1, Name);
        //excute query
        rs = pst.executeQuery();
        //get return data
        while (rs.next()) {
            int country_code = rs.getInt("country_code");
            String name = rs.getString("name");
            int country_status = rs.getInt("country_status");
            //add to result list
            Countries result = new Countries(country_code, name, country_status);
            pst.close();
            return result;
        }
        return null;
    }
}

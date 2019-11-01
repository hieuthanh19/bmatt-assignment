/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ThanhKH
 */
public class GetConnection {

    private static String dbName = "perfume_store";
    private static String URL = "jdbc:mysql://localhost/" + dbName;
    private static String UID = "root";
    private static String PWD = "";
    private static Connection con;
    private static PreparedStatement ps;
    private static ResultSet rs;

   

    public static Connection getConnection() throws SQLException {
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        con = (Connection) DriverManager.getConnection(URL, UID, PWD);
        return con;
    }

    public void test() {

    }

}

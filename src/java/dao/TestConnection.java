package dao;

import java.sql.Connection;

public class TestConnection {

    public static void main(String[] args) {

        Connection con = DBConnection.getConnection();

        if (con != null) {
            System.out.println("SUCCESS: Oracle Database Connected!");
        } else {
            System.out.println("FAILED: Database Connection Failed!");
        }
    }
}
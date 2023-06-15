package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionUtil {

    private static final String URL = "jdbc:mysql://localhost:3306/jsp?serverTimezone=Asia/Seoul";
    private static final String USERNAME = "pjm";
    private static final String PASSWORD = "jmjm1102";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            return con;
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("JDBC Connector Driver not found", e);
        } catch (SQLException e) {
            throw new IllegalStateException("Failed to connect to the database", e);
        }
    }
}

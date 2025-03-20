package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection connection;
    private static final String URL = "jdbc:mysql://localhost:3306/8386shop_new";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "tai@#04102004";
    public static Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            if (connection == null || connection.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");  // Đảm bảo sử dụng driver mới (com.mysql.cj.jdbc.Driver)
                connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                System.out.println("Kết nối thành công");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new SQLException("Không thể kết nối đến cơ sở dữ liệu", e);
        }
        return connection;
    }

}
package dao.productDao;

import dao.DBConnection;
import model.Product;
import service.product.ProductService;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IProductDAO  {
    private final Connection connection;

    public ProductDAO() {
        DBConnection db = new DBConnection();
        this.connection = db.getConnection();
    }
    @Override
    public List<Product> selectAllProducts() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Product";

        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("ProductID"),
                        rs.getInt("BrandID"),
                        rs.getString("Name"),
                        rs.getDouble("Price"),
                        rs.getInt("Stock"),
                        rs.getString("Description"),
                        rs.getString("ImageURL")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("🔥 Lỗi khi lấy danh sách sản phẩm: " + e.getMessage());
        }

        System.out.println("🔍 Số sản phẩm lấy được từ DB: " + products.size());
        return products;
    }
}

package dao.productDao;

import dao.DBConnection;
import model.Product;
import model.ProductReview;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    @Override
    public int getTotalProducts() {
        int totalProducts = 0;
        String query = "SELECT COUNT(*) FROM Product";

        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                totalProducts = rs.getInt(1); // Lấy giá trị đếm từ cột đầu tiên
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi khi lấy tổng số sản phẩm: " + e.getMessage());
        }

        System.out.println("Tổng số sản phẩm trong DB: " + totalProducts);
        return totalProducts;
    }

    @Override
    public List<Product> getProductsByPage(int pageNumber, int pageSize) {
        List<Product> products = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String query = "SELECT * FROM Product LIMIT ? OFFSET ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, pageSize); // Số sản phẩm trên mỗi trang
            ps.setInt(2, offset); // Vị trí bắt đầu

            try (ResultSet rs = ps.executeQuery()) {
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi khi lấy sản phẩm theo trang: " + e.getMessage());
        }

        System.out.println("Số sản phẩm lấy được từ DB cho trang " + pageNumber + ": " + products.size());
        return products;
    }
    public Product getProductById(int productID) {
        Product product = null;
        String query = "SELECT * FROM Product WHERE ProductID = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product = new Product(
                            rs.getInt("ProductID"),
                            rs.getInt("BrandID"),
                            rs.getString("Name"),
                            rs.getDouble("Price"),
                            rs.getInt("Stock"),
                            rs.getString("Description"),
                            rs.getString("ImageURL")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi khi lấy thông tin sản phẩm: " + e.getMessage());
        }

        return product;
    }

    @Override
    public List<ProductReview> getReviewsByProductId(int productId) {
        List<ProductReview> reviews = new ArrayList<>();
        String query = "SELECT ReviewID, CustomerID, ProductID, Rating, Comment, ReviewDate " +
                "FROM ProductReview WHERE ProductID = ? ORDER BY ReviewDate DESC";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductReview review = new ProductReview(
                        rs.getInt("ReviewID"),
                        rs.getInt("CustomerID"),
                        rs.getInt("ProductID"),
                        rs.getInt("Rating"),
                        rs.getString("Comment"),
                        rs.getTimestamp("ReviewDate")
                );
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
    public ProductReview getReviewById(int reviewID) {
        String query = "SELECT * FROM ProductReview WHERE ReviewID = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, reviewID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new ProductReview(
                        rs.getInt("ReviewID"),
                        rs.getInt("CustomerID"),
                        rs.getInt("ProductID"),
                        rs.getInt("Rating"),
                        rs.getString("Comment"),
                        rs.getTimestamp("ReviewDate")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean addReview(ProductReview review) {
        String query = "INSERT INTO ProductReview (CustomerID, ProductID, Rating, Comment, ReviewDate) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, review.getCustomerID());
            ps.setInt(2, review.getProductID());
            ps.setInt(3, review.getRating());
            ps.setString(4, review.getComment());
            ps.setTimestamp(5, review.getReviewDate());

            int rowsInserted = ps.executeUpdate();
            System.out.println("✅ Số dòng đã chèn vào DB: " + rowsInserted);
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("❌ Lỗi khi thêm đánh giá vào DB: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean deleteReview(int reviewID) {
        String query = "DELETE FROM ProductReview WHERE ReviewID = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, reviewID);
            return ps.executeUpdate() > 0; // Trả về true nếu delete thành công
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
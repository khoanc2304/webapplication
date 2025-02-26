package dao.product;

import model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface IProductDAO {
    //
    // Create
    void addProduct(Product product);

    // Find
    List<Product> findAllProducts();
    Optional<Product> findProductById(int product_id);
    Optional<Product> findProductByName(String product_name);
    List<Product> searchProduct(String searchKeyword);

    // Update
    void updateProduct(Product product);

    // Delete
    boolean deleteProductById(int product_id);
    boolean deleteProductByName(String product_name);

    // Ánh Xạ
    Product mapProduct(ResultSet rs) throws SQLException;
}

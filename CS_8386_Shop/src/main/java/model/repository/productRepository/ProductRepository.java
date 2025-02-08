package model.repository.productRepository;

import model.entity.Product;
import model.repository.DBRepository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository {

    private static List<Product> products = new ArrayList<>();

    public List<Product> findAll(){
        List<Product> products = new ArrayList<>();
        try {
            Statement statement = DBRepository.getConnection().
                    createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM product");
            while (resultSet.next()){
                int productID = resultSet.getInt("ProductID");
                int brandID = resultSet.getInt("BrandID");
                String nameProduct = resultSet.getString("Name");
                double priceProduct = resultSet.getDouble("Price");
                int stock = resultSet.getInt("Stock");
                String description = resultSet.getString("Description");
                String url = resultSet.getString("imageURL");
                products.add(new Product(productID,brandID,nameProduct,priceProduct,stock,description,url))
;            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }
}

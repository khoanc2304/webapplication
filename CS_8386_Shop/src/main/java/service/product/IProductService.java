package service.product;

import model.Product;
import model.ProductReview;

import java.util.List;
import java.util.Optional;

public interface IProductService {
    List<Product> getAllForAdmin();

    // search
    Optional<Product> findProductById(int id);
    Optional<Product> findProductByName(String name);
    Optional<Product> findProductByBrand(String brand);
    Optional<Product> findProductByPrice(double price);

    //create
    void insertProduct(Product product);

    //update
    void updateProduct(Product product);

    //delete
    void deleteProduct(int id);

    List<Product> getAllForUser();
    int getTotalProducts();
    List<Product> getProductsByPage(int pageNumber, int pageSize);
    Product getProductById(int productID);
    List<ProductReview> getReviewsByProductId(int productId);
    ProductReview getReviewById(int reviewID);
    boolean addReview(ProductReview review);
    boolean deleteReview(int reviewID);
    List<Product> searchProductsByName(String keyword);
    List<Product> getProductsByPriceRange(double minPrice, double maxPrice, int pageNumber, int pageSize);
    int getTotalProductsByPriceRange(double minPrice, double maxPrice);

    int countProducts();
    List<Object[]> getStockByBrand();
    boolean updateReview(int reviewID, String newComment);

    Product findById(int productID);

    void update(Product product);
    List<Object[]> getRevenueByBrand();
}

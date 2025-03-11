package service.product;

import model.Product;
import model.ProductReview;

import java.util.List;

public interface IProductService {
    List<Product> getAll();
    int getTotalProducts();
    List<Product> getProductsByPage(int pageNumber, int pageSize);
    Product getProductById(int productID);
    List<ProductReview> getReviewsByProductId(int productId);
    ProductReview getReviewById(int reviewID);
    boolean addReview(ProductReview review);
    boolean deleteReview(int reviewID);
}
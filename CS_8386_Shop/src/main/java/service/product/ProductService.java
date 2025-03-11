package service.product;

import dao.productDao.ProductDAO;
import model.Product;
import model.ProductReview;
import service.product.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    ProductDAO productDAO;
    public ProductService() {
        this.productDAO = new ProductDAO();
        if (this.productDAO == null) {
            throw new RuntimeException(" Lỗi: ProductDAO chưa được khởi tạo!");
        }
    }

    @Override
    public List<Product> getAll() {
        List<Product> products = productDAO.selectAllProducts();
        System.out.println("✅ ProductService - Số sản phẩm gửi đến Servlet: " + products.size());
        return products;
    }

    @Override
    public int getTotalProducts() {
        return productDAO.getTotalProducts();
    }

    @Override
    public List<Product> getProductsByPage(int pageNumber, int pageSize) {
        return productDAO.getProductsByPage(pageNumber, pageSize);
    }

    @Override
    public Product getProductById(int productID) {
        return productDAO.getProductById(productID);
    }

    @Override
    public List<ProductReview> getReviewsByProductId(int productId) {
        return productDAO.getReviewsByProductId(productId);
    }

    @Override
    public ProductReview getReviewById(int reviewID) {
        return productDAO.getReviewById(reviewID);
    }

    @Override
    public boolean addReview(ProductReview review) {
        return productDAO.addReview(review);
    }

    @Override
    public boolean deleteReview(int reviewID) {
        return productDAO.deleteReview(reviewID);
    }

}
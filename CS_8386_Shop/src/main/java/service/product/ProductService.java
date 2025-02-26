package service.product;

import dao.productDao.ProductDAO;
import model.Product;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
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
}

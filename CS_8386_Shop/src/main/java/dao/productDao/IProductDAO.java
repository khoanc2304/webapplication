package dao.productDao;

import model.Product;

import java.util.List;

public interface IProductDAO <t> {
    List<Product> selectAllProducts();


}

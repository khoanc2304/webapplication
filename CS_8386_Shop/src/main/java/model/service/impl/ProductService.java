package model.service.impl;

import model.entity.User;
import model.repository.productRepository.ProductRepository;
import model.service.IService;

import java.util.List;

public class ProductService implements IService {
    private static ProductRepository productRepository = new ProductRepository();
    @Override
    public List getAll() {
        return productRepository.findAll();
    }

    @Override
    public void remove(int id) {

    }

    @Override
    public void update(int id, User user) {

    }

    @Override
    public Object findById(int id) {
        return null;
    }

    @Override
    public List findByName(String name) {
        return List.of();
    }
}

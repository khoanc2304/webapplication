package model.service.impl;

import model.entity.User;
import model.repository.UserRepository;
import model.service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private static UserRepository userRepository = new UserRepository();
    @Override
    public List<User> getAll() {
        return userRepository.findAll() ;
    }

    @Override
    public void remove(int id) {

    }

    @Override
    public void update(int id, User user) {

    }

    @Override
    public User findById(int id) {
        return null;
    }

    @Override
    public List<User> findByName(String name) {
        return List.of();
    }
}

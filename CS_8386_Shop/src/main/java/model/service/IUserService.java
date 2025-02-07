package model.service;


import model.entity.User;

import java.util.List;

public interface IUserService {

    List<User> getAll();
    void remove(int id);
    void update(int id, User user);
    User findById(int id);
    List<User> findByName(String name);
}

package model.service;


import model.entity.User;

import java.util.List;

public interface IService<T> {

    List<T> getAll();
    void remove(int id);
    void update(int id, User user);
    T findById(int id);
    List<T> findByName(String name);
}

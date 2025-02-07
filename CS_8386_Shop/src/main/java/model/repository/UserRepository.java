package model.repository;

import model.entity.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserRepository {

    private static List<User> users = new ArrayList<>();

    public List<User> findAll(){
        List<User> users = new ArrayList<>();
        try {
            Statement statement = DBRepository.getConnection().
                    createStatement();
            ResultSet resultSet =statement.executeQuery("SELECT * from users");
            while (resultSet.next()){
                int userID = resultSet.getInt("userID");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String name = resultSet.getString("fullName");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String avatar = resultSet.getString("avatar");
                String userStatus = resultSet.getString("userStatus");
                String userRole = resultSet.getString("userRole");
                users.add(new User(userID,username,password,name,email,phone,address,avatar,userStatus,userRole));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }
}

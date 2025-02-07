package controller;

import model.entity.User;
import model.service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "StudentController", urlPatterns = "/users")
    public class UserController extends HttpServlet {
        private UserService userService = new UserService();

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.setCharacterEncoding("UTF-8");
            List<User> users = userService.getAll();
            req.setAttribute("users", users);
            req.getRequestDispatcher("WEB-INF/view/user/userList.jsp").forward(req, resp);
        }
    }

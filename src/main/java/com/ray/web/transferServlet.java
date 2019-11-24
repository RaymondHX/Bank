package com.ray.web;

import com.ray.domain.User;
import com.ray.service.IUserService;
import com.ray.service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/transferServlet")
public class transferServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("UTF-8");
        String to = request.getParameter("account");
        String password = request.getParameter("password");
        double money = Double.parseDouble(request.getParameter("money"));
        IUserService userService = new UserService();
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        userService.transfer(user.getUsername(),to,money);
        request.getRequestDispatcher("/account.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

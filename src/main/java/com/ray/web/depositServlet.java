package com.ray.web;

import com.ray.crypo.DESUtils;
import com.ray.crypo.Sha256;
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

@WebServlet("/deposit")
public class depositServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("UTF-8");
        String money = request.getParameter("money");
        String password = request.getParameter("password");
        try {
            password = DESUtils.decryption(password,"6y8SwEs8Fu8YXwvq");
            money = DESUtils.decryption(money,"6y8SwEs8Fu8YXwvq");
            System.out.println(money);
        } catch (Exception e) {
            e.printStackTrace();
        }
        double money1 = Double.parseDouble(money);
        UserService userService = new UserService();
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        String salt = userService.getSalt(user.getUsername());
        password = Sha256.getSHA256(password+salt);
        User depositUser = new User();
        depositUser.setUsername(user.getUsername());
        depositUser.setPassword(password);
        User findUser = userService.findUser(user);
        if(findUser!=null){
            userService.deposit(user.getUsername(),money1);
            session.setAttribute("user",user);
            request.getRequestDispatcher("/account.jsp").forward(request,response);

        }
        else {

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

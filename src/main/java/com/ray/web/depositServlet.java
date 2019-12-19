package com.ray.web;

import com.ray.crypo.DESUtils;
import com.ray.crypo.Sha256;
import com.ray.domain.User;
import com.ray.service.IUserService;
import com.ray.service.impl.DetailService;
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
    UserService userService = new UserService();
    DetailService detailService = new DetailService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("UTF-8");
        String money = request.getParameter("money");
        String password = request.getParameter("password");
        try {
            password = DESUtils.decryption(password,"6y8SwEs8Fu8YXwvq");
            money = DESUtils.decryption(money,"6y8SwEs8Fu8YXwvq");
        } catch (Exception e) {
            e.printStackTrace();
        }
        double money1 = Double.parseDouble(money);

        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        String salt = userService.getSalt(user.getUsername());
        password = Sha256.getSHA256(password+salt);
        User depositUser = new User();
        depositUser.setUsername(user.getUsername());
        depositUser.setPassword(password);
        User findUser = userService.findUser(depositUser);
        if(findUser!=null){
            userService.deposit(user.getUsername(),money1);
            detailService.addInfo(user.getUsername(),money1,0);
            session.setAttribute("user",user);
            request.setAttribute("msg","存款成功");
            request.getRequestDispatcher("/account.jsp").forward(request,response);

        }
        else {
            request.setAttribute("msg","密码错误");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

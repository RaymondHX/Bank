package com.ray.web;

import com.ray.crypo.DESUtils;
import com.ray.crypo.Sha256;
import com.ray.dao.IDetailDao;
import com.ray.domain.Detail;
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
import java.util.List;

@WebServlet("/transferServlet")
public class transferServlet extends HttpServlet {
    private DetailService detailService = new DetailService();
    UserService userService = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("UTF-8");
        String to = request.getParameter("account");
        String password = request.getParameter("password");
        String money = request.getParameter("money");
        try {
            password = DESUtils.decryption(password,"6y8SwEs8Fu8YXwvq");
            to = DESUtils.decryption(to,"6y8SwEs8Fu8YXwvq");
            money = DESUtils.decryption(money,"6y8SwEs8Fu8YXwvq");
        } catch (Exception e) {
            e.printStackTrace();
        }
        double money1 = Double.parseDouble(money);
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        String salt = userService.getSalt(user.getUsername());
        password = Sha256.getSHA256(password+salt);
        User findUser = new User();
        findUser.setPassword(password);
        findUser.setUsername(user.getUsername());
        if(userService.findUser(findUser)!=null){
            userService.transfer(user.getUsername(),to,money1);
            detailService.addInfo(user.getUsername(),0,money1);
            detailService.addInfo(to,money1,0);
            request.setAttribute("msg","转账成功");
            request.getRequestDispatcher("/account.jsp").forward(request,response);
        }
        else {
            request.setAttribute("msg","密码错误");
            request.getRequestDispatcher("/account.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

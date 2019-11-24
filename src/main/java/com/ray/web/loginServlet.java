package com.ray.web;

import com.ray.domain.User;
import com.ray.service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("UTF-8");
        //2.获取数据
        String code = request.getParameter("verifycode");

        //校验验证码
        HttpSession session = request.getSession();
        String checkcode =(String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");//确保验证码一次性
        if(!checkcode.equalsIgnoreCase(code)){
            request.setAttribute("login_msg","验证码错误");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
            return;
        }

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = new User();
        user.setPassword(password);
        user.setUsername(username);
        UserService userService = new UserService();
        User loginUser = userService.findUser(user);
        if(loginUser!=null){
            //将用户存入session
//            double balance = userService.userBalance(user);
//            loginUser.setBalance(balance);
//            System.out.println("余额："+balance);
            session.setAttribute("user",loginUser);
//            System.out.println(user.toString());
            response.sendRedirect(request.getContextPath()+"/account.jsp");
        }
        else {
            request.setAttribute("login_msg","用户名或密码错误");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
            return;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
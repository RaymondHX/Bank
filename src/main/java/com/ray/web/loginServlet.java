package com.ray.web;

import com.ray.crypo.Ende;
import com.ray.crypo.Key;
import com.ray.crypo.Sha256;
import com.ray.domain.Detail;
import com.ray.domain.User;
import com.ray.service.impl.DetailService;
import com.ray.service.impl.UserService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    private DetailService detailService = new DetailService();
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
        user.setUsername(username);
        UserService userService = new UserService();
        String salt = userService.getSalt(username);
        //System.out.println("getsalt"+salt);
        user.setPassword(Sha256.getSHA256(password+salt));
       // System.out.println("pazsword"+user.getPassword());
        User loginUser = userService.findUser(user);
        if(loginUser!=null){
            //将用户存入session
//            double balance = userService.userBalance(user);
//            loginUser.setBalance(balance);
//            System.out.println("余额："+balance);
            session.setAttribute("user",loginUser);
            List<Detail> details = detailService.allDetails(loginUser.getUsername());
//            for (Detail detail: details) {
//                System.out.println(detail.toString());
//
//            }
            session.setAttribute("details",details);
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

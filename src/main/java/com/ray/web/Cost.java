package com.ray.web;

import com.ray.crypo.DESUtils;
import com.ray.crypo.Ende;
import com.ray.crypo.Key;
import com.ray.crypo.Sha256;
import com.ray.domain.User;
import com.ray.service.impl.DetailService;
import com.ray.service.impl.UserService;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.Base64;

@WebServlet("/Cost")
public class Cost extends HttpServlet {

    UserService userService = new UserService();
    DetailService detailService = new DetailService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

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
        System.out.println(username);
        System.out.println(password);
        try {
//            username = DESUtils.decryption(username,"6y8SwEs8Fu8YXwvq");
            password = DESUtils.decryption(password,"6y8SwEs8Fu8YXwvq");
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(username);
        System.out.println(password);
        double money = Double.parseDouble((String) session.getAttribute("money"));
        System.out.println(money);

        String salt = userService.getSalt(username);
        password = Sha256.getSHA256(password+salt);
        User loginUser = new User();
        loginUser.setPassword(password);
        loginUser.setUsername(username);
        User user  = userService.findUser(loginUser);
        if(user!=null){
            userService.deduction(username,money);
            detailService.addInfo(username,0,money);
            request.setAttribute("msg","付款成功");
            String resp = "Ok";
            byte[] plain = resp.getBytes("UTf-8");
            String hash = Sha256.getSHA256(resp);
            byte[] plainhash = hash.getBytes("utf-8");
            try {
                RSAPublicKey publicKey = Ende.loadPublicKeyByStr(Key.loadPublicKeyByFile());
                RSAPrivateKey privateKey = Ende.loadPrivateKeyByStr(Key.loadPrivateKeyByFile());
                byte[] mi_res = Ende.encrypt(publicKey, plain);
                byte[] mi_hash = Ende.encrypt(privateKey, plainhash);
                String str_res = URLEncoder.encode(Base64.getEncoder().encodeToString(mi_res),"utf-8");
                String str_hash = URLEncoder.encode( Base64.getEncoder().encodeToString(mi_hash),"utf-8");
                response.sendRedirect("http://192.168.43.16:8080/demo3_war/receiveBank?response="+str_res+"&signature="+str_hash);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        else{
            response.getWriter().write("用户名或密码错误");
            response.getWriter().print("<a href=\"./payment.jsp\">点击返回登录</a>");
        }

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

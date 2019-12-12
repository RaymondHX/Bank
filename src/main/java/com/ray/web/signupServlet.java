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
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

@WebServlet("/signupServlet")
public class signupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        DESUtils desUtils = new DESUtils();
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
        System.out.println(username);
        try {
            username =DESUtils.decryption(username,"6y8SwEs8Fu8YXwvq");
            System.out.println(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String pass = request.getParameter("password");
        System.out.println(pass);
        try {
            pass = DESUtils.decryption(pass,"6y8SwEs8Fu8YXwvq");
            System.out.println(pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //利用强伪随机给密码加盐
        try {
            SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
            byte bytes[] = new byte[32];
            random.nextBytes(bytes);
            String salt = new String(bytes);
            String hash = Sha256.getSHA256(pass+salt);
            System.out.println("salt"+salt);
            User user = new User();
            user.setPassword(hash);
            user.setUsername(username);
            IUserService service = new UserService();
            boolean result = service.signupUser(username,hash,salt);
            if (result){
                session.setAttribute("user",user);
//            System.out.println(user.toString());
                response.sendRedirect(request.getContextPath()+"/account.jsp");
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

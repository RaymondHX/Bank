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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/signupServlet")
public class signupServlet extends HttpServlet {
    public boolean HasDigitAndCharacter(String content) {
        boolean flag = false;
        Pattern p = Pattern.compile("^(?=.[0-9])(?=.[a-zA-Z])([a-zA-Z0-9]{6,20})$");
        Matcher m = p.matcher(content);
        if (m.matches()) {
            flag = true;
        }
        return flag;
    }


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
        //System.out.println(username);
        try {
            username =DESUtils.decryption(username,"6y8SwEs8Fu8YXwvq");
           // System.out.println(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String pass = request.getParameter("password");
       // System.out.println(pass);
        try {
            pass = DESUtils.decryption(pass,"6y8SwEs8Fu8YXwvq");
            System.out.println(pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(HasDigitAndCharacter(pass)&&pass.length()>6){
            //利用强伪随机生成器给密码加盐
            try {
                SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
                byte bytes[] = new byte[32];
                random.nextBytes(bytes);
                String salt = new String(bytes);
                String hash = Sha256.getSHA256(pass+salt);
                User user = new User();
                user.setPassword(hash);
                user.setUsername(username);
                IUserService service = new UserService();
                boolean result = service.signupUser(username,hash,salt);
                if (result){
                    session.setAttribute("user",user);
                    response.sendRedirect(request.getContextPath()+"/account.jsp");
                }
                else {
                    request.setAttribute("msg","该用户已存在");
                    request.getRequestDispatcher("/index.jsp").forward(request,response);
                }
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
        }
        else {
            request.setAttribute("msg","密码强度不够");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

package com.ray.web;



import com.ray.crypo.Ende;
import com.ray.crypo.Key;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;


@WebServlet("/getMoney")
public class getMoney extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
          request.setCharacterEncoding("UTF-8");
          String money = request.getParameter("money");
          System.out.println(money);
          String signature = request.getParameter("signature");
          System.out.println(signature);

//
        try {
            RSAPrivateKey privateKey = Ende.loadPrivateKeyByStr(Key.loadPrivateKeyByFile());
            money = new String(Ende.decrypt(privateKey, money.getBytes("UTF-8")),"UTF-8");
            System.out.println(money);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("money",money);
        request.getRequestDispatcher("payment.jsp").forward(request,response);
//        String decode_sig = Ende.decrypt();
   }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

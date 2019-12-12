package com.ray.web;



import com.ray.crypo.Ende;
import com.ray.crypo.Key;
import com.ray.crypo.Sha256;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLEncoder;
import java.security.PrivateKey;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.Base64;


@WebServlet("/getMoney")
public class getMoney extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
          request.setCharacterEncoding("UTF-8");
          String money = request.getParameter("money");
         // System.out.println(money);
          String signature = request.getParameter("signature");
         // System.out.println(signature);
//
        try {
            PrivateKey privateKey = Ende.loadPrivateKeyByStr(Key.loadPrivateKeyByFile());
            String new_money = new String(Ende.decrypt((RSAPrivateKey) privateKey, Base64.getDecoder().decode(money)),"UTF-8");
            String hash = Sha256.getSHA256(new_money);
            RSAPublicKey publicKey = Ende.loadPublicKeyByStr(Key.loadPublicKeyByFile());
            String new_sig = new String(Ende.decrypt(publicKey,Base64.getDecoder().decode(signature)),"utf-8");
            System.out.println(new_sig);
            if(hash.equals(new_sig)){
                System.out.println("hhh");
                HttpSession session = request.getSession();
                session.setAttribute("money",new_money);
                request.getRequestDispatcher("payment.jsp").forward(request,response);
            }
            else {
                String resp = "Not Ok";
                byte[] plain = resp.getBytes("UTf-8");
                String hash2 = Sha256.getSHA256(resp);
                byte[] plainhash = hash2.getBytes("utf-8");
                byte[] mi_res = Ende.encrypt(publicKey, plain);
                byte[] mi_hash = Ende.encrypt((RSAPrivateKey) privateKey, plainhash);
                String str_res = URLEncoder.encode(Base64.getEncoder().encodeToString(mi_res), "utf-8");
                String str_hash = URLEncoder.encode(Base64.getEncoder().encodeToString(mi_hash), "utf-8");
                response.sendRedirect("http://192.168.43.16:8080/demo3_war/receiveBank?response=" + str_res + "&signature=" + str_hash);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

//        String decode_sig = Ende.decrypt();
   }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

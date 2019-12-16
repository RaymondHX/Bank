package com.ray.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/listServlet")
public class listServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("UTF-8");
        String begin = request.getParameter("begin")+" 00:00:00";
        String end = request.getParameter("end")+" 00:00:00";
        System.out.println(begin);
        Timestamp a = Timestamp.valueOf(begin);
        Timestamp b = Timestamp.valueOf(end);


    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

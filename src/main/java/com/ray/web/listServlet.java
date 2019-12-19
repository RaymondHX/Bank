package com.ray.web;

import com.ray.domain.Detail;
import com.ray.service.impl.DetailService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

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
        DetailService detailService = new DetailService();
        List<Detail> details = detailService.allDetails("hx");
        for (int i = 0; i <details.size() ; i++) {
            if(Timestamp.valueOf(details.get(i).getTime()).before(a)||Timestamp.valueOf(details.get(i).getTime()).after(b))
                details.remove(i);
        }
        HttpSession session = request.getSession();
        session.setAttribute("details",details);
        response.sendRedirect(request.getContextPath()+"/list.jsp");

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

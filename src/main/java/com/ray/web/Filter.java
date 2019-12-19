package com.ray.web;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter("/account.jsp")
public class Filter implements javax.servlet.Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        if(((HttpServletRequest) req).getSession().getAttribute("user")!=null){
            //放行
            chain.doFilter(req, resp);
        }
        else {
            req.setAttribute("msg","您还没有登录，请先登录");
            req.getRequestDispatcher("/index.jsp").forward(req,resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}

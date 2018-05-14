package com.ltt.servlet;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

/**
 * 设置一个上下文路径
 */

public class WebContextInitServlet  extends HttpServlet {

    @Override
    public void init() throws ServletException {
        getServletContext().setAttribute("ctx",getServletContext().getContextPath());
    }
}

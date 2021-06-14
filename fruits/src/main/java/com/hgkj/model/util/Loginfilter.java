package com.hgkj.model.util;


import javax.servlet.Filter;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebFilter(filterName = "Loginfilter", urlPatterns = {
        "/integral.jsp",
        "/Orders.jsp",
        "/shopping_cart.jsp",
        "/user.jsp",
        "/user_address.jsp",
        "/user_Collect.jsp",
        "/user_info.jsp",
        "/user_integral.jsp",
        "/user_Password.jsp"
})
public class Loginfilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        if (session.getAttribute("customer") == null) {
            response.sendRedirect("/Login.jsp");
        } else {
            chain.doFilter(req, resp);
        }
    }

    @Override
    public void destroy() {

    }
}

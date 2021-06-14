package com.hgkj.model.util;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AdminLoginfilter", urlPatterns = {
        "/adminjsp/Menu/*",
        "/adminjsp/Node/*",
        "/adminjsp/Role/*",
        "/adminjsp/User/*",
        "/adminjsp/index.jsp"
})
public class AdminLoginfilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("/adminjsp/login.jsp");
        } else {
            chain.doFilter(req, resp);
        }
    }

    @Override
    public void destroy() {

    }
}

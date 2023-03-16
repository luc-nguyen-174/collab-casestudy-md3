package com.dina.filter;

import javax.servlet.*;
import java.io.IOException;
import java.util.logging.LogRecord;

public class Filter implements javax.servlet.Filter {
    private String encoding = "utf-8";

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException, ServletException {
        request.setCharacterEncoding(encoding);
        //                response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding(encoding);
        filterChain.doFilter(request, response);

    }

    public void init(FilterConfig filterConfig) throws ServletException {
        String encodingParam = filterConfig.getInitParameter("encoding");
        if (encodingParam != null) {
            encoding = encodingParam;
        }
    }

    public void destroy() {
        // nothing todo
    }

}

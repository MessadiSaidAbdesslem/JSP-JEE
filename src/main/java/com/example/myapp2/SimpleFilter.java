package com.example.myapp2;

import java.io.IOException;

import jakarta.servlet.DispatcherType;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;

@WebFilter(
        dispatcherTypes = {
                DispatcherType.REQUEST, DispatcherType.FORWARD,
                DispatcherType.INCLUDE, DispatcherType.ERROR
        },
        urlPatterns = {"*"}
)
public class SimpleFilter implements Filter {

    public void init(FilterConfig fConfig) throws ServletException {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {
        System.err.printf("Before %s\n", request);

        if (request instanceof HttpServletRequest) {
            HttpServletRequest hr = (HttpServletRequest) request;
            System.err.printf("Before Http Request %s\n", hr);
        }

        if (!request.getRemoteAddr().equals("127.0.0.1")) {
            return;
        }

        chain.doFilter(request, response);
        System.err.printf("After %s\n", request);
    }

}
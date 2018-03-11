package cn.com.retrans.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter
        implements Filter
{
    public void init(FilterConfig filterConfig)
            throws ServletException
    {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException
    {
        HttpServletRequest servletRequest = (HttpServletRequest)request;
        HttpServletResponse servletResponse = (HttpServletResponse)response;
        HttpSession session = servletRequest.getSession();

        String path = servletRequest.getRequestURI();

        String account = (String)session.getAttribute("account");

        if (path.indexOf("/login") > -1) {
            chain.doFilter(servletRequest, servletResponse);
            return;
        }

        if ((account == null) || ("".equals(account)))
        {
            servletResponse.sendRedirect("/webDemo");
        }
        else
            chain.doFilter(request, response);
    }

    public void destroy()
    {
    }
}

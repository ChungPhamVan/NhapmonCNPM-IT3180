/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.filter;

import com.nhapmoncnpm.model.UserModel;
import com.nhapmoncnpm.utils.SessionUtil;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HDN
 */
public class AuthorizationFilter implements Filter{
    private ServletContext context;
    
    @Override
    public void init(FilterConfig fc) throws ServletException {
        this.context = fc.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain fc) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();
        if(url.startsWith("/nhapmoncnpm_IT3180/admin")) {
            UserModel model = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
            fc.doFilter(servletRequest, servletResponse);
            if(model != null) {
                if(model.getRoleModel().getCode().equals("ADMIN")) {
                    fc.doFilter(servletRequest, servletResponse);
                } else if(model.getRoleModel().getCode().equals("USER")) {
                    response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=not_permission&alert=danger");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=not_login&alert=danger");
            }
        } else {
            fc.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
        
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.controller.admin;

import com.nhapmoncnpm.model.UserModel;
import com.nhapmoncnpm.service.IUserService;
import com.nhapmoncnpm.utils.FormUtil;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HDN
 */
@WebServlet(urlPatterns = {"/admin-user"})
public class UserController extends HttpServlet {
    @Inject
    private IUserService userService;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserModel model = FormUtil.toModel(UserModel.class, request);
        List<UserModel> listUserModel = userService.findByIdRole();
        model.setListResult(listUserModel);
        request.setAttribute("users", model);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/list.jsp");
        rd.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Integer access = Integer.parseInt(request.getParameter("access"));
        Long id = Long.parseLong(request.getParameter("userId"));
        UserModel userModel = userService.findOne(id);
        userModel.setAccess(access);
        userService.update(userModel);
    }
}

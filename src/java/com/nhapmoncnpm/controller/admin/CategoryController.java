package com.nhapmoncnpm.controller.admin;


import com.nhapmoncnpm.model.CategoryModel;
import com.nhapmoncnpm.paging.PageRequest;
import com.nhapmoncnpm.paging.Pageble;
import com.nhapmoncnpm.service.ICategoryService;
import com.nhapmoncnpm.service.IProductService;
import com.nhapmoncnpm.sort.Sorter;
import com.nhapmoncnpm.utils.FormUtil;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author HDN
 */
@WebServlet(urlPatterns = {"/admin-category"})
public class CategoryController extends HttpServlet {

    @Inject
    private ICategoryService categoryService;
    @Inject
    private IProductService productService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryModel model = FormUtil.toModel(CategoryModel.class, request);
        String view = "";
        Long id = model.getId();
        if (id == null) {
            if (model.getType().equals("list")) {
                Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(), model.getSortBy()));
                model.setListResult(categoryService.findAllByPage(pageble));
                model.setTotalItem(categoryService.count());
                model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
                view = "/views/admin/category/list.jsp";
            } else if(model.getType().equals("edit")) {
                view = "/views/admin/category/edit.jsp";
            } else if(model.getType().equals("listanddelete")) {
                Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(), model.getSortBy()));
                model.setListResult(categoryService.findAllByPage(pageble));
                model.setTotalItem(categoryService.count());
                model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
                view = "/views/admin/category/list.jsp";
                request.setAttribute("isDelete", true);
            }
        } else {
            if (model.getType().equals("edit")) {
                model = categoryService.findOne(id);
                view = "/views/admin/category/edit.jsp";
                request.setAttribute("model", model);
                RequestDispatcher rd = request.getRequestDispatcher(view);
                rd.forward(request, response);
            }
        }
        request.setAttribute("model", model);
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        CategoryModel categoryModel = new CategoryModel();
        categoryModel.setId(request.getParameter("id") != null ? Long.parseLong(request.getParameter("id")) : null);
        categoryModel.setCode(request.getParameter("code"));
        categoryModel.setName(request.getParameter("name"));
        if(categoryModel.getId() != null) {
            categoryService.update(categoryModel);
        } else if(categoryModel.getId() == null) {
            categoryService.save(categoryModel);
        }
        response.sendRedirect("/nhapmoncnpm_IT3180/admin-category?type=list&page=1&maxPageItem=8&sortName=code&sortBy=asc");
    }
    

}

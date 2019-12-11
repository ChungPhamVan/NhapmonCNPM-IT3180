/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.controller.admin.api;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhapmoncnpm.model.ProductModel;
import com.nhapmoncnpm.service.IProductService;
import com.nhapmoncnpm.utils.HttpUtil;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HDN
 */
@WebServlet(urlPatterns = {"/api-admin-product"})
public class ProductAPI extends HttpServlet {
    @Inject
    private IProductService productService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        ProductModel productModel = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
        productModel = productService.save(productModel);
        mapper.writeValue(response.getOutputStream(), productModel);
    }
    
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        ProductModel updateProduct = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
        updateProduct = productService.update(updateProduct);
        mapper.writeValue(response.getOutputStream(), updateProduct);
    }

    
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        ProductModel deleteProduct = HttpUtil.of(request.getReader()).toModel(ProductModel.class);
        productService.delete(deleteProduct.getIds());
        mapper.writeValue(response.getOutputStream(), "{}");
    }
    
    
    
    private void saveOrUpdate() {
        
    }
    
}

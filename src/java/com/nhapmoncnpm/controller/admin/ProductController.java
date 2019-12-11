/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.controller.admin;

import com.nhapmoncnpm.model.ProductModel;
import com.nhapmoncnpm.paging.PageRequest;
import com.nhapmoncnpm.paging.Pageble;
import com.nhapmoncnpm.service.ICategoryService;
import com.nhapmoncnpm.service.IProductService;
import com.nhapmoncnpm.sort.Sorter;
import com.nhapmoncnpm.utils.FormUtil;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author HDN
 */
@WebServlet(urlPatterns = {"/admin-product"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 2)
public class ProductController extends HttpServlet {

    @Inject
    private IProductService productService;

    @Inject
    private ICategoryService categoryService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        ProductModel model = FormUtil.toModel(ProductModel.class, request);
        String view = "";
        if (id == null) {
            if (model.getType().equals("list")) {
                if(model.getCategoryId() != null) {
                    model.setListResult(productService.findByCategoryId(model.getCategoryId()));
                } else {
                    Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(), model.getSortBy()));
                    model.setListResult(productService.findAllByPage(pageble));
                    model.setTotalItem(productService.count());
                    model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
                }
                view = "/views/admin/product/list.jsp";
            } else if (model.getType().equals("edit")) {
                request.setAttribute("categories", categoryService.findAll());
                view = "/views/admin/product/edit.jsp";
            } else if (model.getType().equals("listanddelete")) {
                Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(), model.getSortBy()));
                model.setListResult(productService.findAllByPage(pageble));
                model.setTotalItem(productService.count());
                model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
                view = "/views/admin/product/list.jsp";
                request.setAttribute("isDelete", true);
            }
            request.setAttribute("model", model);
            RequestDispatcher rd = request.getRequestDispatcher(view);
            rd.forward(request, response);
        } else {
            if (model.getType().equals("edit")) {
                model = productService.findOne(model.getId());
                request.setAttribute("categories", categoryService.findAll());
                view = "/views/admin/product/edit.jsp";
                request.setAttribute("model", model);
                RequestDispatcher rd = request.getRequestDispatcher(view);
                rd.forward(request, response);
            } else if (model.getType().equals("listanddelete")) {
                long[] ids = new long[]{Long.parseLong(id)};
                model.setIds(ids);
                productService.delete(ids);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductModel productModel = writeFile(request, response);
        if (productModel.getId() == null) {
            productService.save(productModel);
        } else {
            productService.update(productModel);
        }
        response.sendRedirect("/nhapmoncnpm_IT3180/admin-product?type=list&page=1&maxPageItem=8&sortName=title&sortBy=asc");
    }

    public ProductModel writeFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out1 = response.getWriter()) {
            HttpSession session = request.getSession();
            ProductModel productModel = new ProductModel();
            productModel.setTitle(request.getParameter("title"));
            productModel.setCategoryCode(request.getParameter("categoryCode"));
            productModel.setContent(request.getParameter("content"));
            productModel.setShortDescription(request.getParameter("shortDescription"));
            productModel.setId(request.getParameter("id") != null ? Long.parseLong(request.getParameter("id")) : null);
            productModel.setPrice(request.getParameter("price") != null ? Integer.parseInt(request.getParameter("price")) : 0);
            productModel.setAmount(request.getParameter("amount") != null ? Integer.parseInt(request.getParameter("amount")) : 0);
            Part filePart = request.getPart("thumbnail");

            String photo = "";
            String path = "C:\\Users\\HDN\\Documents\\NetBeansProjects\\nhapmoncnpm_IT3180\\web\\images\\";

            File file = new File(path);
            file.mkdir();
            String fileName = getFileName(filePart);
            productModel.setThumbnail(fileName);
            OutputStream out = null;

            InputStream filecontent = null;

            PrintWriter writer = response.getWriter();
            try {
                out = new FileOutputStream(new File(path + File.separator
                        + fileName));

                filecontent = filePart.getInputStream();

                int read = 0;
                final byte[] bytes = new byte[1024];

                while ((read = filecontent.read(bytes)) != -1) {
                    out.write(bytes, 0, read);

                    photo = path + "/" + fileName;

                }
            } catch (Exception e) {

            }
            out1.println("<html><body><script>alert('Updated Successfully!');</script></body></html>");
            return productModel;
        }
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");

        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}

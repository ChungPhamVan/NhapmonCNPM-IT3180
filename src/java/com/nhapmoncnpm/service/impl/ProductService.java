/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.service.impl;

import com.nhapmoncnpm.dao.ICategoryDAO;
import com.nhapmoncnpm.dao.IProductDAO;
import com.nhapmoncnpm.model.CategoryModel;
import com.nhapmoncnpm.model.ProductModel;
import com.nhapmoncnpm.paging.Pageble;
import com.nhapmoncnpm.service.IProductService;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author HDN
 */
public class ProductService implements IProductService{
    @Inject
    private IProductDAO productDAO;
    @Inject
    private ICategoryDAO categoryDAO;
    
    
    @Override
    public List<ProductModel> findByCategoryId(Long categoryId) {
        return productDAO.findByCategoryId(categoryId);
    }

    @Override
    public ProductModel save(ProductModel productModel) {
//        productModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
//        productModel.setCreatedBy("");
        CategoryModel category = categoryDAO.findOneByCode(productModel.getCategoryCode());
        productModel.setCategoryId(category.getId());
        Long productId = productDAO.save(productModel);
        return productDAO.findOne(productId);
    }

    @Override
    public ProductModel update(ProductModel updateProduct) {
        ProductModel oldProduct = productDAO.findOne(updateProduct.getId());
//        updateProduct.setCreatedBy(oldProduct.getCreatedBy());
//        updateProduct.setCreatedDate(oldProduct.getCreatedDate());
        CategoryModel category = categoryDAO.findOneByCode(updateProduct.getCategoryCode());
        updateProduct.setCategoryId(category.getId());
        productDAO.update(updateProduct);
        return productDAO.findOne(updateProduct.getId());
    }

    @Override
    public void delete(long[] ids) {
        for(long id: ids) {
            productDAO.delete(id);
        }
    }

    @Override
    public List<ProductModel> findAllByPage(Pageble pageble) {
        return productDAO.findAllByPage(pageble);
    }

    @Override
    public Integer count() {
        return productDAO.count();
    }

    @Override
    public ProductModel findOne(Long id) {
        ProductModel product = productDAO.findOne(id);
        CategoryModel category = categoryDAO.findOne(product.getCategoryId());
        product.setCategoryCode(category.getCode());
        return product;
    }

    @Override
    public List<ProductModel> findAll() {
        return productDAO.findAll();
    }

    @Override
    public Integer count(Long id) {
        return productDAO.countByCategoryId(id);
    }

    @Override
    public List<ProductModel> search(String search) {
        List<ProductModel> listProduct = new ArrayList<>();
        for(ProductModel i : productDAO.findAll()) {
            if(i.getTitle().toLowerCase().contains(search.toLowerCase())) {
                listProduct.add(i);
            }
        }
        return listProduct;
    }

    @Override
    public Integer countResultSearch(String search) {
        return productDAO.countResultSearch(search);
    }
    
}

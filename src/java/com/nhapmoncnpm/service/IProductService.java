/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.service;

import com.nhapmoncnpm.model.ProductModel;
import com.nhapmoncnpm.paging.Pageble;
import java.util.List;

/**
 *
 * @author HDN
 */
public interface IProductService {
    List<ProductModel> findByCategoryId(Long categoryId);
    ProductModel save(ProductModel productModel);
    ProductModel update(ProductModel updateProduct);
    void delete(long[] ids);
    List<ProductModel> findAllByPage(Pageble pageble);
    List<ProductModel> findAll();
    Integer count();
    ProductModel findOne(Long id);
    Integer count(Long id);
    List<ProductModel> search(String search);
    Integer countResultSearch(String search);
}

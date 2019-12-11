/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.dao;

import com.nhapmoncnpm.model.ProductModel;
import com.nhapmoncnpm.paging.Pageble;
import java.util.List;

/**
 *
 * @author HDN
 */
public interface IProductDAO extends GenericDAO<ProductModel>{
    ProductModel findOne(Long id);
    List<ProductModel> findByCategoryId(Long categoryId);
    Long save(ProductModel productModel);
    void update(ProductModel updateProduct);
    void delete(long id);
    List<ProductModel> findAllByPage(Pageble pageble);
    List<ProductModel> findAll();
    Integer count();
    Integer countByCategoryId(Long id);
    List<ProductModel> search(String search);
    Integer countResultSearch(String search);
}

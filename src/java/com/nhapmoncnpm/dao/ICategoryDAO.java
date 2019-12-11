/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.dao;

import com.nhapmoncnpm.model.CategoryModel;
import com.nhapmoncnpm.paging.Pageble;
import java.util.List;

/**
 *
 * @author HDN
 */
public interface ICategoryDAO extends GenericDAO<CategoryModel>{
    List<CategoryModel> findAll();
    CategoryModel findOne(Long id);
    CategoryModel findOneByCode(String code);
    List<CategoryModel> findAllByPage(Pageble pageble);
    Integer count();
    void update(CategoryModel updateCategory);
    Long save(CategoryModel categoryModel);
    void delete(long id);
}

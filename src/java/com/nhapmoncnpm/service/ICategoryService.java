/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.service;

import com.nhapmoncnpm.model.CategoryModel;
import com.nhapmoncnpm.paging.Pageble;
import java.util.List;

/**
 *
 * @author HDN
 */
public interface ICategoryService {
    List<CategoryModel> findAllByPage(Pageble pageble);
    List<CategoryModel> findAll();
    CategoryModel findOne(Long id);
    Integer count();
    CategoryModel update(CategoryModel updateCategory);
    CategoryModel save(CategoryModel categoryModel);
    void delete(long[] ids);
}

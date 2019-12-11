
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.service.impl;

import com.nhapmoncnpm.dao.ICategoryDAO;
import com.nhapmoncnpm.model.CategoryModel;
import com.nhapmoncnpm.paging.Pageble;
import com.nhapmoncnpm.service.ICategoryService;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author HDN
 */
public class CategoryService implements ICategoryService{
    @Inject
    private ICategoryDAO categoryDAO;
    
    @Override
    public List<CategoryModel> findAll() {
        return categoryDAO.findAll();
    }

    @Override
    public CategoryModel findOne(Long id) {
        return categoryDAO.findOne(id);
    }

    @Override
    public List<CategoryModel> findAllByPage(Pageble pageble) {
        return categoryDAO.findAllByPage(pageble);
    }

    @Override
    public Integer count() {
        return categoryDAO.count();
    }

    @Override
    public CategoryModel update(CategoryModel updateCategory) {
        CategoryModel oldCategory = categoryDAO.findOne(updateCategory.getId());
        categoryDAO.update(updateCategory);
        return categoryDAO.findOne(updateCategory.getId());
    }

    @Override
    public CategoryModel save(CategoryModel categoryModel) {
        Long categoryId = categoryDAO.save(categoryModel);
        return categoryDAO.findOne(categoryId);
    }

    @Override
    public void delete(long[] ids) {
        for(long id: ids) {
            categoryDAO.delete(id);
        }
    }
    
}

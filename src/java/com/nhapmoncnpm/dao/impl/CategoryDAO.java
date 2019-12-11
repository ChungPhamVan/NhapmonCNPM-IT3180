/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.dao.impl;

import com.nhapmoncnpm.dao.ICategoryDAO;
import com.nhapmoncnpm.model.CategoryModel;
import com.nhapmoncnpm.paging.Pageble;
import com.nhapmoncnpm.mapper.CategoryMapper;
import java.util.List;

/**
 *
 * @author HDN
 */
public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {
    @Override
    public List<CategoryModel> findAll() {
        String query = "SELECT * FROM category";
        return query(query, new CategoryMapper());
    }

    @Override
    public CategoryModel findOne(Long id) {
        String query = "SELECT * FROM category where idcategory = ?";
        List<CategoryModel> categories = query(query, new CategoryMapper(), id);
        return categories.isEmpty() ? null : categories.get(0);
    }

    @Override
    public CategoryModel findOneByCode(String code) {
        String query = "SELECT * FROM category where code = ?";
        List<CategoryModel> categories = query(query, new CategoryMapper(), code);
        return categories.isEmpty() ? null : categories.get(0);
    }

    @Override
    public List<CategoryModel> findAllByPage(Pageble pageble) {
        StringBuilder query = new StringBuilder("SELECT * FROM category");
        if(pageble.getSorter() != null) {
            query.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if(pageble.getOffset() != null && pageble.getLimit() != null) {
            query.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
            return query(query.toString(), new CategoryMapper(), pageble.getOffset(), pageble.getLimit());
        } else {
            return query(query.toString(), new CategoryMapper());
        }
    }

    @Override
    public Integer count() {
        String query = "SELECT count(*) FROM category";
        return count(query);
    }

    @Override
    public void update(CategoryModel updateCategory) {
        String query = "UPDATE category SET name = ? WHERE idcategory = ?";
        update(query, updateCategory.getName(), updateCategory.getId());
    }

    @Override
    public Long save(CategoryModel categoryModel) {
        String query = "INSERT INTO category(code, name) VALUES (?, ?)";
        return insert(query, categoryModel.getCode(), categoryModel.getName());
    }

    @Override
    public void delete(long id) {
        String query = "DELETE FROM category WHERE idcategory = ?";
        update(query, id);
    }
}

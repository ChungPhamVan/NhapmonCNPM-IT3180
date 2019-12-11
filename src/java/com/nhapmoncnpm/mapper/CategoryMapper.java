/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.mapper;

import com.nhapmoncnpm.model.CategoryModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HDN
 */
public class CategoryMapper implements RowMapper<CategoryModel>{

    @Override
    public CategoryModel mapRow(ResultSet resultSet) {
        try {
            CategoryModel category = new CategoryModel();
            category.setId(resultSet.getLong("idcategory"));
            category.setName(resultSet.getString("name"));
            category.setCode(resultSet.getString("code"));
            return category;
        } catch (SQLException e) {
            return null;
        }
    }   
} 
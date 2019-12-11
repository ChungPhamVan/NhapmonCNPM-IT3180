/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.mapper;

import com.nhapmoncnpm.model.ProductModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HDN
 */
public class ProductMapper implements RowMapper<ProductModel>{

    @Override
    public ProductModel mapRow(ResultSet resultSet) {
        try {
            ProductModel product = new ProductModel();
            product.setId(resultSet.getLong("idproduct"));
            product.setCategoryId(resultSet.getLong("idcategory"));
            product.setTitle(resultSet.getString("title"));
            product.setThumbnail(resultSet.getString("thumbnail"));
            product.setShortDescription(resultSet.getString("shortdescription"));
            product.setContent(resultSet.getString("content"));
            product.setPrice(resultSet.getInt("price"));
            product.setAmount(resultSet.getInt("amount"));
            return product;
        } catch (SQLException e) {
            return null;
        }
    }
    
}

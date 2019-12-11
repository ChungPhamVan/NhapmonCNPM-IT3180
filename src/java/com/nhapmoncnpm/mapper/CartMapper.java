/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.mapper;

import com.nhapmoncnpm.model.CartModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HDN
 */
public class CartMapper implements RowMapper<CartModel>{

    @Override
    public CartModel mapRow(ResultSet resultSet) {
        try {
            CartModel cartModel = new CartModel();
            cartModel.setId(resultSet.getLong("idcart"));
            cartModel.setUserId(resultSet.getLong("iduser"));
            cartModel.setProductId(resultSet.getLong("idproduct"));
            cartModel.setAmount(resultSet.getInt("amount"));
            return cartModel;
        } catch (SQLException e) {
            return null;
        }
    }
    
}

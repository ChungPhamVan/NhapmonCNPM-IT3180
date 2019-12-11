/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.dao.impl;

import com.nhapmoncnpm.dao.ICartDAO;
import com.nhapmoncnpm.mapper.CartMapper;
import com.nhapmoncnpm.mapper.RowMapper;
import com.nhapmoncnpm.model.CartModel;
import java.util.List;

/**
 *
 * @author HDN
 */
public class CartDAO extends AbstractDAO<CartModel> implements ICartDAO{

    @Override
    public CartModel findOne(Long id) {
        String query = "SELECT * FROM cart WHERE idcart = ?";
        List<CartModel> carts = query(query, new CartMapper(), id);
        return carts.isEmpty() ? null : carts.get(0);
    }

    @Override
    public List<CartModel> findAllByUserId(Long id) {
        String query = "SELECT * FROM cart WHERE iduser = ?";
        return query(query, new CartMapper(), id);
    }

    @Override
    public void update(CartModel updateCart) {
        String query = "UPDATE cart SET iduser = ?, idproduct = ?, amount = ? WHERE idcart = ?";
        update(query, updateCart.getUserId(), updateCart.getProductId(), updateCart.getAmount(), updateCart.getId());
    }

    @Override
    public Long save(CartModel cartModel) {
        String query = "INSERT INTO cart(iduser, idproduct, amount) VALUES (?, ?, ?)";
        return insert(query, cartModel.getUserId(), cartModel.getProductId(), cartModel.getAmount());
    }

    @Override
    public void delete(long id) {
        String query = "DELETE FROM cart WHERE idcart = ?";
        update(query, id);
    }

    @Override
    public Integer countByUserId(Long id) {
        String query = "SELECT count(*) FROM cart WHERE iduser = ?";
        return count(query, id);
    }

    @Override
    public Integer countByUserIdAndProductId(Long userId, Long productId) {
        String query = "SELECT count(*) FROM cart WHERE iduser = ? and idproduct = ?";
        return count(query, userId, productId);
    }

    @Override
    public CartModel findOneByUserIdAndProductId(Long userId, Long productId) {
        String query = "SELECT * FROM cart WHERE iduser = ? and idproduct = ?";
        List<CartModel> carts = query(query, new CartMapper(), userId, productId);
        return carts.isEmpty() ? null : carts.get(0);
    }
}

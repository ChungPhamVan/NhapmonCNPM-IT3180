/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.service.impl;

import com.nhapmoncnpm.dao.ICartDAO;
import com.nhapmoncnpm.model.CartModel;
import com.nhapmoncnpm.service.ICartService;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author HDN
 */
public class CartService implements ICartService{
    @Inject
    private ICartDAO cartDAO;
    @Override
    public CartModel findOne(Long id) {
        CartModel cartModel = cartDAO.findOne(id);
        return cartModel;
    }

    @Override
    public List<CartModel> findAllByUserId(Long id) {
        return cartDAO.findAllByUserId(id);
    }

    @Override
    public CartModel update(CartModel updateCart) {
        cartDAO.update(updateCart);
        return cartDAO.findOne(updateCart.getId());
    }

    @Override
    public CartModel save(CartModel cartModel) {
        Long cartId = cartDAO.save(cartModel);
        return cartDAO.findOne(cartId);
    }

    @Override
    public void delete(long[] ids) {
        for(long id : ids) {
            cartDAO.delete(id);
        }
    }

    @Override
    public Integer countByUserId(Long id) {
        return cartDAO.countByUserId(id);
    }

    @Override
    public Integer countByUserIdAndProductId(Long userId, Long productId) {
        return cartDAO.countByUserIdAndProductId(userId, productId);
    }

    @Override
    public CartModel findOneByUserIdAndProductId(Long userId, Long productId) {
        return cartDAO.findOneByUserIdAndProductId(userId, productId);
    }
    
    
}

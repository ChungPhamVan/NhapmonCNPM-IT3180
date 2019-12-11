/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.dao;

import com.nhapmoncnpm.model.CartModel;
import java.util.List;

/**
 *
 * @author HDN
 */
public interface ICartDAO extends GenericDAO<CartModel>{
    CartModel findOne(Long id);
    List<CartModel> findAllByUserId(Long id);
    CartModel findOneByUserIdAndProductId(Long userId, Long productId);
    void update(CartModel updateCart);
    Long save(CartModel cartModel);
    void delete(long id);
    Integer countByUserId(Long id);
    Integer countByUserIdAndProductId(Long userId, Long productId);
}

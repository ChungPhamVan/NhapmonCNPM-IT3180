/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.service;

import com.nhapmoncnpm.model.CartModel;
import java.util.List;

/**
 *
 * @author HDN
 */
public interface ICartService {
    CartModel findOne(Long id);
    List<CartModel> findAllByUserId(Long id);
    CartModel findOneByUserIdAndProductId(Long userId, Long productId);
    CartModel update(CartModel updateCart);
    CartModel save(CartModel cartModel);
    void delete(long[] ids);
    Integer countByUserId(Long id);
    Integer countByUserIdAndProductId(Long userId, Long productId);
}

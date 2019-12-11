/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.model;

import java.sql.Timestamp;

/**
 *
 * @author HDN
 */
public class CartModel extends AbstractModel<CartModel> {
    private Long userId;
    private Long productId;
    private int amount;

    public CartModel(Long userId, Long productId, int amount) {
        this.userId = userId;
        this.productId = productId;
        this.amount = amount;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public CartModel() {
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

}

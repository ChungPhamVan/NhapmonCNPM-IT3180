/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.service;

import com.nhapmoncnpm.model.UserModel;

/**
 *
 * @author HDN
 */
public interface IUserService {
    UserModel findByUserNameAndPasswordAndStatus(String emailAddress, String password, Integer status);
    UserModel findByEmailAddressAndStatus(String emailAddress, Integer status);
    UserModel save(UserModel userModel);
}

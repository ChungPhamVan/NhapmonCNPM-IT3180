/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.service.impl;

import com.nhapmoncnpm.dao.IUserDAO;
import com.nhapmoncnpm.model.UserModel;
import com.nhapmoncnpm.service.IUserService;
import javax.inject.Inject;

/**
 *
 * @author HDN
 */
public class UserService implements IUserService{
    @Inject IUserDAO userDAO;
    @Override
    public UserModel findByUserNameAndPasswordAndStatus(String emailAddress, String password, Integer status) {
        return userDAO.findByUserNameAndPasswordAndStatus(emailAddress, password, status);
    }

    @Override
    public UserModel findByEmailAddressAndStatus(String emailAddress, Integer status) {
        return userDAO.findByEmailAddressAndStatus(emailAddress, status);
    }

    @Override
    public UserModel save(UserModel userModel) {
        Long id = userDAO.save(userModel);
        return userDAO.findOne(id);
    }
    
}

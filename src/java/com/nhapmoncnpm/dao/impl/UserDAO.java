/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.dao.impl;

import com.nhapmoncnpm.dao.IUserDAO;
import com.nhapmoncnpm.model.UserModel;
import com.nhapmoncnpm.mapper.UserMapper;
import java.util.List;

/**
 *
 * @author HDN
 */
public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {

    @Override
    public UserModel findByUserNameAndPasswordAndStatus(String emailAddress, String password, Integer status) {
        StringBuilder query = new StringBuilder("SELECT * FROM user_human AS u");
        query.append(" INNER JOIN role AS r ON r.idrole=u.idrole");
        query.append(" WHERE u.emailaddress = ? AND u.password = ? AND u.status = ?");
        List<UserModel> users = query(query.toString(), new UserMapper(), emailAddress, password, status);
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public UserModel findByEmailAddressAndStatus(String emailAddress, Integer status) {
        StringBuilder query = new StringBuilder("SELECT * FROM user_human AS u");
        query.append(" INNER JOIN role AS r ON r.idrole=u.idrole");
        query.append(" WHERE u.emailaddress = ? AND u.status = ?");
        List<UserModel> users = query(query.toString(), new UserMapper(), emailAddress, status);
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public Long save(UserModel userModel) {
        String query = "INSERT INTO user_human(idrole, emailaddress, password, status, lastname, firstname, access) VALUES (?, ?, ?, ?, ?, ?, 1)";
        return insert(query, 2, userModel.getEmailAddress(), userModel.getPassword(), 1, userModel.getLastName(), userModel.getFirstName());
    }

    @Override
    public UserModel findOne(Long id) {
        String query = "SELECT * FROM user_human WHERE iduser = ?";
        List<UserModel> users = query(query.toString(), new UserMapper(), id);
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public List<UserModel> findByIdRole() {
        StringBuilder query = new StringBuilder("SELECT * FROM user_human AS u");
        query.append(" INNER JOIN role AS r ON r.idrole=u.idrole");
        query.append(" WHERE r.code = ?");
        List<UserModel> users = query(query.toString(), new UserMapper(), "USER");
        return users;
    }

    @Override
    public void update(UserModel userModel) {
        String query = "UPDATE user_human SET access = ? WHERE iduser = ?";
        update(query, userModel.getAccess(), userModel.getId());
        
    }
    
}

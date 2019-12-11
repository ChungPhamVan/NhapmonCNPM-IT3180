/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.mapper;
import com.nhapmoncnpm.model.RoleModel;
import com.nhapmoncnpm.model.UserModel;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HDN
 */
public class UserMapper implements RowMapper<UserModel> {

    @Override
    public UserModel mapRow(ResultSet resultSet) {
        try {
            UserModel user = new UserModel();
            user.setId(resultSet.getLong("iduser"));
            user.setFirstName(resultSet.getString("firstname"));
            user.setLastName(resultSet.getString("lastname"));
            user.setEmailAddress(resultSet.getString("emailaddress"));
            user.setPassword(resultSet.getString("password"));
            user.setStatus(resultSet.getInt("status"));
            try {
                RoleModel role = new RoleModel();
                role.setCode(resultSet.getString("code"));
                role.setName(resultSet.getString("name"));
                user.setRoleModel(role);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            return user;
        } catch (SQLException e) {
            return null;
        }
    }
    
}

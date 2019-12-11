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
public class UserModel extends AbstractModel<UserModel> {
    private String firstName;
    private String lastName;
    private String emailAddress;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
    private String password;
    private int status;
    private Long roleId;
    private RoleModel roleModel = new RoleModel();

    public RoleModel getRoleModel() {
        return roleModel;
    }

    public void setRoleModel(RoleModel roleModel) {
        this.roleModel = roleModel;
    }

    public UserModel() {
    }   

    public String getPassword() {
        return password;
    }

    public int getStatus() {
        return status;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
}

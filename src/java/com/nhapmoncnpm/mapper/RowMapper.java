/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.mapper;

import java.sql.ResultSet;

/**
 *
 * @author HDN
 * @param <T>
 */
public interface RowMapper<T> {

    /**
     *
     * @param resultSet
     * @return
     */
    T mapRow(ResultSet resultSet);
}

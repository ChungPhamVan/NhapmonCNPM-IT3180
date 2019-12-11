/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.dao;

import com.nhapmoncnpm.mapper.RowMapper;
import java.util.List;

/**
 *
 * @author HDN
 */
public interface GenericDAO<T> {
    <T> List<T> query(String query, RowMapper<T> rowMapper, Object... parameters);
    void update(String query, Object... parameters);
    Long insert(String query, Object... parameters);
    Integer count(String query, Object... parameters);
}

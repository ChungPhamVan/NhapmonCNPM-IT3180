/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.dao.impl;

import com.nhapmoncnpm.dao.GenericDAO;
import com.nhapmoncnpm.mapper.RowMapper;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HDN
 * @param <T>
 */
public class AbstractDAO<T> implements GenericDAO<T> {
//    ResourceBundle resourceBundle = ResourceBundle.getBundle("db");
    public Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=NMCNPM;user=sa;password=12345";
//            Class.forName(resourceBundle.getString("driverName"));
//            String url = resourceBundle.getString("url");
            Connection connection = DriverManager.getConnection(url);
            return connection;
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        }
    }

    @Override
    public <T> List<T> query(String query, RowMapper<T> rowMapper, Object... parameters) {// lay ra du lieu
        List<T> results = new ArrayList<>();
        Connection connection = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            connection = getConnection();
            prepareStatement = connection.prepareStatement(query);
            setParameter(prepareStatement, parameters);
            resultSet = prepareStatement.executeQuery();
            while (resultSet.next()) {
                results.add(rowMapper.mapRow(resultSet));
            }
            return results;
        } catch (SQLException e) {
            return null;
        } finally {
            try {
                connection.close();
                if (prepareStatement != null) {
                    prepareStatement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                return null;
            }
        }
    }

    private void setParameter(PreparedStatement prepareStatement, Object... parameters) {
        try {
            for(int i = 1; i<= parameters.length; i++) {
                Object parameter = parameters[i - 1];
                if(parameter instanceof Long) {
                    prepareStatement.setLong(i, (Long) parameter);
                } else if(parameter instanceof String) {
                    prepareStatement.setString(i, (String) parameter);
                } else if(parameter instanceof Integer) {
                    prepareStatement.setInt(i, (Integer) parameter);
                }
            }
        } catch (SQLException e) {
        }
    }

    @Override
    public void update(String query, Object... parameters) { //cap nhat san pham va khong tra ve gi ca
        Connection connection = null;
        PreparedStatement prepareStatement = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            prepareStatement = connection.prepareStatement(query);
            setParameter(prepareStatement, parameters);
            prepareStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            if(connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                }
            } else {
            } 
        } finally {
            try {
                connection.close();
                if (prepareStatement != null) {
                    prepareStatement.close();
                }
            } catch (SQLException e) {
            }
        }
    }

    @Override
    public Long insert(String query, Object... parameters) { // de them san pham, tra ve id san pham da them
        ResultSet resultSet = null;
        Long id = null;
        Connection connection = null;
        PreparedStatement prepareStatement = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            prepareStatement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            setParameter(prepareStatement, parameters);
            prepareStatement.executeUpdate();
            resultSet = prepareStatement.getGeneratedKeys();
            if(!resultSet.next()) {
            } else {
                id = resultSet.getLong(1);
            }
            connection.commit();
            return id;
        } catch (SQLException e) {
            if(connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                }
            } else {
            }
            return null;
        } finally {
            try {
                connection.close();
                if (prepareStatement != null) {
                    prepareStatement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                return null;
            }
        }
    }

    @Override
    public Integer count(String query, Object... parameters) {
        Connection connection = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            Integer count = 0;
            connection = getConnection();
            prepareStatement = connection.prepareStatement(query);
            setParameter(prepareStatement, parameters);
            resultSet = prepareStatement.executeQuery();
            while (resultSet.next()) {
                count = (Integer)resultSet.getInt(1);
            }
            return count;
        } catch (SQLException e) {
            return null;
        } finally {
            try {
                connection.close();
                if (prepareStatement != null) {
                    prepareStatement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                return null;
            }
        }
    }
}

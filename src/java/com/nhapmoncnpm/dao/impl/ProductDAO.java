/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.dao.impl;

import com.nhapmoncnpm.dao.IProductDAO;
import com.nhapmoncnpm.model.ProductModel;
import com.nhapmoncnpm.paging.Pageble;
import com.nhapmoncnpm.mapper.ProductMapper;
import java.util.List;

/**
 *
 * @author HDN
 */
public class ProductDAO  extends AbstractDAO<ProductModel> implements IProductDAO {

    @Override
    public List<ProductModel> findByCategoryId(Long categoryId) {
        String query = "SELECT * FROM product WHERE idcategory = ?";
        return query(query, new ProductMapper(), categoryId);
    }

    @Override
    public Long save(ProductModel productModel) {
        String query = "INSERT INTO product(idcategory, title, thumbnail, shortdescription, content, price, amount) VALUES (?, ?, ?, ?, ?, ?, ?)";
        return insert(query, productModel.getCategoryId(), productModel.getTitle(), productModel.getThumbnail(), productModel.getShortDescription(), productModel.getContent(), productModel.getPrice(), productModel.getAmount());
    }

    @Override
    public ProductModel findOne(Long id) {
        String query = "SELECT * FROM product WHERE idproduct = ?";
        List<ProductModel> products = query(query, new ProductMapper(), id);
        return products.isEmpty() ? null : products.get(0);
    }

    @Override
    public void update(ProductModel updateProduct) {
        String query = "UPDATE product SET idcategory = ?, title = ?, thumbnail = ?, shortdescription = ?, content = ?, price = ?, amount = ? WHERE idproduct = ?";
        update(query, updateProduct.getCategoryId(), updateProduct.getTitle(), updateProduct.getThumbnail(),
                updateProduct.getShortDescription(), updateProduct.getContent(), updateProduct.getPrice(), updateProduct.getAmount(), updateProduct.getId());
    }

    @Override
    public void delete(long id) {
        String query = "DELETE FROM product WHERE idproduct = ?";
        update(query, id);
    }

    @Override
    public List<ProductModel> findAllByPage(Pageble pageble) {
        StringBuilder query = new StringBuilder("SELECT * FROM product");
        if(pageble.getSorter() != null) {
            query.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if(pageble.getOffset() != null && pageble.getLimit() != null) {
            query.append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
            return query(query.toString(), new ProductMapper(), pageble.getOffset(), pageble.getLimit());
        } else {
            return query(query.toString(), new ProductMapper());
        }
    }

    @Override
    public Integer count() {
        String query = "SELECT count(*) FROM product";
        return count(query);
    }

    @Override
    public List<ProductModel> findAll() {
        String query = "SELECT * FROM product";
        return query(query, new ProductMapper());
    }

    @Override
    public Integer countByCategoryId(Long id) {
        String query = "SELECT count(*) FROM product WHERE idcategory = ?";
        return count(query, id);
    }

    @Override
    public List<ProductModel> search(String search) {
        
        String query = "SELECT * FROM product WHERE title LIKE '%?%'";
        System.out.println(query);
        return query(query, new ProductMapper(), search);
    }

    @Override
    public Integer countResultSearch(String search) {
        String query = "SELECT count(*) FROM product WHERE title LIKE '%?%'";
        return count(query, search);
    }

}

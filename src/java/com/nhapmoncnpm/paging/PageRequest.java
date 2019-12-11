/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.paging;

import com.nhapmoncnpm.sort.Sorter;

/**
 *
 * @author HDN
 */
public class PageRequest implements Pageble{
    private Integer page;
    private Integer maxPageItem;
    private Sorter sorter;

    public Sorter getSorter() {
        if(this.sorter != null) {
            return this.sorter;
        }
        return null;
    }

    public void setSorter(Sorter sorter) {
        this.sorter = sorter;
    }

    public PageRequest(Integer page, Integer maxPageItem, Sorter sorter) {
        this.page = page;
        this.maxPageItem = maxPageItem;
        this.sorter = sorter;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public void setLimit(Integer maxPageItem) {
        this.maxPageItem = maxPageItem;
    }
    
    @Override
    public Integer getOffset() {
        if(this.page != null && this.maxPageItem != null) {
            return (this.page - 1) * this.maxPageItem;
        }
        return null;
    }

    @Override
    public Integer getLimit() {
        return this.maxPageItem;
    }

    @Override
    public Integer getPage() {
        return this.page;
    }
    
}

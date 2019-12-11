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
public interface Pageble {
    Integer getOffset();
    Integer getLimit();
    Integer getPage();
    Sorter getSorter();
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.List;

/**
 *
 * @author Admin
 */
public interface Accessible<T> {
    boolean insertRec(T obj);
    boolean updateRec(T obj);
    void deleteRec(T obj);
    T getObjeCtById(String id);
    List<T> listAll();
    
}

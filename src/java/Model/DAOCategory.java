/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Utils.ConnectDb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

/**
 *
 * @author Admin
 */
public class DAOCategory implements Accessible<DTOCategory> {

    private ServletContext sc;
    private Connection con;

    public DAOCategory() throws ClassNotFoundException, SQLException {
        con = new ConnectDb().getConnection();
    }

    public DAOCategory(ServletContext sc) throws ClassNotFoundException, SQLException {
        this.sc = sc;
        con = getConnect(sc);
    }

    private Connection getConnect(ServletContext sc) throws ClassNotFoundException, SQLException {
        ConnectDb connectDb = (ConnectDb) sc.getAttribute("DBConnection");
        return connectDb.getConnection();
    }

    @Override
    public boolean insertRec(DTOCategory obj) {
        boolean kq = false;
        try {
            String sqlString = "INSERT INTO categories(categoryName, memo) VALUES (?,?);";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, obj.getCategoryName());
            cmd.setString(2, obj.getMemo());
            int n = cmd.executeUpdate();
            kq = (n > 0);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public boolean updateRec(DTOCategory obj) {
        boolean kq = false;
        try {
            String sqlString = "UPDATE categories SET categoryName=?, memo=? WHERE typeId=?;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, obj.getCategoryName());
            cmd.setString(2, obj.getMemo());
            cmd.setInt(3, obj.getTypeId());
            int n = cmd.executeUpdate();
            kq = (n > 0);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public void deleteRec(DTOCategory obj) {
        try {
            String sqlString = "DELETE from categories where typeId=?;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setInt(1, obj.getTypeId());
            cmd.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public DTOCategory getObjeCtById(String id) {
        DTOCategory obj = null;
        try {
            String sqlString = "SELECT * FROM categories where typeId=?;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, id);
            ResultSet rs = cmd.executeQuery();
            if (rs.next()) {
                obj = new DTOCategory(
                        rs.getInt("typeId"),
                        rs.getString("categoryName"),
                        rs.getString("memo")
                );

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

    @Override
    public List<DTOCategory> listAll() {
        List<DTOCategory> l = new ArrayList<>();
        try {
            String sqlString = "SELECT * FROM categories ORDER BY typeId ASC;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            ResultSet rs = cmd.executeQuery();
            while (rs.next()) {
                l.add(new DTOCategory(
                        rs.getInt("typeId"),
                        rs.getString("categoryName"),
                        rs.getString("memo")
                ));
            }
            rs.close();
            cmd.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;
    }

}

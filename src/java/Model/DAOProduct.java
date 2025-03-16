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
public class DAOProduct implements Accessible<DTOProduct> {

    private ServletContext sc;
    private Connection con;

    public DAOProduct() throws ClassNotFoundException, SQLException {
        con = new ConnectDb().getConnection();
    }

    public DAOProduct(ServletContext sc) throws ClassNotFoundException, SQLException {
        this.sc = sc;
        con = getConnect(sc);
    }

    private Connection getConnect(ServletContext sc) throws ClassNotFoundException, SQLException {
        ConnectDb connectDb = (ConnectDb) sc.getAttribute("DBConnection");
        return connectDb.getConnection();
    }

    @Override
    public boolean insertRec(DTOProduct obj) {
        boolean kq = false;
        try {
            String sqlString = "INSERT INTO products(productId, productName, productImage, brief, postedDate, typeId, account, unit, price, discount) VALUES (?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, obj.getProductId());
            cmd.setString(2, obj.getProductName());
            cmd.setString(3, obj.getProductImage());
            cmd.setString(4, obj.getBrief());
            cmd.setDate(5, obj.getPostedDate());
            cmd.setInt(6, obj.getTypeId().getTypeId());
            cmd.setString(7, obj.getAccount().getAccount());
            cmd.setString(8, obj.getUnit());
            cmd.setInt(9, obj.getPrice());
            cmd.setInt(10, obj.getDiscount());
            int n = cmd.executeUpdate();
            kq = (n > 0);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public boolean updateRec(DTOProduct obj) {
        boolean kq = false;
        try {
            String sqlString = "UPDATE products SET productName=?, productImage=?, brief=?, postedDate=?, typeId=?, account=?, unit=?, price=?, discount=? WHERE productId=?;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, obj.getProductName());
            cmd.setString(2, obj.getProductImage());
            cmd.setString(3, obj.getBrief());
            cmd.setDate(4, obj.getPostedDate());
            cmd.setInt(5, obj.getTypeId().getTypeId());
            cmd.setString(6, obj.getAccount().getAccount());
            cmd.setString(7, obj.getUnit());
            cmd.setInt(8, obj.getPrice());
            cmd.setInt(9, obj.getDiscount());
            cmd.setString(10, obj.getProductId());
            int n = cmd.executeUpdate();
            kq = (n > 0);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public void deleteRec(DTOProduct obj) {
        try {
            String sqlString = "DELETE from products where productId=?;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, obj.getProductId());
            cmd.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public DTOProduct getObjeCtById(String id) {
        DTOProduct obj = null;
        try {

            String sqlString = "SELECT * FROM products WHERE productId = ?;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, id);
            ResultSet rs = cmd.executeQuery();

            if (rs.next()) {
                DTOCategory category = new DTOCategory(rs.getInt("typeId"), null, null);
                DTOAccount account = new DTOAccount(rs.getString("account"), null, null, null, null, false, null, true, 0);

                obj = new DTOProduct(
                        rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("productImage"),
                        rs.getString("brief"),
                        rs.getDate("postedDate"),
                        category,
                        account,
                        rs.getString("unit"),
                        rs.getInt("price"),
                        rs.getInt("discount")
                );
            }
            rs.close();
            cmd.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

    @Override
    public List<DTOProduct> listAll() {
        List<DTOProduct> l = new ArrayList<>();
        try {
            String sqlString = "SELECT * FROM products;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            ResultSet rs = cmd.executeQuery();
            while (rs.next()) {

                DTOCategory category = new DTOCategory(rs.getInt("typeId"), null, null);

                DTOAccount account = new DTOAccount(rs.getString("account"), null, null, null, null, false, null, true, 0);
                l.add(new DTOProduct(
                        rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("productImage"),
                        rs.getString("brief"),
                        rs.getDate("postedDate"),
                        category,
                        account,
                        rs.getString("unit"),
                        rs.getInt("price"),
                        rs.getInt("discount")
                )
                );

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;
    }

    public List<DTOProduct> listByCategory(int id) {
        List<DTOProduct> l = new ArrayList<>();
        try {
            String sqlString = "SELECT * FROM products where typeId=?;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setInt(1, id);
            ResultSet rs = cmd.executeQuery();
            while (rs.next()) {

                DTOCategory category = new DTOCategory(rs.getInt("typeId"), null, null);

                DTOAccount account = new DTOAccount(rs.getString("account"), null, null, null, null, false, null, true, 0);
                l.add(new DTOProduct(
                        rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("productImage"),
                        rs.getString("brief"),
                        rs.getDate("postedDate"),
                        category,
                        account,
                        rs.getString("unit"),
                        rs.getInt("price"),
                        rs.getInt("discount")
                )
                );

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;
    }

    public List<DTOProduct> searchbyName(String name, String priceRange, String discountFilter) {
        List<DTOProduct> l = new ArrayList<>();
        try {
            String sql = "SELECT * FROM products WHERE 1=1";

            if (name != null && !name.trim().isEmpty()) {
                sql += " AND productName LIKE ?";
            }
            if ("low".equals(priceRange)) {
                sql += " AND price < 5000000";
            } else if ("medium".equals(priceRange)) {
                sql += " AND price BETWEEN 5000000 AND 15000000";
            } else if ("high".equals(priceRange)) {
                sql += " AND price > 15000000";
            }
            if ("discounted".equals(discountFilter)) {
                sql += " AND discount > 0";
            } else if ("non-discounted".equals(discountFilter)) {
                sql += " AND discount = 0";
            }

            PreparedStatement cmd = con.prepareStatement(sql);
            int index = 1;
            if (name != null && !name.trim().isEmpty()) {
                cmd.setString(index++, "%" + name + "%");
            }
            ResultSet rs = cmd.executeQuery();
            while (rs.next()) {

                DTOCategory category = new DTOCategory(rs.getInt("typeId"), null, null);

                DTOAccount account = new DTOAccount(rs.getString("account"), null, null, null, null, false, null, true, 0);
                l.add(new DTOProduct(
                        rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("productImage"),
                        rs.getString("brief"),
                        rs.getDate("postedDate"),
                        category,
                        account,
                        rs.getString("unit"),
                        rs.getInt("price"),
                        rs.getInt("discount")
                )
                );

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;
    }

    public List<DTOProduct> sortbyPrice(String order) {
        List<DTOProduct> l = new ArrayList<>();
        try {
            String sql = "SELECT * FROM products ORDER BY price " + ("desc".equals(order) ? "DESC" : "ASC");
            PreparedStatement cmd = con.prepareStatement(sql);
            ResultSet rs = cmd.executeQuery();
            while (rs.next()) {

                DTOCategory category = new DTOCategory(rs.getInt("typeId"), null, null);

                DTOAccount account = new DTOAccount(rs.getString("account"), null, null, null, null, false, null, true, 0);
                l.add(new DTOProduct(
                        rs.getString("productId"),
                        rs.getString("productName"),
                        rs.getString("productImage"),
                        rs.getString("brief"),
                        rs.getDate("postedDate"),
                        category,
                        account,
                        rs.getString("unit"),
                        rs.getInt("price"),
                        rs.getInt("discount")
                )
                );

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;
    }

    public List<DTOCategory> getAllCategories() {
        List<DTOCategory> categories = new ArrayList<>();
        try {
            String sql = "SELECT * FROM categories;";
            PreparedStatement cmd = con.prepareStatement(sql);
            ResultSet rs = cmd.executeQuery();

            while (rs.next()) {
                DTOCategory category = new DTOCategory(rs.getInt("typeId"), rs.getString("categoryName"), rs.getString("memo"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
    
    public String determineUserWealth(List<DTOProduct> viewedProducts) {
    int lowPrice = 0, mediumPrice = 0, highPrice = 0;

    for (DTOProduct product : viewedProducts) {
        int price = product.getPrice();
        
        if (price < 5000000) {
            lowPrice++;
        } else if (price <= 15000000) {
            mediumPrice++;
        } else {
            highPrice++;
        }
    }

    if (lowPrice > mediumPrice && lowPrice > highPrice) {
        return "Poor";
    } else if (mediumPrice >= highPrice) {
        return "Normal";
    } else {
        return "Rich";
    }
}
}



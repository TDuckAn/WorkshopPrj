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
public class DAOAccount implements Accessible<DTOAccount> {

    private ServletContext sc;
    private Connection con;

    public DAOAccount() throws ClassNotFoundException, SQLException {
        con = new ConnectDb().getConnection();
    }

    public DAOAccount(ServletContext sc) throws ClassNotFoundException, SQLException {
        this.sc = sc;
        con = getConnect(sc);
    }

    private Connection getConnect(ServletContext sc) throws ClassNotFoundException, SQLException {
        ConnectDb connectDb = (ConnectDb) sc.getAttribute("DBConnection");
        return connectDb.getConnection();
    }

    @Override
    public boolean insertRec(DTOAccount obj) {
        boolean kq = false;
        try {
            String sqlString = "INSERT INTO accounts(account, pass, lastName, firstName, birthday, gender, phone, isUse, roleInSystem) VALUES (?,?,?,?,?,?,?,?,?);";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, obj.getAccount());
            cmd.setString(2, obj.getPass());
            cmd.setString(3, obj.getLastName());
            cmd.setString(4, obj.getFirstName());
            cmd.setDate(5, obj.getBirthday());
            cmd.setBoolean(6, obj.isGender());
            cmd.setString(7, obj.getPhone());
            cmd.setBoolean(8, obj.isIsUse());
            cmd.setInt(9, obj.getRoleInSystem());
            int n = cmd.executeUpdate();
            kq = (n > 0);
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;

    }

    @Override
    public boolean updateRec(DTOAccount obj) {
        boolean kq = false;
        try {
            String sqlString = "UPDATE accounts SET pass=?, lastName=?, firstName=?, birthday=?, gender=?, phone=?, isUse=?, roleInSystem=? WHERE account=?;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, obj.getPass());
            cmd.setString(2, obj.getLastName());
            cmd.setString(3, obj.getFirstName());
            cmd.setDate(4, obj.getBirthday());
            cmd.setBoolean(5, obj.isGender());
            cmd.setString(6, obj.getPhone());
            cmd.setBoolean(7, obj.isIsUse());
            cmd.setInt(8, obj.getRoleInSystem());
            cmd.setString(9, obj.getAccount());
            int n = cmd.executeUpdate();
            kq = (n > 0);
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;

    }

    @Override
    public void deleteRec(DTOAccount obj) {
        try {
            String sqlString = "DELETE from accounts where account=?;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, obj.getAccount());
            cmd.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<DTOAccount> listByRole(int role) {
        List<DTOAccount> list = new ArrayList<>();
        try {
            String sqlString = "SELECT * FROM accounts WHERE roleInSystem=?;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setInt(1, role);
            ResultSet rs = cmd.executeQuery();
            while (rs.next()) {
                list.add(new DTOAccount(
                        rs.getString("account"),
                        rs.getString("pass"),
                        rs.getString("lastName"),
                        rs.getString("firstName"),
                        rs.getDate("birthday"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("isUse"),
                        rs.getInt("roleInSystem")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public DTOAccount getObjeCtById(String account) {
        DTOAccount obj = null;
        try {
            String sqlString = "SELECT * FROM accounts WHERE account = ?;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, account);
            ResultSet rs = cmd.executeQuery();
            if (rs.next()) {
                obj = new DTOAccount(
                        rs.getString("account"),
                        rs.getString("pass"),
                        rs.getString("lastName"),
                        rs.getString("firstName"),
                        rs.getDate("birthday"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("isUse"),
                        rs.getInt("roleInSystem")
                );

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

    public boolean updateIsUsed(String acc, boolean isUsed) {
        boolean kq = false;
        try {
            String sqlString = "UPDATE accounts SET isUse=? WHERE account=?;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setBoolean(1, isUsed);
            cmd.setString(2, acc);
            int n = cmd.executeUpdate();
            kq = (n > 0);
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public List<DTOAccount> listAll() {
        List<DTOAccount> l = new ArrayList<>();
        try {
            String sqlString = "SELECT * FROM accounts;";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            ResultSet rs = cmd.executeQuery();
            while (rs.next()) {
                l.add(new DTOAccount(
                        rs.getString("account"),
                        rs.getString("pass"),
                        rs.getString("lastName"),
                        rs.getString("firstName"),
                        rs.getDate("birthday"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("isUse"),
                        rs.getInt("roleInSystem")
                )
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;

    }

    public DTOAccount loginSuccess(String acc, String pass) {
        DTOAccount obj = null;
        try {
            String sql = "SELECT * FROM accounts WHERE account=? AND pass=? AND isUse=1;";
            PreparedStatement cmd = con.prepareStatement(sql);
            cmd.setString(1, acc);
            cmd.setString(2, pass);
            ResultSet rs = cmd.executeQuery();

            if (rs.next()) {
                obj = new DTOAccount(
                        rs.getString("account"),
                        rs.getString("pass"),
                        rs.getString("lastName"),
                        rs.getString("firstName"),
                        rs.getDate("birthday"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getInt("isUse") == 1,
                        rs.getInt("roleInSystem")
                );
            }
            rs.close();
            cmd.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

}

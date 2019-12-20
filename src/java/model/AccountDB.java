/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hoangdeptraivodich
 */
public class AccountDB {
    DBContext db;
    Connection con;
    
    public AccountDB(){
        db = new DBContext();
        try{
            con = db.getConnection();
        }catch(Exception ex){
            System.out.println(ex);
        }
    }
    
    public void insert(Account acc){
        String sql = "insert into accounts values (?,?,?,?,?,0) ";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, acc.getUsername());
            st.setString(2, acc.getPassword());
            st.setString(3, acc.getAddress());
            st.setString(4,acc.getPhone());
            st.setString(5,acc.getEmail());
            
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
    
    public Account getAccount(String username, String password){
       
        String sql = "select * from accounts where username = ? and [password] = ? ";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                Account account = new Account();
                account.setUsername(username);
                account.setPassword(password);
                account.setAddress(rs.getString(3));
                account.setPhone(rs.getString(4));
                account.setEmail(rs.getString(5));
                account.setRole(rs.getBoolean(6));
                return account;
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return null;
    }
    
    public void changePass(String username, String newPass){
        String sql = "update accounts set [password] = ? where username = ? ";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, newPass);
            st.setString(2, username);
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hoangdeptraivodich
 */
public class AdminDB {
    DBContext db;
    Connection con;
    
    public AdminDB(){
        db = new DBContext();
        try{
            con = db.getConnection();
        }catch(Exception ex){
            System.out.println(ex);
        }
    }
    
    public void insert(Admin a){
        String sql = "insert into admins (username,[password]) values (?,?) ";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
    
    public boolean existedAdmin(Admin a){
        boolean check = false;
        String sql = "select * from admins where username = ? and [password] = ? ";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                check = true;
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return check;
    }
    
    
    
}

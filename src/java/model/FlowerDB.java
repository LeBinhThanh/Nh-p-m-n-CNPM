
package model;

import entity.Flower;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;

/**
 *
 * @author hoangdeptraivodich
 */
public class FlowerDB {
    DBContext db;
    Connection con;
    
    public FlowerDB(){
        db = new DBContext();
        try{
            con = db.getConnection();
        }catch(Exception ex){
            System.out.println(ex);
        }
    }
    
    public ArrayList<Flower> getAllFlowers(){
        ArrayList<Flower> list = new ArrayList<>();
        String sql = "select * from flowers ";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Flower f = new Flower(rs.getString(1),rs.getString(2),rs.getString(3),
                        rs.getString(4),rs.getFloat(5));
                list.add(f);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return list;
    }
    
    public ArrayList<Flower> getFlowersByType(String type){
        ArrayList<Flower> list = new ArrayList<>();
        String sql = "select * from flowers where type = ? ";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, type);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Flower f = new Flower(rs.getString(1),rs.getString(2),rs.getString(3),
                        rs.getString(4),rs.getFloat(5));
                list.add(f);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return list;
    }
    
    public HashSet<String> getFlowersType(){
        ArrayList<String> list = new ArrayList<>();
        HashSet<String> hs = new HashSet();
        String sql = "select type from flowers";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                String type = rs.getString(1);
                list.add(type);
            }
            for (String i : list){
                hs.add(i);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return hs;
    }
    
    public Flower getFlowersByCode(String code){
        Flower f = new Flower();
        String sql = "select * from flowers where code = ? ";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                f = new Flower(rs.getString(1),rs.getString(2),rs.getString(3),
                        rs.getString(4),rs.getFloat(5));
            }
            return f;
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return null;
    }
    
    public ArrayList<Flower> getFlowersName(String txt){
        ArrayList<Flower> list = new ArrayList<>();
        String sql = "select *\n" +
                "from flowers\n" +
                "where [name] like '%'+?+'%' ";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,txt);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Flower f = new Flower(rs.getString(1),rs.getString(2),rs.getString(3),
                        rs.getString(4),rs.getFloat(5));
                list.add(f);
            }
            return list;
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return null;
    }
    
    public void insert(Flower f){
        String sql = "insert into flowers values (?,?,?,?,?)";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, f.getCode());
            st.setString(2, f.getType());
            st.setString(3,f.getName());
            st.setString(4,f.getImage());
            st.setDouble(5,f.getPrice());
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
    
    public void remove2(String code){
        String sql = "delete from flowers where code = ?";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,code);
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
    
    public void remove1(String code){
        String sql = "delete from flowerDetail where code = ?";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,code);
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
    
    public void update(Flower f){
        String sql = "update flowers set type = ? ,name = ? ,image = ? , price = ? where code = ? ";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, f.getType());
            st.setString(2,f.getName());
            st.setString(3,f.getImage());
            st.setDouble(4,f.getPrice());
            st.setString(5, f.getCode());
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
    
    public boolean existedFlower(String code){
        String sql = "select * from flowers where code = ? ";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                return true;
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return false;
    }
    
    public String getContent(String code){
        String content = "";
        String sql = "select d.content\n" +
                    "from flowers f inner join flowerDetail d\n" +
                    "on f.code = d.code\n" +
                    "where f.code= ? " ;
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                content = rs.getString(1);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return content;
    }
    
    public int getInvoiceId(){
        int iid = -1;
        String sql="select top(1) iid\n" +
                "from invoice\n" +
                "order by iid desc";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                iid = rs.getInt(1);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return iid;
    }
    
    public void insert_invoice(int iid,String date,String username){
        String sql="insert into invoice values (?,?,?)";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, iid);
            st.setString(2,date);
            st.setString(3, username);
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
    
    public void insert_invoiceLine(int iid,String code,float quantity,float price){
        String sql="insert into invoice_line values (?,?,?,?)";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, iid);
            st.setString(2,code);
            st.setFloat(3, quantity);
            st.setFloat(4, price);
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
    
    public int getCommentId(){
        int cid = -1;
        String sql ="select top(1) comment_id\n" +
                    "from comments\n" +
                    "order by comment_id desc";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                cid = rs.getInt(1);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return cid;
    }
    
    public ArrayList<String> getComment(String code){
        ArrayList<String> comments = new ArrayList<>();
        String sql="select content\n" +
                    "from comments\n" +
                    "where code = ? ";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,code );
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                String comment = rs.getString(1);
                comments.add(comment);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return comments;
    }
    
    public void insertComment(int cid,String content,String code){ 
        String sql = "insert into comments values (?,?,?,?)";
        try{
            PreparedStatement st = con.prepareStatement(sql);
            Date d = new Date();
            SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
            String date = f.format(d);
            st.setInt(1, cid);
            st.setString(2, content);
            st.setString(3, date);
            st.setString(4, code);
            st.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
    }
    
}

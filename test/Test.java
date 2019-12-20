
import entity.Account;
import entity.Flower;
import java.util.ArrayList;
import model.AccountDB;
import model.FlowerDB;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Windows10-Pro
 */
public class Test {
    public static void main(String[] args) {
        FlowerDB fdb = new FlowerDB();
        ArrayList<String> comments = fdb.getComment("01");
        for (String s : comments){
            System.out.println(s);
        }
        
        
    }
}

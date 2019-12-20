/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Windows10-Pro
 */
public class Invoice {
    private int iid;
    private String date;
    private Account account;
    private ArrayList<InvoiceLine> lines = new ArrayList<>();
    private float total;

    public Invoice() {
    }
    
    public float getTotal(){
        float total = 0;
        for (InvoiceLine l : lines){
            total += l.getTotal();
        }
        return total;
    }

    public int getIid() {
        return iid;
    }

    public void setIid(int iid) {
        this.iid = iid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public ArrayList<InvoiceLine> getLines() {
        return lines;
    }

    public void setLines(ArrayList<InvoiceLine> lines) {
        this.lines = lines;
    }
    
    

    
}

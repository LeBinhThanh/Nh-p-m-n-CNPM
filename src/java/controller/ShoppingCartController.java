/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Flower;
import entity.Invoice;
import entity.InvoiceLine;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FlowerDB;

/**
 *
 * @author Windows10-Pro
 */
public class ShoppingCartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (request.getSession().getAttribute("account") == null){
            response.sendRedirect("login");
        }
        else{
        
        String code = request.getParameter("code");
        float quantity = Float.parseFloat(request.getParameter("quantity"));
        
        FlowerDB fdb = new FlowerDB();
        Flower f = fdb.getFlowersByCode(code);
        
        Invoice i = (Invoice)request.getSession().getAttribute("invoice");
        if (i == null){
            i = new Invoice();
        }
        boolean isExisted = false;
        for (InvoiceLine line : i.getLines()){
            if (line.getFlower().getCode().equalsIgnoreCase(code)){
                line.setQuantity(line.getQuantity() + quantity);
                isExisted = true;
                break;
            }
        }
        if (!isExisted){
            InvoiceLine line = new InvoiceLine();
            line.setInvoice(i);
            line.setFlower(f);
            line.setQuantity(quantity);
            line.setPrice(f.getPrice());
            i.getLines().add(line);
        }
        
        request.getSession().setAttribute("invoice", i);
        response.sendRedirect("flowerDetail.jsp?code="+code);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

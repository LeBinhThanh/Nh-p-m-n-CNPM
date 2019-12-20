/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Flower;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FlowerDB;

/**
 *
 * @author hoangdeptraivodich
 */
public class addFlowerServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        String image = "images/"+request.getParameter("image");
        float price = Float.parseFloat(request.getParameter("price"));
        
        FlowerDB fdb = new FlowerDB();
        
        if (fdb.existedFlower(code)){
            request.setAttribute("message","Existed Code!!!Please try again!!!");
            RequestDispatcher rd = request.getRequestDispatcher("addFlower.jsp");
            rd.forward(request, response);
        }else{
            Flower f = new Flower(code, type, name, image, price);
            fdb.insert(f);
            request.setAttribute("message","Add new Flower successfully!!!");
            RequestDispatcher rd = request.getRequestDispatcher("addFlower.jsp");
            rd.forward(request, response);
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

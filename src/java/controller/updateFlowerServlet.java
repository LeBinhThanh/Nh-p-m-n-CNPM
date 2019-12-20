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
public class updateFlowerServlet extends HttpServlet {

   
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
        String image = request.getParameter("image");
        float price = Float.parseFloat(request.getParameter("price"));
        
        FlowerDB fdb = new FlowerDB();
        Flower f = new Flower(code, type, name, image, price);
        fdb.update(f);
        response.sendRedirect("HomeAdmin.jsp");

//        response.getWriter().println(code);
//        response.getWriter().println(name);
//        response.getWriter().println(type);
//        response.getWriter().println(image);
//        response.getWriter().println(price);
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

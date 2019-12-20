/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AccountDB;

/**
 *
 * @author hoangdeptraivodich
 */
public class ChangePass extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        Account acc = (Account)request.getSession().getAttribute("account");
        String username = acc.getUsername();
        String password = acc.getPassword();
        
        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        String newPass2 = request.getParameter("newPass2");
//        
//        response.getWriter().println(username);
//        response.getWriter().println(password);
//        response.getWriter().println(oldPass);
//        response.getWriter().println(newPass);
//        response.getWriter().println(newPass2);
        
        if (!oldPass.equals(password)){
            request.setAttribute("message", "Old password is not correct!Please retry!!!");
            RequestDispatcher rd = request.getRequestDispatcher("ChangePass.jsp");
            rd.forward(request, response);
        }else{
            if (!newPass.equals(newPass2)){
                request.setAttribute("message", "Re-enter password is not correct!Please retry!!!");
                RequestDispatcher rd = request.getRequestDispatcher("ChangePass.jsp");
                rd.forward(request, response);
            }
            else{
                AccountDB adb = new AccountDB();
                adb.changePass(username, newPass);
                request.getSession().setAttribute("account",new Account(username, newPass,acc.getAddress(),acc.getPhone(),acc.getEmail()));
                request.setAttribute("message", "Change Password succesfully!!!");
                RequestDispatcher rd = request.getRequestDispatcher("ChangePass.jsp");
                rd.forward(request, response);
            }
        }
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePass</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePass at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
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

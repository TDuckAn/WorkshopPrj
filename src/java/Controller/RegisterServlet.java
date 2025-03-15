/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DAOAccount;
import Model.DTOAccount;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class RegisterServlet extends HttpServlet {

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
        String account = request.getParameter("account");
        String pass = request.getParameter("pass");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        Date birthday = Date.valueOf(request.getParameter("birthday"));
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String phone = request.getParameter("phone");

        int roleInSystem = 3;   
        boolean isUse = true; 

        DTOAccount newUser = new DTOAccount(account, pass, lastName, firstName, birthday, gender, phone, isUse, roleInSystem);

        try {
            DAOAccount dao = new DAOAccount();
            if (dao.getObjeCtById(account) == null) {
                boolean inserted = dao.insertRec(newUser);
                if (inserted) {
                    response.sendRedirect("login.jsp?success=registered");
                } else {
                    request.setAttribute("error", "Registration failed. Please try again.");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Username already exists.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            request.setAttribute("error", "An error occurred. Please try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
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

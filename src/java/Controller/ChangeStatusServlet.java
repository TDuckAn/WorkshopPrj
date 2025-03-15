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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ChangeStatusServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final Logger LOGGER = Logger.getLogger(ChangeStatusServlet.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String account = request.getParameter("account");
        String isUseParam = request.getParameter("isUse");

        if (account == null || account.trim().isEmpty() || isUseParam == null) {
            response.sendRedirect("AccountServlet?error=missing-parameters");
            return;
        }

        boolean isUse = Boolean.parseBoolean(isUseParam); 

        try {
            DAOAccount dao = new DAOAccount();
            DTOAccount user = dao.getObjeCtById(account);

            if (user == null) {
                LOGGER.warning("User not found: " + account);
                response.sendRedirect("AccountServlet?error=user-not-found");
                return;
            }

            DTOAccount loggedInUser = (DTOAccount) session.getAttribute("loggedInUser");
            if (loggedInUser.getAccount().equals(account) && !isUse) {
                response.sendRedirect("AccountServlet?error=self-deactivate");
                return;
            }

            boolean updated = dao.updateIsUsed(account, isUse);

            if (updated) {
                LOGGER.info("Successfully updated user " + account + " to status: " + isUse);
                response.sendRedirect("AccountServlet?statusChange=success");
            } else {
                LOGGER.warning("Failed to update user " + account);
                response.sendRedirect("AccountServlet?statusChange=failure");
            }

        } catch (SQLException | ClassNotFoundException ex) {
            LOGGER.log(Level.SEVERE, "Database error while updating user status", ex);
            response.sendRedirect("error.jsp?message=Database error");
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

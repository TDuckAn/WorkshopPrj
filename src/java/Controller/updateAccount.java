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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class updateAccount extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final Logger LOGGER = Logger.getLogger(updateAccount.class.getName());

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
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            LOGGER.warning("Session expired or user not logged in. Redirecting to login.");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String account = request.getParameter("account");
            DAOAccount dao = new DAOAccount();
            DTOAccount acc = dao.getObjeCtById(account);

            if (acc != null) {
                request.setAttribute("account", acc);
                request.getRequestDispatcher("/private/updateAccount.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath()+"accountList.jsp?error=notfound");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving account data", ex);
            response.sendRedirect(request.getContextPath()+"accountList.jsp?error=server");
        }
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
        try {
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("loggedInUser") == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            request.setCharacterEncoding("UTF-8");
            DAOAccount dao = new DAOAccount();

            String account = request.getParameter("account");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String password = request.getParameter("pass");
            Date birthday = Date.valueOf(request.getParameter("birthday"));
            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
            String phone = request.getParameter("phone");
            int role = Integer.parseInt(request.getParameter("role"));
            boolean isUse = Boolean.parseBoolean(request.getParameter("isUse"));

            DTOAccount acc = new DTOAccount(account, password, lastName, firstName, birthday, gender, phone, isUse, role);
            boolean success = dao.updateRec(acc);

            if (success) {
                DTOAccount loggedInUser = (DTOAccount) session.getAttribute("loggedInUser");

                if (loggedInUser != null && loggedInUser.getAccount().equals(account)) {
                    DTOAccount refreshedUser = dao.getObjeCtById(account);
                    session.setAttribute("loggedInUser", refreshedUser);
                }

                response.sendRedirect("AccountServlet");
            } else {
                request.setAttribute("errorMessage", "Update failed.");
                request.setAttribute("account", acc);
                RequestDispatcher dispatcher = request.getRequestDispatcher("updateAccount.jsp");
                dispatcher.forward(request, response);
            }
        } catch (IllegalArgumentException ex) {
            request.setAttribute("errorMessage", "Error processing request.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("updateAccount.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(updateAccount.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(updateAccount.class.getName()).log(Level.SEVERE, null, ex);
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

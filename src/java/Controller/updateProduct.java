/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DAOProduct;
import Model.DTOAccount;
import Model.DTOCategory;
import Model.DTOProduct;
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
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author Admin
 */
public class updateProduct extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException {

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

        String productId = request.getParameter("productId");

        try {
            DAOProduct dao = new DAOProduct();
            DTOProduct product = dao.getObjeCtById(productId);

            if (product == null) {
                System.out.println("Product not found in database for ID: " + productId);
                response.sendRedirect("ProductServlet?error=ProductNotFound");
                return;
            }

            request.setAttribute("product", product);
            request.getRequestDispatcher("/private/productUpdate.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(updateProduct.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("ProductServlet?error=Exception");
        }
    }

    /**
     * Handles POST request - Updates product in the database.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {

            String productId = request.getParameter("productId");
            String productName = request.getParameter("productName");
            String productImage = request.getParameter("productImage");
            String brief = request.getParameter("brief");
            Date postedDate = Date.valueOf(request.getParameter("postedDate"));
            int typeId = Integer.parseInt(request.getParameter("typeId"));
            String accountId = request.getParameter("accountId");
            String unit = request.getParameter("unit");
            int price = Integer.parseInt(request.getParameter("price"));
            int discount = Integer.parseInt(request.getParameter("discount"));

            DTOCategory category = new DTOCategory();
            category.setTypeId(typeId);

            DTOAccount account = new DTOAccount();
            account.setAccount(accountId);

            DTOProduct product = new DTOProduct(productId, productName, productImage, brief, postedDate, category, account, unit, price, discount);

            DAOProduct dao = new DAOProduct();
            boolean success = dao.updateRec(product);

            if (success) {
                response.sendRedirect("ProductServlet?updateStatus=success");
            } else {
                response.sendRedirect(request.getContextPath()+"/private/productUpdate.jsp?updateStatus=failure");
            }
        } catch (SQLException | IllegalArgumentException ex) {
            Logger.getLogger(updateProduct.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(request.getContextPath()+"/private/productUpdate.jsp?error=Exception");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(updateProduct.class.getName()).log(Level.SEVERE, null, ex);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DAOProduct;
import Model.DTOCategory;
import Model.DTOProduct;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
public class searchProduct extends HttpServlet {

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

        String searchQuery = request.getParameter("searchQuery");
        String priceRange = request.getParameter("priceRange");
        String discountFilter = request.getParameter("discountFilter");
        String categoryIdStr = request.getParameter("categoryId");
        String sortOrder = request.getParameter("sortOrder");

 
        Integer categoryId = null;
        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            try {
                categoryId = Integer.parseInt(categoryIdStr);
            } catch (NumberFormatException e) {
                categoryId = null;
            }
        }

        try {
            DAOProduct dao = new DAOProduct();
            List<DTOProduct> productList;
            List<DTOCategory> categoryList = dao.getAllCategories(); 

 
            System.out.println("Categories found: " + categoryList.size());

       
            if (categoryId != null) {
                productList = dao.listByCategory(categoryId);
            } else if (sortOrder != null && !sortOrder.isEmpty()) {
                productList = dao.sortbyPrice(sortOrder);
            } else {
                productList = dao.searchbyName(searchQuery, priceRange, discountFilter);
            }

   
            request.setAttribute("productList", productList);
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("searchQuery", searchQuery);
            request.setAttribute("priceRange", priceRange);
            request.setAttribute("discountFilter", discountFilter);
            request.setAttribute("categoryId", categoryId);
            request.setAttribute("sortOrder", sortOrder);

     
            request.getRequestDispatcher("Explore.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(searchProduct.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("Explore.jsp?error=DatabaseError");
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

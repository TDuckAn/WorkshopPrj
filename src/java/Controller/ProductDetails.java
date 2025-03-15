/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DAOProduct;
import Model.DTOProduct;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
public class ProductDetails extends HttpServlet {

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

        String productId = request.getParameter("productId");
        if (productId == null || productId.trim().isEmpty()) {
            response.sendRedirect("Explore.jsp?error=InvalidProduct");
            return;
        }

        try {
            DAOProduct dao = new DAOProduct();
            DTOProduct product = dao.getObjeCtById(productId);

            if (product == null) {
                response.sendRedirect("Explore.jsp?error=ProductNotFound");
                return;
            }

            request.setAttribute("product", product);

            HttpSession session = request.getSession();
            Object obj = session.getAttribute("viewedProducts");

            List<DTOProduct> viewedProducts;
            if (obj instanceof List<?>) {
                viewedProducts = new ArrayList<>();
                for (Object item : (List<?>) obj) {
                    if (item instanceof DTOProduct) {
                        viewedProducts.add((DTOProduct) item);
                    }
                }
            } else {
                viewedProducts = new ArrayList<>();
            }

            boolean alreadyViewed = viewedProducts.stream()
                    .anyMatch(p -> p.getProductId().equals(product.getProductId()));

            if (!alreadyViewed) {
                viewedProducts.add(product);
            }

            session.setAttribute("viewedProducts", viewedProducts);

            request.getRequestDispatcher("productDetail.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ProductDetails.class.getName()).log(Level.SEVERE, "Database error", ex);
            response.sendRedirect("Explore.jsp?error=DatabaseError");
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

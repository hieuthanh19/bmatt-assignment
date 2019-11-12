package Servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import perfumestore.Product_Image_Model;
import perfumestore.Product_Model;

/**
 *
 * @author ThanhKH
 */
public class HandleCreate extends HttpServlet {

    private String upload_dir = "/img";
    //private final String UPLOAD_ABSOLUTE_DIR = getServletContext().getRealPath(upload_dir);
    private final String UPLOAD_ABSOLUTE_DIR = "C:\\Users\\Laptop\\OneDrive\\STUDY\\2019 FALL\\PRJ321\\bmatt-assignment\\web\\img\\product\\single-product";

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet handleCreate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet handleCreate at " + request.getContextPath() + "</h1>");
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

        try {
            Product_Model productM = new Product_Model();
            Product_Image_Model proImgM = new Product_Image_Model();

            String productName = "";
            int volume = 0;
            double productBasePrice = 0.0;
            double productSellPrice = 0.0;
            int categoryId = 0;
            int brandId = 0;
            String description = "";
            int status = -1;
            String imageName = "";
            List<FileItem> multiparts = null;

            //variables for debug
            int afterStep = 0;
            int beforeStep = 0;
            int i = 0;
            int notFormField = 0;
            int formField = 0;
            //process only if its multipart content
            if (ServletFileUpload.isMultipartContent(request)) {

                try {
                    multiparts = new ServletFileUpload(
                            new DiskFileItemFactory()).parseRequest(request);
                } catch (FileUploadException ex) {
                    Logger.getLogger(HandleCreate.class.getName()).log(Level.SEVERE, null, ex);
                }

                for (FileItem item : multiparts) {

                    //if item is file
                    if (!item.isFormField()) {
                        imageName = new File(item.getName()).getName();
                        try {
                            //notFormField++;
                            item.write(new File(UPLOAD_ABSOLUTE_DIR + File.separator + brandId + File.separator + imageName));
                            request.setAttribute("productImage", imageName);
                        } catch (Exception ex) {
                            Logger.getLogger(HandleCreate.class.getName()).log(Level.SEVERE, null, ex);
                        }

                    } //normal field
                    else {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString();
                        if (fieldName.equals("productBrand")){
                            brandId = Integer.parseInt(fieldValue);
                        }
                        request.setAttribute(fieldName, fieldValue);
                    }
                }
            }
            // formField++;

//                            switch (fieldName) {
//                                case "productBrand":
//                                    // beforeStep = 1;
//                                    brandId = Integer.parseInt(fieldValue);
//                                    // afterStep = 1;
//                                    break;
//                                case "productName":
//                                    // beforeStep = 1;
//                                    productName = fieldValue;
//                                    // afterStep = 1;
//                                    break;
//                                case "productVolume":
//                                    // beforeStep = 1;
//                                    volume = Integer.parseInt(fieldValue);
//                                    // afterStep = 1;
//                                    break;
//                                case "productBasePrice":
//                                    // beforeStep = 2;
//                                    productBasePrice = Double.parseDouble(fieldValue);
//                                    // afterStep = 2;
//                                    break;
//                                case "productSellPrice":
//                                    // beforeStep = 3;
//                                    productSellPrice = Long.parseLong(fieldValue);
//                                    // afterStep = 3;
//                                    break;
//                                case "productCategory":
//                                    // beforeStep = 1;
//                                    categoryId = Integer.parseInt(fieldValue);
//                                    // afterStep = 1;
//                                    break;
//
//                                case "productDescription":
//                                    // beforeStep = 4;
//                                    description = fieldValue;
//                                    // afterStep = 4;
//                                    break;
//                                case "productStatus":
//                                    //beforeStep = 4;
//                                    status = Integer.parseInt(fieldValue);
//                                    // afterStep = 5;
//                                    break;
//                            }
//                    //insert new product
//                    int productId = productM.insertProduct(productName, volume, categoryId, brandId, productBasePrice, productSellPrice, description, status);
//                    if (productId != -1) {
//                        proImgM.insertProductImg(productId, imageName, 1);
//                    }
//                    //NOTE: search and sort column always empty
//                    //pageNumber = (int) Math.ceil(spM.getNumberOfProduct("", "") / (float) SoDong_Trang);
//
//                    //File uploaded successfully
//                    request.setAttribute("message", "File Uploaded Successfully");
//                } catch (Exception ex) {
//                    request.setAttribute("message", "File Upload Failed due to " + ex);
//                }
//
//            } else {
//                request.setAttribute("message",
//                        "Sorry this Servlet only handles file upload request");
//            }
//            response.setContentType("text/html;charset=UTF-8");
//            try (PrintWriter out = response.getWriter()) {
//                // TODO output your page here. You may use following sample code. 
//                out.println("<!DOCTYPE html>");
//                out.println("<html>");
//                out.println("<head>");
//                out.println("<title>Servlet ProductCreateHandle</title>");
//                out.println("</head>");
//                out.println("<body>");
//                for (FileItem item : multiparts) {
//                    if (!item.getFieldName().equals("picture-upload")) {
//                        out.println("<h3>Field Name: " + item.getFieldName() + "</h3>");
//                        out.println("<h4>Field Value: " + item.getString() + "</h4>");
//
//                    }
//                }
//                out.println("<h3>  ---------  </h3>");
//                out.println("<h3>Product Name: " + productName + "</h3>");
//                out.println("<h3>Product Name: " + basePrice + "</h3>");
//                out.println("<h3>Product Name: " + sellPrice + "</h3>");
//                out.println("<h3>Product Name: " + description + "</h3>");
//                out.println("<h3>Product Name: " + status + "</h3>");
//                out.println("<h3>Product Name: " + type + "</h3>");
//                //  out.println("<h3>Product Name: " + search + "</h3>");
//                out.println("<h3>Step: " + afterStep + "</h3>");
//                out.println("<h3>Step: " + beforeStep + "</h3>");
//                out.println("<h3>Loop count: " + i + "</h3>");
//                out.println("<h3>Not Form: " + notFormField + "</h3>");
//                out.println("<h3>Form: " + formField + "</h3>");
//                out.println("</body>");
//                out.println("</html>");
//            }
            request.getRequestDispatcher("/admin/create-save.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(HandleCreate.class.getName()).log(Level.SEVERE, null, ex);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

/**
 *
 * @author Nhat Thanh
 */
public class Product_Image {
    private int img_id;
    private int product_id;
    private String url;
    private int product_img_status;
    
    public Product_Image(){}
    
    /**
     * Create new product image
     * @param img_id
     * @param product_id
     * @param url
     * @param product_img_status 
     */
    public Product_Image(int img_id, int product_id, String url, int product_img_status) {
        this.img_id = img_id;
        this.product_id = product_id;
        this.url = url;
        this.product_img_status = product_img_status;
    }

    public int getImg_id() {
        return img_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public String getUrl() {
        return url;
    }

    public int getProduct_img_status() {
        return product_img_status;
    }

    public void setImg_id(int img_id) throws Product_Image_Exception {
        if (img_id <= 0) {
            throw new Product_Image_Exception("Image ID must be greater than 0");
        }
        this.img_id = img_id;
    }

    public void setProduct_id(int product_id) throws Product_Image_Exception {
        if (product_id <= 0) {
            throw new Product_Image_Exception("Product ID must be greater than 0");
        }
        this.product_id = product_id;
    }

    public void setUrl(String url) throws Product_Image_Exception {
        if(this.url.length() > 100){
           throw new Product_Image_Exception("Please enter short category's name");
        }
        this.url = url;
    }

    public void setProduct_img_status(int product_img_status) throws Product_Image_Exception {
        if (this.product_img_status < 0 || product_img_status > 1) {
            throw new Product_Image_Exception("Category status must be either 0 or 1");
        }
        this.product_img_status = product_img_status;
    }
      
}

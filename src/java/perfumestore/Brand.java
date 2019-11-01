/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

/**
 *
 * @author nguyen tuan bang
 */
public class Brand {
    //attribute
    private int brand_id;
    private String brand_name;
    private int country_code;
    private String created_at;
    private int brand_status;

    public Brand() {
        
    }
    
    /**
     * 
     * @param brand_id
     * @param brand_name
     * @param country_code
     * @param created_at
     * @param brand_status 
     */
    public Brand(int brand_id, String brand_name, int country_code, String created_at, int brand_status) {
        this.brand_id = brand_id;
        this.brand_name = brand_name;
        this.country_code = country_code;
        this.created_at = created_at;
        this.brand_status = brand_status;
    }

    /**
     * 
     * @return 
     */
    public int getBrand_id() {
        return brand_id;
    }
    
    /**
     * check id brand
     * 
     * @param brand_id  
     * @throws Perfume.BrandException  
     */
    public void setBrand_id(int brand_id) throws BrandException {
        if (brand_id <= 0) {
            throw new BrandException("Brand ID must be greater than 0");
        }
        this.brand_id = brand_id;
    }

    /**
     * 
     * @return 
     */
    public String getBrand_name() {
        return brand_name;
    }
    
    /**
     * check name brank
     * 
     * @param brand_name 
     * @throws Perfume.BrandException 
     */
    public void setBrand_name(String brand_name) throws BrandException {
        if (brand_name.isEmpty()) {
            throw new BrandException("Name brand is not null");
        }
        this.brand_name = brand_name;
    }

    /**
     * 
     * @return 
     */
    public int getCountry_code() {
        return country_code;
    }

    /**
     * check country code
     * 
     * @param country_code
     * @throws BrandException 
     */
    public void setCountry_code(int country_code) throws BrandException {
        if (country_code <= 0) {
            throw new BrandException("Country code must be greater than 0");
        }
        this.country_code = country_code;
    }

    public String getCreated_at() {
        return created_at;
    }

    public int getBrand_status() {
        return brand_status;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public void setBrand_status(int brand_status) throws CountriesException {
        if (brand_status != 0 || brand_status != 1) {
            throw new CountriesException("Brand status must be 0 - disable or 1 - Active");
        }
        this.brand_status = brand_status;
    }
    
    
}

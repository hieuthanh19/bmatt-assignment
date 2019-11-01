/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

/**
 *
 * @author DELL
 */
public class Countries {
    //attribute
    private int country_code;
    private String name;
    private int country_status;

    public Countries() {
        
    }

    /**
     * 
     * @param country_code
     * @param name
     * @param country_status 
     */
    public Countries(int country_code, String name, int country_status) {
        this.country_code = country_code;
        this.name = name;
        this.country_status = country_status;
    }

    /**
     * getCountry_code
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
     * @throws Perfume.CountriesException 
     */
    public void setCountry_code(int country_code) throws CountriesException {
        if (country_code <= 0) {
            throw new CountriesException("Country code must be greather than 0");
        }
        this.country_code = country_code;
    }

    /**
     * getName
     * 
     * @return 
     */
    public String getName() {
        return name;
    }

    /**
     * check name
     * 
     * @param name 
     * @throws Perfume.CountriesException 
     */
    public void setName(String name) throws CountriesException {
        if (name.isEmpty()) {
            throw new CountriesException("Name country is not null");
        }
        this.name = name;
    }

    /**
     * getCountry_status
     * 
     * @return 
     */
    public int getCountry_status() {
        return country_status;
    }

    /**
     * check country status
     * 
     * @param country_status 
     * @throws Perfume.CountriesException 
     */
    public void setCountry_status(int country_status) throws CountriesException {
        if (country_status != 0 || country_status != 1) {
            throw new CountriesException("Country status must be 0 - disable or 1 - Active");
        }
        this.country_status = country_status;
    }
    
    
}

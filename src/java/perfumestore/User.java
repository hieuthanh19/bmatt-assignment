/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

import java.util.Date;

/**
 *
 * @author ThanhKH
 */
public class User {

    int user_id;
    String full_name;
    String address;
    String phone;
    String email;
    String profile_picture;
    int account_id;
    String createdTime;
    int user_status;

    /**
     * Create new user
     *
     * @param user_id
     * @param full_name
     * @param address
     * @param phone
     * @param email
     * @param profile_picture
     * @param account_id
     * @param createdTime
     * @param user_status
     */
    public User(int user_id, String full_name, String address, String phone, String email, String profile_picture, int account_id, String createdTime, int user_status) {
        this.user_id = user_id;
        this.full_name = full_name;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.profile_picture = profile_picture;
        this.account_id = account_id;
        this.createdTime = createdTime;
        this.user_status = user_status;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) throws UserException {
        if (user_id < 0) {
            throw new UserException("User ID must be greater than 0");
        }
        this.user_id = user_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) throws UserException {
        if (full_name.isEmpty()) {
            throw new UserException("User name can't be empty");
        }
        if (full_name.length() > 150) {
            throw new UserException("Full name length can't be greater than 150 chacracters");
        }
        this.full_name = full_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) throws UserException {
        if (address.isEmpty()) {
            throw new UserException("Address can't be empty");
        }
        if (address.length() > 300) {
            throw new UserException("Address length can't be greater than 300 chacracters");
        }
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) throws UserException {
        if (phone.isEmpty()) {
            throw new UserException("Phone can't be empty");
        }
        if (phone.length() > 20) {
            throw new UserException("Phone length can't be greater than 20 chacracters");
        }
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) throws UserException {
        if (email.isEmpty()) {
            throw new UserException("Email can't be empty");
        }
        if (email.length() > 100) {
            throw new UserException("Email length can't be greater than 100 chacracters");
        }
        this.email = email;
    }

    public String getProfile_picture() {
        return profile_picture;
    }

    public void setProfile_picture(String profile_picture) throws UserException {
        if (profile_picture.isEmpty()) {
            throw new UserException("Profile picture path can't be empty");
        }
        if (profile_picture.length() > 200) {
            throw new UserException("Profile picture path length can't be greater than 200 chacracters");
        }
        this.profile_picture = profile_picture;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) throws UserException {
        if (account_id < 0) {
            throw new UserException("Account ID must be greater than 0");
        }
        this.account_id = account_id;
    }

    public String getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }

    public int getUser_status() {

        return user_status;
    }

    public void setUser_status(int user_status) throws UserException {
        if (user_status < 0 || user_status > 1) {
            throw new UserException("User status must be either 0 or 1");
        }
        this.user_status = user_status;
    }

}

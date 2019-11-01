/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perfumestore;

/**
 *
 * @author ThanhKH
 */
public class Account {

    int account_id;
    String username;
    String password;
    int account_status;
    int role_id;

    /**
     * Create new Account
     *
     * @param account_id
     * @param username
     * @param password
     * @param account_status
     * @param role_id
     */
    public Account(int account_id, String username, String password, int account_status, int role_id) {
        this.account_id = account_id;
        this.username = username;
        this.password = password;
        this.account_status = account_status;
        this.role_id = role_id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) throws AccountException {
        if (account_id <= 0) {
            throw new AccountException("Account ID must be greater than 0");
        }
        this.account_id = account_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) throws AccountException {
        if (username.length() > 100) {
            throw new AccountException("Username can't be greater than 100 characters");
        }
        if (username.isEmpty()){
            throw new AccountException("Username can't be empty");
        }
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) throws AccountException {
        if (password.isEmpty()) {
            throw new AccountException("Password can't be empty");
        }
        this.password = password;
    }

    public int getAccount_status() {
        return account_status;
    }

    public void setAccount_status(int account_status) throws AccountException {
        if (account_status < 0 || account_status > 1) {
            throw new AccountException("Account status must be either 0 or 1");
        }
        this.account_status = account_status;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) throws AccountException {
        if (role_id < 1 || role_id > 4) {
            throw new AccountException("Role ID must be from 1 to 4");
        }
        this.role_id = role_id;
    }

}

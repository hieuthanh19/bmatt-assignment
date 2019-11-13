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
public class UserRole {

    //attribute
    int role_id;
    String role_name;
    int user_role_status;

    public UserRole() {

    }

    /**
     *
     * @param role_id
     * @param role_name
     * @param user_role_status
     */
    public UserRole(int role_id, String role_name, int user_role_status) {
        this.role_id = role_id;
        this.role_name = role_name;
        this.user_role_status = user_role_status;
    }

    
       

    /**
     * 
     * @return 
     */
    public int getRole_id() {
        return this.role_id;
    }

    /**
     * check id role
     *
     * @param role_id
     * @throws UserRoleException
     */
    public void setRole_id(int role_id) throws UserRoleException {
        if (role_id <= 0) {
            throw new UserRoleException("Role ID greater than 0");
        }
        this.role_id = role_id;
    }

    /**
     * 
     * @return
     */
    public String getRole_name() {
        return role_name;
    }

    /**
     * check name role
     *
     * @param role_name
     * @throws UserRoleException
     */
    public void setRole_name(String role_name) throws UserRoleException {
        if (role_name.isEmpty()) {
            throw new UserRoleException("Username is not null");
        }
        this.role_name = role_name;
    }

    /**
     * 
     * @return 
     */
    public int getUser_role_status() {
        return user_role_status;
    }
    
    /**
     * check user role status
     * 
     * @param user_role_status
     * @throws UserRoleException 
     */
    public void setUser_role_status(int user_role_status) throws UserRoleException {
        if (user_role_status != 0 || user_role_status != 1) {
            throw new UserRoleException("User role status must be 0 - disable or 1 - Active");
        }
        this.user_role_status = user_role_status;
    }
}

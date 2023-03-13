/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class User {
    private String id;
    private String account;
    private String password;

    public User() {
    }

    public User(String id, String account, String password) {
        this.id = id;
        this.account = account;
        this.password = password;
    }

    public User(String account, String password) {
        this.account = account;
        this.password = password;
    }
    
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", account=" + account + ", password=" + password + '}';
    }
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext{
    public User getUser(String account, String password) {
        String sql = "select * from [User] where account = ? and password = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, account);
            pstm.setString(2, password);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                return new User(account, password);
            }
        } catch (Exception e) {
            System.out.println("getListUser: "+e.getMessage());
        }
        return null;
    }
    
    public static void main(String[] args) {
        UserDAO u = new UserDAO();
        User mu = u.getUser("admin", "123");
        System.out.println(mu);
    }
}

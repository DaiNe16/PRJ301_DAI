/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class SubjectDAO extends DBContext{
    public ArrayList<Subject> getAllSubject() {
        ArrayList<Subject> list = new ArrayList<>();
        String sql = "select * from Subject";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                int numOfCredits = rs.getInt(3);
                list.add(new Subject(id, name, numOfCredits));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        SubjectDAO s = new SubjectDAO();
        ArrayList<Subject> list = s.getAllSubject();
        for (Subject subject : list) {
            System.out.println(subject);
        }
    }
}

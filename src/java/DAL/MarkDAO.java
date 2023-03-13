/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Mark;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class MarkDAO extends DBContext{
    public ArrayList<Mark> getAllMarkBySubID(String subID){
        ArrayList<Mark> list = new ArrayList<>();
        String sql = "select m.* from Mark m join Test t on m.testID = t.id\n" +
                    "join Subject s on t.subID = s.id where s.id = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, subID);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                list.add(new Mark(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public static void main(String[] args) {
        MarkDAO m = new MarkDAO();
        ArrayList<Mark> list = m.getAllMarkBySubID("MAE101");
        for (Mark mark : list) {
            System.out.println(mark);
        }
    }
}

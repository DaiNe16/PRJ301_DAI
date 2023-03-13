/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.QuestionOfTheTest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class QuestionOfTheTestDAO extends DBContext{
    public ArrayList<QuestionOfTheTest> getAllQuestionOfTheTestByQuesID(String subID, String quesID){
        ArrayList<QuestionOfTheTest> list = new ArrayList<>();
        String sql = "select * from QuestionOfTheTest q join Test t on q.testID = t.id\n" +
                        "where subID = ? and questionID = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, subID);
            pstm.setString(2, quesID);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()) {
                list.add(new QuestionOfTheTest(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public ArrayList<QuestionOfTheTest> getAllQuestionOfTheTestBySubID(String subID){
        ArrayList<QuestionOfTheTest> list = new ArrayList<>();
        String sql = "select * from QuestionOfTheTest q join Test t on q.testID = t.id\n" +
                    "join Subject s on t.subID = s.id join Student st on t.stuID = st.id join Mark m on t.id = m.testID \n" +
                    "where s.id = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, subID);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()) {
                list.add(new QuestionOfTheTest(rs.getString(1), 
                                                rs.getString(2), 
                                                rs.getString(3), 
                                                rs.getString(4), 
                                                rs.getString(5), 
                                                rs.getString(6), 
                                                rs.getString(7), 
                                                rs.getString(8), 
                                                rs.getString(10), 
                                                rs.getString(12), 
                                                rs.getString(21), 
                                                rs.getString(13), 
                                                rs.getString(18)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public static void main(String[] args) {
        QuestionOfTheTestDAO q = new QuestionOfTheTestDAO();
        ArrayList<QuestionOfTheTest> list = q.getAllQuestionOfTheTestBySubID("OSG202");
        for (QuestionOfTheTest questionOfTheTest : list) {
            System.out.println(questionOfTheTest);
        }
    }
}

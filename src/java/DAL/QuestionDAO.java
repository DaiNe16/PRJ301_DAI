/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Question;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class QuestionDAO extends DBContext{
    public ArrayList<Question> getAllQuestionBySubjectID(String sid) {
        ArrayList<Question> list = new ArrayList<>();
        String sql = "select * from Question where subjectID = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, sid);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()) {
                String id = rs.getString(1);
                String content = rs.getString(2);
                list.add(new Question(id, content, sid));
            }
        } catch (Exception e) {
            System.out.println("getAllQuestionBySubjectID: "+e.getMessage());
        }
        return list;
    }
    public ArrayList<Question> getAllQuestionBySubjectIDAndText(String sid, String txt) {
        ArrayList<Question> list = new ArrayList<>();
        String sql = "select * from Question where subjectID = ? and content like ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, sid);
            pstm.setString(2, "%"+txt+"%");
            ResultSet rs = pstm.executeQuery();
            while(rs.next()) {
                String id = rs.getString(1);
                String content = rs.getString(2);
                list.add(new Question(id, content, sid));
            }
        } catch (Exception e) {
            System.out.println("getAllQuestionBySubjectIDAndText: "+e.getMessage());
        }
        return list;
    }
    public static void main(String[] args) {
        QuestionDAO q= new QuestionDAO();
//        ArrayList<Question> data = q.getAllQuestionBySubjectID("MAE101");
//        for (Question question : data) {
//            System.out.println(question);
//        }
//        ArrayList<Question> data = q.getAllQuestionBySubjectIDAndText("MAE101", "Let a");
//        for (Question question : data) {
//            System.out.println(question);
//        }
        Question qt = q.getQuestionByQuesID("1");
        System.out.println(qt);
    }

    public void deleteQuestionByQuesID(String id) {
        String sql = "delete Question where id = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, id);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("deleteQuestionByQuesID: "+e.getMessage());
        }
    }
    public Question getQuestionByQuesID(String qid){
        String sql = "select * from Question where id = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, qid);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                return new Question(qid, rs.getString(2), rs.getString(3));
            }
        } catch (Exception e) {
            System.out.println("getQuestionByQuesID: "+e.getMessage());
        }
        return null;
    }

    public void updateQuestion(String qContent, String qid) {
        String sql = "update Question set content = ? where id = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, qContent);
            pstm.setString(2, qid);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("updateQuestion: "+e.getMessage());
        }
    }

    public ArrayList<Question> getAllQuestion() {
        ArrayList<Question> list = new ArrayList<>();
        String sql = "select * from Question";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()) {
                String id = rs.getString(1);
                String content = rs.getString(2);
                String sid = rs.getString(3);
                list.add(new Question(id, content, sid));
            }
        } catch (Exception e) {
            System.out.println("getAllQuestion: "+e.getMessage());
        }
        return list;
    }

    public void addQuestion(String id, String question, String subject) {
        String sql = "insert into Question values(?, ?, ?)";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, id);
            pstm.setString(2, question);
            pstm.setString(3, subject);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("addQuestion: "+e.getMessage());
        }
    }
    
}

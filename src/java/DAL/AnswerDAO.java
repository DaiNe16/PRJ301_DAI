/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Answer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class AnswerDAO extends DBContext {

    public ArrayList<Answer> getAllAnswerByQuesID(String qid) {
        ArrayList<Answer> list = new ArrayList<>();
        String sql = "select * from Answer where quesID = ? ";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, qid);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String content = rs.getString(2);
                list.add(new Answer(id, content, qid));
            }
        } catch (Exception e) {
            System.out.println("getAllAnswerByQuesID: " + e.getMessage());
        }
        return list;
    }
    public ArrayList<Answer> getAllAnswer() {
        ArrayList<Answer> list = new ArrayList<>();
        String sql = "select * from Answer";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String content = rs.getString(2);
                String qid = rs.getString(3);
                list.add(new Answer(id, content, qid));
            }
        } catch (Exception e) {
            System.out.println("getAllAnswer: " + e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        AnswerDAO a = new AnswerDAO();
//        ArrayList<Answer> list = a.getAllAnswerByQuesID("1");
//        for (Answer answer : list) {
//            System.out.println(answer);
//        }
        a.deleteAnswerByQuesID("1");
    }

    public void deleteAnswerByQuesID(String id) {
        String sql = "delete Answer where quesID = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, id);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("deleteAnswerByQuesID: " + e.getMessage());
        }

    }

    public void updateAnswer(ArrayList<Answer> listA) {
        String sql = "update Answer set content = ? where id = ?";
        for (Answer answer : listA) {
            try {
                PreparedStatement pstm = connection.prepareStatement(sql);
                pstm.setString(1, answer.getContent());
                pstm.setString(2, answer.getId());
                pstm.execute();
            } catch (Exception e) {
                System.out.println("updateAnswer: " + e.getMessage());
            }
        }
    }

    public void addAnswer(String[] answer, int size1) {
        AnswerDAO a = new AnswerDAO();
        ArrayList<Answer> listA= a.getAllAnswer();
        int size = 0;
        for (Answer answer1 : listA) {
            if(size<Integer.parseInt(answer1.getId()))
                size = Integer.parseInt(answer1.getId());
        }
        size++;
        for (int i = 0; i < answer.length; i++) {
            String sql = "insert into Answer values(?, ?, ?)";
            try {
                PreparedStatement pstm = connection.prepareStatement(sql);
                pstm.setString(1, size+"");size++;
                pstm.setString(2, answer[i]);
                pstm.setString(3, size1+"");
                pstm.execute();
            } catch (Exception e) {
                System.out.println("addAnswer: " + e.getMessage());
            }
        }
    }

}

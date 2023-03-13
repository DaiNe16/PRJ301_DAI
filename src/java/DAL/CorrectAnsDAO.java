/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Answer;
import Model.CorrectAns;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class CorrectAnsDAO extends DBContext{
    public ArrayList<CorrectAns> getAllCorrectAnsByQuesID(String qid) {
        ArrayList<CorrectAns> list = new ArrayList<>();
        String sql = "select * from CorrectAns where quesID = ? ";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, qid);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()) {
                String id = rs.getString(1);
                String CorrectAns = rs.getString(2);
                list.add(new CorrectAns(id, CorrectAns, qid));
            }
        } catch (Exception e) {
            System.out.println("getAllCorrectAnsByQuesID: "+e.getMessage());
        }
        return list;
    }
    public ArrayList<CorrectAns> getAllCorrectAns() {
        ArrayList<CorrectAns> list = new ArrayList<>();
        String sql = "select * from CorrectAns";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()) {
                String id = rs.getString(1);
                String CorrectAns = rs.getString(2);
                String qid = rs.getString(3);
                list.add(new CorrectAns(id, CorrectAns, qid));
            }
        } catch (Exception e) {
            System.out.println("getAllCorrectAns: "+e.getMessage());
        }
        return list;
    }
    
    public static void main(String[] args) {
        CorrectAnsDAO c = new CorrectAnsDAO();
        ArrayList<CorrectAns> list = c.getAllCorrectAnsByQuesID("1");
        for (CorrectAns correctAns : list) {
            System.out.println(correctAns);
        }
    }

    public void deleteCorrectAnsByQuesID(String id) {
        String sql = "delete CorrectAns where quesID = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, id);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("deleteCorrectAnsByQuesID: "+e.getMessage());
        }
    }

    public void updateCorrectAns(String correctAns, String qid) {
        String sql = "update CorrectAns set correctAns = ? where quesID = ?";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, correctAns);
            pstm.setString(2, qid);
            pstm.execute();
        } catch (Exception e) {
            System.out.println("updateCorrectAns: "+e.getMessage());
        }
    }

    public void addCorrectAns(String correctAns, int size1) {
        String trueCorrectAns = "1";
        AnswerDAO a = new AnswerDAO();
        ArrayList<Answer> listA = a.getAllAnswerByQuesID(size1+"");
        int index = Integer.parseInt(correctAns);
        trueCorrectAns = listA.get(index-1).getId();
        
        CorrectAnsDAO c = new CorrectAnsDAO();
        ArrayList<CorrectAns> listC = c.getAllCorrectAns();
        int size = listC.size()+1;
        for (CorrectAns correctAns1 : listC) {
            if(size<Integer.parseInt(correctAns1.getId()))
                size = Integer.parseInt(correctAns1.getId());
        }
        size++;
        String sql = "insert into CorrectAns values(?, ?, ?)";
        try {
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, size+"");
            pstm.setString(2, trueCorrectAns);
            pstm.setString(3, size1+"");
            pstm.execute();
        } catch (Exception e) {
            System.out.println("addCorrectAns: "+e.getMessage());
        }
    }
}

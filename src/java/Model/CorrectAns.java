/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class CorrectAns {
    private String id;
    private String correctAns;
    private String quesID;

    public CorrectAns() {
    }

    public CorrectAns(String id, String correctAns, String quesID) {
        this.id = id;
        this.correctAns = correctAns;
        this.quesID = quesID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCorrectAns() {
        return correctAns;
    }

    public void setCorrectAns(String correctAns) {
        this.correctAns = correctAns;
    }

    public String getQuesID() {
        return quesID;
    }

    public void setQuesID(String quesID) {
        this.quesID = quesID;
    }

    @Override
    public String toString() {
        return "CorrectAns{" + "id=" + id + ", correctAns=" + correctAns + ", quesID=" + quesID + '}';
    }
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Question {
    private String id;
    private String content;
    private String subjectID;

    public Question() {
    }

    public Question(String id, String content, String subjectID) {
        this.id = id;
        this.content = content;
        this.subjectID = subjectID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    @Override
    public String toString() {
        return "Question{" + "id=" + id + ", content=" + content + ", subjectID=" + subjectID + '}';
    }
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class ViewExam {
    private ArrayList<ExamAndAnswer> examAndAnswer;
    private String stuID;
    private String stuName;
    private String testCategory;
    private String markValue;

    public ViewExam() {
    }

    public ViewExam(ArrayList<ExamAndAnswer> examAndAnswer, String stuID, String stuName, String testCategory, String markValue) {
        this.examAndAnswer = examAndAnswer;
        this.stuID = stuID;
        this.stuName = stuName;
        this.testCategory = testCategory;
        this.markValue = markValue;
    }

    public ArrayList<ExamAndAnswer> getExamAndAnswer() {
        return examAndAnswer;
    }

    public void setExamAndAnswer(ArrayList<ExamAndAnswer> examAndAnswer) {
        this.examAndAnswer = examAndAnswer;
    }

    public String getStuID() {
        return stuID;
    }

    public void setStuID(String stuID) {
        this.stuID = stuID;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getTestCategory() {
        return testCategory;
    }

    public void setTestCategory(String testCategory) {
        this.testCategory = testCategory;
    }

    public String getMarkValue() {
        return markValue;
    }

    public void setMarkValue(String markValue) {
        this.markValue = markValue;
    }

    @Override
    public String toString() {
        return "ViewExam{" + "examAndAnswer=" + examAndAnswer + ", stuID=" + stuID + ", stuName=" + stuName + ", testCategory=" + testCategory + ", markValue=" + markValue + '}';
    }

    
    
}

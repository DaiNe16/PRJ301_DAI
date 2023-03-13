/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class QuestionOfTheTest {
    private String testID;
    private String questionID;
    private String answerID;
    private String trueOrFalse;
    private String qContent;
    private String aContent;
    private String caContent;
    private String yourAContent;
    private String testCategory;
    private String subjectID;
    private String markValue;
    private String stuID;
    private String name;

    public QuestionOfTheTest() {
    }

    public QuestionOfTheTest(String testID, String questionID, String answerID, String trueOrFalse) {
        this.testID = testID;
        this.questionID = questionID;
        this.answerID = answerID;
        this.trueOrFalse = trueOrFalse;
    }

    public QuestionOfTheTest(String testID, String questionID, String answerID, String trueOrFalse, String qContent, String aContent, String caContent, String yourAContent) {
        this.testID = testID;
        this.questionID = questionID;
        this.answerID = answerID;
        this.trueOrFalse = trueOrFalse;
        this.qContent = qContent;
        this.aContent = aContent;
        this.caContent = caContent;
        this.yourAContent = yourAContent;
    }

    public QuestionOfTheTest(String testID, String questionID, String answerID, String trueOrFalse, String qContent, String aContent, String caContent, String yourAContent, String testCategory, String subjectID, String markValue, String stuID, String name) {
        this.testID = testID;
        this.questionID = questionID;
        this.answerID = answerID;
        this.trueOrFalse = trueOrFalse;
        this.qContent = qContent;
        this.aContent = aContent;
        this.caContent = caContent;
        this.yourAContent = yourAContent;
        this.testCategory = testCategory;
        this.subjectID = subjectID;
        this.markValue = markValue;
        this.stuID = stuID;
        this.name = name;
    }


    public String getTestID() {
        return testID;
    }

    public void setTestID(String testID) {
        this.testID = testID;
    }

    public String getQuestionID() {
        return questionID;
    }

    public void setQuestionID(String questionID) {
        this.questionID = questionID;
    }

    public String getAnswerID() {
        return answerID;
    }

    public void setAnswerID(String answerID) {
        this.answerID = answerID;
    }

    public String getTrueOrFalse() {
        return trueOrFalse;
    }

    public void setTrueOrFalse(String trueOrFalse) {
        this.trueOrFalse = trueOrFalse;
    }

    public String getqContent() {
        return qContent;
    }

    public void setqContent(String qContent) {
        this.qContent = qContent;
    }

    public String getaContent() {
        return aContent;
    }

    public void setaContent(String aContent) {
        this.aContent = aContent;
    }

    public String getCaContent() {
        return caContent;
    }

    public void setCaContent(String caContent) {
        this.caContent = caContent;
    }

    public String getYourAContent() {
        return yourAContent;
    }

    public void setYourAContent(String yourAContent) {
        this.yourAContent = yourAContent;
    }

    public String getTestCategory() {
        return testCategory;
    }

    public void setTestCategory(String testCategory) {
        this.testCategory = testCategory;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public String getMarkValue() {
        return markValue;
    }

    public void setMarkValue(String markValue) {
        this.markValue = markValue;
    }

    public String getStuID() {
        return stuID;
    }

    public void setStuID(String stuID) {
        this.stuID = stuID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "QuestionOfTheTest{" + "testID=" + testID + ", questionID=" + questionID + ", answerID=" + answerID + ", trueOrFalse=" + trueOrFalse + ", qContent=" + qContent + ", aContent=" + aContent + ", caContent=" + caContent + ", yourAContent=" + yourAContent + ", testCategory=" + testCategory + ", subjectID=" + subjectID + ", markValue=" + markValue + ", stuID=" + stuID + ", name=" + name + '}';
    }

    
}

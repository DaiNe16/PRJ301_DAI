/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class QuestionStatistic {
    private Question question;
    private int correctRatio;
    private int wrongRatio;

    public QuestionStatistic() {
    }

    public QuestionStatistic(Question question, int correctRatio, int wrongRatio) {
        this.question = question;
        this.correctRatio = correctRatio;
        this.wrongRatio = wrongRatio;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public int getCorrectRatio() {
        return correctRatio;
    }

    public void setCorrectRatio(int correctRatio) {
        this.correctRatio = correctRatio;
    }

    public int getWrongRatio() {
        return wrongRatio;
    }

    public void setWrongRatio(int wrongRatio) {
        this.wrongRatio = wrongRatio;
    }

    @Override
    public String toString() {
        return "QuestionStatistic{" + "question=" + question + ", correctRatio=" + correctRatio + ", wrongRatio=" + wrongRatio + '}';
    }
    
    
}

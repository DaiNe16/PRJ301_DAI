/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class ExamAndAnswer {
    private QuestionOfTheTest questionOfTheTest;
    private String[] answers;

    public ExamAndAnswer() {
    }

    public ExamAndAnswer(QuestionOfTheTest questionOfTheTest, String[] answers) {
        this.questionOfTheTest = questionOfTheTest;
        this.answers = answers;
    }

    public QuestionOfTheTest getQuestionOfTheTest() {
        return questionOfTheTest;
    }

    public void setQuestionOfTheTest(QuestionOfTheTest questionOfTheTest) {
        this.questionOfTheTest = questionOfTheTest;
    }

    public String[] getAnswers() {
        return answers;
    }

    public void setAnswers(String[] answers) {
        this.answers = answers;
    }

    @Override
    public String toString() {
        return "ViewExam{" + "questionOfTheTest=" + questionOfTheTest + ", answers=" + answers + '}';
    }
    
    
}

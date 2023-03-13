/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.AnswerDAO;
import DAL.CorrectAnsDAO;
import DAL.QuestionDAO;
import DAL.SubjectDAO;
import Model.Answer;
import Model.CorrectAns;
import Model.Question;
import Model.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class editServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        String qid = request.getParameter("id");
        String sid = request.getParameter("subject");
        
        QuestionDAO q = new QuestionDAO();
        Question qt = q.getQuestionByQuesID(qid);
        AnswerDAO a = new AnswerDAO();
        ArrayList<Answer> listA = a.getAllAnswerByQuesID(qid);
        CorrectAnsDAO c = new CorrectAnsDAO();
        ArrayList<CorrectAns> listC = c.getAllCorrectAnsByQuesID(qid);
        
        request.setAttribute("subject", sid);
        request.setAttribute("id", qid);
        request.setAttribute("qt", qt);
        request.setAttribute("listA", listA);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        String qid = request.getParameter("id");
        String qContent = request.getParameter("question");
        String[] listContent = request.getParameterValues("answer");
        String correctAns = "";
        int idCorrectAns;
        int correctAnsInt = Integer.parseInt(request.getParameter("correctAns"));
        AnswerDAO a = new AnswerDAO();
        QuestionDAO q = new QuestionDAO();
        ArrayList<Answer> listA = a.getAllAnswerByQuesID(qid);
        int count = 0;
        //set the content after edit
        for (Answer answer : listA) {
            answer.setContent(listContent[count]);
            count++;
        }
        correctAns = listA.get(correctAnsInt-1).getId();
        //Update in DB
        CorrectAnsDAO c = new CorrectAnsDAO();
        c.updateCorrectAns(correctAns, qid);
        a.updateAnswer(listA);
        q.updateQuestion(qContent, qid);
        
        //Back to Manage Question
        String id = request.getParameter("subject");
        SubjectDAO s = new SubjectDAO();
        ArrayList<Subject> data = s.getAllSubject();
        ArrayList<Question> dataQ = q.getAllQuestionBySubjectID(id);
        ArrayList<Answer> dataA = new ArrayList<>();
        ArrayList<CorrectAns> dataC = new ArrayList<>();
        
        for (Question question : dataQ) {
            ArrayList<Answer> l = a.getAllAnswerByQuesID(question.getId());
            for (Answer answer : l) {
                dataA.add(answer);
            }
        }
        for (Question question : dataQ) {
            ArrayList<CorrectAns> l = c.getAllCorrectAnsByQuesID(question.getId());
            for (CorrectAns correctAns1 : l) {
                dataC.add(correctAns1);
            }
        }
        
        request.setAttribute("dataA", dataA);
        request.setAttribute("dataC", dataC);
        request.setAttribute("id", id);
        request.setAttribute("dataQ", dataQ);
        request.setAttribute("data", data);
        request.setAttribute("number", 2);
        request.getRequestDispatcher("center.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

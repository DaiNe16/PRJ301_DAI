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
import java.util.Random;

/**
 *
 * @author Admin
 */
public class renderServlet extends HttpServlet {
   
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
            out.println("<title>Servlet renderServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet renderServlet at " + request.getContextPath () + "</h1>");
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
        
        SubjectDAO s = new SubjectDAO();
        ArrayList<Subject> data = s.getAllSubject();
        
        request.setAttribute("data", data);
        request.setAttribute("number", 3);
        request.getRequestDispatcher("center.jsp").forward(request, response);
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
        int numberOfQuestion = 5;
        String id = request.getParameter("subject");
        SubjectDAO s = new SubjectDAO();
        QuestionDAO q = new QuestionDAO();
        AnswerDAO a = new AnswerDAO();
        CorrectAnsDAO c = new CorrectAnsDAO();
        ArrayList<Subject> data = s.getAllSubject();
        ArrayList<Question> dataQ = q.getAllQuestionBySubjectID(id);
        ArrayList<Question> dataRandomQ = new ArrayList<>();
        
        if(dataQ.size() < numberOfQuestion) numberOfQuestion = dataQ.size();
        //Random question 
        Random ran = new Random();
        int num = 0;
        for (int i=0; i<numberOfQuestion; i++) {
            int numRan = ran.nextInt(dataQ.size());
            dataRandomQ.add(dataQ.get(numRan));
            dataQ.remove(numRan);
        }
        
        ArrayList<Answer> dataA = new ArrayList<>();
        
        for (Question question : dataRandomQ) {
            ArrayList<Answer> l = a.getAllAnswerByQuesID(question.getId());
            for (Answer answer : l) {
                dataA.add(answer);
            }
        }
        
        request.setAttribute("dataA", dataA);
        request.setAttribute("id", id);
        request.setAttribute("dataQ", dataRandomQ);
        request.setAttribute("data", data);
        request.setAttribute("number", 3);
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

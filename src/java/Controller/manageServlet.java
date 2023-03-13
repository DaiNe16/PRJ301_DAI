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
public class manageServlet extends HttpServlet {
   
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
            out.println("<title>Servlet manageServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manageServlet at " + request.getContextPath () + "</h1>");
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
        request.setAttribute("number", 2);
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
        String id = request.getParameter("subject");
        SubjectDAO s = new SubjectDAO();
        QuestionDAO q = new QuestionDAO();
        AnswerDAO a = new AnswerDAO();
        CorrectAnsDAO c = new CorrectAnsDAO();
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
            for (CorrectAns correctAns : l) {
                dataC.add(correctAns);
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

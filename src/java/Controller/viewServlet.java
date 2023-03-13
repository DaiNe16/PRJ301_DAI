/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.QuestionOfTheTestDAO;
import DAL.SubjectDAO;
import Model.QuestionOfTheTest;
import Model.Subject;
import Model.ExamAndAnswer;
import Model.ViewExam;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author Admin
 */
public class viewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet viewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
        request.setAttribute("number", 5);
        request.getRequestDispatcher("center.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        /*
            private String stuID;
            private String stuName;
            private String testCategory;
            private String markValue;
         */
        String page = request.getParameter("page");
        if (page == null) {
            String subID = request.getParameter("subject");
            SubjectDAO s = new SubjectDAO();
            ArrayList<Subject> data = s.getAllSubject();

            QuestionOfTheTestDAO q = new QuestionOfTheTestDAO();
            ArrayList<ViewExam> listListQOTT = new ArrayList<>();
            ViewExam viewExam;
            ArrayList<QuestionOfTheTest> listQOTT = q.getAllQuestionOfTheTestBySubID(subID);
            Set<String> listTestIDNotDup = new HashSet<String>();
            for (QuestionOfTheTest questionOfTheTest : listQOTT) {
                listTestIDNotDup.add(questionOfTheTest.getTestID());
            }
            for (String string : listTestIDNotDup) {
                ArrayList<ExamAndAnswer> listQOTTFake = new ArrayList<>();
                viewExam = new ViewExam();
                for (QuestionOfTheTest questionOfTheTest : listQOTT) {
                    if (questionOfTheTest.getTestID().equals(string)) {
                        String answers[] = questionOfTheTest.getaContent().split("uwu");
                        ExamAndAnswer examAndAnswer = new ExamAndAnswer(questionOfTheTest, answers);
                        listQOTTFake.add(examAndAnswer);
                        viewExam.setStuID(questionOfTheTest.getStuID());
                        viewExam.setStuName(questionOfTheTest.getName());
                        viewExam.setTestCategory(questionOfTheTest.getTestCategory());
                        viewExam.setMarkValue(questionOfTheTest.getMarkValue());
                    }
                }
                viewExam.setExamAndAnswer(listQOTTFake);
                listListQOTT.add(viewExam);
            }
            request.setAttribute("listListQOTT", listListQOTT);
            request.setAttribute("page", 1);
            request.setAttribute("data", data);
            request.setAttribute("id", subID);
            request.setAttribute("number", 5);
            request.getRequestDispatcher("center.jsp").forward(request, response);
        }else{
            
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

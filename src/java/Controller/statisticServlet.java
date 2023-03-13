/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.MarkDAO;
import DAL.QuestionDAO;
import DAL.QuestionOfTheTestDAO;
import DAL.SubjectDAO;
import Model.Mark;
import Model.Question;
import Model.QuestionOfTheTest;
import Model.QuestionStatistic;
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
public class statisticServlet extends HttpServlet {

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
            out.println("<title>Servlet statisticServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet statisticServlet at " + request.getContextPath() + "</h1>");
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
        //When user choose a subject in statistic mode

        SubjectDAO s = new SubjectDAO();
        ArrayList<Subject> data = s.getAllSubject();

        request.setAttribute("data1", data);
        request.setAttribute("data2", data);
        request.setAttribute("number", 4);
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
        String mode = request.getParameter("mode");
        if(mode.equals("1")){
            String subject = request.getParameter("subject");
            SubjectDAO s = new SubjectDAO();
            QuestionDAO q = new QuestionDAO();
            ArrayList<Subject> data = s.getAllSubject();
            ArrayList<Question> dataQ = q.getAllQuestionBySubjectID(subject);
            //Calculate ratio correct or wrong of each question
            ArrayList<QuestionStatistic> dataStatistic = new ArrayList<>();

            for (Question question : dataQ) {
                QuestionOfTheTestDAO qd = new QuestionOfTheTestDAO();
                ArrayList<QuestionOfTheTest> listQOTT = qd.getAllQuestionOfTheTestByQuesID(subject, question.getId());
                int cor=0, wro=0;
                for (QuestionOfTheTest questionOfTheTest : listQOTT) {
                    if(questionOfTheTest.getTrueOrFalse().equals("1")){
                        cor++;
                    }else{
                        wro++;
                    }
                }
                QuestionStatistic qs = new QuestionStatistic(question, cor, wro);
                dataStatistic.add(qs);
            }

            request.setAttribute("dataStatistic", dataStatistic);
            request.setAttribute("id1", subject);
            request.setAttribute("data1", data);
            request.setAttribute("data2", data);
            request.setAttribute("number", 4);
            request.getRequestDispatcher("center.jsp").forward(request, response);
        }else if(mode.equals("2")){
            String subject = request.getParameter("subject1");
            SubjectDAO s = new SubjectDAO();
            ArrayList<Subject> data = s.getAllSubject();
            
            MarkDAO m = new MarkDAO();
            ArrayList<Mark> listM = m.getAllMarkBySubID(subject);
            int mark[] = new int[listM.size()];
            int i=0;
            for (Mark mark1 : listM) {
                mark[i] = Integer.parseInt(mark1.getValue());
                i++;
            }
            int a0=0 ,a1=0, a2=0, a3=0, a4=0, a5=0, a6=0, a7=0, a8=0, a9=0, a10=0;
            for(i=0; i<mark.length; i++){
                if(mark[i]==0) a0++;
                if(mark[i]==1) a1++;
                if(mark[i]==2) a2++;
                if(mark[i]==3) a3++;
                if(mark[i]==4) a4++;
                if(mark[i]==5) a5++;
                if(mark[i]==6) a6++;
                if(mark[i]==7) a7++;
                if(mark[i]==8) a8++;
                if(mark[i]==9) a9++;
                if(mark[i]==10) a10++;
            }
            request.setAttribute("a0", a0);
            request.setAttribute("a1", a1);
            request.setAttribute("a2", a2);
            request.setAttribute("a3", a3);
            request.setAttribute("a4", a4);
            request.setAttribute("a5", a5);
            request.setAttribute("a6", a6);
            request.setAttribute("a7", a7);
            request.setAttribute("a8", a8);
            request.setAttribute("a9", a9);
            request.setAttribute("a10", a10);
            request.setAttribute("listM", mark);
            request.setAttribute("id2", subject);
            request.setAttribute("data1", data);
            request.setAttribute("data2", data);
            request.setAttribute("number", 4);
            request.getRequestDispatcher("center.jsp").forward(request, response);
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

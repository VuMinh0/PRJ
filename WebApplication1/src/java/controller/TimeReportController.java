/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.EmpDBContext;
import dal.TimeSheetDBContext;
import helper.DateTimeHelper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Emp;
import model.Salary;
import model.Timesheet;

/**
 *
 * @author dttnb
 */
public class TimeReportController extends HttpServlet {

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
        try {
            Date today = new Date();
            today = DateTimeHelper.removeTime(today);
            int dayOfMonth = DateTimeHelper.getDayOfMonth(today);
            Date begin = DateTimeHelper.addDays(today, -1 * (dayOfMonth - 1));
            Date end = DateTimeHelper.addDays(DateTimeHelper.addMonths(begin, 1), -1);
            ArrayList<Date> dates = DateTimeHelper.getDates(begin, end);
            
            request.setAttribute("dates", dates);
            request.setAttribute("dates", dates);
            
            EmpDBContext db2 = new EmpDBContext();
            ArrayList<Emp> employees = db2.getAllEmp();
//        HttpSession session = request.getSession();
//        session.setAttribute("emp", employees);
request.setAttribute("emp", employees);

TimeSheetDBContext db = new TimeSheetDBContext();
List<Timesheet> timesheets = db.getTimeSheet(8);
HttpSession session = request.getSession();
session.setAttribute("time", timesheets);

List<Timesheet> timesheets2 = db.getTotalWorkingById(1);
request.setAttribute("time2", timesheets2);
List<Timesheet> timesheets3 = db.getTotalWorkingById(2);
request.setAttribute("time3", timesheets3);
List<Timesheet> timesheets4 = db.getTotalWorkingById(3);
request.setAttribute("time4", timesheets4);
List<Timesheet> timesheets5 = db.getTotalWorkingById(4);
request.setAttribute("time5", timesheets5);
List<Timesheet> timesheets6 = db.getTotalWorkingById(5);
request.setAttribute("time6", timesheets6);
List<Timesheet> timesheets7 = db.getTotalWorkingById(6);
request.setAttribute("time7", timesheets7);
List<Timesheet> timesheets8 = db.getTotalWorkingById(7);
request.setAttribute("time8", timesheets8);
List<Timesheet> timesheets9 = db.getTotalWorkingById(8);
request.setAttribute("time9", timesheets9);
List<Timesheet> timesheets10 = db.getTotalWorkingById(9);
request.setAttribute("time10", timesheets10);
List<Timesheet> timesheets11 = db.getTotalWorkingById(10);
request.setAttribute("time11", timesheets11);
List<Timesheet> timesheets12 = db.getTotalWorkingById(11);
request.setAttribute("time12", timesheets12);
List<Timesheet> timesheets13 = db.getTotalWorkingById(12);
request.setAttribute("time13", timesheets13);
List<Timesheet> timesheets14 = db.getTotalWorkingById(13);
request.setAttribute("time14", timesheets14);
List<Timesheet> timesheets15 = db.getTotalWorkingById(14);
request.setAttribute("time15", timesheets15);

List<Timesheet> timesheets16 = db.getTotalWorkingById2(1);
request.setAttribute("time16", timesheets16);
List<Timesheet> timesheets17 = db.getTotalWorkingById2(2);
request.setAttribute("time17", timesheets17);
List<Timesheet> timesheets18 = db.getTotalWorkingById2(3);
request.setAttribute("time18", timesheets18);
List<Timesheet> timesheets19 = db.getTotalWorkingById2(4);
request.setAttribute("time19", timesheets19);
List<Timesheet> timesheets20 = db.getTotalWorkingById2(5);
request.setAttribute("time20", timesheets20);
List<Timesheet> timesheets21 = db.getTotalWorkingById2(6);
request.setAttribute("time21", timesheets21);
List<Timesheet> timesheets22 = db.getTotalWorkingById2(7);
request.setAttribute("time22", timesheets22);
List<Timesheet> timesheets23 = db.getTotalWorkingById2(8);
request.setAttribute("time23", timesheets23);
List<Timesheet> timesheets24 = db.getTotalWorkingById2(9);
request.setAttribute("time24", timesheets24);
List<Timesheet> timesheets25 = db.getTotalWorkingById2(10);
request.setAttribute("time25", timesheets25);
List<Timesheet> timesheets26 = db.getTotalWorkingById2(11);
request.setAttribute("time26", timesheets26);
List<Timesheet> timesheets27 = db.getTotalWorkingById2(12);
request.setAttribute("time27", timesheets27);
List<Timesheet> timesheets28 = db.getTotalWorkingById2(13);
request.setAttribute("time28", timesheets28);
List<Timesheet> timesheets29 = db.getTotalWorkingById2(14);
request.setAttribute("time29", timesheets29);

List<Salary> salary1 = db.getAllSalary(1);
request.setAttribute("salary1", salary1);
List<Salary> salary2 = db.getAllSalary(2);
request.setAttribute("salary2", salary2);
List<Salary> salary3 = db.getAllSalary(3);
request.setAttribute("salary3", salary3);
List<Salary> salary4 = db.getAllSalary(4);
request.setAttribute("salary4", salary4);
List<Salary> salary5 = db.getAllSalary(5);
request.setAttribute("salary5", salary5);
List<Salary> salary6 = db.getAllSalary(6);
request.setAttribute("salary6", salary6);
List<Salary> salary7 = db.getAllSalary(7);
request.setAttribute("salary7", salary7);
List<Salary> salary8 = db.getAllSalary(8);
request.setAttribute("salary8", salary8);
List<Salary> salary9 = db.getAllSalary(9);
request.setAttribute("salary9", salary9);
List<Salary> salary10 = db.getAllSalary(10);
request.setAttribute("salary10", salary10);
List<Salary> salary11 = db.getAllSalary(11);
request.setAttribute("salary11", salary11);
List<Salary> salary12 = db.getAllSalary(12);
request.setAttribute("salary12", salary12);
List<Salary> salary13 = db.getAllSalary(13);
request.setAttribute("salary13", salary13);
List<Salary> salary14 = db.getAllSalary(14);
request.setAttribute("salary14", salary14);

request.getRequestDispatcher("report2.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(TimeReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

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
        processRequest(request, response);
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

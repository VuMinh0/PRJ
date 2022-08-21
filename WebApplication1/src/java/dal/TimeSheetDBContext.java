/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Emp;
import model.Timesheet;

/**
 *
 * @author dttnb
 */
public class TimeSheetDBContext extends DBContext{
    
    public List<Timesheet> getTimeSheet(int eid, int month){
//        public List<Timesheet> getTimeSheet(Date begin, Date end)
        List<Timesheet> timesheet = new ArrayList<>();
        try {
            String sql = "SELECT e.eid, e.ename, t.date, t.status FROM Emp3 e,  Salary3 s, Timesheet3 t " +
                            "WHERE e.chucvu = s.chucvu AND e.eid = t.eid AND MONTH(t.date) = 8";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                Timesheet t = new Timesheet();
                t.setTid(rs.getInt("eid"));
                t.setDate(rs.getDate("date"));
                t.setStatus(rs.getString("status"));
                timesheet.add(t);
            }
             return timesheet;
        } catch (SQLException ex) {
            Logger.getLogger(TimeSheetDBContext.class.getName()).log(Level.SEVERE, null, ex);

        }
        return null;
    }
    
    public static void main(String[] args) {
            TimeSheetDBContext ts = new TimeSheetDBContext();
         List<Timesheet> timesheet = ts.getTimeSheet(1, 8);
         for (Timesheet timesheet1 : timesheet) {
             System.out.println(timesheet1.getStatus());
        }
         
    }
}



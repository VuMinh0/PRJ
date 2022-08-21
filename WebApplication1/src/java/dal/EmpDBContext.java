/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import helper.DateTimeHelper;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Emp;
import model.Timesheet;

/**
 *
 * @author dttnb
 */
public class EmpDBContext extends DBContext {

    public ArrayList<Emp> getEmp(Date day) throws SQLException {
        ArrayList<Emp> employees = new ArrayList<>();
        try {
            String sql = "select e.eid,name,chucvu, t.date  from Emp e inner join \n"
                    + "Timesheet t on t.eid = e.eid where t.[date] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setTimestamp(1, DateTimeHelper.getTimeStamp(DateTimeHelper.addDays2(day)));
            ResultSet rs = stm.executeQuery();
            Emp curEmp = new Emp();
            curEmp.setEid(-1);
            while (rs.next()) {
                int eid = rs.getInt("eid");
                if (eid != curEmp.getEid()) {
                    curEmp = new Emp();
                    curEmp.setEid(eid);
                    curEmp.setName(rs.getString("name"));
                    curEmp.setChucvu(rs.getString("chucvu"));
                    employees.add(curEmp);
                }

                if (rs.next()) {
                    Timesheet t = new Timesheet();
                    t.setEid(curEmp);
                    t.setDate(DateTimeHelper.getDateFrom(rs.getTimestamp("date")));
                    curEmp.getTimesheets().add(t);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmpDBContext.class.getName()).log(Level.SEVERE, null, ex);

        }
        return employees;
    }
}

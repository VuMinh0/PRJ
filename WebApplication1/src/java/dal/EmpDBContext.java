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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Emp;
import model.Timesheet;

/**
 *
 * @author dttnb
 */
public class EmpDBContext extends DBContext {

    public Emp getEmpById(int eid) throws SQLException {
        try {
            String sql = "SELECT * FROM Emp3 WHERE eid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Emp e = new Emp();
                e.setEid(rs.getInt("eid"));
                e.setName(rs.getString("ename"));
                e.setChucvu(rs.getString("chucvu"));
                return e;

            }
        } catch (SQLException ex) {
            Logger.getLogger(EmpDBContext.class.getName()).log(Level.SEVERE, null, ex);

        }
        return null;
    }

    public ArrayList<Emp> getAllEmp() {
        ArrayList<Emp> emp = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Emp3";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                emp.add(getEmpById(rs.getInt("eid")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmpDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return emp;
    }
    
        public static void main(String[] args) {
            EmpDBContext ts = new EmpDBContext();
         ArrayList<Emp> emp = ts.getAllEmp();
         for (Emp ee : emp) {
             System.out.println(ee.getEid());
        }
        }
}

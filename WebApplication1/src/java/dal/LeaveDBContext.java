/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Leave;

/**
 *
 * @author dttnb
 */
public class LeaveDBContext extends DBContext {

    public Leave getLeaveById(int lid) throws SQLException {
        try {
            String sql = "select * from Leave3 where lid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Leave l = new Leave();
                l.setLid(rs.getInt("lid"));
                l.setEid(rs.getInt("eid"));
                l.setFrom(rs.getDate("from"));
                l.setTo(rs.getDate("to"));
                l.setReason(rs.getString("reason"));
                l.setCheck(rs.getBoolean("check"));
                return l;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Leave> getAllLeave() {
        ArrayList<Leave> lea = new ArrayList<>();
        try {
            String sql = "select * from Leave3";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                lea.add(getLeaveById(rs.getInt("lid")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lea;
    }

    public static void main(String[] args) {
        LeaveDBContext ts = new LeaveDBContext();
        ArrayList<Leave> lea = ts.getAllLeave();
        for (Leave ee : lea) {
            System.out.println(ee.getLid());
        }
    }
}

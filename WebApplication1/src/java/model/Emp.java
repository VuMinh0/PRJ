/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author dttnb
 */
public class Emp {
    private int eid;
    private String name;
    private String chucvu;
    public ArrayList<Timesheet> timesheets = new ArrayList<>();

    public Emp() {
    }

    public Emp(int eid, String name, String chucvu) {
        this.eid = eid;
        this.name = name;
        this.chucvu = chucvu;
    }

    
    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getChucvu() {
        return chucvu;
    }

    public void setChucvu(String chucvu) {
        this.chucvu = chucvu;
    }

//    public ArrayList<Timesheet> getTimesheets() {
//        return timesheets;
//    }
//
//    public void setTimesheets(ArrayList<Timesheet> timesheets) {
//        this.timesheets = timesheets;
//    }
    
    
    
}

--Lấy dữ liệu bẳng Emp3
SELECT * FROM Emp3 WHERE eid = 1
SELECT * FROM Emp3
--Lấy dữ liệu bẳng Leave
select * from Leave3 where lid = 1
select * from Leave3

--Lấy Ngày và status của từng Emp 
SELECT e.eid, e.ename, t.date, t.status FROM Emp3 e,  Salary3 s, Timesheet3 t
                    WHERE e.chucvu = s.chucvu AND e.eid = t.eid AND MONTH(t.date) = '8'

--Lấy Tổng số ngày nhân viên có eid = 1 đi làm
select COUNT(Timesheet3.status) as status
                    from Timesheet3
                    where Timesheet3.status = 'Y' AND Timesheet3.eid = 1

--Lấy Tổng số ngày của từng nhân viên có đi làm
select COUNT(Timesheet3.status) as status
                   from Timesheet3
                   where Timesheet3.status = 'Y' group by Timesheet3.eid

--Lấy Tổng số nửa ngày nhân viên có eid = 1 đi làm
select COUNT(Timesheet3.status) as status
                    from Timesheet3
                    where Timesheet3.status = 'NN' AND Timesheet3.eid = 1
--Nhan vien di lam cac ngay trong thang
select e.eid,name,chucvu, t.date  from Emp e inner join 
Timesheet t on t.eid = e.eid 

--Nhung ngay nhan vien nghi va ly do
select e.eid,[name],chucvu, l.[from],[to], r.reason,[check] from Emp e, Leav l, Reason r  
where e.eid = l.eid and l.rid = r.rid

--Luong 1 ngay cua moi nguoi trong cty theo chuc vu
select * from Emp e, Salary s where
e.chucvu = s.chucvu


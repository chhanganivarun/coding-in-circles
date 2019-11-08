select Fname , Minit , Lname from EMPLOYEE where Salary >(select avg(Salary) from EMPLOYEE);
SELECT DISTINCT S.Fname, S.Minit, S.Lname from EMPLOYEE as E, EMPLOYEE as S where S.Ssn not in (select Essn from DEPENDENT,EMPLOYEE where EMPLOYEE.Ssn = DEPENDENT.Essn group by DEPENDENT.Essn) and E.Super_ssn = S.Ssn;
select E.Fname,E.Minit,E.Lname from EMPLOYEE as E, WORKS_ON as W where E.Ssn = W.Essn and Hours is NOt NULL group by Ssn order by E.Salary/sum(W.Hours) DESC;
select avg(tp), DEPARTMENT.Dname   from (select E.Fname,E.Minit,E.Lname,E.Ssn,E.Salary/sum(W.Hours) as tp,E.Dno from EMPLOYEE as E, WORKS_ON as W where E.Ssn = W.Essn and Hours is NOt NULL group by Ssn) as THROUGHPUT,DEPARTMENT where DEPARTMENT.Dnumber = THROUGHPUT.Dno group by DEPARTMENT.Dnumber order by avg(tp) desc;



SELECT COUNT(*) AS Student_no, AVG(S.CGPA) FROM STUDENT as S,TAKES as T,COURSE as C WHERE C.CName="information technology" AND C.CNO=T.CNO AND T.RollNo=S.RollNumber;
SELECT F.Name , F.FID FROM FACULTY as F WHERE  F.FID NOT IN (SELECT Head FROM RESEARCH_CENTER);
SELECT C.CName FROM COURSE as C WHERE C.CNO NOT IN (SELECT DISTINCT CNO FROM TAKES WHERE Grade='A');
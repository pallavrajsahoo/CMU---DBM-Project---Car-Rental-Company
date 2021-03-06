#Query 1
Column "Date Checked" format A25
Column "Start Date" format A25
Column "Return Date" format A25
SELECT r.rentalno,TO_CHAR(startdate, 'DD-MON-YYYY HH24:MI:SS') "Start Date",
	   TO_CHAR(returndate, 'DD-MON-YYYY HH24:MI:SS') "Return Date",
       v.licenseno, outno "Outlet",make,
       model,year,TO_CHAR(DateChecked, 'DD-MON-YYYY HH24:MI:SS') "Date Checked"
FROM vehicle v join ragreement r on v.licenseno = r.licenseno
			left outer join faultreport f on f.rentalno = r.rentalno
				 
#Query3
SELECT distinct v.licenseno, v.make, v.model, TO_NUMBER(EXTRACT(YEAR FROM SYSDATE)) - v.year || ' years' "Vehicle Age", 
				(SELECT MAX(mileageafter) FROM ragreement WHERE licenseno = v.licenseno) "Final Odometer Reading",
				(SELECT MAX(mileageafter) FROM ragreement WHERE licenseno = v.licenseno) - (SELECT MAX(mileagebefore) FROM ragreement WHERE licenseno = v.licenseno) "Total Run", 
				(SELECT COUNT(reportnum) FROM faultreport GROUP BY licenseno HAVING licenseno = v.licenseno ) AS "Number of Fault Reports"
FROM vehicle v join ragreement r on v.licenseno = r.licenseno
			left outer join faultreport f on f.rentalno = r.rentalno
WHERE 
	(EXTRACT(YEAR FROM SYSDATE) - v.Year) >= 3 ;


#Query5
COLUMN "Quarter" FORMAT A10
BREAK ON "Quarter"
SELECT  TO_CHAR(r.startdate,'Q') "Quarter", v.make "Make",
	(Select Count(rentalno) from ragreement join vehicle using(licenseno)
	 where make = v.make AND TO_CHAR(startdate,'Q') = TO_CHAR(r.startdate,'Q')) "Rentals by Make" ,
	RANK() OVER (PARTITION BY TO_CHAR(startdate,'Q') ORDER BY (COUNT(f.reportnum) *100/(SELECT COUNT(rentalno) 
																						FROM 
																						ragreement JOIN vehicle using(licenseno)
																						WHERE make = v.make AND TO_CHAR(startdate,'Q') = TO_CHAR(r.startdate,'Q'))) DESC) "Rank"
FROM ragreement r JOIN Faultreport f ON r.rentalno = f.rentalno
				JOIN Vehicle v ON v.licenseno = r.licenseno
WHERE EXTRACT(YEAR FROM startdate) = EXTRACT(YEAR FROM sysdate)
GROUP BY TO_CHAR(r.startdate,'Q'), v.make;


#Query7
COLUMN "Revenue" FORMAT A8
SELECT v.model, COUNT(v.model) "Model Count" , 
		DECODE(TO_CHAR(((RATIO_TO_REPORT(SUM(dailyrate*(SELECT SUM(TO_DATE(returndate, 'DD-MON-YYYY') - TO_DATE(startdate, 'DD-MON-YYYY')) 
														FROM ragreement JOIN vehicle USING (licenseno) 
														WHERE model = v.model AND TO_CHAR(returndate, 'Q') = TO_CHAR(sysdate, 'Q')-1
																			  AND EXTRACT(YEAR FROM returndate) = EXTRACT(YEAR FROM SYSDATE)))) OVER())* 100),'99.99')
			  ,NULL,0,
			   TO_CHAR(((RATIO_TO_REPORT(SUM(dailyrate*(SELECT SUM(TO_DATE(returndate, 'DD-MON-YYYY') - TO_DATE(startdate, 'DD-MON-YYYY')) 
														FROM ragreement JOIN vehicle USING (licenseno) 
														WHERE model = v.model AND TO_CHAR(returndate, 'Q') = TO_CHAR(sysdate, 'Q')-1 
																			  AND EXTRACT(YEAR FROM returndate) = EXTRACT(YEAR FROM SYSDATE)))) OVER())* 100),'99.99')) ||'%' "Revenue" 
FROM vehicle v 
GROUP BY model 
ORDER BY 3 DESC;



#Query9
COLUMN "Employee Details" FORMAT A40;
SELECT  LEVEL, LPAD(' ', 3*(LEVEL - 1)) ||  e.empno || '   ' ||   fname || ' ' || lname "Employee Details",
		position,  street ||', '|| city||', '|| state ||', '|| zipcode "Outlet Address", 
		(SELECT COUNT(reportnum) FROM faultreport f WHERE f.empno = e.empno and sysdate - f.datechecked <= 90) "Reports Prepared"
FROM  employee e JOIN outlet o ON e.outno = o.outno
START WITH e.empno = 4000  CONNECT BY PRIOR e.empno = e.supervisorno;

#Query11
select Time, Start_Rentals, Return_Rentals ,(Start_Rentals + Return_Rentals) "# of Transactions", 
       To_Char((Ratio_to_report( Start_rentals + Return_Rentals) over ())*100, '9999.99') || '%' "Transactions" 
from 
	(Select Time, Count(rentalno) As Start_Rentals
	from (select rentalno, (Case When to_char(startdate, 'HH24:MI') between '06:00' and '11:59' Then 'Morning'
						         When to_char(startdate, 'HH24:MI') between '12:00' and '17:59' then 'Afternoon'
						         when to_Char(startdate, 'HH24:MI') between '18:00' and '23:00' then 'Night'
					        end) Time
	      from ragreement)
	group by time) join 
	(Select Time, Count(rentalno) As Return_Rentals
	from (select rentalno, (Case When to_char(returndate, 'HH24:MI') between '06:00' and '11:59' Then 'Morning'
						         When to_char(returndate, 'HH24:MI') between '12:00' and '17:59' then 'Afternoon'
						         when to_Char(returndate, 'HH24:MI') between '18:00' and '23:00' then 'Night'
					        end) Time
	      from ragreement)
    group by time) using (Time);

#Query13
COLUMN "Outlet" FORMAT A10;
COLUMN "Total" FORMAT A16;
COLUMN MONDAY FORMAT A20;
COLUMN TUESDAY FORMAT A20;
COLUMN WEDNESDAY FORMAT A20;
COLUMN THURSDAY FORMAT A20;
COLUMN FRIDAY FORMAT A20;
COLUMN SATURDAY FORMAT A20;
COLUMN SUNDAY FORMAT A20;
SELECT DECODE(outno, NULL, 'Rent|Repo', outno) "Outlet",
		SUM(DECODE(TO_CHAR(startdate, 'D'),1,1,0)) || ' Rent, ' || SUM(DECODE(TO_CHAR(datechecked, 'D'),1,1,0)) || ' Repo' AS MONDAY,
		SUM(DECODE(TO_CHAR(startdate, 'D'),2,1,0)) || ' Rent, ' || SUM(DECODE(TO_CHAR(datechecked, 'D'),2,1,0)) || ' Repo' AS TUESDAY,
		SUM(DECODE(TO_CHAR(startdate, 'D'),3,1,0)) || ' Rent, ' || SUM(DECODE(TO_CHAR(datechecked, 'D'),3,1,0)) || ' Repo' AS WEDNESDAY,
		SUM(DECODE(TO_CHAR(startdate, 'D'),4,1,0)) || ' Rent, ' || SUM(DECODE(TO_CHAR(datechecked, 'D'),4,1,0)) || ' Repo'AS THURSDAY,
		SUM(DECODE(TO_CHAR(startdate, 'D'),5,1,0)) || ' Rent, ' || SUM(DECODE(TO_CHAR(datechecked, 'D'),5,1,0)) || ' Repo' AS FRIDAY,
		SUM(DECODE(TO_CHAR(startdate, 'D'),6,1,0)) || ' Rent, ' || SUM(DECODE(TO_CHAR(datechecked, 'D'),6,1,0)) || ' Repo' AS SATURDAY,
		SUM(DECODE(TO_CHAR(startdate, 'D'),7,1,0)) || ' Rent, ' || SUM(DECODE(TO_CHAR(datechecked, 'D'),7,1,0)) || ' Repo' AS SUNDAY,
		COUNT(RENTALNO) || ' Rent, ' || Count(reportnum) || ' Repo' "Total" 
From outlet join vehicle using(outno) join ragreement using(licenseno) 
			left outer join faultreport using(rentalno)
where extract(MONTH from Sysdate) - extract(Month from startdate) <=3
GROUP BY GROUPING SETS (outno, ());

#Query15
COLUMN "Place" FORMAT A5;
COLUMN "Proportion of Customers(%)" FORMAT A30;
COLUMN "Proportion of Rentals(%)" FORMAT A30;
select X.Place, X.OutNumber, X.Clients "#Clients", X.Rentals, round(((X.Clients / X.TotalCustomers)*100),2) || '%' "Proportion of Customers(%)", 
round(((X.Rentals / X.TotalRentals)*100),2) || '%' "Proportion of Rentals(%)"
from
(select  ot.state As Place, ot.outno OutNumber, count(Distinct cl.clientno) Clients, count(ra.rentalno) Rentals, 
			(select count(r.rentalno) from outlet o join vehicle v on o.outno =v.outno
			join ragreement r on r.licenseno = v.licenseno
			join client c on c.clientno = r.clientno
			where ot.outno = o.outno
			group by o.outno) TotalRentals,			
			(select count(DISTINCT c.clientno) from outlet o join vehicle v on o.outno = v.outno
			join ragreement r on r.licenseno = v.licenseno
			join client c on c.clientno = r.clientno
			where ot.outno = o.outno
			group by o.outno) TotalCustomers			
from outlet ot join vehicle vh on ot.outno = vh.outno
			join ragreement ra on vh.licenseno = ra.licenseno
			join client cl on cl.clientno = ra.clientno 			
where ot.state = cl.state
group by ot.outno, ot.state) X;
	
#Query17	
Select 
	(select Count(distinct clientno) from client where webaddress LIKE '%.com') "#Profit Clients",
	(select Count(rentalno) from client join ragreement using(clientno) 
	where webaddress LIKE '%.com' AND TO_CHAR(startdate, 'Q') = TO_CHAR(sysdate, 'Q')-1 ) "#Profit Rentals",
	(Select Count(distinct clientno) from client where webaddress LIKE '%.edu') "#Edu Clients",
	(select Count(rentalno) from client join ragreement using(clientno) 
	where webaddress LIKE '%.edu' AND TO_CHAR(startdate, 'Q') = TO_CHAR(sysdate, 'Q')-1 ) "#Edu Rentals",
	(select Count(distinct clientno) from client where webaddress LIKE '%.org') "#Non-Profit Clients",
	(select Count(rentalno) from client join ragreement using(clientno)
	where webaddress LIKE '%.org' AND TO_CHAR(startdate, 'Q') = TO_CHAR(sysdate, 'Q')-1 ) "#Non-Profit Rentals",
	(select Count(distinct clientno) from client where webaddress LIKE '%.gov') "#Gov Clients",
	(select Count(rentalno) from client join ragreement using(clientno) 
	where webaddress LIKE '%.gov' AND TO_CHAR(startdate, 'Q') = TO_CHAR(sysdate, 'Q')-1 ) "#Gov Rentals",
	(select Count(distinct clientno) from client where webaddress NOT LIKE '%.com' AND webaddress NOT LIKE '%.edu' AND webaddress NOT LIKE '%.gov' AND webaddress NOT LIKE '%.org') "Other",
	(select Count(rentalno) from client join ragreement using(clientno) 
	where webaddress NOT LIKE '%.com' AND webaddress NOT LIKE '%.edu' AND webaddress NOT LIKE '%.gov' AND webaddress NOT LIKE '%.org' AND TO_CHAR(startdate, 'Q') = TO_CHAR(sysdate, 'Q')-1 ) "#Other Rentals",
	(select Count(distinct clientno) from client where webaddress is NULL) "N.A.",
	(select Count(rentalno) from client join ragreement using(clientno) 
	where webaddress is NULL AND TO_CHAR(startdate, 'Q') = TO_CHAR(sysdate, 'Q')-1 ) "#N.A"
from dual;

#Query19
BREAK ON "Table Name" ON "Column Name"
COLUMN "Table Name" FORMAT A15
COLUMN "Column Name" FORMAT A15
COLUMN "Constraint Name" FORMAT A17
COLUMN "Search Condition" FORMAT A65
COLUMN "Refer Table" FORMAT A11
COLUMN "Refer Col." FORMAT A11
SELECT Table_name "Table Name", Column_name "Column Name" , constraint_name "Constraint Name", 
(CASE WHEN constraint_type  = 'P' THEN 'PK'
      WHEN constraint_type = 'R' THEN 'FK'
      WHEN constraint_type = 'U' THEN 'UK'
      WHEN constraint_type = 'C' THEN SUBSTR(constraint_name,-2)
      ELSE ' ' END) "Type",
search_condition "Search Condition", NVL(tab_name,'Not a FK') "Refer Table", NVL(col_name,'Not a FK') "Refer Col."
FROM USER_TAB_COLUMNS 
LEFT OUTER JOIN USER_CONS_COLUMNS USING (table_name , column_name)
LEFT OUTER JOIN USER_CONSTRAINTS USING (table_name , constraint_name) 
LEFT OUTER JOIN
(SELECT table_name AS tab_name, column_name as col_name, constraint_name As con_name                  
FROM USER_CONS_COLUMNS) ON R_constraint_name = con_name
ORDER BY table_name,column_ID;

	

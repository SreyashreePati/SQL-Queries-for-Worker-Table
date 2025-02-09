drop database if exists organization;
create database organization;
use organization;

# use org database to work on this query Happy Learning By JEEVAN RAJ

#Q-1. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table Using The Alias Name As
#<WORKER_NAME>.
select first_name as worker_name from worker;
select * from worker;
#Q-2. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case.
select upper(first_name) as worker_name from worker;

#Q-3. Write An SQL Query To Fetch Unique Values Of DEPARTMENT From Worker Table.
select distinct department from worker;
select department from worker;
#Q-4. Write An SQL Query To Print The First Three Characters Of FIRST_NAME From Worker Table.
select substr('Jeevan',1,3);
select first_name,substr(first_name,1,3)as nick_name from worker;
#Q-5. Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First Name Column ‘Amitabh’
#From Worker Table.
#select position('a' in 'Jeevan')
select first_name, position ('A' in first_name) from worker where name = 'Amitabh';
#Q-6. Write An SQL Query To Print The FIRST_NAME From Worker Table After Removing White Spaces
#From The Right Side.
#select length(ltrim('      Sreya')); # remove whitespace from left side
#select length(rtrim('Sreya       ')); # remove whitespace from right side
#select length(rtrim('        Sreya       ')); # remove whitespace from both side

select rtrim(first_name) as first_name from worker;


#Q-7. Write An SQL Query To Print The DEPARTMENT From Worker Table After Removing White Spaces
#From The Left Side.
select ltrim(department) as department from worker;

#Q-8. Write An SQL Query That Fetches The Unique Values Of DEPARTMENT From Worker Table And Prints Its Length.
select department, length(department) as len from worker group by department;


select * from worker;
select * from(
select first_name,length(first_name) as len from worker) as t where len<7;

#Q-9. Write An SQL Query To Print The FIRST_NAME From Worker Table After Replacing ‘a’ With ‘K’. (for replacing char is case-sensitive)
select  first_name,replace(first_name,'a','k')as new_name from worker;
select  first_name,replace(lower(first_name),'a','k')as new_name from worker;

#Q-10. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single
#Column COMPLETE_NAME. A Space Char Should Separate Them.
select concat(first_name,'',last_name) as complete_name from worker;

#Q-11. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending.
select * from worker order by first_name asc; # for ascending
select * from worker order by first_name desc; # for descinding

#Q-12. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME
#Ascending And DEPARTMENT Descending.
select * from worker order by first_name asc, department desc;


#Q-13. Write An SQL Query To Print Details For Workers With The First Name As “Vipul” And “Satish”
#From Worker Table.
select * from worker where first_name in ('vipul','satish');
# alternative way
select * worker where first_name = 'vipul' or first_name = 'satish';

#Q-14. Write An SQL Query To Print Details Of Workers Excluding First Names, “Vipul” And “Satish” From
#Worker Table.
select * from worker where first_name not in ('vipul','satish');

#Q-15. Write An SQL Query To Print Details Of Workers With DEPARTMENT Name As “Admin”.
select * from worker where department = 'admin';

#Q-16. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.
select * from worker where first_name like '%a%';

#Q-17. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.
select * from worker where first_name like '%a';

#Q-18. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘H’ And
#Contains Six Alphabets.
select * from worker where first_name like'_____H;'

#Q-19. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.
select * from worker where salary >= 100000 and salary<=500000;
# Alternative way
select * from worker where salary between 100000 and 500000;

#Q-20. Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.
select * from worker where month of (joining_date) = 2 and year(joining_date) = 2014;
# Alternative way
select * from worker where joining_date like '2014-02%';


#Q-21. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.
select department,count(department) as No_of_emp from worker where department = 'admin' group by department;


#Q-22. Write An SQL Query To Fetch Worker Names With Salaries >= 50000 And <= 100000.
select concat(first_name,'',last_name) as worker_name, salary from worker where salary between 50000 and 100000;


#Q-23. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.
select department,count(department) as no_of_emp from worker group by department order by no_of_emp desc;


#Q-24. Write An SQL Query To Print Details Of The Workers Who Are Also Managers.
select * from title;
select w.*, t.worker_title from worker w inner join title t on w.worker_id = t.worker_ref_id where worker_title = 'Manager';


#Q-25. Write An SQL Query To Fetch Duplicate Records Having Matching Data In Some Fields Of A Table.
select * from title;
select worker_title,affected_from, count(*) as cnt from title group by worker_title,affected_from having cnt>1;


#Q-26. Write An SQL Query To Show Only Odd Rows From A Table.
select * from worker where mod(worker_id,2) != 0;

#Q-27. Write An SQL Query To Show Only Even Rows From A Table.
select * from worker where mod(worker_id,2) = 0;
#Q-28. Write An SQL Query To Clone A New Table From Another Table.
create table cloned_strusture like worker;
drop database if exists cloned_strusture;
select * from cloned_structure;
create table cloned_values as select * from worker;
select * from cloned_values;
#Q-29. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
select * from worker as w inner join bonus as b on w.worker_id=b.worker_ref_id;
# alternative
select * from worker where worker_id in (select worker_ref_id from bonus);
#Q-30. Write An SQL Query To Show Records From One Table That Another Table Does Not Have.
select * from worker where worker_id not in (select worker_ref_id from bonus);
select * from worker w left join bonus b on w.worker_id = b.worker_ref_id where worker_ref_id is null;
#Q-31. Write An SQL Query To Show The Current Date And Time.
select now(),sysdate();

#Q-32. Write An SQL Query To Show The Top N (Say 5) Records Of A Table.
select * from worker limit 5;
select * from worker limit 3 offset 4;
#Q-33. Write An SQL Query To Determine The Nth (Say N=5) Highest Salary From A Table.
# (use windows function)
select * from (
select *, row_number() over (order by salary desc) as rn,
rank() over(order by salary desc) as rnk,
dense_rank() over(order by salary desc) drnk from worker) as t where drnk = 5;


#Q-34. Write An SQL Query To Determine The 5th Highest Salary Without Using TOP Or Limit Method.
select * from (
select *, row_number() over (order by salary desc) as rn,
rank() over(order by salary desc) as rnk,
dense_rank() over(order by salary desc) drnk from worker) as t where drnk = 5;



#Q-35. Write An SQL Query To Fetch The List Of Employees With The Same Salary.

# subquery
select * from worker where salary in (
select salary from worker group by salary having count(salary)>1);
#Q-36. Write An SQL Query To Show The Second Highest Salary From A Table.
select * from (
select *, row_number() over (order by salary desc) as rn,
rank() over(order by salary desc) as rnk,
dense_rank() over(order by salary desc) drnk from worker) as t where drnk = 2;

#Q-37. Write An SQL Query To Show One Row Twice In Results From A Table.
select * from worker union all select * from worker;
select * from worker union all select * from worker order by worker_id;

#Q-38. Write An SQL Query To Fetch Intersecting Records Of Two Tables.



#Q-39. Write An SQL Query To Fetch The First 50% Records From A Table.
select * from worker where worker_id  <=( select count(*)/2 from worker );

#Q-40. Write An SQL Query To Fetch The Departments That Have Less Than Three People In It.
select department, count(department) as no_of_emp from worker group by department having no_of_emp<3;
 
#Q-41. Write An SQL Query To Show All Departments Along With The Number Of People In There.
select department, count(department) as no_of_emp from worker group by department;
 
#Q-42. Write An SQL Query To Show The Last Record From A Table.
select * from worker order by worker_id desc limit 1;
#Q-43. Write An SQL Query To Fetch The First Row Of A Table.
select * from worker order by worker_id asc limit 1;
#Q-44. Write An SQL Query To Fetch The Last Five Records From A Table.
select * from worker order by worker_id desc limit 5;
#Q-45. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.
# windows function operation
select * from (
select *,dense_rank() over(partition by department order by salary desc) as drnk from worker) as t where drnk = 1;
#Q-46. Write An SQL Query To Fetch Three Max Salaries From A Table.
select salary from worker order by salary desc limit 3;
select salary from worker group by salary order by salary desc limit 3;

#Q-47. Write An SQL Query To Fetch Three Min Salaries From A Table.
select salary from worker group by salary order by salary asc limit 3;


#Q-48. Write An SQL Query To Fetch Nth Max Salaries From A Table.


#Q-49. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid
select department, sum(salary) as total_salary from worker group by department;

#Q-50. Write An SQL Query To Fetch The Names Of Workers Who Earn The Highest Salary.
select * from (
select *,dense_rank() over( order by salary desc) as drnk from worker) as t where drnk = 1;









#views
# create views
create view m1 as(
select first_name,last_name,department,worker_title from worker as w inner join title t on w.worker_id = t.worker_ref_id);

select * from m1;

select * from worker;
Grant Select on m1 to 'Sreyashree';
# For granting privilages
Grant Select on students_info to 'userone';

select * from worker;

# for revoke
Revoke select on worker from 'Sreyashree';

# for grant all the info
Grant all on worker to 'Sreyashree';
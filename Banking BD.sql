Create Database BankingDB;
use BankingDB;

Create table Customers(
C_ID Int,
First_name Varchar(40),
Last_name Varchar(40),
Email Varchar(100),
Phone Varchar(13));

alter table Customers
add Column Date_of_birth Date;
alter table Customers 
Add  Primary Key (C_ID);
alter table Customers 
modify Phone varchar(20);
alter Table Customers 
modify First_name Varchar(40) Not null;
alter table Customers 
add unique (Email);
Desc Customers;


Create Table Accounts(
AccountID Int,
Accounttype Varchar(20),
Balance decimal(10,2));

alter table Accounts
add constraint Balance Check (Balance > 1000);
alter Table Accounts
add Column C_ID Int ;
alter Table Accounts
add primary key (AccountID);
desc Accounts;
alter table Accounts
Add constraint foreign key (C_ID) references Customers(C_ID);

create table Transactions(T_id Int,
Transaction_date Date,
Amount decimal(10,2),
Transaction_type varchar(20));

alter Table Transactions
add column AccountID Int;
alter table Transactions 
add foreign key (AccountID) references Accounts (AccountID);
desc Transactions;

create table Branches(
Branch_id Int,
Branch_name Varchar(100),
Branch_address varchar(100),
Branch_phone varchar(13));

alter Table Branches
add column AccountID int;
alter Table Branches
add constraint foreign key (AccountID) references Accounts(AccountID);
desc Branches;


create table AccountBranches(
Assignmentdate Date);

desc AccountBranches;

Create Table Loans(
LoanID Int,
Loan_Amount decimal(10,2),
Interest_rate decimal(10,2),
Startdate Date,
Enddate Date);
alter table Loans
add column C_ID int ;
alter Table Loans
add constraint foreign key(C_ID) references Customers(C_ID);
alter table Loans
add primary key (C_ID);
desc Loans;
alter table Loans
modify column C_ID int;


insert Into Customers (C_ID,First_name,Last_name,Email,Phone,Date_of_birth) Values (001,"Rahul","Sharma","Rahul@gmail.com",9374636474,'2004-03-07');
select * from Customers;
 set sql_safe_updates=0;
 
Update  Customers
set C_ID = 101
where First_name = "Rahul";

insert into Accounts(AccountID,Accounttype,Balance,C_ID) values(201,"Saving",30000,101);
select * from Accounts;
insert Into Customers (C_ID,First_name,Last_name,Email,Phone,Date_of_birth) Values (102,"Hari","Karnor","Hari@gmail.com",9999998889,'1990-11-04'),
(103,"Sachin","Pawar","sachin@gmail.com",9374625232,'2005-07-03'),
(104,"Akash","Pawar","akash@gmail.com",9878937679,'2004-04-21'),
(105,"Nagesh","Sonune","Nagesh@gmail.com",8987898990,'2003-03-11'),
(106,"Suryachandra","Tare","Suryachandra@gmail.com",8010369553,'2004-05-24');
select * from Customers;

insert into Accounts(AccountID,Accounttype,Balance,C_ID) values(202,"Saving",320000,102),
(203,"Current",1300000,103),
(204,"Saving",14000,103),
(205,"Saving",2500,104),
(206,"Current",3500000,105),
(207,"Current",4000000,106);
select * from Accounts;

update Accounts
set Balance=45000
where AccountID = 201;
select * from Transactions;

insert Into Transactions(T_id,Transaction_date,Amount,Transaction_type,AccountID)Values (301,'2026-10-12',26000,"Credit",201);
insert Into Transactions(T_id,Transaction_date,Amount,Transaction_type,AccountID)Values (302,'2026-10-11',34000,"Deposit",202),
(303,'2026-09-21',50000,"Credit",203),
(304,'2026-10-23',140000,"Credit",204),
(305,'2026-10-21',23000,"Deposit",205),
(306,'2026-10-23',40000,"Credit",206),
(307,'2026-10-24',230000,"Credit",207);
 
 set sql_safe_updates=0;
 delete from Transactions 
 where T_Id = 301;
 
 select *from Customers;
 
 select First_name,Last_name,Email,Phone From Customers;
 
 Select AccountId,Accounttype,Balance from Accounts;
 
 Select * from Accounts
 Where Accounttype = "saving";
 
 Select * from Accounts
 Where Balance > 25000;
 
 Select * from Transactions 
 Where Amount between 50000 And 200000;
 
 select * from Accounts;
 
 select * from Customers 
 Where C_ID in(101,102,103,105);
 
 select * from Accounts
 Where AccountID In (201,202,206);
 
 
 select * from Customers
 Where First_name Like "R%";
 
 Select * from Accounts
 Where Accounttype Like "c%";
 
 
 Select * from Accounts
 WHere Accounttype ="Current";
 
 select * from Accounts
 Where Balance < 15000;
 
 Select * from Transactions 
 Where Amount between 25000 and 2500000;
 
 select * from Customers 
 where C_ID in (101,102,103);
 
 select * from Customers 
 Where First_name like "S%";
 
 
Select * from Customers
Order By First_name Asc;

select * from Accounts
Order By Balance desc;

select distinct Accounttype 
from Accounts;

select distinct balance 
from accounts;

Select * from Accounts
Order By Balance desc limit 4;

select * from Accounts
order by balance desc limit 4 offset 3;

select * from Customers 
Order By Last_name asc;

Select * from Transactions 
Order by amount desc limit 5;

select distinct Transaction_type from Transactions;

select * from Transactions 
order by amount desc limit 4 offset 3;

select * from Customers
where Phone is null;

select * from Customers
where Email is not null;

select * from Accounts
where balance is not null;

select AccountID,Balance ,
Case 
when balance >= 100000 then "Premiun Account"
when balance >= 50000 then "Standard Account"
else "Basic Account"
end as AccountCategory
from Accounts;

select * from Transactions;

select T_id,Amount,
Case
when Amount >= 50000 then "High Transaction"
when Amount >= 45000 then "Medium Transaction"
else "Low Transaction"
End as Transaction_Category
from Transactions;

select AccountID, Balance,
rank() over (order by balance desc) as Balance_rnk from Accounts;

select T_id,Amount,
sum(Amount) over (Order by Transaction_date) as running_total From Transactions;

select T_id,Amount,
avg(Amount) over () as averagetransaction from Transactions;

select C_ID,Balance,
rank() over (Order by balance desc) as balance_rank from Accounts;

select C_ID,Balance,
sum(Balance) over (order by balance desc) as running_total from Accounts;
select * from Accounts;

select T_id,Amount,
dense_rank() over (Order By Amount Desc) As Maximum_Amount from Transactions;

select * from Customers
where First_name Like "A%";

select * from Customers 
where Email Like "%gmail%";

select * from Customers 
where First_name Like "%ra";

select * from Customers 
where First_name Like "A%";

select *from Customers 
where Email Like "%Yahoo";

select * from Customers 
where Last_name Like "p%";

select * from Customers 
where Phone Like "99%";

select * from Transactions 
where Transaction_type  in ("Deposit","Withdrawal");

select * from Transactions;

select * from Customers 
where C_ID in (101,102,103);

select * from Accounts
where Accounttype in ("Salary","Saving");

select * from Transactions 
where Transaction_type in ("payment","deposit");

select * from Customers 
where C_ID in (103,104);

select * from Accounts 
where C_ID in (103,104);

select * from CUstomers 
Order by Last_name asc;

select * from Accounts 
Order By Balance desc;

select * from Transactions
order by Transaction_date desc;


select * from Customers 
order by first_name asc;

select * from Accounts 
order by accounttype;

select * from Transactions
Order by Amount Desc;

select * from Customers 
Order by Date_of_birth ;

select * from Accounts
Order By Balance desc limit 5;

select * from Customers
limit 3;

select * from Transactions 
limit 5 offset 3;

select * from Transactions 
order by amount desc limit 3;

select * from Customers 
limit 4;

select * from Accounts
limit 3 offset 2;

select * from Accounts;

select *from Transactions 
order by Transaction_date desc limit 5;

select * from Accounts
where Accounttype ="saving"
order by balance desc;

select * from Customers
Where First_name Like "h%"
limit 3;

select * from Transactions 
where Transaction_type in ("deposit")
order by Transaction_date desc;

select * from Branches;
select * from Accounts;
insert into Branches(Branch_id,Branch_name,Branch_address,Branch_phone,AccountID)values(401,"Indira Nagar Branch","Near Kandi Hospital-Indira Nagar,Hingoli",000111222,201),
(402,"Akola Bypass Branch","Hingoli-Washim Road Akola Bypass",1110002222,202),
(403,"Akola Bypass Branch","Hingoli-Washim Road Akola Bypass",1110002222,203),
(404,"Akola Bypass Branch","Hingoli-Washim Road Akola Bypass",1110002222,204),
(405,"Indira Nagar Branch","Near Kandi Hospital-Indira Nagar,Hingoli",1112223333,205),
(406,"Indira Nagar Branch","Near Kandi Hospital-Indira Nagar,Hingoli",1112223333,206);

set sql_safe_updates=0;
update Branches
set Branch_phone =1112223333
where Branch_id = 401;

delete from branches
where Branch_id =402;

select * from AccountBranches;
insert into Accountbranches (Assignmentdate) Values(now());

select * from Transactions;
select * from Customers;

select First_name,Upper(First_name) as Up_names from Customers;
select LAst_name,upper(LAst_name) as name_ from Customers;
select Branch_name,upper(Branch_name) as UpperN from Branches;
select Branch_address,upper(Branch_address) as branch_address from Branches;

select First_name,lower(First_name) as LO_names From Customers;
select LAst_name,lower(LAst_name)as LowerN from Customers;

select First_name,length(First_name) as Length_ From customers;

select First_name,left(First_name,2) as initials from customers; 

select concat(first_name,"  ",Last_name) as full_Name from customers;

select round(1234.12) as Total;

select * from Transactions;

select ceil(1209.34) as total;

select * from Customers;
select curdate();

select now();

select C_ID,year(Date_of_birth) as Birth_year from Customers;

select C_ID,month(Date_of_birth) as Birth_month from Customers;

select C_ID,date(DAte_of_birth) as birth_day from Customers;

select C_ID,datediff(curdate(),Date_of_birth) as days from customers;

select First_name,Date_of_birth,if(year(Date_of_birth) <= 2000,"adult","young") as cotegory from Customers;

select first_name,ifnull(Phone,"not available") as phone from customers;

select greatest('2004-03-07','1990-11-04','2005-07-03','2004-04-21','2003-03-11','2004-05-24') as latest;

select least('2004-03-07','1990-11-04','2005-07-03','2004-04-21','2003-03-11','2004-05-24') as least;

select first_name,nullif(first_name,"Rahul") as result from customers;
select sum(balance) as total_balance from Accounts;
select max(balance) as max_ba from accounts;
group by AccountID ;
select * from customers;
select * from Accounts;
show tables;
select * from Accountbranches;
select * from accounts;
select * from branches;
select * from customers;
select * from loans;
select * from transactions;

select accountid,accounttype,balance from Accounts;

select * from Accounts
where accounttype ="saving";

select * from Accounts
where balance > 250000;

select * from Transactions
where Amount between 50000 and 250000;

select * from Customers 
where C_ID in (101,102,103);

select * from Customers
where First_name like "A%";

select * from Accounts
where Accounttype ="current";

select * from Accounts
where Balance <50000;

select * from Transactions
where Amount between 100000 and 300000;

select * from Customers 
where C_ID in (105,106);

select * from Customers
where Last_name Like "S%";

select * from Customers
order by First_name asc;

select * from Accounts
order by balance desc ;

select distinct accounttype from accounts;

select * from Accounts 
order by balance desc limit 3;

select * from Transactions
limit 4 offset 3;

select * from customers
order by last_name;

select * from Transactions 
order by amount desc  limit 5;

select distinct transaction_type from transactions;

select  distinct Transaction_type  from Transactions;

select * from Transactions
Limit 4 offset 3;

select * from Customers 
where Phone Is not null;

select * from Customers 
where Email is not null;

select * from accounts 
where balance is not null;

select accountid,balance,
case 
when balance >= 100000 then "premium"
when balance >= 50000 then "standard"
else "basic account"
end as account_category from accounts;

select amount,
case 
when amount >= 50000 then "High Transaction"
when amount >= 25000 then "Medium Transaction"
else "Low Transaction"
end as Transactin_category 
from Transactions;

select Accountid,balance,
rank() over (order by balance desc) as balance_rank from Accounts;

select accountid,balance,
dense_rank() over (order by balance desc) as densernk from accounts;

select T_ID,Amount,
sum(amount) over (order by Transaction_date) as runningtotal from Transactions;

select T_ID,Amount,
avg(amount) over () as Averageamount
from Transactions;

select c.first_name,c.last_name,a.balance ,
dense_rank() over (Order by a.balance desc) as densernk
from Customers as c
 join Accounts as a on c.C_ID=a.c_id;

desc loans;

alter table loans
drop primary key;
desc accounts;

drop table loans;
create table Loans(LoanID int Primary key,
Loan_Amount decimal(10,2),
Interest_rate decimal(10,2),
Start_date date,
End_date date);

desc loans;
alter table loans
add column C_ID int ;
alter table loans 
add constraint foreign key(C_ID)references Customers(C_ID);

insert into Loans(LoanID,Loan_Amount,Interest_rate,Start_date,End_date,C_ID)values(501,2300000,0.13,'2024-10-10','2028-10-09',101);

select * from Loans;
insert into Loans(LoanID,Loan_Amount,Interest_rate,Start_date,End_date,C_ID)values(502,3300000,0.13,'2023-08-10','2028-08-09',103),
(503,1500000,0.13,'2025-02-12','2026-01-27',105);

select * from Accounts;

insert into Accounts(AccountID,Accounttype,Balance,C_ID)values(210,"Saving",170000,109),
(211,"Saving",1200000,110);

select * from Customers;

insert into Customers(C_ID,First_name,Last_name,Email,Phone,Date_of_birth)values(107,"Abhishek","Dipke","AbhiDipke@gmail.com",9080707060,'1998-05-12'),
(108,"Saurav","Das","sauravdas@gmail.com",2736425367,'2000-12-04');

insert into Customers(C_ID,First_name,Last_name,Email,Phone,Date_of_birth)values(109,"Anjali","Singh","Anjalisingh@gmail.com",9080707084,'1998-12-12'),
(110,"Savita","Das","savitadas@gmail.com",9036425367,'1990-12-04');
select * from Customers;

alter table Customers
add column Gender varchar(50);

set sql_safe_updates=0;
update Customers
set Gender ="Male"
where C_ID in (101,102,103,104,105,106,107,108);

update customers
set Gender = "Female"
where C_ID in (109,110);
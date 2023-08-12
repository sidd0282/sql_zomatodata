drop table if exists goldusers_signup;
CREATE TABLE goldusers_signup(userid integer,gold_signup_date date); 

INSERT INTO goldusers_signup(userid,gold_signup_date) 
 VALUES (1,'22-09-2017'),
(3,'21-04-2017');

drop table if exists users;
CREATE TABLE users(userid integer,signup_date date); 

INSERT INTO users(userid,signup_date) 
 VALUES (1,'02-09-2014'),
(2,'15-01-2015'),
(3,'11-04-2014');

drop table if exists sales;
CREATE TABLE sales(userid integer,created_date date,product_id integer); 

INSERT INTO sales(userid,created_date,product_id) 
 VALUES (1,'19-04-2017',2),
(3,'18-12-2019',1),
(2,'20-07-2020',3),
(1,'23-10-2019',2),
(1,'19-03-2018',3),
(3,'20-12-2016',2),
(1,'09-11-2016',1),
(1,'20-05-2016',3),
(2,'24-09-2017',1),
(1,'11-03-2017',2),
(1,'11-03-2016',1),
(3,'10-11-2016',1),
(3,'07-12-2017',2),
(3,'15-12-2016',2),
(2,'08-11-2017',2),
(2,'10-09-2018',3);


drop table if exists product;
CREATE TABLE product(product_id integer,product_name text,price integer); 

INSERT INTO product(product_id,product_name,price) 
 VALUES
(1,'p1',980),
(2,'p2',870),
(3,'p3',330);

select * from goldusers_signup;
select * from users;
select * from sales;
select * from product;


1.  what is the total amount each customer spent on zomato?
 
select userid,sum(price)as total_amount from sales as s join product as p
on s.product_id= p.product_id
group by userid 
order by userid asc

2.  how many days has each customer visited zomato?

select userid,count(distinct created_date) as days_visited from sales
group by userid

3.  what was the first product purchased by each customer?

select * from
(select * , rank() over(partition by userid order by created_date ) 
 as rnk from sales) as r where rnk =1
 
4.  what is the most purchased item on the menu and how many times was it purchased by all customers?

select product_id,count(product_id) from sales 
group by product_id
order by count(product_id) desc limit 1


5.  which item was the most popular for each customers? 


select * from(
select *, rank() over ( partition by userid order by cont desc) rnk from
(select userid,product_id, count(product_id) as cont from sales group by userid,product_id)as a) as b
where rnk = 1















 
 
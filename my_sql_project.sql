-- create database
create database onlinebookstore;
-- switch on database 
use onlinebookstore;
-- create table 
create table books(
Book_id serial primary key ,
Title varchar (100),
Author varchar(100),
genre varchar(50),
Published_year int,
price numeric(10,2),
Stock int
);
create table customers(
Customer_id serial primary key ,
name varchar(100),
Email varchar(100),
Phone varchar(15),
City varchar(50),
Country varchar(100)
);
create table orders(
Order_id serial primary key,
customer_id int references customers(customer_id),
Book_id int references Books(book_id),
Order_Date date,
Quantity int,
Total_amount numeric(10,2)
);

select* from books;
select * from customers;
select* from orders;

-- 1) retrive all books in the 'fiction' genre:
select* from books where genre = 'fiction';

-- 2) finds books published after the year1950:
select* from books where published_year>1950;

-- 3) list all customers from canada:
 select* from customers where country = 'canada';

-- 4) show order placed in november 2023:
select * from orders 
where order_date between '2023-11-01' and '2023-11-30';

-- 5) retrive total stock of books available:
select sum(stock) as total_stock from books;

-- 6) find the details of most expensive books:
select* from books
 order by price
 desc limit 1;
 
 -- 7) show all customers who orderd more than 1 quantity of a book
 select * from orders 
 where quantity >1;
 
 -- 8) retrive all orders where the total amount exceeds $20:
 select * from orders where total_amount >20;

-- 9) list all genre available in the books table:
select distinct genre  from books;

-- 10) find the books with the lowest stock:
select*
 from books
 order by stock;
 
 -- 11) calculate the total revenue generated from all orders:
 select sum(total_amount) as total_revenue from orders;
 
 -- advance question
 
 -- 12) retrive the total number of books sold for each genre
 select b.genre ,sum(o.quantity) as total_book_sold
 from books b
 join orders o
 on b.book_id = o.book_id
 group by b.genre;
 
 -- 13) find the average price of books in the 'fantasy' genre;
 select genre , avg(price) as average_price
 from books
 where genre = 'fantasy';

-- 14) list customers who have placed at least 2 orders 
select o.customer_id , count(o.order_id) as total_order_placed , c.name
 from orders o 
 join customers c
 on c.customer_id = o.customer_id
group by o.customer_id , c.name
  having count(o.order_id) >=2;

-- 15) find the most frequently orderd book:
select book_id ,count(order_id) as order_count
from orders
group by book_id
order by order_count desc;

 -- 16) show the top 3 most expensive books of 'fantasy' gemre:
 select* 
 from books
 where genre = 'fantasy'
 order by price desc
 limit 3;
 
 -- 17) retrive the total quantity of books sold by each author:
 select b.author ,sum(o.quantity) as total_quantity
 from books b
 join orders o
 on b.book_id = o.book_id
 group by b.author
 order by total_quantity desc;
 
 -- 18) list the cities where customers who spent over $30 are located;
 select distinct c.city ,o.total_amount
 from customers c
 join orders o 
 on c.customer_id = o.customer_id 
 where o.total_amount>30;
 
-- 19) find the customers who spent the most on orers:
select c.customer_id , c.name , sum(o.total_amount) as most_expenditure
 from customers c 
 join orders o
 on c.customer_id = o.customer_id 
 group by c.customer_id , c.name 
 order by most_expenditure desc
 limit 1;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



 
 
 
 
 
 
 
 
 
 
 
 
 
 




 
 
 
 
 
 
 
 
 
 
 













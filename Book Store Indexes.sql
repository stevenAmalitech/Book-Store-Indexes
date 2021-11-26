select * from customers limit 10;
select * from orders limit 10;
select * from books  limit 10;

select *
from pg_Indexes
where tablename = 'customers' or tablename = 'orders' or tablename = 'books';

create index customers_first_name_idx
on customers(first_name);

explain analyze select original_language, title, sales_in_millions from books
where original_language='French';

select pg_size_pretty
(pg_total_relation_size('books'));

create index books_original_language_title_sales_in_millions_price
on books(original_language,title,sales_in_millions,price);

select pg_size_pretty
(pg_total_relation_size('books'));

drop index if exists
books_original_language_title_sales_in_millions_price;

select now();

\COPY orders from 'orders_add.txt' DELIMITER ',' CSV HEADER;

select now();

create index customers_first_name_email_address on
customers(first_name,email_address);

select * from pg_Indexes
where tablename='customers';
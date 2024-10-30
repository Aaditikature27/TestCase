-- 1) select price,s.product_id,sum(price) from products p join Sales s on p.product_id=s.product_id  group by price,s.product_id;

 -- 2) select price,s.product_id,sum(price) from products p join Sales s on p.product_id=s.product_id 
 --    group by price,s.product_id order by sum(price) desc limit 3;

 3) select un.name,gu.user_id from user_name as un inner gold_users as gu
    group by un.name;

8)select year(created_date) as years , sum(price) as total from sales as s
join product as p on s.product_id=p.product_id group by years

10) select count(u.user_id)*0.10 from users as u join gold_users as gs on
    gs.user_id=u.user_id

12) select u.user_id,un.name,sum(price) as spent from sales as s join
    products as p on s.product_id=p.product_id join username as un on un.user_is=s.user_id
	group by s.user_id;

13) select s.user_id,name,count(product_id) as visited_no from sales as s
    join username as un on s.user_id=un.user_id
	group by user_id;

15)  select user_id,count(product_id) from sales where product_id=
(select product_id from sales group by product_id order by count(product_id) desc limit 1)
group by user_id;


16)select user_id,product_id
 from(select *,rank()over(partition by user_id order by orders )from
 (select user_id,product_id,count(product_id)as count from sales group by
 user_id,product_id) 
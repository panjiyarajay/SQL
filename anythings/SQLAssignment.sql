use pubs

--1) print the employee name and the number of titles each of them have published

select concat(fname,' ',minit,' ',lname) 'Employee Name',count(e.pub_id) 'Number of Books Published'from
employee e join titles t on (e.pub_id=t.pub_id) 
group by concat(fname,' ',minit,' ',lname)

--2) sort by date and print the store name and the latest purchase done by every store

select store_name 'Store name',ord_date 'Latest purchase by Store'from sales s 
join stores st on (s.store_id=st.store_id) 
order by ord_date desc

--3) print every book name and  its author 's full name

select title 'Book name',concat(au_fname,' ',au_lname) 'Author' from
titles t left outer join titleauthor ta on (t.title_id=ta.title_id)
join authors a on (a.au_id=ta.au_id)
order by Author

--4) print the author's full name and number of books written by each

select concat(au_fname,' ',au_lname) 'Author',count(ta.title_id) 'Number of Books Written'from
titleauthor ta join authors a on (a.au_id=ta.au_id)
group by a.au_fname,a.au_lname 
order by Author

--5) print the author full name, publisher's name, title name, quantity sold, store name and the store address of all the books.

select concat(au_fname,' ',au_lname) 'Author',pub_name 'Publisher name',title 'Title name',
qty 'Quantity Sold',store_name 'Store Name',storie_address 'Store Address' from publishers p 
join titles t on (p.pub_id=t.pub_id) 
join titleauthor ta on (t.title_id=ta.title_id) 
join authors a on(ta.au_id=a.au_id)
join sales s on (s.title_id=t.title_id)
right outer join stores st on (s.store_id=st.store_id) order by Author

--6) select author name and the average quantity sold for every author

select concat(au_fname,' ',au_lname) 'Author',avg(qty) 'Quantity sold'from authors a 
left outer join titleauthor ta on (a.au_id=ta.au_id)
right outer join titles t on (t.title_id=ta.title_id) 
join sales s on (s.title_id=t.title_id) group by au_fname,au_lname

--7) print the store name and address of all the sales for a given title

select store_name 'Store name',store_address 'Store Address' from titles t 
join sales s on (s.title_id=t.title_id) 
right outer join stores st on (s.store_id=st.store_id) 

--8) what is the max quantity sold for every publisher?

select pub_name 'Publisher name',max(qty) 'Maximum Quantity Sold'from publishers p
left outer join titles t on (p.pub_id=t.pub_id)
left outer join sales s on (s.title_id=t.title_id)
group by pub_name

--9) print the employee names for a given publisher

select concat(fname,' ',minit,' ',lname) 'Empolyee Name',pub_name 'Publisher Name'from employee e  
join publishers p on (e.pub_id=p.pub_id) order by [Empolyee Name]

--10) Explore the function soundex. show an example query

--Soundex function evaluate similary of two strings and return the 4 character code based on how the string sounds when spoken

select SOUNDEX('Ajay') 'Value1',SOUNDEX('panjiyar')'Value2';

--11) print the total sales(price*quantity) for every city in the author table

select a.city 'City',price*qty 'Total sales'from titles t 
right outer join sales s on (t.title_id=s.title_id) 
join titleauthor ta on (ta.title_id=t.title_id) 
join authors a on (a.au_id=ta.au_id) order by city



-- 12) print the store name, title name, total price , quantity, price, publisher name for every book

select stor_name 'Store name',title 'Book name',price*qty 'Total price',qty 'Quantity sold',price 'Price',
p.pub_name 'Publisher name'from 
publishers p join titles t on (p.pub_id=t.pub_id) 
join sales s on (t.title_id=s.title_id) 
join stores st on (s.store_id=st.store_id) order by st.store_name

--MUSIC STORE DATA ANALYSIS--

--Q1: Who is the senior most employee based on the Job title?

select * from employee
order by levels desc

--Q2: Which countries have the most invoices?

select count (*) as c, billing_country 
from invoice
group by billing_country
order by c desc


--Q3: What are top three values of invoices?

select total from invoice
order by total desc


--Q4: Which city has the best customers? We would like to throw a promotional MusicFestival in the city we made the most money.
--Write a query that returns one city that has the highest sum of invoice totals.
--Return both the city name and sum of all invoice totals.

select sum(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc


--Q5: Return all the track names that have a song length longer than the average song length.
--Return the Name and Milliseconds for each track.
--Order by the song length with the longest songs listed first.

Select name, milliseconds
from track
where milliseconds > (
	select avg(milliseconds) as avg_track_length
	from track)
order by milliseconds desc;

--Q6: Write a query to return the email, first name, last name and Genre of all Rock music listeners.
--Return your list ordered alphabetically by email starting with A.

Select distinct email, first_name, last_name
from customer
join invoice on customer.customer_id= invoice.customer_id
join invoice_line on invoice.invoice_id= invoice_line.invoice_id
where track_id in(
	select track_id from track
	join genre on track.genre_id= genre.genre_id
	where genre.name like 'Rock'
)
order by email;


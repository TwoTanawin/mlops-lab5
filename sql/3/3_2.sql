select sum (total), paytype from yellow
where paytype = 'Credit' group by paytype;
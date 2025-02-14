select sum (total), paytype from creditcard
where paytype = 'Credit' group by paytype;
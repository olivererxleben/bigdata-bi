use datashot;

#CREATE TABLE if not exists bdbi_EMP_p1 like bdbi_EMP;
#truncate table bdbi_EMP_p1;

# p1
SELECT * FROM bdbi_EMP where TITLE < "Programmer";
# p2
select * from bdbi_EMP where TITLE > "Programmer";
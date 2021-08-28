--Chapter 5

--Dual
select sysdate from dual;

select * from ship_cabins;

--upper and lower
select * from ship_cabins where upper(style) = 'SUITE';

select * from ship_cabins where lower(style) = 'suite';

--initcap
select initcap('napoleon'), initcap('RED O''BRIEN'), initcap('McDonald''s') from dual;

--concat and ||
select concat('Hello, ', 'World') from dual;

select 'Hello, ' || 'World' from dual;

select 'Hello, ' || 'World! ' || 'Greate to ' || 'see you.' from dual;

--2020/10/17
--lpad, rpad
select RPAD('Chapter One -  I am Born ',40,'.') from dual;

select LPAD('Chapter One -  I am Born ',40,'.') from dual;

Create table Book_Contents (
title varchar2(20),
Page_number number);

Insert into Book_Contents values('Introduction',1);
Insert into Book_Contents values('Chapter1',5);
Insert into Book_Contents values('Chapter2',10);
Insert into Book_Contents values('Chapter3',15);
Insert into Book_Contents values('Chapter4',20);
Insert into Book_Contents values('Chapter5',25);

select * from Book_Contents;

select rpad(title || ' ',30,'.')
|| lpad(' ' || Page_number, 30, '.') "Table of Contents"
from Book_Contents order by Page_number;

--Ltrim and Rtrim
select rtrim('--Seven thousand--------', '-') from dual;
select ltrim('--Seven thousand--------', '-') from dual;

--Trim
select trim(trailing '-' from '--Seven thousand--------') from dual;
select trim(leading '-' from '--Seven thousand--------') from dual;
select trim('-' from '--Seven thousand--------') from dual;

--Length
select length ('Supercalifragilisticexpialidocious') from dual;

--Instr
select instr('Mississippi', 'is',1,2) from dual;
select instr('Mississippi', 'is',1,3) from dual;
select instr('Mississippi', 'i',1,3) from dual;

--substr
select substr('Name: MARK KENNDEY', 7) from dual;

--soundex
select soundex('Worthington'), soundex('Worthen') from dual;

select employee_id, first_name, last_name from employees where soundex(last_name) = soundex('Worthen');


--Numberical functions
--Round
select round(12.355143, 2), Round(259.99, -1) from dual;
--Trunc
select trunc(12.355143, 2), trunc(259.99, -1) from dual;

--remainder
select remainder(9,3), remainder(10,3), remainder(11,3) from dual;
select remainder(13,5), remainder(12,5), remainder(11,5) from dual;

--mod
select mod(9,3), mod(10,3), mod(11,3) from dual;

--Date functions
select sysdate from dual;

--round date
select sysdate today, round(sysdate, 'mm') rounded_month,
round(sysdate, 'rr') rounded_year from dual;

--to char round date
select to_char(sysdate, 'dd-mon-yy hh:mi:ss') as raw_date,
to_char(round(sysdate), 'dd-mon-yy hh:mi:ss') as rounded_date from dual;

select to_char(to_date('01-aug-16 12:00:00', 'dd-mon-yy hh24:mi:ss'), 'dd-mon-yy hh:mi:ss') as day_at_noon,
to_char(round(to_date('01-aug-16 12:00:00', 'dd-mon-yy hh24:mi:ss')), 'dd-mon-yy hh:mi:ss') as rounded_to_next_day from dual;

--sysdate
select sysdate today,
trunc(sysdate, 'mm') truncated_month,
trunc(sysdate, 'rr') truncated_year from dual;

--next day
select next_day('31-may-19', 'Saturaday') from dual;

--last day
select last_day('14-feb-20'), last_day('20-feb-21') from dual;

--add months
select add_months('31-jan-17', 1), add_months('01-nov-17', 4) from dual;

--month between
select months_between('12-jun-14', '03-oct-13') from dual;
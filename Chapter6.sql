/*****Chapter 6 *********/.

----6.1.
select  'Chapter'  | | 1 | |  ' . . . I am born.' from dual;

select sysdate, Add_months(SYSDATE, SUBSTR('plus 3 month', 6,1)) plus_three from dual;

select  'TRUE' From  dual where '3'> '20';

select 'TRUE' from dual where  '3'  >20;



create table emp
(emp_no number (2) constraint emp_emp_no_pk  primary key,
ename varchar2 (15),
salary number (8,2),
mbr_no number(2) constraint emp_mgr_fk  references emp(emp_no));

alter table emp 
disable constraint emp_emp_no_pk  cascade;

alter table emp
enable constraint emp_emp_no_pk;

select * from emp;

drop table emp;

/*********chapter 6.2./.

select  To_number  ('17,000.23' ,'99,999.99') from dual;

select  To_number ('$17,000.23','$999,999.99') 
from dual;

select To_number ('0017.23','0099.99') from dual;
    
    select TO_number (' 911' , 'B999') from dual;
    
    select TO_number (' 911' , '999') from dual;
    
select to_number('MMK99999', 'C99999', ' NLS_ISO_Currency=Myanmar')  from dual;

     select to_number('THB99999', 'C99999', ' NLS_ISO_Currency=Thailand')  from dual;

select To_number ('170,203',  '999G999' ) from dual;
select To_Char(170203,'9G999G99') from dual;

select to_number('1.2E+02','9.9EEEE') from dual;
select To_number ('1 7,000.23', '9G999') from dual;

Select To_number ('17.000,23', 
'999G999D99', 'nls_numeric_characters= '',.''  ')
            REFORMATTED_NUMBER
FROM  DUAL;


select to_number ('17.000,23',  '999G999D99',
                  'NLS_NUMERIC_CHARACTERS='',.'' ')
                  REFORMATTED_NUMBER
from dual;


select value
from nls_session_parameters
where parameter = 'NLS_NUMERIC_CHARACTERS';

select value
from nls_session_parameters
where parameter = 'NLS_ISO_CURRENCY';

alter session set NLS_ISO_CURRENCY=Burmese;

select to_char(198,'L999.99', 'NLS_CURRENCY = ''MMK'' ') from dual;

//********/.

create table blob_test (
id  number,
blob_col blob);

insert into blob_test  (id)  values (1) ;

select * from blob_test;

select to_char  (sysdate-3,'FMDAY,"THE" DD  "OF" MONTH, RRRR') from dual;
select to_char  (sysdate-6,'FMDAY,"THE" DDTH  "OF" MONTH, RRRR') from dual;

select to_char  (sysdate ,'DD:MI:SS AM') from dual;
select  to_char(to_date ('07-Jul-16 00:00:00', 'DD-MON-YY HH24:MI:SS'),'DD-MON-YY HH24:MI:SS PM') AS MIDNIGHT_HR24 from dual;

select  To_TimeStamp ('2020-Jan-01 13:34:00:093423', 'RRRR-MON-DD HH24:MI:SS:FF')   event_time  from dual;
select to_timestamp_TZ ('17-04-2016 16:45:30', 'DD-MM-RRRR HH24:MI:SS') "Time" from dual;


select to_char(SYSDATE,'DAY,"The"  DD " OF" MONTH, RRRR') from Dual;

select to_char (SYSDATE, 'FMDAY, "THE" DD "OF" MONTH, RRRR') from dual;

select to_char(sysdate, 'FMDAY, "THE" Ddth  "OF" Month, RRRR') from dual;

select to_char (SYSDATE, 'HH24:MI:SS AM') from dual;

select To_Char(SYSDATE, 'DD-MON-RRRR HH:MM:SS')  "Today's Date  and Time" from dual;

select To_char(To_date ('01-Jan-49', 'DD-MON-YY') , 'YYYY'),
              To_char(To_date('01-Jan-50', 'DD-MON-YY'), 'YYYY'),
             To_char(To_date('01-Jan-49', 'DD-MON-RR'), 'RRRR'),
             To_char(To_date('01-Jan-50', 'DD-MON-RR'), 'RRRR') from dual;
             
select To_char(To_date ('07-JUL-16 00:00:00', 'DD-MON-YY HH24:MI:SS'), 'DD-MON-YY HH24:MI:SS PM') AS MIDNIGHT_HR24,
            To_char(To_date ('07-JUL-16 00:00:00', 'DD-MON-YY HH24:MI:SS'), 'DD-MON-YY HH12:MI:SS PM') AS MIDNIGHT_HR12 from dual;
            
  select to_date ('2016-01-31', 'RRRR-MM-DD') from dual;
  
-------------Assignment chapter 5.

create table Dog_info (
Dog_id number (4),
Dog_heigh number (8));

insert into Dog_info values (1,600);
insert into Dog_info values (2,470);
insert into Dog_info values (3,170);
insert into Dog_info values (4,430);
insert into Dog_info values (5,300);

select * from Dog_info;

----6.3--.

select case 'Option1' 
        when 'Option1' then 'found it'
        when 'Option2' then 'did not fount it'
        end as "answer"
from dual;

create table ships_table(
ship_id number,
Ship_name varchar2(40),
capacity number (5));


insert into ships_table values (1, 'Codd Crystal', 2051);
insert into ships_table values (2,'Codd Elegance', 2974);
insert into ships_table values (3, 'Codd Champion', 2974);
insert into ships_table values (4,'Codd Victorious', 2974);
select ship_name,  capacity, case capacity when 2052 then 'Medium'  when 2974 then 'Large' End as Cabin_Size from ships_table where  ship_id <=4;

---decode 

select state, Decode (state,'YG', 'Yangon','MDY', 'Mandalay', 'Other') AS Decode_State from addresses;

select NVL(Null,0) first_Answer, 14+Null-4 second_Answer, 14+NVL(NULL,0) -4 Third_Answer from dual;

                                                                                        

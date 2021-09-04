
select * from invoices where  trunc (invoice_date) ='03-DEC-19';

select * from invoices where shipping_date> '23-DEC-19';

select * from invoices where account_number='COODA010';


SELECT  *  FROM    V$NLS_PARAMETERS;

create index IX_INV_Invoice_vendor_id on Invoices (vendor_id, invoice_date);
select * from invoices where vendor_id=112 and trunc(invoice_date)='03-DEC-19';

select * from invoices  where vendor_id=112;

create unique index IX_add2_city on address1 (city);

create table ports3 (port_id number, port_name varchar2 (30));

create index ix1 on ports3 (port_name) invisible;
create index ix1 on ports3 (port_name) visible;
select * from ports3;
alter index ix1 visible;

**********/

create table Houndini  ( Voila  varchar2  (30));
insert into Houndini  (voila ) values  ('Now you see it');
commit ;

drop table houndini;
flashback table Houndini to before drop;
select * from Houndini;
flashback table Houndini to before drop rename to houndini2;
drop table houndini2;

purge table houndini2;
purge recyclebin;

select * from user_recyclebin;
select * from recyclebin;

Alter session Set recyclebin= OFF;

SELECT  *  FROM    V$PARAMETERS;

show parameter recyclebin;

CREATE USER books_admin IDENTIFIED BY MyPassword;

create table Houndini3  ( Voila  varchar2  (30))
enable row movement;

insert into Houndini3  (voila ) values  ('Now you see it');
commit ;
execute DBMS_LOCK.Sleep (15);
Delete from Houndini3;
commit;
execute DBMS_LOCK.Sleep(15);
Flashback table Houndini3 to Timestamp
                    SysTimestamp - interval '0 00:00:20' Day to Second;
                    
select DBMS_Flashback.get_system_change_number from dual;

select current_scn from V$DATABASE;

select ORA_ROWSCN, Voila
                from  Houndini;

********************/

select DBMS_Flashback.get_system_change_number from dual;-11087385
select * from invoices;

create table test_flash (
test1  number primary key,
test2 number(3)  constraint test1_fk    references invoices(invoice_id));

insert  into test_flash values (1,701);
insert  into test_flash values (2,702);

drop table test_flash;
flashback table test_flash to before drop;
select * from test_flash;
select * from recyclebin;
rollback;

insert into test_flash values (3,701);
insert into test_flash values (4,701);
commit;
select * from  test_flash;
select DBMS_Flashback.get_system_change_number from dual;-11088164

alter table test_flash  enable row movement ;

select * from test_flash;

flashback table test_flash to scan 11088164;
select DBMS_Flashback.get_system_change_number from dual;
select current_scn from v$database;

*********************/

create table test_flash2 (
test1  number primary key,
test2 number(3)  constraint test1_fk    references invoices(invoice_id));

insert into test_flash2 values (1,701);
commit;
select * from test_flash2;
select current_scn from v$database;-11088626/

insert into test_flash2 values (1,701);
insert into test_flash2 values (2,702);
commit;
select current_scn from v$database;-11088676/

flashback table test_flash to scn 11088626;

********************/
select To_Timestamp ('2017-08-25 13:15:08.232349',
                                            RRRR-MM-DD HH24:MI:SS.FF')
    from Dual;
    
select timestamp_to_scn(SYSTIMESTAMP) NOW,TIMESTAMP_TO_SCN(TO_TIMESTAMP('01-DEC-19 10:00:00', 'DD-MON-RR HH:MI:SS'))  NOT_NOW from dual;
select  timestamp_to_scn (scn_to_timestamp(11088626))    from dual;


********************/

create restore point test_restore_point;
insert into test_flash values (6,702);
commit;
flashback  table test_flash to restore point test_restore_point;
delete from test_flash where test1 =2;
select * from test_flash;
alter table test_flash enable row movement;
alter table test_flash disable row movement;

select * from V$restore_point;
drop  restore point  test_restore_point; 

******************/


set autocommit =0;
use week10;
create table temp_table(
	id int not null,
    name varchar(10) null,
    primary key(id));
    
insert into temp_table(id, name) values(23, 'john');
insert into temp_table(id, name) values(20, 'jane');
select * from temp_table;
rollback;
insert into temp_table(id, name) values(23, 'john');
commit;
set autocommit  = 1;


drop procedure if exists nosql_sample;

delimiter ^
create procedure nosql_sample(in max_student int, in s_id int, out result boolean)
Begin
	declare cnt int;
    set autocommit = 0;
    insert into enrollmentdate values (s_id, current_date());
    set cnt = (select count(*) from enrollmentdate);
    if cnt > max_student then 
		set result = 0;
        rollback;
	else 
		set result =1;
        commit;
	end if;
end ^
delimiter ;

set sql_safe_updates = 0;
delete from enrollmentdate;
select * from enrollmentdate;

call nosql_sample(3, 100, @result);
call nosql_sample(3, 200, @result);
call nosql_sample(3, 300, @result);
call nosql_sample(3, 400, @result);



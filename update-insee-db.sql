delete from death where death_year > 0;

insert into death (
	death_year,
	death_month,
	death_day,
	death_state_code,
	death_city,
	birth_year,
	birth_month,
	birth_day,
	sex,
	dep_dom,
	death_localization
) select * from insee_update;

-- correct dates
update death set death_month = 1 where death_month = 0;

update death set death_day = 1 where death_day = 0;

update death set birth_month = 1 where birth_month = 0;

update death set birth_day = 1 where birth_day = 0;

-- set dates and age
update death set death_date = make_date(death_year, death_month, death_day);

update death set birth_date = make_date(birth_year, birth_month, birth_day); 

update death set age = age(death_date, birth_date);

update death set age_year = date_part('year', age);

-- state link

update death set death_state_id = (select state.id from state state where death_state_code = state.code limit 1);

--age cat
update death set death_cat_1 = case when age_year between 0 and 19 then 1 else 0 end;

update death set death_cat_2 = case when age_year between 20 and 39 then 1 else 0 end;

update death set death_cat_3 = case when age_year between 40 and 59 then 1 else 0 end;

update death set death_cat_4 = case when age_year between 60 and 74 then 1 else 0 end;

update death set death_cat_5 = case when age_year > 74 then 1 else 0 end;


--age groups

update death set age_group_5 = trunc(age_year::float/5.0); 

update death set age_group_10 = trunc(age_year::float/10.0); 

--index

create index on state(code);




-- correct dates
update insee_update
set mdec = 1
where mdec = 0;

update insee_update
set jdec = 1
where jdec = 0;

update insee_update
set mnaiss = 1
where mnaiss = 0;

update insee_update
set jnaiss = 1
where jnaiss = 0;

delete
from insee
where id > 0;

/*
 Populate insee
 */

insert into insee (death_state,
                   dom_state,
                   death_date,
                   birth_date,
                   age,
                   age_year,
                   age_group_5,
                   age_group_10,
                   age_cat_1,
                   age_cat_2,
                   age_cat_3,
                   age_cat_4,
                   age_cat_5,
                   sex,
                   location)
SELECT (select state.id from state state where depdec = state.code limit 1),
       (select state.id from state state where depdom = state.code limit 1),
       death,
       birth,
       age,
       year,
       trunc(year::float / 5.0),
       trunc(year::float / 10.0),
       case when year between 0 and 19 then 1 else 0 end,
       case when year between 20 and 39 then 1 else 0 end,
       case when year between 40 and 59 then 1 else 0 end,
       case when year between 60 and 75 then 1 else 0 end,
       case when year > 74 then 1 else 0 end,
       case sexe
           when 'M' then 'MALE'::sex_type
           when 'F' then 'FEMALE'::sex_type
           else Null::sex_type end,
       case lieudec2
           when 'HopCli' then 'MEDIC'::location_type
           when 'HosMar' then 'EHPAD'::location_type
           when 'Logem' then 'DOM'::location_type
           when 'Autres' then 'PUBLIC'::location_type
           else 'NA'::location_type
           end
FROM (select depdec,
             depdom,
             make_date(adec, mdec, jdec)                                                  as death,
             make_date(anaiss, mnaiss, jnaiss)                                            as birth,
             age(make_date(adec, mdec, jdec),
                 make_date(anaiss, mnaiss, jnaiss))                                       as age,
             date_part(
                     'year',
                     age(make_date(adec, mdec, jdec), make_date(anaiss, mnaiss, jnaiss))) as year,
             lieudec2,
             sexe
      from insee_update) u;

/*
 Control
 */

SELECT c.year,
       c.source,
       c.count
FROM (
         SELECT 'UPDATE'                      as source,
                count(*)                      as count,
                date_part('year', death_date) as year
         from insee
         GROUP BY date_part('year', death_date)
         UNION
         SELECT 'SOURCE',
                count(*),
                adec
         from insee_update
         group by adec) c
order by year;




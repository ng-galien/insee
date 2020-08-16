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


DROP table if exists insee_stat;
CREATE table insee_stat as

SELECT state.code || '-' || state.name as state,
       state.region                      as region,
       source.death_date,
       source.sum_tot,
       source.sum_cat_1,
       source.sum_cat_2,
       source.sum_cat_3,
       source.sum_cat_4,
       source.sum_cat_5,
       source.sum_male,
       source.sum_female,
       round(source.sum_tot::numeric / state.tot_pop::numeric * 100000, 2) as norm_tot,
       round(source.sum_cat_1::numeric / state.tot_pop_cat_1::numeric * 100000, 2) as norm_cat_1,
       round(source.sum_cat_2::numeric / state.tot_pop_cat_2::numeric * 100000, 2) as norm_cat_2,
       round(source.sum_cat_3::numeric / state.tot_pop_cat_3::numeric * 100000, 2) as norm_cat_3,
       round(source.sum_cat_4::numeric / state.tot_pop_cat_4::numeric * 100000, 2) as norm_cat_4,
       round(source.sum_cat_5::numeric / state.tot_pop_cat_5::numeric * 100000, 2) as norm_cat_5,
       round(source.sum_male::numeric / state.f_pop::numeric * 100000, 2) as norm_male,
       round(source.sum_female::numeric / state.h_pop::numeric * 100000, 2) as norm_female
FROM (SELECT ins.death_date,
             ins.death_state,
             count(ins.id)      as sum_tot,
             sum(ins.age_cat_1) as sum_cat_1,
             sum(ins.age_cat_2) as sum_cat_2,
             sum(ins.age_cat_3) as sum_cat_3,
             sum(ins.age_cat_4) as sum_cat_4,
             sum(ins.age_cat_5) as sum_cat_5,
             sum(case when ins.sex = 'MALE' then 1 else 0 end) as sum_male,
             sum(case when ins.sex = 'FEMALE' then 1 else 0 end) as sum_female
      FROM insee ins
      group by ins.death_date, ins.death_state, ins.sex
      order by ins.death_date, ins.death_state, ins.sex) source
         join state state on source.death_state = state.id;

delete from insee where id is not null;
delete from insee_update where depdec is not null;
delete from state where id is not null;

select *
from insee_stat;


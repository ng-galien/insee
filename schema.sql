
drop table if exists insee_update;

create table insee_update
(
    adec     integer,
    mdec     integer,
    jdec     integer,
    depdec   varchar(50),
    comdec   varchar(50),
    anaiss   integer,
    mnaiss   integer,
    jnaiss   integer,
    sexe     varchar(50),
    depdom   varchar(50),
    lieudec2 varchar(50)
);

/*

 */
drop table if exists insee;
drop table if exists state;

create table state
(
    id            bigserial   not null
        constraint departement_pkey1
            primary key,
    code          varchar(3)  not null
        constraint departement_code_key
            unique,
    name          varchar(30) not null
        constraint departement_name_key
            unique,
    h_pop_cat_1   integer,
    h_pop_cat_2   integer,
    h_pop_cat_3   integer,
    h_pop_cat_4   integer,
    h_pop_cat_5   integer,
    h_pop         integer,
    f_pop_cat_1   integer,
    f_pop_cat_2   integer,
    f_pop_cat_3   integer,
    f_pop_cat_4   integer,
    f_pop_cat_5   integer,
    f_pop         integer,
    tot_pop_cat_1 integer,
    tot_pop_cat_2 integer,
    tot_pop_cat_3 integer,
    tot_pop_cat_4 integer,
    tot_pop_cat_5 integer,
    tot_pop       integer,
    diab          integer,
    region        varchar(100)
);

create index state_code_idx
    on state (code);

create index state_name_idx
    on state (name);

create index state_region_idx
    on state (region);

/**

 */



DROP TYPE IF EXISTS location_type;
CREATE TYPE location_type AS ENUM (
    'MEDIC', 'EHPAD', 'DOM', 'PUBLIC', 'NA'
    );

DROP TYPE IF EXISTS sex_type;
CREATE TYPE sex_type AS ENUM (
    'MALE', 'FEMALE'
    );

create table if not exists insee
(
    id           bigserial not null
        constraint insee_pkey
            primary key,
    death_state  bigint    not null references state (id),
    dom_state    bigint references state (id),
    death_date   date,
    birth_date   date,
    age          interval,
    age_year     integer,
    age_group_5  integer,
    age_group_10 integer,
    age_cat_1    integer,
    age_cat_2    integer,
    age_cat_3    integer,
    age_cat_4    integer,
    age_cat_5    integer,
    sex          sex_type,
    location     location_type
);

create index insee_death_date_idx
    on insee (death_date);
create index insee_birth_date_idx
    on insee (birth_date);
create index insee_age_idx
    on insee (age);
create index insee_age_year_idx
    on insee (age_year);
create index insee_sex_idx
    on insee (sex);
create index insee_location_idx
    on insee (location);

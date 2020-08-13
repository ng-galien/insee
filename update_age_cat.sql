select
count(*) as "total", 
count(case when date_part('year', ins.age) between 20 and 35 then 1 end) as "20-35",
count(case when date_part('year', ins.age) <= 49 then 1 end) as "-50",
--count(case when date_part('year', ins.age) between 21 and 50 then 1 end) as "21 - 50", 
--count(case when date_part('year', ins.age) between 51 and 65 then 1 end) as "51 - 65", 
--count(case when date_part('year', ins.age) between 66 and 75 then 1 end) as "65 - 75", 
--count(case when date_part('year', ins.age) > 75 then 1 end) as "75 +",
--count(case when ins.lieu_dec = 'Non renseigne' then 1 end) as "Non renseigné",
--count(case when ins.lieu_dec = 'HosMar' then 1 end) as "EHPAD",
--count(case when ins.lieu_dec = 'Logem' then 1 end) as "Logement",
--count(case when ins.lieu_dec = 'Autres' then 1 end) as "Autre",
--count(case when ins.lieu_dec = 'HopCli' then 1 end) as "Hopital",
a_dec as "annee", 
--m_dec as "mois",
date_part('week', ins.date_dec) as "semaine"
--lieu_dec as "lieu"
from insee ins
where 
--date_part('year', ins.age) between 25 and 35 AND 
--m_dec < 5 AND NOT (m_dec = 4 AND j_dec > 16) 
date_part('week', ins.date_dec) < 17
group by 
a_dec, 
--m_dec,
date_part('week', ins.date_dec)--,
--lieu_dec 
order by 
a_dec,
date_part('week', ins.date_dec)
--m_dec 
--lieu_dec 
ASC;

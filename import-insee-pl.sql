
DELETE from insee_update where adec > 0;

-- psql command for Import Csv downloaded in INSEE website
\copy insee_update FROM '/Users/alex/Downloads/2020-07-31_detail/DC_2018_det.csv' DELIMITER ';' CSV HEADER;
\copy insee_update FROM '/Users/alex/Downloads/2020-07-31_detail/DC_2019_det.csv' DELIMITER ';' CSV HEADER;
\copy insee_update FROM '/Users/alex/Downloads/2020-07-31_detail/DC_2018_det.csv' DELIMITER ';' CSV HEADER;
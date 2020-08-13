update state 
set region = 
CASE
	WHEN code = ANY (ARRAY['01', '03', '07', '15', '26', '38', '42', '43', '63', '69', '73', '74']) THEN 'Auvergne-Rhône-Alpes'
	WHEN code = ANY (ARRAY['21', '25', '39', '58', '70', '71', '89', '90']) THEN 'Bourgogne-Franche-Comté'
	WHEN code = ANY (ARRAY['22', '29', '35', '56']) THEN 'Bretagne'
	WHEN code = ANY (ARRAY['18', '28', '36', '37', '41', '45']) THEN 'Centre-Val de Loire'
	WHEN code = ANY (ARRAY['2A', '2B']) THEN 'Corse'
	WHEN code = ANY (ARRAY['06', '10', '51', '52', '54', '55', '57', '67', '68', '88']) THEN 'Grand Est'
	WHEN code = ANY (ARRAY['02', '59', '60', '62', '80']) THEN 'Hauts-de-France'
	WHEN code = ANY (ARRAY['75', '77', '78', '91', '92', '93', '94', '95']) THEN 'Île-de-France'
	WHEN code = ANY (ARRAY['14', '27', '50', '61', '76']) THEN 'Normandie'
	WHEN code = ANY (ARRAY['16', '17', '19', '23', '24', '33', '40', '47', '64', '79', '86', '87']) THEN 'Nouvelle Aquitaine'
	WHEN code = ANY (ARRAY['09', '11', '12', '30', '31', '34', '46', '48', '65', '66', '81', '82']) THEN 'Occitanie'
	WHEN code = ANY (ARRAY['44', '49', '53', '72', '85']) THEN 'Pays de la Loire'
	WHEN code = ANY (ARRAY['04', '05', '06', '13', '83', '84']) THEN 'Provence-Alpes-Côte d''Azur'
   	ELSE 'DOM-TOM'
 END

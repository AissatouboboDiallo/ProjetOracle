LOAD DATA 
INFILE 'inscription.csv'
APPEND
INTO TABLE us_Sco.inscription 
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
	id_ins,
	annee,
	id_etudiant
)
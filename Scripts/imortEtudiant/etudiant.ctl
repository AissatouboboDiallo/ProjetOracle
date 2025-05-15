LOAD DATA 
INFILE 'etudiant.csv'
APPEND
INTO TABLE us_Dep.etudiant 
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
	id_etudiant,	
	matricule,
	nom,
	prenom,
	date_Nais DATE "YYYY-MM-DD",
	id_dept,
	id_promo
)
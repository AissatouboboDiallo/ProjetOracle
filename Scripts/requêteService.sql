-- les requetes
 
-- 1 la scolarité voudrais voir la liste des etudiants leurs department et promotion
 select 
	e.matricule, 
	e.nom, 
	e.prenom, 
	d.nom_dep, 
	p.libelle from etudiant 
	e join departement d on e.id_dept=d.id_Dep 
	join promotion p on e.id_promo=p.id_pro;

---- ouvrir la base de donnée pulggable
	 Alter pluggable database nom_PDB open;
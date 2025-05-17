-- les requetes
--- Afficher la liste des consultation
SELECT 
    c.id_consult,
    c.id_etudiant,
    c.date_consult,
    c.motif
    FROM us_infirm.consultation c ;
	 ---Afficher les informations de l’étudiant avec ses consultations médicales
	  SELECT 
    e.matricule,
    e.nom,
    e.prenom,
    e.date_Nais,
    c.date_consult,
    c.motif,
    t.medicament
FROM 
    us_Dep.etudiant e
JOIN 
    us_infirm.consultation c ON e.id_etudiant = c.id_etudiant
JOIN us_infirm.traitement t on c.id_consult= t.id_consult
WHERE 
    e.matricule = '2304002729' order by e.id_etudiant;

-- Rôle pour les users qui accedent a tous les services
create role role_globle_access;

-- Rôle pour les users qui n'accedent seulement a leurs services dedié
create role role_infirmerie_only;
create role role_dep_only;
create role role_sco_only;

-- Utilisateur avec accès global
 create user us_Global identified by usG123;

-- Attribution du droit de connexion au user Global
grant connect to us_Global;

-- Atribution du rôle global au user global
grant role role_globle_access to us_Global;

-- Atribution de tous les privileges
grant select, insert, update, delete on us_Sco.inscription to role_global_all;
grant select, insert, update, delete on us_infirm.consultation to role_global_all;
grant select, insert, update, delete on us_infirm.traitement to role_global_all;
grant select, insert, update, delete on us_Dep.etudiant to role_global_all;
grant select, insert, update, delete on us_Dep.departement to role_global_all;
grant select, insert, update, delete on us_Dep.promotion to role_global_all;


--  Creation des autres users pour gerer leurs services seulements

-- Creation du rôle infirmeire
create role role_infirmerie_only container=current;

-- creation de user et attribution de rôle
create user us_only_infrim identified by usOI123; 
grant role_infirmerie_only to us_only_infrim;

-- Attribution du droit de connexion au user only
grant connect to us_only_infrim

-- Attribution de privilleges
grant select, insert, update, delete on consultation to role_infirmerie_only;
grant select, insert, update, delete on traitement to role_infirmerie_only;


-- Creation du rôle departement
create role role_dep_only container=current;

-- creation de user et attribution de rôle
create user us_only_dep identified by usOD123; 
grant role_dep_only to us_only_dep;

-- Attribution du droit de connexion au user only
grant connect to us_only_dep;

-- Attribution de privilleges
grant select, insert, update, delete on departement to role_dep_only;
grant select, insert, update, delete on etudiant to role_dep_only;
grant select, insert, update, delete on promotion to role_dep_only;


-- Creation du rôle scolarité
create role role_sco_only container=current;

-- creation de user et attribution de rôle
create user us_only_sco identified  by usOS123;
grant role_sco_only to us_only_sco;

-- Attribution du droit de connexion au user only
grant connect to us_only_sco;

-- Attribution de privilleges
grant select, insert, update, delete on inscription to role_sco_only;


-- Attribution des droit pour que le service infirmerie et scolarité puis accede au table commune(Etudiant,Departement)
-- droit de selection(affichage)
-- Pour le service infirmerie on deux utlisateurs(us_infirmerie et us_only_infrim)

-- Pour us_infirmerie en etant connecter a us_Dep
grant select on etudiant to us_infirm;
grant select on departement to us_infirm;
-- Dans us_infirm(creation d'un synonym de us_Dep) 
GRANT CREATE SYNONYM TO us_infirm; -- dans sysdba
create synonym etudiant for us_Dep.etudiant; -- creation de synonym 
create synonym departement for us_Dep.departement; -- creation de synonym departement

-- Pour us_only_infrim en etant connecter a us_Dep
grant select on etudiant to us_only_infrim;
grant select on departement to us_only_infrim;
-- Dans us_only_infrim(creation d'un synonym de us_Dep) 
GRANT CREATE SYNONYM TO us_only_infrim; -- dans sysdba
create synonym etudiant for us_Dep.etudiant; -- creation de synonym 
create synonym departement for us_Dep.departement; -- creation de synonym departement



---Supprimer un role

-- vider les données d'une table
TRUNCATE TABLE nom_table;
-- suppression d'un synonym
drop synonym nom_table;
-- sqlldr nom_us/m_passe@pdb;
-- attribuer tous les droits
GRANT DBA TO nom_user; 




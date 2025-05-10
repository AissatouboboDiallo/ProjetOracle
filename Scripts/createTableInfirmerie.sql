-- code de création de la table consultation
create table consultation(
            id_consult NUMBER PRIMARY KEY ,
            id_etudiant NUMBER NOT NULL, 
            date_consult DATE,
            motif VARCHAR(255)
);

-- code de création de la table traitement
CREATE TABLE traitement(
            id_traitement NUMBER PRIMARY KEY,
            id_consult NUMBER REFERENCES consultation(id_consult),
            medicament VARCHAR(255),
            duree_traitement NUMBER 
);
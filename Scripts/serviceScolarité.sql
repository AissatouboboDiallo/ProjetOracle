-- création de la table  inscription
create table inscription(
            id_inscription NUMBER PRIMARY KEY ,
            etudiant NUMBER NOT NULL,
            CONSTRAINT fk_dept FOREIGN KEY (etudiant) 
            REFERENCES etudiants( id_etudiant) ON DELETE CASCADE,
            date_inscription DATE,
            annee_Universitaire DATE,
            departement_etudiant NUMBER NOT NULL,
            CONSTRAINT fk_dept FOREIGN KEY (departement_etudiant) 
            REFERENCES departement(id_departement) ON DELETE CASCADE,
            niveau VARCHAR(255)
);
/* creation de la table etudiants */

CREATE TABLE etudiants (
  id_etudiant NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  matricule_etudiant VARCHAR2(10) NOT NULL,
  nom_etudiant VARCHAR2(20) NOT NULL,
  prenom_etudiant VARCHAR2(20) NOT NULL,
  licence_etudiant NUMBER NOT NULL,
  promotion_etudiant NUMBER NOT NULL,
  departement_etudiant NUMBER NOT NULL,
  CONSTRAINT fk_dept FOREIGN KEY (departement_etudiant) 
    REFERENCES departement(id_departement) ON DELETE CASCADE,
  CONSTRAINT fk_promotion FOREIGN KEY (promotion_etudiant) 
    REFERENCES promotion(id_promotion) ON DELETE CASCADE
);



 /* creation de la table promotion */


  CREATE TABLE promotion (
    id_promotion Number primary key, 
    nom_promotion VARCHAR(20) NOT NULL ,
 );

 /* creation de la table departement */
 CREATE TABLE departement (
    id_departement Number primary key , 
    nom_departement VARCHAR(20) NOT NULL 
 ) ; 

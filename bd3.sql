SET foreign_key_checks = 0;
DROP TABLE IF EXISTS Utilisateur;
DROP TABLE IF EXISTS Voyageur;
DROP TABLE IF EXISTS Proprietaire;
DROP TABLE IF EXISTS Etablissement;
DROP TABLE IF EXISTS Restaurant;
DROP TABLE IF EXISTS Hotel;
DROP TABLE IF EXISTS Magasin;
DROP TABLE IF EXISTS Avis;
DROP TABLE IF EXISTS Paiement;
DROP TABLE IF EXISTS Promotion;
DROP TABLE IF EXISTS Notecom;
DROP TABLE IF EXISTS Reponse;
SET foreign_key_checks = 1;

CREATE TABLE Utilisateur(
        id_uti     INT  NOT NULL PRIMARY KEY,
        nom        VARCHAR (150) NOT NULL ,
        prenom     VARCHAR (150) NOT NULL ,
        date_naiss  DATE NOT NULL ,
        ville      VARCHAR (125) NOT NULL ,
        pays       VARCHAR (150) NOT NULL ,
        partenaire TEXT ,
        mail  TEXT NOT NULL ,
	pseudo TEXt
	
)ENGINE=InnoDB;

CREATE TABLE Proprietaire(
        id_uti INT PRIMARY KEY,
	FOREIGN KEY (id_uti) REFERENCES Utilisateur(id_uti) 


 	
							 			
	
)ENGINE=InnoDB ;


CREATE TABLE Voyageur(
	 id_uti INT NOT NULL PRIMARY KEY,
   	statut  VARCHAR(50) NOT NULL,
	FOREIGN KEY (id_uti) REFERENCES Utilisateur(id_uti) 
	      
) ENGINE=InnoDB ;


CREATE TABLE Etablissement(
	id_eta INT NOT NULL  PRIMARY KEY ,
	nom         VARCHAR (50) NOT NULL ,
        taille      FLOAT NOT NULL ,
        adresse    TEXT  NOT NULL ,
        ville       VARCHAR (200) NOT NULL ,
        pays        VARCHAR (50) NOT NULL ,
        Latcoo_gps FLOAT NOT NULL ,
        Longcoo_gps FLOAT NOT NULL,
        id_proprietaire    INT NOT NULL,
	FOREIGN KEY (id_proprietaire) REFERENCES Utilisateur(id_uti) 
    

)ENGINE=InnoDB;
CREATE TABLE Restaurant(
        type_cuisine VARCHAR (50),
        nb_etoiles   INT NOT NULL check (nb_etoiles between 0 and 7),
        id_eta       INT NOT NULL PRIMARY KEY,
	FOREIGN KEY (id_eta) REFERENCES Etablissement(id_eta)

		

)ENGINE=InnoDB ;


CREATE TABLE Hotel(
        nb_etoiles INT NOT NULL check (nb_etoiles between 0 and 7),
        id_eta     INT NOT NULL  PRIMARY KEY,
	FOREIGN KEY (id_eta) REFERENCES Etablissement(id_eta)
	
)ENGINE=InnoDB;


CREATE TABLE Magasin(
        categorie VARCHAR (100) ,
        id_eta    INT NOT NULL  PRIMARY KEY,
	FOREIGN KEY (id_eta) REFERENCES Etablissement(id_eta)
	

) ENGINE=InnoDB;

CREATE TABLE Avis(
        id_avis     INT NOT NULL PRIMARY KEY,
        adresse_ip  TEXT,
        date_avis   DATE,
        avis_etoile INT NOT NULL check (avis_etoile between 0 and 5),
        avis_com    TEXT ,
        eval_prix   INT check (eval_prix between 1 and 5),
	id_eta INT NOT NULL,
	id_uti INT NOT NULL,
	FOREIGN KEY (id_uti) REFERENCES Utilisateur(id_uti),
	FOREIGN KEY (id_eta) REFERENCES Etablissement(id_eta)
	
	
) ENGINE=InnoDB ;

CREATE TABLE Notecom (						
		id_uti int not null references Utilisateur, 
		id_avis int not null references Avis,
		note INT NOT NULL check (note between 1 and 5) ,
		constraint cle_prim primary key (id_uti, id_avis)
		
	   	
) ENGINE=InnoDB ;



CREATE TABLE Reponse(
        id_rep        INT NOT NULL PRIMARY KEY,
        rep_com        TEXT,
        avis_insultant int check (avis_insultant between 0 and 1),
	id_avis      INT NOT NULL,
	FOREIGN KEY (id_avis) REFERENCES Avis (id_avis) 

 ) ENGINE=InnoDB;




CREATE TABLE Paiement(
        id_p  INT NOT NULL PRIMARY KEY,
        date_p DATE NOT NULL,
        somme  FLOAT NOT NULL  ,
	id_eta INT NOT NULL,
	FOREIGN KEY (id_eta) REFERENCES Etablissement(id_eta) 
 
)ENGINE=InnoDB;


CREATE TABLE Promotion(
        id_prom     INT PRIMARY KEY,
        description TEXT ,
        debut  DATE,
	fin  DATE,
	id_eta INT NOT NULL,
	FOREIGN KEY (id_eta) REFERENCES Etablissement(id_eta) 
)ENGINE=InnoDB ;







LOAD DATA LOCAL INFILE 'Utilisateur.dat' INTO TABLE Utilisateur FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'Voyageur.dat' INTO TABLE Voyageur FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'Proprietaire.dat' INTO TABLE Proprietaire FIELDS TERMINATED BY ','; 
LOAD DATA LOCAL INFILE 'Etablissement.dat' INTO TABLE Etablissement FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'Restaurant.dat' INTO TABLE Restaurant FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'Hotel.dat' INTO TABLE Hotel FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'Magasin.dat' INTO TABLE Magasin FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'Avis.dat' INTO TABLE Avis FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'Notecom.dat' INTO TABLE Notecom FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'Reponse.dat' INTO TABLE Reponse FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'Paiement.dat' INTO TABLE Paiement FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'Promotion.dat' INTO TABLE Promotion FIELDS TERMINATED BY ',';


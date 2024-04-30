CREATE TABLE droit(
   num_droit INT AUTOINCREMENT,
   libelle_droit VARCHAR(50),
   PRIMARY KEY(num_droit)
);

CREATE TABLE theme(
   num_theme INT AUTOINCREMENT,
   libelle_theme VARCHAR(50),
   description_theme VARCHAR(50),
   PRIMARY KEY(num_theme)
);

CREATE TABLE utilisateur(
   login VARCHAR(50),
   pwd VARCHAR(50),
   num_droit INT NOT NULL,
   PRIMARY KEY(login),
   FOREIGN KEY(num_droit) REFERENCES droit(num_droit)
);

CREATE TABLE qcm(
   num_qcm INT AUTOINCREMENT,
   titre_qcm VARCHAR(50) NOT NULL,
   description_qcm VARCHAR(50),
   difficulte_qcm VARCHAR(50),
   nombre_questions INT NOT NULL,
   duree_qcm INT,
   num_theme INT NOT NULL,
   login VARCHAR(50) NOT NULL,
   PRIMARY KEY(num_qcm),
   FOREIGN KEY(num_theme) REFERENCES theme(num_theme),
   FOREIGN KEY(login) REFERENCES utilisateur(login)
);

CREATE TABLE question(
   num_question INT AUTOINCREMENT,
   intitule_question VARCHAR(50) NOT NULL,
   num_qcm INT NOT NULL,
   PRIMARY KEY(num_question),
   FOREIGN KEY(num_qcm) REFERENCES qcm(num_qcm)
);

CREATE TABLE proposition(
   num_reponse INT AUTOINCREMENT,
   libelle_reponse VARCHAR(50),
   reponse_juste VARCHAR(50),
   note INT,
   num_question INT NOT NULL,
   PRIMARY KEY(num_reponse),
   FOREIGN KEY(num_question) REFERENCES question(num_question)
);

CREATE TABLE passage(
   num_passage INT AUTOINCREMENT,
   score INT NOT NULL,
   date_passage DATE NOT NULL,
   num_qcm INT NOT NULL,
   login VARCHAR(50) NOT NULL,
   PRIMARY KEY(num_passage),
   FOREIGN KEY(num_qcm) REFERENCES qcm(num_qcm),
   FOREIGN KEY(login) REFERENCES utilisateur(login)
);

CREATE TABLE choisir(
   num_passage INT AUTOINCREMENT,
   num_reponse INT,
   PRIMARY KEY(num_passage, num_reponse),
   FOREIGN KEY(num_passage) REFERENCES passage(num_passage),
   FOREIGN KEY(num_reponse) REFERENCES proposition(num_reponse)
);

CREATE TABLE tirer(
   num_passage INT AUTOINCREMENT,
   num_question INT,
   PRIMARY KEY(num_passage, num_question),
   FOREIGN KEY(num_passage) REFERENCES passage(num_passage),
   FOREIGN KEY(num_question) REFERENCES question(num_question)
);

CREATE DATABASE flashly;

CREATE TABLE usuario
(
	user_id INTEGER PRIMARY KEY AUTOINCREMENT,
	nm_user TEXT,
	email TEXT,
	password TEXT
);

CREATE TABLE disciplina
(
	sub_matter_id INTEGER PRIMARY KEY,
	nm_sub_matter TEXT,
	description TEXT,
	fk_user_id INTEGER,
FOREIGN KEY(fk_user_id) REFERENCES usuario(user_id)
);

CREATE TABLE assunto
(
	subject_id INTEGER PRIMARY KEY,
	nm_subject TEXT,
	description TEXT,
	fk_sub_matter_id INTEGER, 
FOREIGN KEY (fk_sub_matter_id) REFERENCES disciplina(sub_matter_id)
);

CREATE TABLE cartao
(
	card_id INTEGER PRIMARY KEY,
	termo TEXT,
	description TEXT,
	fk_subject_id INTEGER,
FOREIGN KEY (fk_subject_id) REFERENCES assunto(subject_id)
);
CREATE TABLE teste
(
	teste_id INTEGER PRIMARY KEY,
	qtd_hits INTEGER,
	score INTEGER
);

CREATE TABLE teste_cartao
(		
	teste_id INTEGER,
	fk_card_id INTEGER, 
FOREIGN key(teste_id) REFERENCES teste(teste_id),
FOREIGN key(fk_card_id) REFERENCES cartao(card_id)
);

/*Inserindo usuários*/
INSERT INTO usuario (nm_user, email, password)
VALUES(“Anderson”, “anderson@email.com”, “12345678”);

INSERT INTO usuario (nm_user, email, password)
VALUES(“Clebson”, “clebson@email.com”, “87654321”);

INSERT INTO usuario (nm_user, email, password)
VALUES(“Ismar”, “ismar@email.com”, “159264837”);

INSERT INTO usuario (nm_user, email, password)
VALUES(“Joana”, “joana@email.com”, “951628473”);


CREATE TABLE usuario
(
	user_id INTEGER PRIMARY KEY AUTOINCREMENT,
	nm_user TEXT,
	email TEXT,
	password TEXT
);

CREATE TABLE disciplina
(
	sub_matter_id INTEGER PRIMARY KEY AUTOINCREMENT,
	nm_sub_matter TEXT NOT NULL,
	description TEXT,
	fk_user_id INTEGER,
FOREIGN KEY(fk_user_id) REFERENCES usuario(user_id)
);

CREATE TABLE assunto
(
	subject_id INTEGER PRIMARY KEY,
	nm_subject TEXT NOT NULL,
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
	ON DELETE CASCADE
	ON UPDATE CASCADE

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

/*Inserindo disciplinas*/
INSERT INTO disciplina (nm_sub_matter, description, fk_user_id )
VALUES("Banco de Dados", "Conheça a disciplina de Banco de dados ", 1);

INSERT INTO disciplina (nm_sub_matter, description, fk_user_id )
VALUES("Engenharia de Software Aplicada", "Disciplina prática de engenharia de software", 2);

INSERT INTO disciplina (nm_sub_matter, description, fk_user_id )
VALUES("Sistemas Operacionais", "", 3);

INSERT INTO disciplina (nm_sub_matter, description, fk_user_id )
VALUES("Programação Orientada a Objetos", "", 4);

/*Inserindo assuntos*/
INSERT INTO assunto (nm_subject, description, fk_sub_matter_id)
VALUES(“Relacionamentos ”,”Faça o relacionamento de suas entidades”,1);
INSERT INTO assunto (nm_subject, description, fk_sub_matter_id)
VALUES(“Tesde de usabilidade”,”Como fazer testes de usabilidade”,2);
INSERT INTO assunto (nm_subject, description, fk_sub_matter_id)
VALUES(“Arquivos”,”Como os arquivos são gerenciados”,3);
INSERT INTO assunto (nm_subject, description, fk_sub_matter_id)
VALUES(“Classes”,””,4);

/* Inserindo Cartão*/
INSERT INTO cartao(termo,description,fk_subject_id)
VALUES(“Tipos de Relacionamentos”,”Relacionamento 0 para n, Relacionamento 1 para 1, Relacionamento 1...n para 1*, Relacionamento n...m para *...*”, 1);
INSERT INTO cartao(termo,description,fk_subject_id)
VALUES(“Tipos de Teste”,”Teste de Usabilidade In-Person ou In-House e Testes Remotos Não Moderados de Usabilidade”, 2);
INSERT INTO cartao(termo,description,fk_subject_id)
VALUES(“Formas de armazenar”,”Em páginas, endereços sequenciais e endereços inseridos em uma lista encadeada”, 3);
INSERT INTO cartao(termo,description,fk_subject_id)
VALUES(“Composição de uma classe”,”Atributos, Métodos Construtores e Destrutores”, 4);

/* Inserindo Testes */
INSERT INTO teste(qtd_hits,score)
VALUES(10, 530);
INSERT INTO teste(qtd_hits,score)
VALUES(3, 200);
INSERT INTO teste(qtd_hits,score)
VALUES(7, 450);
INSERT INTO teste(qtd_hits,score)
VALUES(2, 70);

/* Inserindo o teste de cartão */
INSERT INTO teste_cartao(fk_card_id)
VALUES(1);
INSERT INTO teste_cartao(fk_card_id)
VALUES(2);
INSERT INTO teste_cartao(fk_card_id)
VALUES(3);
INSERT INTO teste_cartao(fk_card_id)
VALUES(4);

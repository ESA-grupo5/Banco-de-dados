# Sistema Gerenciador de Flashcards

Este é um banco de dados criado como projeto da disciplina de banco de dados 1, com a problemática, regra de negócio, detalhamento da solução e requisitos, mais especificados no [link](https://docs.google.com/document/d/1JbqEUPDBTMbnUetJX7zMlQ1E_SgQ6iW3BeQn2o8u8tY/edit?usp=sharing).

## Instalação

Para clonar o repositório pressupõe-se que o command line do git já esteja instalado, com isso feito, você pode executar o comando abaixo dentro da pasta onde queira clonar o repositório:

```sh
git clone https://github.com/ESA-grupo5/Banco-de-dados.git
```

Após isso, você vai pecisar de um SGBD para sqlite, ou simplesmente executar [online](https://sqliteonline.com/) importando este arquivo.

## Consultas

Todas as consultas estão dispostas em outro arquivo, no [consultas.sql](consultas.sql) neste repositório e para informações mais detalhadas você pode acessar o documento clicando neste [link](https://docs.google.com/document/d/1JbqEUPDBTMbnUetJX7zMlQ1E_SgQ6iW3BeQn2o8u8tY/edit?usp=sharing). Abaixo segue as entidades encontradas do nosso projeto e segue os comandos necessários para realização de consultas neste banco.

### Usuário
Se você deseja recuperar todos usuário, use o comando:
```sh
SELECT user_id, nm_user, email FROM usuario; 
```
Se você deseja recuperar usuário por id, use o comando:
```sh
SELECT user_id, nm_user, email FROM usuario WHERE user_id={digite o id do usuário}; 
```
Se você deseja recuperar usuário por nome, use o comando:
```sh
SELECT user_id, nm_user, email FROM usuario WHERE nm_user like "{prefixo que deseja recuperar}%";     
```
Se você deseja atualizar nome do usuário, use o comando:
```sh
UPDATE usuario SET nm_user="anderson" WHERE user_id=1; 
```
Se você deseja deletar usuário:
```sh
DELETE FROM usuario WHERE user_id={o id do usuário que deseja apagar};
```
#### Inserção
Caso deseje inserir mais dados para usuário, use o comando:
```sh
INSERT INTO usuario (nm_user, email, password)
VALUES(“{adicione o id do usuário}”, “{adicione o email deste usuário}”, “{adicione a senha do usuário}”);
```

### Disciplina
Caso deseje recuperar todas disciplinas de um usuário, use o comando:
```sh
SELECT  sub_matter_id, nm_sub_matter, description FROM disciplina WHERE fk_user_id = {chave estrangeira do id do usuário};
```
Caso deseje recuperar todas disciplinas, use o comando:
```sh
SELECT * FROM disciplina;
```
Caso deseje recuperar disciplina pelo seu id, use o comando:
```sh
SELECT * FROM disciplina WHERE sub_matter_id = {id da disciplina}; 
```
Caso deseje recuperar disciplina e o nome dos assuntos por id da disciplina, use o comando:
```sh
SELECT disciplina.nm_sub_matter, assunto.nm_subject
FROM disciplina 
INNER JOIN assunto 
ON disciplina.sub_matter_id=assunto.fk_sub_matter_id;
```
Caso deseje recuperar disciplina por busca de nome da disciplina, use o comando:
```sh
SELECT * FROM disciplina WHERE nm_sub_matter like "Banco de Dados%";  
```
Caso deseje atualizar nome do disciplina, use o comando:
```sh
UPDATE disciplina SET nm_sub_matter="Engenharia", description="" WHERE sub_matter_id = 1;
```
Caso deseje deletar disciplina por id, use o comando:
```sh
DELETE FROM disciplina WHERE sub_matter_id =  1;
```

#### Inserção

Caso deseje criar disciplina:
```sh
INSERT INTO disciplina (nm_sub_matter, description, fk_user_id )
VALUES("{Nome da disciplina que deseja inserir}", "{descrição que deseja inserir}", {chave estrangeira do usuário que deseja inserir a disciplina});
```

### Assunto

Caso deseje recuperar todos os assuntos, use o comando:
```sh
SELECT * FROM assunto;
```
Caso deseje recuperar assuntos por id da disciplina, use o comando:
```sh
SELECT * FROM assunto WHERE fk_sub_matter_id = {chave estrangeira de disciplina};
```
Caso deseje recuperar assuntos por nome do assunto, use o comando:
```sh
SELECT * FROM assunto WHERE nm_subject like "Gatilhos";
```
Caso deseje atualizar descrição do assunto, use o comando:
```sh
UPDATE assunto SET description = "Teste" WHERE subject_id = 1;
```
Caso deseje deletar assunto por id, use o comando:
```sh
DELETE FROM assunto WHERE subject_id = 1;
```
Caso deseje deletar todos assuntos de uma disciplina, use o comando:
```sh
DELETE FROM assunto WHERE fk_sub_matter_id =1;
```

#### Inserção
Caso deseje inserir assunto, use o comando:
```sh
INSERT INTO assunto (nm_subject, description, fk_sub_matter_id)
VALUES(“Gatilhos”,””,1);
```

### Cartão

Recuperar todos os cartões de uma disciplina:
```sh
SELECT * FROM cartao WHERE fk_subject_id = 1;
```
Recuperar um cartão de uma disciplina por id;
```sh
SELECT * FROM cartao WHERE fk_sub_matter_id= 1 AND card_id = 1;
```
Atualizar termo de um cartão por id :
```sh
UPDATE assunto SET termo = “{nome que substituirá o termo}” WHERE card_id = {id do cartão que será modificado};
```

Deletar um cartão:
```sh
DELETE * FROM cartao WHERE card_id = 1;
```

#### Inserção
Caso deseje inserir cartão, use o comando:
```sh
INSERT INTO cartao(termo,description,fk_subject_id)
VALUES(“Teste”,”Testando”, 1);
```
### Teste
Caso deseje recuperar todos os testes, use o comando:
```sh
SELECT* FROM teste;
```
#### Inserção
Caso deseje inserir teste, use o comando:
```sh
INSERT INTO teste(qtd_hits,score)
VALUES(10, 530);
```
### Teste_Cartão
Caso deseje criar relação entre teste e cartão, use o comando de inserção:
```sh
INSERT INTO teste_cartao(fk_card_id)
VALUES(1);
```
Caso deseje retornar todos os testes ligados a um cartão, use o comando:
```sh
SELECT * FROM teste_cartao;
```

## Equipe
#### Anderson Barbosa de Freitas
:email: anderson.barbosa@dcx.ufpb.br
:octocat: [GitHub](http://github.com/clebsonf)
:link: [LinkedIn](https://www.linkedin.com/in/anderson-barbosa-de-freitas/)

#### Clebson Augusto fonseca 
:email: clebson.augusto@dcx.ufpb.br
:octocat: [GitHub](http://github.com/clebsonf)
:link: [LinkedIn](https://www.linkedin.com/in/fclebson/)

#### Ismar Rodrigues da Silva 
:email: ismar.rodrigues@dcx.ufpb.br
:octocat: [GitHub](http://github.com/IsmarRodgs-dce)
:link:

#### Joana Darck Soares da Silva 
:email: joana.darck@dcx.ufpb.br
:octocat: [GitHub](http://github.com/joanasoaresd)
:link: [LinkedIn](https://www.linkedin.com/in/joanasoaresd/)

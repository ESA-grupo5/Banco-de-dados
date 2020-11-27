# Antes de utizar os scripts de select, certifique-se de ter rodado o database.sql

/*=== Table usuario ===*/

/*Recuperar todos usuário:*/
SELECT user_id, nm_user, email FROM usuario; 
/*Recuperar usuário por id:*/
SELECT user_id, nm_user, email FROM usuario WHERE user_id=1; 
/*Recuperar usuário por nome:*/
SELECT user_id, nm_user, email FROM usuario WHERE nm_user like "An%";       

/*=== Table disciplina ===*/

/*Recuperar todas disciplinas de um usuário:*/
SELECT  sub_matter_id, nm_sub_matter, description FROM disciplina WHERE fk_user_id = 1;
/*Recuperar todas disciplinas:*/
SELECT * FROM disciplina;
/*Recuperar disciplina por id da disciplina:*/
SELECT * FROM disciplina WHERE sub_matter_id = 1; 
/*Recuperar disciplina e o nome dos assuntos por id da disciplina:*/
SELECT disciplina.nm_sub_matter, assunto.nm_subject
FROM disciplina 
INNER JOIN assunto 
ON disciplina.sub_matter_id=assunto.fk_sub_matter_id;
/*Recuperar disciplina por busca de nome da disciplina:*/
SELECT * FROM disciplina WHERE nm_sub_matter like "Banco de Dados%";  

/*=== Table assunto ===*/

/*Recuperar todos os assuntos:*/
SELECT * FROM assunto;
/*Recuperar assuntos por id da disciplina:*/
SELECT * FROM assunto WHERE fk_sub_matter_id =  1;
/*Recuperar assuntos por nome do assunto:*/
SELECT * FROM assunto WHERE nm_subject like "Gatilhos";

/*=== Table cartao ===*/

/*Recuperar todos os cartões de uma disciplina:*/
SELECT * FROM cartao WHERE fk_subject_id = 1;
/*Recuperar um cartão de uma disciplina por id;*/
SELECT * FROM cartao WHERE fk_sub_matter_id= 1 AND card_id = 1;

/*=== Table teste ===*/

/*Recuperar todos os testes:  */
SELECT * FROM teste;

/*=== Table teste_cartao ===*/

/*Retornar todos os testes ligados a um cartão:*/
SELECT * FROM teste_cartao;

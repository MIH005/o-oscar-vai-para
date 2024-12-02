-- Este conjunto de consultas SQL foi criado para responder perguntas relacionadas ao Oscar utilizando o banco de dados 'oscar_database'.  
-- Abaixo estão as perguntas e suas respectivas respostas por meio de consultas.

-- 1. Quantas vezes Natalie Portman foi indicada ao Oscar?
-- Resposta: 3 vezes.
SELECT COUNT(*) 
FROM indicados_ao_oscar 
WHERE nome_do_indicado LIKE "%Natalie Portman%";

-- 2. Quantos Oscars Natalie Portman ganhou?
SELECT * 
FROM indicados_ao_oscar 
WHERE nome_do_indicado LIKE "%Natalie Portman%" 
AND vencedor = "true";

-- 3. Amy Adams já ganhou algum Oscar?
SELECT * 
FROM indicados_ao_oscar 
WHERE nome_do_indicado LIKE "%Amy Adams%" 
AND vencedor = "true";

-- 4. A série de filmes Toy Story ganhou um Oscar em quais anos?
SELECT nome_do_filme, ano_cerimonia 
FROM indicados_ao_oscar 
WHERE nome_do_filme LIKE "%Toy Story%" 
AND vencedor = "true";

-- 5. A partir de que ano a categoria "ACTRESS" deixa de existir?
SELECT DISTINCT ano_cerimonia 
FROM indicados_ao_oscar 
WHERE categoria = "ACTRESS" 
ORDER BY ano_cerimonia DESC;

-- 6. Quem ganhou o primeiro Oscar de Melhor Atriz? Em que ano?
SELECT nome_do_indicado, ano_cerimonia 
FROM indicados_ao_oscar 
WHERE categoria = "ACTRESS" 
AND vencedor = "true" 
ORDER BY ano_cerimonia ASC 
LIMIT 1;

-- 7. Alterar todos os valores "true" para 1 e "false" para 0 no campo "vencedor".
UPDATE indicados_ao_oscar 
SET vencedor = "1" 
WHERE vencedor = "true";

UPDATE indicados_ao_oscar 
SET vencedor = "0" 
WHERE vencedor = "false";

-- 8. Em qual edição do Oscar "Crash" concorreu ao Oscar?
SELECT nome_do_filme, cerimonia 
FROM indicados_ao_oscar 
WHERE nome_do_filme LIKE "%Crash%";

-- 9. O filme Central do Brasil aparece no Oscar?
SELECT * 
FROM indicados_ao_oscar 
WHERE nome_do_filme LIKE "Central%";

-- 10. Inclua no banco 3 filmes que nunca foram nomeados ao Oscar, mas que merecem ser.
INSERT INTO indicados_ao_oscar (nome_do_filme, categoria, ano_cerimonia, vencedor) 
VALUES ("Blade Runner 2049", "BEST MOVIE", 2018, 0);

INSERT INTO indicados_ao_oscar (nome_do_filme, categoria, ano_cerimonia, vencedor) 
VALUES ("The Big Lebowski", "BEST MOVIE", 1999, 0);

INSERT INTO indicados_ao_oscar (nome_do_filme, categoria, ano_cerimonia, vencedor) 
VALUES ("Children of Men", "BEST MOVIE", 2007, 0);

-- 11. Denzel Washington já ganhou algum Oscar?
SELECT * 
FROM indicados_ao_oscar 
WHERE nome_do_indicado LIKE "%Denzel Washington%" 
AND vencedor = "1";

-- 12. Quais os filmes que ganharam o Oscar de Melhor Filme?
SELECT nome_do_filme, ano_cerimonia 
FROM indicados_ao_oscar 
WHERE categoria = "BEST PICTURE" 
AND vencedor = "1";

-- 13. (Bônus) Quais os filmes que ganharam o Oscar de Melhor Filme e Melhor Diretor na mesma cerimônia?
SELECT DISTINCT nome_do_filme
FROM indicados_ao_oscar
WHERE vencedor = 1 
AND categoria = 'BEST PICTURE'
AND nome_do_filme IN (
    SELECT nome_do_filme
    FROM indicados_ao_oscar
    WHERE categoria = 'DIRECTING' 
    AND vencedor = 1
);

-- 14. (Bônus) Denzel Washington e Jamie Foxx já concorreram ao Oscar no mesmo ano?
SELECT ano_cerimonia 
FROM indicados_ao_oscar 
WHERE nome_do_indicado LIKE "%Denzel Washington%" 
AND nome_do_indicado LIKE "%Jamie Foxx%";

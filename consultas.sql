-- CONSULTAS

/*
-- SQL

1. ALTER TABLE
2. CREATE INDEX
3. INSERT INTO
4. UPDATE
5. DELETE
6. SELECT-FROM-WHERE
7. BETWEEN
16. LEFT ou RIGHT ou FULL OUTER JOIN
17. SUBCONSULTA COM OPERADOR RELACIONAL
18. SUBCONSULTA COM IN
19. SUBCONSULTA COM ANY
20. SUBCONSULTA COM ALL
21. ORDER BY
22. GROUP BY
23. HAVING
24. UNION ou INTERSECT ou MINUS
*/

-- 22. GROUP BY: número de venda dos funcionário agrupados por homem  mulher
SELECT  P.genero, SUM(F.num_alugueis)  
from Pessoa P
JOIN Funcionario F ON P.cpf=F.cpf_f
WHERE F.cargo != 'Supervisor'
GROUP BY P.genero

-- 18. e 17. SUBCONSULTA COM IN e SUBCONSULTA COM OPERADOR RELACIONAL: mandar email pros cliente que moram perto da locadora, avisando de uma noite de filme na frente da locadora
SELECT E.email
FROM Email E
WHERE E.cpf_e IN (SELECT C.cpf_c
                FROM  Cliente C
                JOIN Pessoa P ON C.cpf_c=P.cpf
                JOIN Endereco EN ON P.cep=EN.cep AND P.num_endereco=EN.num_endereco
                WHERE EN.bairro IN ('Várzea', 'CDU', 'Brasilit') AND (SYSDATE - P.nascimento) >= (18 * 365))

-- 21. ORDER BY: pecas alugadas dos produtos
SELECT P.qnt_alugada, P.titulo
FROM Produto P
ORDER BY P.qnt_alugada DESC, P.titulo ASC;

-- 16. LEFT ou RIGHT ou FULL OUTER JOIN: todo os clientes e os quais ganharam bônus
SELECT P.nome, id_bonus
FROM Pessoa P
RIGHT JOIN Cliente C ON P.cpf=C.cpf_c
JOIN Conta ON C.cpf_c=Conta.cpf_cc
LEFT JOIN GANHA G ON Conta.num=G.num_conta

-- 19. SUBCONSULTA COM ANY: avaliacões dos produtos (feita pelos clientes)(tirando a pior das avaliaçoes)
SELECT P.titulo, AV.valor
from Avalia  AV
JOIN Produto P on AV.id=P.id
WHERE AV.valor > ANY (SELECT AV2.valor
                    FROM Avalia AV2
                    WHERE AV2.id = AV.id)

-- 20. SUBCONSULTA COM ALL: funcionario que mais vendoeu
SELECT P.nome, F.num_alugueis
FROM Pessoa P
JOIN Funcionario F ON P.cpf=F.cpf_f
WHERE F.num_alugueis>= ALL(SELECT F2.num_alugueis
                        FROM Funcionario F2
                        WHERE F2.cpf_f != F.cpf_f
                        )

-- 23. HAVING: produtos having  media da avaliacao  maior que 7
SELECT P.titulo, AVG(AV.valor) AS Média_avaliação
FROM Avalia AV 
JOIN Produto P ON AV.id=P.id
GROUP  BY P.titulo
HAVING AVG(AV.valor)>7

-- 1. ALTER TABLE: alterar a existência da coluna "complemento"
ALTER TABLE Endereco
DROP COLUMN Complemento

-- 2. CREATE INDEX: criar índice para (cep + número da residência) para facilitar consultas
CREATE INDEX end_pessoas
ON Endereco (cep, num_endereco)

-- 3. INSERT INTO: adicionando dependente novo
INSERT INTO Cliente (cpf_c, cpf_indicador)
VALUES ('110.000.000-00', NULL)

-- 4. UPDATE: update estoque de livro
/*UPDATE Produto
SET estoque = 9
WHERE id = v_id;*/

-- 5. DELETE: deletar bônus que já foi utilizado
DELETE FROM Ganha
WHERE num_conta = 2 AND id_bonus = 2;

-- 6. SELECT-FROM-WHERE: selecionar data de nascimento de clientes
SELECT nascimento
FROM Pessoa
WHERE cpf IN (
    SELECT cpf_c
    FROM Cliente
);

-- 7. BETWEEN: produto com num range de valores específicos
SELECT id, preco
FROM Aluga
WHERE preco BETWEEN 11.00 AND 17.00;

-- 24. UNION ou INTERSECT ou MINUS:
SELECT cpf_c FROM Cliente
INTERSECT
SELECT cpf_f FROM Funcionario;

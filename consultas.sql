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
25. CREATE VIEW
26. GRANT / REVOKE
*/

/*
-- PL

1. USO DE RECORD
2. USO DE ESTRUTURA DE DADOS DO TIPO TABLE
3. BLOCO ANÔNIMO
4. CREATE PROCEDURE
5. CREATE FUNCTION
6. %TYPE
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

-- 4. UPDATE: update do salário do crago supervisor
UPDATE Cargo
SET salario = 5000
WHERE titulo = 'Supervisor';

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

-- 7. BETWEEN: criar tabela que retorna todas as melhores avaliações entre 8.5 e 10
CREATE VIEW avaliacoes AS
SELECT A.id, B.id
FROM Avalia A, Avalia2 B
WHERE A.valor BETWEEN 8.5 AND 10.00
AND B.valor BETWEEN 8.5 AND 10.00;

-- 24. UNION ou INTERSECT ou MINUS: lista de cpfs que são clientes e funcionários ao mesmo tempo
SELECT cpf_c FROM Cliente
INTERSECT
SELECT cpf_f FROM Funcionario;

-- 25. CREATE VIEW: retorna tabela com o nome dos clientes e o seu bonus
CREATE VIEW vw_clientes_com_bonus AS
SELECT P.nome, B.valor
FROM Pessoa P 
JOIN Conta C ON P.cpf = C.cpf_cc
JOIN Ganha G ON G.num_conta = C.num
JOIN Bonus B ON B.id_bonus = G.id_bonus;

-- 26. GRANT / REVOKE: 
GRANT SELECT ON Funcionario TO vw_clientes_com_bonus;
REVOKE SELECT ON Funcionario FROM vw_clientes_com_bonus;

-- PL

-- 1. USO DE RECORD: Mostrar os dados (nome, cargo e números de aluguéis) de um funcionário específico.
DECLARE
  TYPE tipo_func IS RECORD (
    nome Pessoa.nome%TYPE,
    cargo Funcionario.cargo%TYPE,
    num_alugueis Funcionario.num_alugueis%TYPE
  );

  func_info tipo_func;
BEGIN
  SELECT P.nome, F.cargo, F.num_alugueis
  INTO func_info
  FROM Pessoa P
  JOIN Funcionario F ON P.cpf = F.cpf_f
  WHERE P.nome = 'Carla Mendes';

  DBMS_OUTPUT.PUT_LINE('Nome: ' || func_info.nome);
  DBMS_OUTPUT.PUT_LINE('Cargo: ' || func_info.cargo);
  DBMS_OUTPUT.PUT_LINE('Nº Aluguéis: ' || func_info.num_alugueis);
END;

-- 2. USO DE ESTRUTURA DE DADOS DO TIPO TABLE

-- 3. BLOCO ANÔNIMO: Mostrar o total de produtos avaliados pelo cliente ‘Lucas Souza’.
DECLARE
    total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO total
    FROM Avalia A
    JOIN Pessoa P ON A.cpf_c = P.cpf
    WHERE P.nome = 'Lucas Souza';

    DBMS_OUTPUT.PUT_LINE('Total de produtos avaliados por Lucas Souza: ' || total);
END;

-- 4. CREATE PROCEDURE: Criar um procedimento que mostra o saldo e a quantidade de produtos alugados de um cliente pelo CPF.
CREATE OR REPLACE PROCEDURE info_conta_cliente (p_cpf IN Conta.cpf_cc%TYPE) AS
    v_credito Conta.credito%TYPE;
    v_qtd Conta.qnt_alugada%TYPE;
BEGIN
    SELECT credito, qnt_alugada
    INTO v_credito, v_qtd
    FROM Conta
    WHERE cpf_cc = p_cpf;

    DBMS_OUTPUT.PUT_LINE('Crédito: R$' || v_credito);
    DBMS_OUTPUT.PUT_LINE('Qtd. Alugada: ' || v_qtd);
END;

BEGIN
    info_conta_cliente('100.000.000-00');
END;

-- 5. CREATE FUNCTION: Função que retorna o total de dependentes de um cliente.
CREATE OR REPLACE FUNCTION total_dependentes (p_cpf Pessoa.cpf%TYPE) RETURN NUMBER IS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM Dependente
    WHERE cpf_responsavel = p_cpf;

    RETURN v_total;
END;

BEGIN
  DBMS_OUTPUT.PUT_LINE('Dependentes: ' || total_dependentes('100.000.000-00'));
END;

-- 6. %TYPE: 
DECLARE
    v_nome Pessoa.nome%TYPE;
    v_alugueis Funcionario.num_alugueis%TYPE;
BEGIN
    SELECT nome, num_alugueis
    INTO v_nome, v_alugueis
    FROM Pessoa P
    JOIN Funcionario F ON P.cpf = F.cpf_f
    WHERE P.nome = 'Fernanda Lima';

    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome);
    DBMS_OUTPUT.PUT_LINE('Aluguéis realizados: ' || v_alugueis);
END;



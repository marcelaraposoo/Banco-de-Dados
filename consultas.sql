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
8. IN
9. LIKE
10. IS NULL ou IS NOT NULL
11. INNER JOIN
12. MAX
13. MIN
14. AVG
15. COUNT
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
14. CURSOR (OPEN, FETCH e CLOSE)
15. EXCEPTION WHEN
16. USO DE PARÂMETROS (IN, OUT ou IN OUT)
17. CREATE OR REPLACE PACKAGE
18. CREATE OR REPLACE PACKAGE BODY
19. CREATE OR REPLACE TRIGGER (COMANDO)
20. CREATE OR REPLACE TRIGGER (LINHA)
*/

-- ==========================
-- ---------- SQL -----------
-- ==========================


-- Comandos utilizados: ALTER TABLE
-- Objetivo: Remover a coluna "complemento" da tabela Endereco
ALTER TABLE Endereco
DROP COLUMN Complemento;

-- Comandos utilizados: CREATE INDEX
-- Objetivo: Criar um índice sobre título, tamanho e lançamento dos produtos para otimizar consultas
CREATE INDEX prod_unico
ON Produto (titulo, tamanho, lancamento);

-- Comandos utilizados: INSERT INTO
-- Objetivo: Inserir um novo cliente na tabela Cliente sem um indicador
INSERT INTO Cliente (cpf_c, cpf_indicador)
VALUES ('110.000.000-00', NULL);

-- Comandos utilizados: UPDATE
-- Objetivo: Atualizar o salário do cargo "Supervisor" para 5000
UPDATE Cargo
SET salario = 5000
WHERE titulo = 'Supervisor';

-- Comandos utilizados: DELETE
-- Objetivo: Deletar um registro de bônus utilizado da tabela Ganha
DELETE FROM Ganha
WHERE num_conta = 2 AND id_bonus = 2;

-- Comandos utilizados: SELECT e FROM e WHERE
-- Objetivo: Selecionar a data de nascimento de todas as pessoas que são clientes
SELECT nascimento
FROM Pessoa
WHERE cpf IN (
    SELECT cpf_c
    FROM Cliente
);

-- Comandos utilizados: CREATE VIEW, SELECT e WHERE com BETWEEN
-- Objetivo: Criar uma view que exibe IDs de avaliações entre 8.5 e 10, feitas por clientes e dependentes
CREATE VIEW avaliacoes AS
SELECT A.id AS id_avalia, B.id AS id_avalia2
FROM Avalia A, Avalia2 B
WHERE A.valor BETWEEN 8.5 AND 10.00
AND B.valor BETWEEN 8.5 AND 10.00;

-- Comandos utilizados: SELECT, FROM, IN
-- Objetivo: Listar os nomes e CPFs dos clientes que já alugaram algum produto
SELECT 
    p.nome,
    c.cpf_c
FROM 
    Cliente c
JOIN Pessoa p ON c.cpf_c = p.cpf
WHERE 
    c.cpf_c IN (
        SELECT co.cpf_cc
        FROM Conta co
        JOIN Aluga a ON a.num = co.num
    );

-- Comandos utilizados: SELECT, FROM, JOIN, LIKE
-- Objetivo: Exibir os clientes com sobrenome "Almeida" que já alugaram algum produto
SELECT 
    p.nome,
    c.cpf_c,
    a.id AS id_produto_alugado,
    a.data_inicio
FROM 
    Pessoa p
JOIN Cliente c ON p.cpf = c.cpf_c
JOIN Conta co ON co.cpf_cc = c.cpf_c
JOIN Aluga a ON a.num = co.num
WHERE 
    p.nome LIKE '%Almeida%'
    AND c.cpf_c = '600.000.000-00';

-- Comandos utilizados: INNER JOIN, COUNT, AVG, IS NOT NULL, GROUP BY
-- Objetivo: Mostrar quantas avaliações cada cliente fez e a média das notas, considerando apenas avaliações válidas
SELECT 
    a.cpf_c,
    COUNT(*) AS total_avaliacoes,
    AVG(a.valor) AS media_avaliacoes
FROM 
    Cliente c
INNER JOIN Avalia a ON c.cpf_c = a.cpf_c
WHERE 
    a.valor IS NOT NULL
GROUP BY 
    a.cpf_c;

-- Comandos utilizados: SELECT, LEFT JOIN, MIN, GROUP BY
-- Objetivo: Exibir o nome dos dependentes e a menor nota dada por cada um, caso tenham avaliado algum produto
SELECT 
    d.nome,
    MIN(av.valor) AS menor_nota  
FROM 
    Dependente d
LEFT JOIN Avalia2 av 
    ON d.cpf_responsavel = av.cpf_responsavel AND d.num_seq = av.num_seq
GROUP BY 
    d.nome;

-- Comandos utilizados: SELECT, RIGHT JOIN, MAX, GROUP BY
-- Objetivo: Exibir todos os produtos junto com a nota máxima recebida, incluindo produtos não avaliados
SELECT 
    p.titulo,
    MAX(a.valor) AS nota_maxima 
FROM 
    Avalia a
RIGHT JOIN Produto p ON a.id = p.id
GROUP BY 
    p.titulo;

-- Comandos utilizados: LEFT JOIN, RIGHT JOIN
-- Objetivo: Listar todos os clientes com seus respectivos bônus, se houver
SELECT P.nome, id_bonus
FROM Pessoa P
RIGHT JOIN Cliente C ON P.cpf = C.cpf_c
JOIN Conta ON C.cpf_c = Conta.cpf_cc
LEFT JOIN GANHA G ON Conta.num = G.num_conta;


-- 18. e 17. SUBCONSULTA COM IN e SUBCONSULTA COM OPERADOR RELACIONAL: mandar email pros cliente que moram perto da locadora, avisando de uma noite de filme na frente da locadora
SELECT E.email
FROM Email E
WHERE E.cpf_e IN (SELECT C.cpf_c
                FROM  Cliente C
                JOIN Pessoa P ON C.cpf_c=P.cpf
                JOIN Endereco EN ON P.cep=EN.cep AND P.num_endereco=EN.num_endereco
                WHERE EN.bairro IN ('Várzea', 'CDU', 'Brasilit') AND (SYSDATE - P.nascimento) >= (18 * 365));

-- 19. SUBCONSULTA COM ANY: avaliacões dos produtos (feita pelos clientes)(tirando a pior das avaliaçoes)
SELECT P.titulo, AV.valor
from Avalia  AV
JOIN Produto P on AV.id=P.id
WHERE AV.valor > ANY (SELECT AV2.valor
                    FROM Avalia AV2
                    WHERE AV2.id = AV.id);

-- 20. SUBCONSULTA COM ALL: funcionario que mais vendoeu
SELECT P.nome, F.num_alugueis
FROM Pessoa P
JOIN Funcionario F ON P.cpf=F.cpf_f
WHERE F.num_alugueis>= ALL(SELECT F2.num_alugueis
                        FROM Funcionario F2
                        WHERE F2.cpf_f != F.cpf_f);


-- 21. ORDER BY: pecas alugadas dos produtos
SELECT P.qnt_alugada, P.titulo
FROM Produto P
ORDER BY P.qnt_alugada DESC, P.titulo ASC;

-- 22. GROUP BY: número de venda dos funcionário agrupados por homem  mulher
SELECT  P.genero, SUM(F.num_alugueis)  
from Pessoa P
JOIN Funcionario F ON P.cpf=F.cpf_f
WHERE F.cargo != 'Supervisor'
GROUP BY P.genero;

-- 23. HAVING: produtos having  media da avaliacao  maior que 7
SELECT P.titulo, AVG(AV.valor) AS Média_avaliação
FROM Avalia AV 
JOIN Produto P ON AV.id=P.id
GROUP  BY P.titulo
HAVING AVG(AV.valor)>7;

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



-- ==========================
-- ---------- PL -----------
-- ==========================

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

-- 2. USO DE ESTRUTURA DE DADOS DO TIPO TABLE: lista de créditos de contas de clientes
DECLARE
    TYPE t_creditos IS TABLE OF Conta.credito%TYPE INDEX BY PLS_INTEGER;
    lista_creditos t_creditos;
    contador NUMBER := 0;
BEGIN
    FOR rec IN (SELECT credito FROM Conta WHERE qnt_alugada > 0) LOOP
        contador := contador + 1;
        lista_creditos(contador) := rec.credito;
    END LOOP;

    FOR i IN 1..contador LOOP
        DBMS_OUTPUT.PUT_LINE('Credito ' || i || ': R$ ' || lista_creditos(i));
    END LOOP;
END;
/

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
CREATE OR REPLACE PROCEDURE info_conta_cliente (
    p_cpf IN Conta.cpf_cc%TYPE
) AS
    v_credito Conta.credito%TYPE;
    v_qnt_alugada NUMBER;
BEGIN
    SELECT credito, qnt_alugada
    INTO v_credito, v_qnt_alugada
    FROM Conta
    WHERE cpf_cc = p_cpf
    AND ROWNUM = 1;

    DBMS_OUTPUT.PUT_LINE('Saldo (crédito): R$ ' || TO_CHAR(v_credito, '999G999D99'));
    DBMS_OUTPUT.PUT_LINE('Quantidade total de produtos alugados: ' || v_qnt_alugada);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Cliente não encontrado com o CPF: ' || p_cpf);
END;
/
BEGIN
    info_conta_cliente('100.000.000-00');
END;
/


-- 5. CREATE FUNCTION: Função que retorna a quantidade de itens na locadorda.
CREATE OR REPLACE FUNCTION total_estoque RETURN NUMBER IS
    v_total_estoque NUMBER := 0;
BEGIN
    SELECT NVL(SUM(estoque), 0)
    INTO v_total_estoque
    FROM Produto;

    RETURN v_total_estoque;
END;
/
SELECT total_estoque() AS estoque_total FROM dual;


-- 6. %TYPE
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

-- 7. %ROWTYPE e 13. SELECT … INTO --

DECLARE
  v_func_rec       Funcionario%ROWTYPE;
  v_nome           Pessoa.nome%TYPE;
  v_cpf_funcionario  Funcionario.cpf_f%TYPE := '130.000.000-00';

BEGIN
  SELECT *
  INTO v_func_rec
  FROM Funcionario
  WHERE cpf_f = v_cpf_funcionario;

  SELECT nome
  INTO v_nome
  FROM Pessoa
  WHERE cpf = v_cpf_funcionario;

  DBMS_OUTPUT.PUT_LINE('--- Detalhes do Funcionário ---');
  DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome);
  DBMS_OUTPUT.PUT_LINE('CPF: ' || v_func_rec.cpf_f);
  DBMS_OUTPUT.PUT_LINE('Cargo: ' || v_func_rec.cargo);
  DBMS_OUTPUT.PUT_LINE('Supervisor (CPF): ' || v_func_rec.cpf_s);
  DBMS_OUTPUT.PUT_LINE('Nº de Aluguéis: ' || v_func_rec.num_alugueis);
END;

-- 8. IF ELSIF --
DECLARE
  v_salario     Cargo.salario%TYPE;
  v_nome        Pessoa.nome%TYPE;
  v_cargo       Funcionario.cargo%TYPE;
  v_classificacao VARCHAR2(20);
  v_cpf_func    Funcionario.cpf_f%TYPE := '140.000.000-00';
BEGIN
  SELECT c.salario, p.nome, f.cargo
  INTO v_salario, v_nome, v_cargo
  FROM Funcionario f
  JOIN Pessoa p ON f.cpf_f = p.cpf
  JOIN Cargo c ON f.cargo = c.titulo
  WHERE f.cpf_f = v_cpf_func; 

  DBMS_OUTPUT.PUT_LINE('Analisando ' || v_nome || ' (Cargo: ' || v_cargo || ')...');

  IF v_salario > 4000 THEN
    v_classificacao := 'Nível Gerencial';
  ELSIF v_salario > 2000 THEN
    v_classificacao := 'Nível Operacional';
  ELSE
    v_classificacao := 'Nível de Entrada';
  END IF;

  DBMS_OUTPUT.PUT_LINE('Classificação: ' || v_classificacao || ' (Salário: ' || TO_CHAR(v_salario, 'L9G999D99') || ').');
END;

-- 9. CASE WHEN --
SELECT
  titulo,
  lancamento,
  CASE
    WHEN lancamento < TO_DATE('01/01/2000', 'DD/MM/YYYY') THEN 'Clássico'
    ELSE 'Moderno'
  END AS Categoria_Temporal
FROM Produto;

-- 10. LOOP ... EXIT WHEN --
DECLARE
  v_num_conta       Conta.num%TYPE := 1;
  v_credito_cliente Conta.credito%TYPE;

  v_alugueis_feitos NUMBER := 0;
  v_custo_aluguel   CONSTANT NUMBER := 18.50; -- Um custo fixo para o exemplo

BEGIN
  SELECT credito
  INTO v_credito_cliente
  FROM Conta
  WHERE num = v_num_conta;

  DBMS_OUTPUT.PUT_LINE('Iniciando simulação de aluguéis para a conta ' || v_num_conta);
  DBMS_OUTPUT.PUT_LINE('Crédito inicial: ' || TO_CHAR(v_credito_cliente, 'L999D99'));
  DBMS_OUTPUT.PUT_LINE('Custo por aluguel: ' || TO_CHAR(v_custo_aluguel, 'L999D99'));
  DBMS_OUTPUT.PUT_LINE('------------------------------------');

  LOOP
    EXIT WHEN v_credito_cliente < v_custo_aluguel;

    v_alugueis_feitos := v_alugueis_feitos + 1;
    v_credito_cliente := v_credito_cliente - v_custo_aluguel;

    DBMS_OUTPUT.PUT_LINE('Aluguel #' || v_alugueis_feitos || ' aprovado. Crédito restante: ' || TO_CHAR(v_credito_cliente, 'L999D99'));

  END LOOP;

  DBMS_OUTPUT.PUT_LINE('------------------------------------');
  DBMS_OUTPUT.PUT_LINE('Simulação finalizada.');
  DBMS_OUTPUT.PUT_LINE('Crédito insuficiente para o próximo aluguel.');
  DBMS_OUTPUT.PUT_LINE('Total de aluguéis realizados: ' || v_alugueis_feitos);
END;

-- 11. WHILE LOOP --
DECLARE
  v_credito_atual Conta.credito%TYPE;
  v_credito_alvo  NUMBER := 200;
  v_num_conta     Conta.num%TYPE := 2; -- Conta que existe no Povoamento
BEGIN
  SELECT credito INTO v_credito_atual
  FROM Conta
  WHERE num = v_num_conta; 

  DBMS_OUTPUT.PUT_LINE('Crédito inicial na conta ' || v_num_conta || ': ' || v_credito_atual);

  WHILE v_credito_atual < v_credito_alvo LOOP
    v_credito_atual := v_credito_atual + 10; -- Adiciona 10 de crédito
    DBMS_OUTPUT.PUT_LINE(' +10... Crédito atual: ' || v_credito_atual);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Crédito alvo atingido. Crédito final: ' || v_credito_atual);
END;

-- 12. FOR IN LOOP --
DECLARE
  v_cpf_resp Dependente.cpf_responsavel%TYPE := '700.000.000-00';
  v_nome_resp  Pessoa.nome%TYPE;
BEGIN
  SELECT nome INTO v_nome_resp FROM Pessoa WHERE cpf = v_cpf_resp; 

  DBMS_OUTPUT.PUT_LINE('--- Lista de Dependentes de ' || v_nome_resp || ' ---');

  FOR rec IN (SELECT nome FROM Dependente WHERE cpf_responsavel = v_cpf_resp) LOOP
    DBMS_OUTPUT.PUT_LINE('> ' || rec.nome);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('--- Fim da Lista ---');
END;

-- 13. SELECT … INTO está junto com o 7. %ROWTYPE --

-- 14. CURSOR (OPEN, FETCH e CLOSE)
DECLARE
  CURSOR c_produtos_baixo_estoque IS
    SELECT titulo, estoque
    FROM Produto
    WHERE estoque <= 5;

  v_titulo  Produto.titulo%TYPE;
  v_estoque Produto.estoque%TYPE;

BEGIN
  DBMS_OUTPUT.PUT_LINE('Relatório de Produtos com Baixo Estoque:');
  
  OPEN c_produtos_baixo_estoque;
  LOOP
    FETCH c_produtos_baixo_estoque INTO v_titulo, v_estoque;
    EXIT WHEN c_produtos_baixo_estoque%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('-> Produto: "' || v_titulo || '" | Estoque: ' || v_estoque);
  END LOOP;
  CLOSE c_produtos_baixo_estoque;
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocorreu um erro no teste do cursor: ' || SQLERRM);
    IF c_produtos_baixo_estoque%ISOPEN THEN
      CLOSE c_produtos_baixo_estoque;
    END IF;
END;

-- 15. EXCEPTION WHEN
DECLARE
  v_cpf_teste Pessoa.cpf%TYPE := '100.000.000-00';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Tentando inserir CPF duplicado: ' || v_cpf_teste);

  INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco)
  VALUES (v_cpf_teste, 'Pessoa Teste', 'H', SYSDATE, '55580-000', 101);

  DBMS_OUTPUT.PUT_LINE('Pessoa inserida com sucesso (isso não deve acontecer).');
  COMMIT;

EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('-> SUCESSO: Exceção DUP_VAL_ON_INDEX capturada corretamente.');
    ROLLBACK;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ocorreu um erro inesperado no teste de exceção: ' || SQLERRM);
    ROLLBACK;
END;
/

-- 16. USO DE PARÂMETROS (IN, OUT)
CREATE OR REPLACE PROCEDURE obter_dados_cliente (
  p_cpf_cliente   IN  Pessoa.cpf%TYPE,
  p_nome_cliente  OUT Pessoa.nome%TYPE,
  p_cidade_cliente OUT Endereco.cidade%TYPE
) IS
BEGIN
  SELECT p.nome, e.cidade
  INTO   p_nome_cliente, p_cidade_cliente
  FROM   Pessoa p
  JOIN   Endereco e ON p.cep = e.cep AND p.num_endereco = e.num_endereco
  WHERE  p.cpf = p_cpf_cliente;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    p_nome_cliente := 'Cliente não encontrado para o CPF informado.';
    p_cidade_cliente := NULL;
  WHEN OTHERS THEN
    p_nome_cliente := 'Ocorreu um erro na consulta.';
    p_cidade_cliente := NULL;
END obter_dados_cliente;
/

-- Bloco de teste para a procedure
DECLARE
  v_nome   Pessoa.nome%TYPE;
  v_cidade Endereco.cidade%TYPE;
  v_cpf_teste Pessoa.cpf%TYPE := '200.000.000-00';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Chamando procedure para o CPF: ' || v_cpf_teste);
  
  obter_dados_cliente(v_cpf_teste, v_nome, v_cidade);
  
  DBMS_OUTPUT.PUT_LINE('-> Nome retornado: ' || v_nome);
  DBMS_OUTPUT.PUT_LINE('-> Cidade retornada: ' || v_cidade);
END;
/

-- 17. CREATE OR REPLACE PACKAGE (SPECIFICATION)
CREATE OR REPLACE PACKAGE pkg_gerenciamento_locadora AS
  PROCEDURE registrar_aluguel (
    p_cpf_funcionario IN Funcionario.cpf_f%TYPE,
    p_cpf_cliente     IN Cliente.cpf_c%TYPE,
    p_id_produto      IN Produto.id%TYPE,
    p_forma_pgmto     IN Aluga.forma_pgmto%TYPE,
    p_preco           IN Aluga.preco%TYPE
  );

  FUNCTION calcular_multa (
    p_cpf_cliente     IN Cliente.cpf_c%TYPE,
    p_id_produto      IN Produto.id%TYPE
  ) RETURN NUMBER;
END pkg_gerenciamento_locadora;
/

-- 18. CREATE OR REPLACE PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY pkg_gerenciamento_locadora AS
  PROCEDURE registrar_aluguel (
    p_cpf_funcionario IN Funcionario.cpf_f%TYPE,
    p_cpf_cliente     IN Cliente.cpf_c%TYPE,
    p_id_produto      IN Produto.id%TYPE,
    p_forma_pgmto     IN Aluga.forma_pgmto%TYPE,
    p_preco           IN Aluga.preco%TYPE
  ) IS
    v_num_conta Conta.num%TYPE;
    v_estoque   Produto.estoque%TYPE;
  BEGIN
    SELECT estoque INTO v_estoque FROM Produto WHERE id = p_id_produto;
    IF v_estoque <= 0 THEN
      RAISE_APPLICATION_ERROR(-20005, 'Produto sem estoque disponível.');
    END IF;

    SELECT num INTO v_num_conta FROM Conta WHERE cpf_cc = p_cpf_cliente;

    INSERT INTO Aluga (cpf_f, num, cpf_cli, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao)
    VALUES (p_cpf_funcionario, v_num_conta, p_cpf_cliente, p_id_produto, SYSDATE, 0, p_preco, p_forma_pgmto, SYSDATE + 7);

    COMMIT;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20006, 'Cliente ou Produto não encontrado.');
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE;
  END registrar_aluguel;

  FUNCTION calcular_multa (
    p_cpf_cliente     IN Cliente.cpf_c%TYPE,
    p_id_produto      IN Produto.id%TYPE
  ) RETURN NUMBER IS
    v_prazo_devolucao DATE;
    v_dias_atraso     NUMBER;
    v_multa           NUMBER := 0;
  BEGIN
    SELECT prazo_devolucao
    INTO v_prazo_devolucao
    FROM Aluga
    WHERE cpf_cli = p_cpf_cliente AND id = p_id_produto
    ORDER BY data_inicio DESC
    FETCH FIRST 1 ROW ONLY;

    v_dias_atraso := TRUNC(SYSDATE) - TRUNC(v_prazo_devolucao);

    IF v_dias_atraso > 0 THEN
      v_multa := v_dias_atraso * 2.50;
    END IF;

    RETURN v_multa;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN 0;
  END calcular_multa;
END pkg_gerenciamento_locadora;
/

-- 19. CREATE OR REPLACE TRIGGER (COMANDO)
CREATE OR REPLACE TRIGGER trg_protege_cargo
BEFORE INSERT OR UPDATE OR DELETE ON Cargo
BEGIN
  RAISE_APPLICATION_ERROR(-20010, 'A tabela CARGO é crítica e não pode ser modificada diretamente.');
END;
/

-- 20. CREATE OR REPLACE TRIGGER (LINHA)
CREATE OR REPLACE TRIGGER trg_atualiza_aluguel
AFTER INSERT ON Aluga
FOR EACH ROW
BEGIN
  UPDATE Produto
  SET estoque = estoque - 1,
      qnt_alugada = qnt_alugada + 1
  WHERE id = :NEW.id;

  UPDATE Funcionario
  SET num_alugueis = num_alugueis + 1
  WHERE cpf_f = :NEW.cpf_f;

  UPDATE Conta
  SET qnt_alugada = qnt_alugada + 1
  WHERE num = :NEW.num AND cpf_cc = :NEW.cpf_cli;

EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20015, 'Falha ao atualizar os contadores de aluguel. A operação foi cancelada.');
END;
/

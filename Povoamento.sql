-- POVOAMENTO -- 

/*
Tabelas:

1. Pessoa
2. Endereco
3. Telefone
4. Email
5. Cliente
6. Dependente
7. Funcionario
8. Cargo
9. Produto
10. Genero_produto
11. Produtora_produto
12. Criadores_produto
13. Bonus
14. Conta
15. Ganha
16. Avalia
17. Avalia2
18. Aluga
*/

-- Tabela Endereco
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('55580-000', 101, NULL, 'Av. Brasil', 'Centro', 'Recife');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('20040-004', 45, NULL, 'Rua das Laranjeiras', 'Santo Amaro', 'Recife');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('01311-200', 3302, 'Apto 102', 'Rua Augusta', 'CDU', 'Recife');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('70160-900', 78, NULL, 'SQS 308', 'Várzea', 'Recife');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('40020-090', 554, NULL, 'Av. Sete de Setembro', 'Centro', 'Recife');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('30140-072', 120, NULL, 'Rua da Bahia', 'Madalena', 'Recife');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('80230-010', 211, NULL, 'Rua Itacolomi', 'Várzea', 'Recife');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('69037-042', 95, NULL, 'Av. Torquato Tapajós', 'CDU', 'Recife');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('29055-310', 809, NULL, 'Rua Alegria', 'Brasilit', 'Recife');

INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('51020-000', 500, NULL, 'Rua Barão de Souza Leão', 'Boa Viagem', 'Recife');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('11060-001', 152, NULL, 'Av. Ana Costa', 'Gonzaga', 'Santos');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('41820-020', 310, NULL, 'Rua Barão de Itapoan', 'CDU', 'Recife');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade)VALUES ('52011-230', 87, NULL, 'Rua Amélia', 'Graças', 'Recife');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade)VALUES ('52061-000', 142, NULL, 'Rua Casa Forte', 'Várzea', 'Recife');

-- Tabela Pessoa
-- Clientes
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('100.000.000-00', 'Lucas Souza', 'H', TO_DATE('15/11/1980','DD/MM/YYYY'), '55580-000', 101);
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('200.000.000-00', 'Julia Santos', 'M', TO_DATE('22/08/1998','DD/MM/YYYY'), '20040-004', 45);
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('300.000.000-00', 'Gabriel Costa', 'H', TO_DATE('30/07/2001','DD/MM/YYYY'), '01311-200', 3302);
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('400.000.000-00', 'Isabella Gonçalves', 'M', TO_DATE('03/11/1997','DD/MM/YYYY'), '70160-900', 78);
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('500.000.000-00', 'Matheus Rodrigues', 'H', TO_DATE('19/02/2003','DD/MM/YYYY'), '40020-090', 554);
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('600.000.000-00', 'Laura Almeida', 'M', TO_DATE('25/09/1985','DD/MM/YYYY'), '30140-072', 120);
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('700.000.000-00', 'Bruno Carvalho', 'H', TO_DATE('12/06/1990','DD/MM/YYYY'), '80230-010', 211);
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('800.000.000-00', 'Beatriz Pereira', 'M', TO_DATE('08/04/1999','DD/MM/YYYY'), '69037-042', 95);
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('900.000.000-00', 'Felipe Ribeiro', 'H', TO_DATE('14/12/2005','DD/MM/YYYY'), '29055-310', 809);

-- Funcionários
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('110.000.000-00', 'Carla Mendes', 'M', TO_DATE('18/05/1988','DD/MM/YYYY'), '51020-000', 500);
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('120.000.000-00', 'Fernanda Lima', 'M', TO_DATE('20/09/1992','DD/MM/YYYY'), '11060-001', 152);
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('130.000.000-00', 'Ricardo Almeida', 'H', TO_DATE('05/02/1979','DD/MM/YYYY'), '41820-020', 310);
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('140.000.000-00', 'Amanda Oliveira', 'M', TO_DATE('15/03/1990','DD/MM/YYYY'), '52011-230', 87);
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereco) VALUES ('150.000.000-00', 'Patrícia Silva', 'M', TO_DATE('22/07/1985','DD/MM/YYYY'), '52061-000', 142);

-- Tabela Telefone
INSERT INTO Telefone (cpf_t, telefone) VALUES ('100.000.000-00', '81999999999');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('100.000.000-00', '81988888888');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('200.000.000-00', '21999999999');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('300.000.000-00', '11988887777');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('300.000.000-00', '11977776666');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('400.000.000-00', '61999995555');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('500.000.000-00', '71999996666');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('600.000.000-00', '31988885555');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('600.000.000-00', '31977774444');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('700.000.000-00', '41966664444');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('800.000.000-00', '92955552222');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('900.000.000-00', '27944441111');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('110.000.000-00', '81933331111');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('120.000.000-00', '13922223333');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('130.000.000-00', '71911112222');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('130.000.000-00', '71900001111');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('140.000.000-00', '81977776666');
INSERT INTO Telefone (cpf_t, telefone) VALUES ('150.000.000-00', '13988889999');

-- Tabela Cliente
INSERT INTO Cliente (cpf_c, cpf_indicador) VALUES ('100.000.000-00', NULL);
INSERT INTO Cliente (cpf_c, cpf_indicador) VALUES ('200.000.000-00', '100.000.000-00');
INSERT INTO Cliente (cpf_c, cpf_indicador) VALUES ('300.000.000-00', '100.000.000-00');
INSERT INTO Cliente (cpf_c, cpf_indicador) VALUES ('400.000.000-00', '200.000.000-00');
INSERT INTO Cliente (cpf_c, cpf_indicador) VALUES ('500.000.000-00', '300.000.000-00');
INSERT INTO Cliente (cpf_c, cpf_indicador) VALUES ('600.000.000-00', '200.000.000-00');
INSERT INTO Cliente (cpf_c, cpf_indicador) VALUES ('700.000.000-00', '100.000.000-00');
INSERT INTO Cliente (cpf_c, cpf_indicador) VALUES ('800.000.000-00', '400.000.000-00');
INSERT INTO Cliente (cpf_c, cpf_indicador) VALUES ('900.000.000-00', '600.000.000-00');

-- Tabela Email
INSERT INTO Email (cpf_e, email) VALUES ('100.000.000-00', 'lucas.souza@email.com');
INSERT INTO Email (cpf_e, email) VALUES ('100.000.000-00', 'lucas.souza2@email.com');
INSERT INTO Email (cpf_e, email) VALUES ('200.000.000-00', 'julia.santos@email.com');
INSERT INTO Email (cpf_e, email) VALUES ('300.000.000-00', 'gabriel.costa@email.com');
INSERT INTO Email (cpf_e, email) VALUES ('300.000.000-00', 'gabriel.costa2@email.com');
INSERT INTO Email (cpf_e, email) VALUES ('400.000.000-00', 'isabella.g@email.com');
INSERT INTO Email (cpf_e, email) VALUES ('500.000.000-00', 'matheus.r@email.com');
INSERT INTO Email (cpf_e, email) VALUES ('600.000.000-00', 'laura.almeida@email.com');
INSERT INTO Email (cpf_e, email) VALUES ('600.000.000-00', 'laura.a@email.com');
INSERT INTO Email (cpf_e, email) VALUES ('700.000.000-00', 'bruno.c@email.com');
INSERT INTO Email (cpf_e, email) VALUES ('800.000.000-00', 'beatriz.p@email.com');
INSERT INTO Email (cpf_e, email) VALUES ('900.000.000-00', 'felipe.r@email.com');

-- Tabela Dependente
INSERT INTO Dependente (cpf_responsavel, num_seq, nome) VALUES ('100.000.000-00', 1, 'Ana Souza');
INSERT INTO Dependente (cpf_responsavel, num_seq, nome) VALUES ('600.000.000-00', 1, 'Pedro Almeida');
INSERT INTO Dependente (cpf_responsavel, num_seq, nome) VALUES ('700.000.000-00', 1, 'Clara Carvalho');
INSERT INTO Dependente (cpf_responsavel, num_seq, nome) VALUES ('700.000.000-00', 2, 'Guilherme Carvalho');

-- Tabela Cargo
INSERT INTO Cargo (titulo, salario) VALUES ('Funcionário', 2500);
INSERT INTO Cargo (titulo, salario) VALUES ('Supervisor', 4500);

-- Tabela Funcionario
INSERT INTO Funcionario (num_alugueis, cpf_f, cargo, cpf_s) VALUES (4, '110.000.000-00', 'Supervisor', NULL);
INSERT INTO Funcionario (num_alugueis, cpf_f, cargo, cpf_s) VALUES (5, '120.000.000-00', 'Funcionário', '110.000.000-00');
INSERT INTO Funcionario (num_alugueis, cpf_f, cargo, cpf_s) VALUES (5, '130.000.000-00', 'Funcionário', '110.000.000-00');
INSERT INTO Funcionario (num_alugueis, cpf_f, cargo, cpf_s) VALUES (4, '140.000.000-00', 'Supervisor', '110.000.000-00');
INSERT INTO Funcionario (num_alugueis, cpf_f, cargo, cpf_s) VALUES (3, '150.000.000-00', 'Funcionário', '110.000.000-00');

-- Tabela Produto
DECLARE
    v_id NUMBER;
BEGIN
    -- Produto 1
    INSERT INTO Produto(id, titulo, tamanho, lancamento, estoque, qnt_alugada)
    VALUES (id.NEXTVAL, 'Vingadores: Ultimato', '181', TO_DATE('26/04/2019','DD/MM/YYYY'), 10, 2)
    RETURNING id INTO v_id;
    INSERT INTO Genero_produto VALUES (v_id, 'Ação');
    INSERT INTO Genero_produto VALUES (v_id, 'Ficção');
    INSERT INTO Produtora_produto VALUES (v_id, 'Marvel Studios');
    INSERT INTO Criadores_produto VALUES (v_id, 'Anthony Russo');

    -- Produto 2
    INSERT INTO Produto(id, titulo, tamanho, lancamento, estoque, qnt_alugada)
    VALUES (id.NEXTVAL, 'O Rei Leão', '118', TO_DATE('19/07/2019','DD/MM/YYYY'), 5, 1)
    RETURNING id INTO v_id;
    INSERT INTO Genero_produto VALUES (v_id, 'Animação');
    INSERT INTO Produtora_produto VALUES (v_id, 'Disney');
    INSERT INTO Criadores_produto VALUES (v_id, 'Jon Favreau');

    -- Produto 3
    INSERT INTO Produto(id, titulo, tamanho, lancamento, estoque, qnt_alugada)
    VALUES (id.NEXTVAL, 'Interstellar', '169', TO_DATE('07/11/2014','DD/MM/YYYY'), 8, 3)
    RETURNING id INTO v_id;
    INSERT INTO Genero_produto VALUES (v_id, 'Ficção Científica');
    INSERT INTO Produtora_produto VALUES (v_id, 'Paramount Pictures');
    INSERT INTO Criadores_produto VALUES (v_id, 'Christopher Nolan');

    -- Produto 4
    INSERT INTO Produto(id, titulo, tamanho, lancamento, estoque, qnt_alugada)
    VALUES (id.NEXTVAL, 'Joker', '122', TO_DATE('04/10/2019','DD/MM/YYYY'), 7, 2)
    RETURNING id INTO v_id;
    INSERT INTO Genero_produto VALUES (v_id, 'Drama');
    INSERT INTO Genero_produto VALUES (v_id, 'Suspense');
    INSERT INTO Produtora_produto VALUES (v_id, 'Warner Bros.');
    INSERT INTO Criadores_produto VALUES (v_id, 'Todd Phillips');

    -- Produto 5
    INSERT INTO Produto(id, titulo, tamanho, lancamento, estoque, qnt_alugada)
    VALUES (id.NEXTVAL, 'The Matrix', '136', TO_DATE('31/03/1999','DD/MM/YYYY'), 6, 4)
    RETURNING id INTO v_id;
    INSERT INTO Genero_produto VALUES (v_id, 'Ação');
    INSERT INTO Genero_produto VALUES (v_id, 'Ficção Científica');
    INSERT INTO Produtora_produto VALUES (v_id, 'Warner Bros.');
    INSERT INTO Criadores_produto VALUES (v_id, 'Lana Wachowski');

    -- Produto 6
    INSERT INTO Produto(id, titulo, tamanho, lancamento, estoque, qnt_alugada)
    VALUES (id.NEXTVAL, '1984', '328', TO_DATE('08/06/1949','DD/MM/YYYY'), 12, 5)
    RETURNING id INTO v_id;
    INSERT INTO Genero_produto VALUES (v_id, 'Ficção Científica');
    INSERT INTO Produtora_produto VALUES (v_id, 'Companhia das Letras');
    INSERT INTO Criadores_produto VALUES (v_id, 'George Orwell');

    -- Produto 7
    INSERT INTO Produto(id, titulo, tamanho, lancamento, estoque, qnt_alugada)
    VALUES (id.NEXTVAL, 'O Senhor dos Anéis: A Sociedade do Anel', '576', TO_DATE('29/07/1954','DD/MM/YYYY'), 9, 2)
    RETURNING id INTO v_id;
    INSERT INTO Genero_produto VALUES (v_id, 'Fantasia');
    INSERT INTO Produtora_produto VALUES (v_id, 'HarperCollins');
    INSERT INTO Criadores_produto VALUES (v_id, 'J.R.R. Tolkien');

    -- Produto 8
    INSERT INTO Produto(id, titulo, tamanho, lancamento, estoque, qnt_alugada)
    VALUES (id.NEXTVAL, 'O Hobbit', '336', TO_DATE('21/09/1937','DD/MM/YYYY'), 7, 1)
    RETURNING id INTO v_id;
    INSERT INTO Genero_produto VALUES (v_id, 'Fantasia');
    INSERT INTO Produtora_produto VALUES (v_id, 'HarperCollins');
    INSERT INTO Criadores_produto VALUES (v_id, 'J.R.R. Tolkien');

    -- Produto 9
    INSERT INTO Produto(id, titulo, tamanho, lancamento, estoque, qnt_alugada)
    VALUES (id.NEXTVAL, 'Dom Quixote', '863', TO_DATE('16/01/1605','DD/MM/YYYY'), 5, 0)
    RETURNING id INTO v_id;
    INSERT INTO Genero_produto VALUES (v_id, 'Clássico');
    INSERT INTO Produtora_produto VALUES (v_id, 'Editora 34');
    INSERT INTO Criadores_produto VALUES (v_id, 'Miguel de Cervantes');

    -- Produto 10
    INSERT INTO Produto(id, titulo, tamanho, lancamento, estoque, qnt_alugada)
    VALUES (id.NEXTVAL, 'A Menina que Roubava Livros', '480', TO_DATE('14/03/2005','DD/MM/YYYY'), 6, 1)
    RETURNING id INTO v_id;
    INSERT INTO Genero_produto VALUES (v_id, 'Drama');
    INSERT INTO Produtora_produto VALUES (v_id, 'Intrínseca');
    INSERT INTO Criadores_produto VALUES (v_id, 'Markus Zusak');
END;
/

-- Tabela Bonus
INSERT INTO Bonus (id_bonus, valor) VALUES (1, 10.00);
INSERT INTO Bonus (id_bonus, valor) VALUES (2, 20.00);

-- Tabela Conta
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (num.NEXTVAL, '100.000.000-00', 100.00, 4);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (num.NEXTVAL, '200.000.000-00', 150.00, 2);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (num.NEXTVAL, '300.000.000-00', 200.00, 3);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (num.NEXTVAL, '400.000.000-00', 80.00, 2);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (num.NEXTVAL, '500.000.000-00', 90.00, 1);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (num.NEXTVAL, '600.000.000-00', 110.00, 2);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (num.NEXTVAL, '700.000.000-00', 130.00, 2);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (num.NEXTVAL, '800.000.000-00', 95.00, 3);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (num.NEXTVAL, '900.000.000-00', 50.00, 2);

-- Tabela Ganha
INSERT INTO Ganha (num_conta, id_bonus) VALUES (1, 1);
INSERT INTO Ganha (num_conta, id_bonus) VALUES (2, 2);
INSERT INTO Ganha (num_conta, id_bonus) VALUES (5, 1);

-- Tabela Avalia
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('100.000.000-00', 1, 9.0);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('200.000.000-00', 1, 8.5);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('300.000.000-00', 1, 8.0);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('200.000.000-00', 7, 9.5);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('300.000.000-00', 3, 9.5);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('500.000.000-00', 3, 7.5);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('400.000.000-00', 4, 8.0);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('500.000.000-00', 4, 9.0);

-- Tabela Avalia2
INSERT INTO Avalia2 (cpf_responsavel, num_seq, id, valor) VALUES ('100.000.000-00', 1, 2, 8.5);
INSERT INTO Avalia2 (cpf_responsavel, num_seq, id, valor) VALUES ('100.000.000-00', 1, 7, 7.0);
INSERT INTO Avalia2 (cpf_responsavel, num_seq, id, valor) VALUES ('600.000.000-00', 1, 3, 9.0);
INSERT INTO Avalia2 (cpf_responsavel, num_seq, id, valor) VALUES ('600.000.000-00', 1, 8, 8.0);
INSERT INTO Avalia2 (cpf_responsavel, num_seq, id, valor) VALUES ('700.000.000-00', 2, 2, 10.0);

-- Tabela Aluga
-- p1
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('110.000.000-00', 1, 1, TO_DATE('01/06/2025','DD/MM/YYYY'), 0, 15.00, 'Cartão de Crédito', TO_DATE('08/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('140.000.000-00', 3, 1, TO_DATE('02/06/2025','DD/MM/YYYY'), 0, 15.00, 'Cartão de Débito', TO_DATE('09/06/2025','DD/MM/YYYY'));

-- p2
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('110.000.000-00', 6, 2, TO_DATE('03/06/2025','DD/MM/YYYY'), 0, 12.00, 'Dinheiro', TO_DATE('10/06/2025','DD/MM/YYYY'));

-- p3
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('120.000.000-00', 3, 3, TO_DATE('05/06/2025','DD/MM/YYYY'), 5.00, 18.00, 'Pix', TO_DATE('12/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('150.000.000-00', 1, 3, TO_DATE('04/06/2025','DD/MM/YYYY'), 0, 18.00, 'Pix', TO_DATE('11/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('120.000.000-00', 7, 3, TO_DATE('05/06/2025','DD/MM/YYYY'), 3.00, 18.00, 'Dinheiro', TO_DATE('12/06/2025','DD/MM/YYYY'));

-- p4
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('120.000.000-00', 4, 4, TO_DATE('06/06/2025','DD/MM/YYYY'), 0, 10.00, 'Cartão de Débito', TO_DATE('13/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('130.000.000-00', 8, 4, TO_DATE('05/06/2025','DD/MM/YYYY'), 0, 10.00, 'Cartão de Crédito', TO_DATE('12/06/2025','DD/MM/YYYY'));

-- p5
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('140.000.000-00', 5, 5, TO_DATE('06/06/2025','DD/MM/YYYY'), 0, 12.00, 'Boleto', TO_DATE('13/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('150.000.000-00', 8, 5, TO_DATE('07/06/2025','DD/MM/YYYY'), 0, 12.00, 'Cartão de Débito', TO_DATE('14/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('110.000.000-00', 9, 5, TO_DATE('08/06/2025','DD/MM/YYYY'), 5.00, 12.00, 'Pix', TO_DATE('15/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('130.000.000-00', 1, 5, TO_DATE('07/06/2025','DD/MM/YYYY'), 2.00, 12.00, 'Boleto', TO_DATE('14/06/2025','DD/MM/YYYY'));

-- p6
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('130.000.000-00', 1, 6, TO_DATE('08/06/2025','DD/MM/YYYY'), 0, 8.00, 'Cartão de Crédito', TO_DATE('15/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('120.000.000-00', 6, 6, TO_DATE('03/06/2025','DD/MM/YYYY'), 0, 8.00, 'Dinheiro', TO_DATE('10/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('130.000.000-00', 2, 6, TO_DATE('04/06/2025','DD/MM/YYYY'), 0, 8.00, 'Cartão de Crédito', TO_DATE('11/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('140.000.000-00', 3, 6, TO_DATE('05/06/2025','DD/MM/YYYY'), 2.00, 8.00, 'Boleto', TO_DATE('12/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('150.000.000-00', 4, 6, TO_DATE('06/06/2025','DD/MM/YYYY'), 0, 8.00, 'Cartão de Débito', TO_DATE('13/06/2025','DD/MM/YYYY'));

-- p7
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('110.000.000-00', 7, 7, TO_DATE('07/06/2025','DD/MM/YYYY'), 0, 20.00, 'Pix', TO_DATE('14/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('120.000.000-00', 8, 7, TO_DATE('08/06/2025','DD/MM/YYYY'), 0, 20.00, 'Dinheiro', TO_DATE('15/06/2025','DD/MM/YYYY'));

-- p8 
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('130.000.000-00', 9, 8, TO_DATE('09/06/2025','DD/MM/YYYY'), 0, 15.00, 'Cartão de Crédito', TO_DATE('16/06/2025','DD/MM/YYYY'));

-- p9 

-- p10 
INSERT INTO Aluga (cpf_f, num, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('140.000.000-00', 2, 10, TO_DATE('10/06/2025','DD/MM/YYYY'), 0, 12.00, 'Boleto', TO_DATE('17/06/2025','DD/MM/YYYY'));
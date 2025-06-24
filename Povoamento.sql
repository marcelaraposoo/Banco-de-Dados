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
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('20040-004', 45, NULL, 'Rua das Laranjeiras', 'Botafogo', 'Rio de Janeiro');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('01311-200', 3302, 'Apto 102', 'Rua Augusta', 'Consolação', 'São Paulo');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('70160-900', 78, NULL, 'SQS 308', 'Asa Sul', 'Brasília');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('40020-090', 554, NULL, 'Av. Sete de Setembro', 'Centro', 'Salvador');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('30140-072', 120, NULL, 'Rua da Bahia', 'Lourdes', 'Belo Horizonte');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('80230-010', 211, NULL, 'Rua Itacolomi', 'Cristo Rei', 'Curitiba');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('69037-042', 95, NULL, 'Av. Torquato Tapajós', 'Flores', 'Manaus');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('29055-310', 809, NULL, 'Rua Alegria', 'Centro', 'Vitória');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('51020-000', 500, NULL, 'Rua Barão de Souza Leão', 'Boa Viagem', 'Recife');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('11060-001', 152, NULL, 'Av. Ana Costa', 'Gonzaga', 'Santos');
INSERT INTO Endereco (cep, num_endereco, complemento, rua, bairro, cidade) VALUES ('41820-020', 310, NULL, 'Rua Barão de Itapoan', 'Barra', 'Salvador');

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
INSERT INTO Funcionario (num_alugueis, cpf_f, cargo, cpf_s) VALUES (0, '110.000.000-00', 'Supervisor', '110.000.000-00');
INSERT INTO Funcionario (num_alugueis, cpf_f, cargo, cpf_s) VALUES (0, '120.000.000-00', 'Funcionário', '110.000.000-00');
INSERT INTO Funcionario (num_alugueis, cpf_f, cargo, cpf_s) VALUES (0, '130.000.000-00', 'Funcionário', '110.000.000-00');

-- Tabela Produto
-- Filmes
INSERT INTO Produto (id, titulo, tamanho, lancamento, estoque, qnt_alugada) VALUES (1, 'Vingadores: Ultimato', '181', TO_DATE('26/04/2019','DD/MM/YYYY'), 10, 2);
INSERT INTO Produto (id, titulo, tamanho, lancamento, estoque, qnt_alugada) VALUES (2, 'O Rei Leão', '118', TO_DATE('19/07/2019','DD/MM/YYYY'), 5, 1);
INSERT INTO Produto (id, titulo, tamanho, lancamento, estoque, qnt_alugada) VALUES (3, 'Interstellar', '169', TO_DATE('07/11/2014','DD/MM/YYYY'), 8, 3);
INSERT INTO Produto (id, titulo, tamanho, lancamento, estoque, qnt_alugada) VALUES (4, 'Joker', '122', TO_DATE('04/10/2019','DD/MM/YYYY'), 7, 2);
INSERT INTO Produto (id, titulo, tamanho, lancamento, estoque, qnt_alugada) VALUES (5, 'The Matrix', '136', TO_DATE('31/03/1999','DD/MM/YYYY'), 6, 4);
-- Livros
INSERT INTO Produto (id, titulo, tamanho, lancamento, estoque, qnt_alugada) VALUES (6, '1984', '328', TO_DATE('08/06/1949','DD/MM/YYYY'), 12, 5);
INSERT INTO Produto (id, titulo, tamanho, lancamento, estoque, qnt_alugada) VALUES (7, 'O Senhor dos Anéis: A Sociedade do Anel', '576', TO_DATE('29/07/1954','DD/MM/YYYY'), 9, 3);
INSERT INTO Produto (id, titulo, tamanho, lancamento, estoque, qnt_alugada) VALUES (8, 'O Hobbit', '336', TO_DATE('21/09/1937','DD/MM/YYYY'), 7, 2);
INSERT INTO Produto (id, titulo, tamanho, lancamento, estoque, qnt_alugada) VALUES (9, 'Dom Quixote', '863', TO_DATE('16/01/1605','DD/MM/YYYY'), 5, 1);
INSERT INTO Produto (id, titulo, tamanho, lancamento, estoque, qnt_alugada) VALUES (10, 'A Menina que Roubava Livros', '480', TO_DATE('14/03/2005','DD/MM/YYYY'), 6, 2);

-- Tabela Genero_produto
INSERT INTO Genero_produto (id_produto, genero) VALUES (1, 'Ação');
INSERT INTO Genero_produto (id_produto, genero) VALUES (1, 'Ficção');
INSERT INTO Genero_produto (id_produto, genero) VALUES (2, 'Animação');
INSERT INTO Genero_produto (id_produto, genero) VALUES (3, 'Ficção Científica');
INSERT INTO Genero_produto (id_produto, genero) VALUES (4, 'Drama');
INSERT INTO Genero_produto (id_produto, genero) VALUES (4, 'Suspense');
INSERT INTO Genero_produto (id_produto, genero) VALUES (5, 'Ação');
INSERT INTO Genero_produto (id_produto, genero) VALUES (5, 'Ficção Científica');
INSERT INTO Genero_produto (id_produto, genero) VALUES (6, 'Ficção Científica');
INSERT INTO Genero_produto (id_produto, genero) VALUES (7, 'Fantasia');
INSERT INTO Genero_produto (id_produto, genero) VALUES (8, 'Fantasia');
INSERT INTO Genero_produto (id_produto, genero) VALUES (9, 'Clássico');
INSERT INTO Genero_produto (id_produto, genero) VALUES (10, 'Drama');

-- Tabela Produtora_produto
INSERT INTO Produtora_produto (id_produto, produtora) VALUES (1, 'Marvel Studios');
INSERT INTO Produtora_produto (id_produto, produtora) VALUES (2, 'Disney');
INSERT INTO Produtora_produto (id_produto, produtora) VALUES (3, 'Paramount Pictures');
INSERT INTO Produtora_produto (id_produto, produtora) VALUES (4, 'Warner Bros.');
INSERT INTO Produtora_produto (id_produto, produtora) VALUES (5, 'Warner Bros.');
INSERT INTO Produtora_produto (id_produto, produtora) VALUES (6, 'Companhia das Letras');
INSERT INTO Produtora_produto (id_produto, produtora) VALUES (7, 'HarperCollins');
INSERT INTO Produtora_produto (id_produto, produtora) VALUES (8, 'HarperCollins');
INSERT INTO Produtora_produto (id_produto, produtora) VALUES (9, 'Editora 34');
INSERT INTO Produtora_produto (id_produto, produtora) VALUES (10, 'Intrínseca');

-- Tabela Criadores_produto
INSERT INTO Criadores_produto (id_produto, criadores) VALUES (1, 'Anthony Russo');
INSERT INTO Criadores_produto (id_produto, criadores) VALUES (2, 'Jon Favreau');
INSERT INTO Criadores_produto (id_produto, criadores) VALUES (3, 'Christopher Nolan');
INSERT INTO Criadores_produto (id_produto, criadores) VALUES (4, 'Todd Phillips');
INSERT INTO Criadores_produto (id_produto, criadores) VALUES (5, 'Lana Wachowski');
INSERT INTO Criadores_produto (id_produto, criadores) VALUES (6, 'George Orwell');
INSERT INTO Criadores_produto (id_produto, criadores) VALUES (7, 'J.R.R. Tolkien');
INSERT INTO Criadores_produto (id_produto, criadores) VALUES (8, 'J.R.R. Tolkien');
INSERT INTO Criadores_produto (id_produto, criadores) VALUES (9, 'Miguel de Cervantes');
INSERT INTO Criadores_produto (id_produto, criadores) VALUES (10, 'Markus Zusak');

-- Tabela Bonus
INSERT INTO Bonus (id_bonus, valor) VALUES (1, 10.00);
INSERT INTO Bonus (id_bonus, valor) VALUES (2, 20.00);

-- Tabela Conta
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (1, '100.000.000-00', 100.00, 2);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (2, '200.000.000-00', 150.00, 1);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (3, '300.000.000-00', 200.00, 3);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (4, '400.000.000-00', 80.00, 0);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (5, '500.000.000-00', 90.00, 1);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (6, '600.000.000-00', 110.00, 2);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (7, '700.000.000-00', 130.00, 0);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (8, '800.000.000-00', 95.00, 1);
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES (9, '900.000.000-00', 50.00, 0);

-- Tabela Ganha
INSERT INTO Ganha (num_conta, id_bonus, cpf_g) VALUES (1, 1, '100.000.000-00');
INSERT INTO Ganha (num_conta, id_bonus, cpf_g) VALUES (2, 2, '200.000.000-00');
INSERT INTO Ganha (num_conta, id_bonus, cpf_g) VALUES (3, 1, '300.000.000-00');

-- Tabela Avalia
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('100.000.000-00', 1, 9.0);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('100.000.000-00', 6, 8.5);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('200.000.000-00', 2, 8.0);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('200.000.000-00', 7, 9.5);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('300.000.000-00', 3, 9.5);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('300.000.000-00', 8, 7.5);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('400.000.000-00', 4, 8.0);
INSERT INTO Avalia (cpf_c, id, valor) VALUES ('500.000.000-00', 5, 9.0);

-- Tabela Avalia2
INSERT INTO Avalia2 (cpf_responsavel, num_seq, id, valor) VALUES ('100.000.000-00', 1, 2, 8.5);
INSERT INTO Avalia2 (cpf_responsavel, num_seq, id, valor) VALUES ('100.000.000-00', 1, 7, 7.0);
INSERT INTO Avalia2 (cpf_responsavel, num_seq, id, valor) VALUES ('600.000.000-00', 1, 3, 9.0);
INSERT INTO Avalia2 (cpf_responsavel, num_seq, id, valor) VALUES ('600.000.000-00', 1, 8, 8.0);
INSERT INTO Avalia2 (cpf_responsavel, num_seq, id, valor) VALUES ('700.000.000-00', 2, 2, 10.0);

-- Tbaela Aluga
INSERT INTO Aluga (cpf_f, num, cpf_cli, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('110.000.000-00', 1, '100.000.000-00', 1, TO_DATE('01/06/2025','DD/MM/YYYY'), 0, 15.00, 'Cartão de Crédito', TO_DATE('08/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, cpf_cli, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('110.000.000-00', 2, '200.000.000-00', 2, TO_DATE('03/06/2025','DD/MM/YYYY'), 0, 12.00, 'Dinheiro', TO_DATE('10/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, cpf_cli, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('120.000.000-00', 3, '300.000.000-00', 3, TO_DATE('05/06/2025','DD/MM/YYYY'), 5.00, 18.00, 'Pix', TO_DATE('12/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, cpf_cli, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('120.000.000-00', 4, '400.000.000-00', 4, TO_DATE('06/06/2025','DD/MM/YYYY'), 0, 10.00, 'Cartão de Débito', TO_DATE('13/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, cpf_cli, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('130.000.000-00', 5, '500.000.000-00', 5, TO_DATE('07/06/2025','DD/MM/YYYY'), 2.00, 12.00, 'Boleto', TO_DATE('14/06/2025','DD/MM/YYYY'));
INSERT INTO Aluga (cpf_f, num, cpf_cli, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES ('130.000.000-00', 6, '600.000.000-00', 6, TO_DATE('08/06/2025','DD/MM/YYYY'), 0, 8.00, 'Cartão de Crédito', TO_DATE('15/06/2025','DD/MM/YYYY'));
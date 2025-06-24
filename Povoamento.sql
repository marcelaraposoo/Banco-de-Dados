-- POVOAMENTO -- 

/*
Tabelas:

1.Pessoa
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
INSERT INTO Endereco (cep, num_endereço, complemento, rua, bairro, cidade) VALUES
('55580-000', 101, NULL, 'Av. Brasil', 'Centro', 'Recife'),
('20040-004', 45, NULL, 'Rua das Laranjeiras', 'Botafogo', 'Rio de Janeiro'),
('01311-200', 3302, 'Apto 102', 'Rua Augusta', 'Consolação', 'São Paulo'),
('70160-900', 78, NULL, 'SQS 308', 'Asa Sul', 'Brasília'),
('40020-090', 554, NULL, 'Av. Sete de Setembro', 'Centro', 'Salvador'),
('30140-072', 120, NULL, 'Rua da Bahia', 'Lourdes', 'Belo Horizonte'),
('80230-010', 211, NULL, 'Rua Itacolomi', 'Cristo Rei', 'Curitiba'),
('69037-042', 95, NULL, 'Av. Torquato Tapajós', 'Flores', 'Manaus'),
('29055-310', 809, NULL, 'Rua Alegria', 'Centro', 'Vitória'),
('51020-000', 500, NULL, 'Rua Barão de Souza Leão', 'Boa Viagem', 'Recife'),
('11060-001', 152, NULL, 'Av. Ana Costa', 'Gonzaga', 'Santos'),
('41820-020', 310, NULL, 'Av. Tancredo Neves', 'Caminho das Árvores', 'Salvador');

-- Tabela Pessoa
INSERT INTO Pessoa (cpf, nome, genero, nascimento, cep, num_endereço) VALUES
-- Clientes
('100.000.000-00', 'Lucas Souza', 'H', TO_DATE('15/11/1980','DD/MM/YYYY'), '55580-000', 101),
('200.000.000-00', 'Julia Santos', 'M', TO_DATE('22/08/1998','DD/MM/YYYY'), '20040-004', 45),
('300.000.000-00', 'Gabriel Costa', 'H', TO_DATE('30/07/2001','DD/MM/YYYY'), '01311-200', 3302),
('400.000.000-00', 'Isabella Gonçalves', 'M', TO_DATE('03/11/1997','DD/MM/YYYY'), '70160-900', 78),
('500.000.000-00', 'Matheus Rodrigues', 'H', TO_DATE('19/02/2003','DD/MM/YYYY'), '40020-090', 554),
('600.000.000-00', 'Laura Almeida', 'M', TO_DATE('25/09/1985','DD/MM/YYYY'), '30140-072', 120),
('700.000.000-00', 'Bruno Carvalho', 'H', TO_DATE('12/06/1990','DD/MM/YYYY'), '80230-010', 211),
('800.000.000-00', 'Beatriz Pereira', 'M', TO_DATE('08/04/1999','DD/MM/YYYY'), '69037-042', 95),
('900.000.000-00', 'Felipe Ribeiro', 'H', TO_DATE('14/12/2005','DD/MM/YYYY'), '29055-310', 809),
-- Funcionários
('110.000.000-00', 'Carla Mendes', 'M', TO_DATE('18/05/1988','DD/MM/YYYY'), '51020-000', 500),
('120.000.000-00', 'Fernanda Lima', 'M', TO_DATE('20/09/1992','DD/MM/YYYY'), '11060-001', 152),
('130.000.000-00', 'Ricardo Almeida', 'H', TO_DATE('05/02/1979','DD/MM/YYYY'), '41820-020', 310);

-- Tabela Telefone
INSERT INTO Telefone (cpf_t, telefone) VALUES
('100.000.000-00', '81999999999'),
('100.000.000-00', '81988888888'),
('200.000.000-00', '21999999999'),
('300.000.000-00', '11988887777'),
('300.000.000-00', '11977776666'),
('400.000.000-00', '61999995555'),
('500.000.000-00', '71999996666'),
('600.000.000-00', '31988885555'),
('600.000.000-00', '31977774444'),
('700.000.000-00', '41966664444'),
('800.000.000-00', '92955552222'),
('900.000.000-00', '27944441111'),
('110.000.000-00', '81933331111'),
('120.000.000-00', '13922223333'),
('130.000.000-00', '71911112222'),
('130.000.000-00', '71900001111');

-- Tabela Cliente
INSERT INTO Cliente (cpf_c, cpf_indicador) VALUES
('100.000.000-00', NULL),
('200.000.000-00', '100.000.000-00'),
('300.000.000-00', '100.000.000-00'),
('400.000.000-00', '200.000.000-00'),
('500.000.000-00', '300.000.000-00'),
('600.000.000-00', '200.000.000-00'),
('700.000.000-00', '100.000.000-00'),
('800.000.000-00', '400.000.000-00'),
('900.000.000-00', '600.000.000-00');

-- Tabela Email
INSERT INTO Email (cpf_e, email) VALUES
('100.000.000-00', 'lucas.souza@email.com'),
('100.000.000-00', 'lucas.souza2@email.com'),
('200.000.000-00', 'julia.santos@email.com'),
('300.000.000-00', 'gabriel.costa@email.com'),
('300.000.000-00', 'gabriel.costa2@email.com'),
('400.000.000-00', 'isabella.g@email.com'),
('500.000.000-00', 'matheus.r@email.com'),
('600.000.000-00', 'laura.almeida@email.com'),
('600.000.000-00', 'laura.a@email.com'),
('700.000.000-00', 'bruno.c@email.com'),
('800.000.000-00', 'beatriz.p@email.com'),
('900.000.000-00', 'felipe.r@email.com');

-- Tabela Dependente
INSERT INTO Dependente (cpf_responsavel, num_seq, nome) VALUES
('100.000.000-00', 1, 'Ana Souza'),
('600.000.000-00', 1, 'Pedro Almeida'),
('700.000.000-00', 1, 'Clara Carvalho'),
('700.000.000-00', 2, 'Guilherme Carvalho')

-- Tabela Cargo
INSERT INTO Cargo (titulo, salario) VALUES
('Funcionário', 2500),
('Supervisor', 4500);

-- Tabela Funcionario
INSERT INTO Funcionario (num_alugueis, cpf_f, cargo, cpf_s) VALUES
(0, '110.000.000-00', 'Supervisor', '110.000.000-00'),
(0, '120.000.000-00', 'Funcionário', '110.000.000-00'),
(0, '130.000.000-00', 'Funcionário', '110.000.000-00');

-- Tabela Produto
INSERT INTO Produto (id, titulo, tamanho, lancamento, estoque, qnt_alugada) VALUES
-- Filmes
(1, 'Vingadores: Ultimato', '181', TO_DATE('26/04/2019','DD/MM/YYYY'), 10, 2),
(2, 'O Rei Leão', '118', TO_DATE('19/07/2019','DD/MM/YYYY'), 5, 1),
(3, 'Interstellar', '169', TO_DATE('07/11/2014','DD/MM/YYYY'), 8, 3),
(4, 'Joker', '122', TO_DATE('04/10/2019','DD/MM/YYYY'), 7, 2),
(5, 'The Matrix', '136', TO_DATE('31/03/1999','DD/MM/YYYY'), 6, 4),
-- Livros
(6, '1984', '328', TO_DATE('08/06/1949','DD/MM/YYYY'), 12, 5),
(7, 'O Senhor dos Anéis: A Sociedade do Anel', '576', TO_DATE('29/07/1954','DD/MM/YYYY'), 9, 3),
(8, 'O Hobbit', '336', TO_DATE('21/09/1937','DD/MM/YYYY'), 7, 2),
(9, 'Dom Quixote', '863', TO_DATE('16/01/1605','DD/MM/YYYY'), 5, 1),
(10, 'A Menina que Roubava Livros', '480', TO_DATE('14/03/2005','DD/MM/YYYY'), 6, 2);

-- Tabela Genero_produto
INSERT INTO Genero_produto (id_produto, genero) VALUES
-- Filmes
(1, 'Ação'),
(1, 'Ficção'),
(2, 'Animação'),
(3, 'Ficção Científica'),
(4, 'Drama'),
(4, 'Suspense'),
(5, 'Ação'),
(5, 'Ficção Científica'),
-- Livros
(6, 'Ficção Científica'),
(7, 'Fantasia'),
(8, 'Fantasia'),
(9, 'Clássico'),
(10, 'Drama');

-- Tabela Produtora_produto
INSERT INTO Produtora_produto (id_produto, produtora) VALUES
-- Filmes
(1, 'Marvel Studios'),
(2, 'Disney'),
(3, 'Paramount Pictures'),
(4, 'Warner Bros.'),
(5, 'Warner Bros.'),
-- Livros
(6, 'Companhia das Letras'),
(7, 'HarperCollins'),
(8, 'HarperCollins'),
(9, 'Editora 34'),
(10, 'Intrínseca');

-- Tabela Criadores_produto
INSERT INTO Criadores_produto (id_produto, criadores) VALUES
-- Filmes
(1, 'Anthony Russo'),
(2, 'Jon Favreau'),
(3, 'Christopher Nolan'),
(4, 'Todd Phillips'),
(5, 'Lana Wachowski'),
-- Livros
(6, 'George Orwell'),
(7, 'J.R.R. Tolkien'),
(8, 'J.R.R. Tolkien'),
(9, 'Miguel de Cervantes'),
(10, 'Markus Zusak');

-- Tabela Bonus
INSERT INTO Bonus (id_bonus, valor) VALUES
(1, 10.00),
(2, 20.00);

-- Tabela Conta
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES
(1, '100.000.000-00', 100.00, 2),
(2, '200.000.000-00', 150.00, 1),
(3, '300.000.000-00', 200.00, 3),
(4, '400.000.000-00', 80.00, 0),
(5, '500.000.000-00', 90.00, 1),
(6, '600.000.000-00', 110.00, 2),
(7, '700.000.000-00', 130.00, 0),
(8, '800.000.000-00', 95.00, 1),
(9, '900.000.000-00', 50.00, 0);

-- Tabela Ganha
INSERT INTO Ganha (num_conta, id_bonus, cpf_g) VALUES
(1, 1, '100.000.000-00'),
(2, 2, '200.000.000-00'),
(3, 1, '300.000.000-00');

-- Tabela Avalia
INSERT INTO Avalia (cpf_c, id, valor) VALUES
('100.000.000-00', 1, 9.0),  
('100.000.000-00', 6, 8.5),  
('200.000.000-00', 2, 8.0),  
('200.000.000-00', 7, 9.5),  
('300.000.000-00', 3, 9.5), 
('300.000.000-00', 8, 7.5),
('400.000.000-00', 4, 8.0),
('500.000.000-00', 5, 9.0);  

-- Tabela Avalia2
INSERT INTO Avalia2 (cpf_responsavel, num_seq, id, valor) VALUES
('100.000.000-00', 1, 2, 8.5),
('100.000.000-00', 1, 7, 7.0), 
('600.000.000-00', 1, 3, 9.0), 
('600.000.000-00', 1, 8, 8.0),
('700.000.000-00', 2, 2, 10.0);

INSERT INTO Aluga (cpf_f, num, cpf_cli, id, data_inicio, multa, preco, forma_pgmto, prazo_devolucao) VALUES
-- Supervisor
('110.000.000-00', 1, '100.000.000-00', 1, TO_DATE('01/06/2025','DD/MM/YYYY'), 0, 15.00, 'Cartão de Crédito', TO_DATE('08/06/2025','DD/MM/YYYY')),
('110.000.000-00', 2, '200.000.000-00', 2, TO_DATE('03/06/2025','DD/MM/YYYY'), 0, 12.00, 'Dinheiro', TO_DATE('10/06/2025','DD/MM/YYYY')),
-- Funcionário
('120.000.000-00', 3, '300.000.000-00', 3, TO_DATE('05/06/2025','DD/MM/YYYY'), 5.00, 18.00, 'Pix', TO_DATE('12/06/2025','DD/MM/YYYY')),
('120.000.000-00', 4, '400.000.000-00', 4, TO_DATE('06/06/2025','DD/MM/YYYY'), 0, 10.00, 'Cartão de Débito', TO_DATE('13/06/2025','DD/MM/YYYY')),
-- Funcionário
('130.000.000-00', 5, '500.000.000-00', 5, TO_DATE('07/06/2025','DD/MM/YYYY'), 2.00, 12.00, 'Boleto', TO_DATE('14/06/2025','DD/MM/YYYY')),
('130.000.000-00', 6, '600.000.000-00', 6, TO_DATE('08/06/2025','DD/MM/YYYY'), 0, 8.00, 'Cartão de Crédito', TO_DATE('15/06/2025','DD/MM/YYYY'));

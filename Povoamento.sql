-- REVISAR POVOAMENTO!!!

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

-- Tabela Endereco (deve ser povoada primeiro)
INSERT INTO Endereco (cep, num_endereço, complemento, rua, bairro, cidade) VALUES
('55580-000', '101', NULL, 'Av. Brasil', 'Centro', 'Recife'),
('20040-004', '045', NULL, 'Rua das Laranjeiras', 'Botafogo', 'Rio de Janeiro'),
('01311-200', '3302', 'Apto 102', 'Rua Augusta', 'Consolação', 'São Paulo'),
('70160-900', '078', NULL, 'SQS 308', 'Asa Sul', 'Brasília'),
('40020-090', '554', NULL, 'Av. Sete de Setembro', 'Centro', 'Salvador'),
('30140-072', '120', NULL, 'Rua da Bahia', 'Lourdes', 'Belo Horizonte'),
('80230-010', '211', NULL, 'Rua Itacolomi', 'Cristo Rei', 'Curitiba'),
('69037-042', '095', NULL, 'Av. Torquato Tapajós', 'Flores', 'Manaus'),
('29055-310', '809', NULL, 'Rua Alegria', 'Centro', 'Vitória'),
('51020-000', '500', NULL, 'Rua Barão de Souza Leão', 'Boa Viagem', 'Recife'),
('11060-001', '152', NULL, 'Av. Ana Costa', 'Gonzaga', 'Santos'),
('41820-020', '310', NULL, 'Av. Tancredo Neves', 'Caminho das Árvores', 'Salvador');

-- Tabela Pessoa (Clientes e Funcionários)
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

-- Tabela Cliente
INSERT INTO Cliente (cpf_c, cpf_indicador) VALUES
('100.000.000-00', '100.000.000-00'),
('200.000.000-00', '100.000.000-00'),
('300.000.000-00', '100.000.000-00'),
('400.000.000-00', '200.000.000-00'),
('500.000.000-00', '300.000.000-00');

-- Tabela Dependente
INSERT INTO Dependete (cpf_responsavel, num_seq, nome) VALUES
('100.000.000-00', 1, 'Ana Souza'),
('200.000.000-00', 1, 'Pedro Santos'),
('300.000.000-00', 1, 'Clara Costa');

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
(1, 'Vingadores: Ultimato', 'HD', TO_DATE('26/04/2019','DD/MM/YYYY'), 10, 2),
(2, 'O Rei Leão', 'FullHD', TO_DATE('19/07/2019','DD/MM/YYYY'), 5, 1),
(3, 'Interstellar', '4K', TO_DATE('07/11/2014','DD/MM/YYYY'), 8, 3);

-- Tabela Genero_produto
INSERT INTO Genero_produto (id_produto, genero) VALUES
(1, 'Ação'),
(1, 'Ficção'),
(2, 'Animação'),
(3, 'Ficção Científica');

-- Tabela Produtora_produto
INSERT INTO Produtora_produto (id_produto, produtora) VALUES
(1, 'Marvel Studios'),
(2, 'Disney'),
(3, 'Paramount Pictures');

-- Tabela Criadores_produto
INSERT INTO Criadores_produto (id, criadores) VALUES
(1, 'Anthony Russo'),
(2, 'Jon Favreau'),
(3, 'Christopher Nolan');

-- Tabela Bonus
INSERT INTO Bonus (id, valor) VALUES
(1, 10.00),
(2, 20.00);

-- Tabela Conta
INSERT INTO Conta (num, cpf_cc, credito, qnt_alugada) VALUES
(1, '100.000.000-00', 100.00, 2),
(2, '200.000.000-00', 150.00, 1),
(3, '300.000.000-00', 200.00, 3);

-- Tabela Ganha
INSERT INTO Ganha (num_conta, id_bonus) VALUES
('1', 1),
('2', 2),
('3', 1);

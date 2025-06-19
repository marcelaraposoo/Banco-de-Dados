

--PESSOA
CREATE TABLE Pessoa (
	cpf VARCHAR2(12) NOT NULL,
	nome VARCHAR2(25) NOT NULL,
    genero VARCHAR2(10) NOT NULL, 
	nascimento DATE NOT NULL,
    cep VARCHAR2(8) NOT NULL,
    num_endereço VARCHAR2(4) NOT NULL,
	CONSTRAINT pessoa_pkey PRIMARY KEY (cpf),
    CONSTRAINT cep_fkey FOREIGN KEY (cep, num_endereço) REFERENCES Endereço(cep, num_endereço)
);

CREATE TABLE Endereco(
    cep VARCHAR2(8) NOT NULL,
    num_endereço VARCHAR2(4) NOT NULL,
    complemento VARCHAR2(30),
    rua VARCHAR2(40) NOT NULL,
    bairro VARCHAR2(15)NOT NULL,
    cidade VARCHAR2(15)NOT NULL,
    CONSTRAINT endereco_pkey PRIMARY KEY(cep,num_endereço),
);

CREATE TABLE Telefone(
    cpf_t VARCHAR2(12) NOT NULL,
    telefone VARCHAR2(11) NOT NULL,
    CONSTRAINT telefone_pkey PRIMARY KEY (telefone, cpf_t),
    CONSTRAINT telefone_fkey FOREIGN KEY (cpf_t) REFERENCES Pessoa(cpf),
);

CREATE TABLE Email(
    cpf_e VARCHAR2(12) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    CONSTRAINT email_pkey PRIMARY KEY (cpf_e, email),
    CONSTRAINT email_fkey FOREIGN KEY (cpf_e) REFERENCES Pessoa(cpf),
);

--CLIENTES
CREATE TABLE Cliente( 
    cpf_c VARCHAR2(12) NOT NULL,
    cpf_indicador VARCHAR2(12),
    CONSTRAINT cliente_pkey PRIMARY KEY (cpf_c),
    CONSTRAINT cliente_fkey FOREIGN KEY(cpf_c, cpf_indicador) REFERENCES Cliente(cpf_c)
);

CREATE TABLE Dependete(
    cpf_responsavel VARCHAR2(12) NOT NULL,
    num_seq INTEGER NOT NULL,
    nome VARCHAR2(10) NOT NULL,
    CONSTRAINT dependente_pkey  PRIMARY KEY(cpf_responsavel, num_seq),
    CONSTRAINT dependente_fkey FOREIGN KEY (cpf_responsavel) REFERENCES Cliente(cpf_c)
);


--FUNCIONÁRIO
CREATE SEQUENCE num_alugueis INCREMENT BY 1 START WITH 0;

CREATE TABLE Funcionario(
    num_alugueis INTEGER,
    cpf_f VARCHAR2(12) NOT NULL,
    cargo VARCHAR2(13) NOT NULL,
    cpf_s VARCHAR2(12) NOT NULL,
    CONSTRAINT funcionario_pkey PRIMARY KEY (cpf_f),
    CONSTRAINT funcionario_fkey FOREIGN KEY (cpf_f) REFERENCES Pessoa(cpf),
    CONSTRAINT funcionario_fkey2 FOREIGN KEY (cpf_s) REFERENCES Funcionário(cpf_f),
    CONSTRAINT funcionario_fkey3 FOREIGN KEY (cargo) REFERENCES Cargo(titulo),
);

CREATE TABLE Cargo(
    titulo VARCHAR2(11) CHECK (titulo IN ('Funcionário', 'Supervisor')) NOT NULL,
    salario INTEGER NOT NULL,
    CONSTRAINT cargo_pkey PRIMARY KEY (titulo),
);

-- PRODUTO
CREATE SEQUENCE id INCREMENT BY 1 START WITH 1;
CREATE TABLE Produto(
    id INTEGER NOT NULL,
    titulo VARCHAR2(100) NOT NULL,
    tamanho VARCHAR2(8),
    lancamento DATE,
    estoque INTEGER NOT NULL,
    qnt_alugada INTEGER,
    CONSTRAINT produto_pkey PRIMARY KEY (id),
);

CREATE TABLE Genero_produto(
    id_produto INTEGER NOT NULL, 
    genero VARCHAR2(25) NOT NULL,
    CONSTRAINT gerenero_produto_pkey PRIMARY KEY (id_produto, genero),
    CONSTRAINT genero_produto_fkey FOREIGN KEY (id_produto) REFERENCES Produto(id),
);

CREATE TABLE Produtora_produto(
    id_produto INTEGER NOT NULL,
    produtora VARCHAR2(100) NOT NULL,
    CONSTRAINT produtora_produto_pkey PRIMARY KEY (id_produto, produtora),
    CONSTRAINT produtora_produto_fkey FOREIGN KEY (id_produto) REFERENCES Produto(id),
);

CREATE TABLE Criadores_produto(
    id INTEGER NOT NULL,
    criadores VARCHAR2(100),
    CONSTRAINT criadores_produto_pkey PRIMARY KEY (id_produto, criadores),
    CONSTRAINT criadores_produto_fkey FOREIGN KEY (id_produto) REFERENCES Produto(id)
);


CREATE SEQUENCE id INCREMENT BY 1 START WITH 1;
CREATE TABLE Bonus(
    id INTEGER,
    valor NUMBER  NOT NULL,
    CONSTRAINT bonus_pkey PRIMARY KEY (id)
);



--CONTA
CREATE SEQUENCE num INCREMENT BY 1 START WITH 1;

CREATE TABLE Conta(
    num INTEGER NOT NULL,
    cpf_cc VARCHAR2(12) NOT NULL,
    ---criacao DATE NOT NULL,
    credito NUMBER,
    qnt_alugada INTEGER,
    CONSTRAINT conta_pkey PRIMARY KEY (num,cpf_cc)
    CONSTRAINT conta_fkey FOREIGN KEY (cpf_cc) REFERENCES Cliente(cpf_c),
);

CREATE TABLE Ganha(   
    cpf_c VARCHAR2(12) NOT NULL,     
    num_conta VARCHAR2(12) NOT NULL,     
    id_bonus INTEGER,     
    CONSTRAINT ganha_pkey PRIMARY KEY (cpf_c, num_conta, id_bonus),
    CONSTRAINT ganha_fkey FOREIGN KEY (cpf_c) REFERENCES Pessoa(cpf),
    CONSTRAINT ganha_fkey2 FOREIGN KEY (num_conta) REFERENCES Conta(num),
    CONSTRAINT ganha_fkey3 FOREIGN KEY (id_bonus) REFERENCES Bonus(id)
);

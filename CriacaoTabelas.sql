
CREATE TABLE Endereco(
    cep VARCHAR2(9) NOT NULL,
    num_endereco INT NOT NULL,
    complemento VARCHAR2(30),
    rua VARCHAR2(40) NOT NULL,
    bairro VARCHAR2(15)NOT NULL,
    cidade VARCHAR2(15)NOT NULL,
    CONSTRAINT endereco_pkey PRIMARY KEY (cep, num_endereco)
);

--PESSOA
CREATE TABLE Pessoa (
	cpf VARCHAR2(14) NOT NULL,
	nome VARCHAR2(50) NOT NULL,
    genero CHAR(1) NOT NULL, 
	nascimento DATE NOT NULL,
    cep VARCHAR2(9) NOT NULL,
    num_endereco INT NOT NULL,
	CONSTRAINT pessoa_pkey PRIMARY KEY (cpf),
    CONSTRAINT cep_fkey FOREIGN KEY (cep, num_endereco) REFERENCES Endereco(cep, num_endereco)
);

CREATE TABLE Telefone(
    cpf_t VARCHAR2(14) NOT NULL,
    telefone VARCHAR2(11) NOT NULL,
    CONSTRAINT telefone_pkey PRIMARY KEY (telefone, cpf_t),
    CONSTRAINT telefone_fkey FOREIGN KEY (cpf_t) REFERENCES Pessoa(cpf)
);

--CLIENTES
CREATE TABLE Cliente( 
    cpf_c VARCHAR2(14) NOT NULL,
    cpf_indicador VARCHAR2(14),
    CONSTRAINT cliente_pkey PRIMARY KEY (cpf_c),
    CONSTRAINT cliente_fkey_p FOREIGN KEY (cpf_c) REFERENCES Pessoa(cpf),
    CONSTRAINT cliente_fkey_c FOREIGN KEY (cpf_indicador) REFERENCES Cliente(cpf_c)
);
    
CREATE TABLE Email(
    cpf_e VARCHAR2(14) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    CONSTRAINT email_pkey PRIMARY KEY (cpf_e, email),
    CONSTRAINT email_fkey FOREIGN KEY (cpf_e) REFERENCES Cliente(cpf_c)
);

CREATE TABLE Dependente(
    cpf_responsavel VARCHAR2(14) NOT NULL,
    num_seq INTEGER NOT NULL,
    nome VARCHAR2(50) NOT NULL,
    CONSTRAINT dependente_pkey  PRIMARY KEY(cpf_responsavel, num_seq),
    CONSTRAINT dependente_fkey FOREIGN KEY (cpf_responsavel) REFERENCES Cliente(cpf_c)
);

--FUNCIONÁRIO
CREATE TABLE Cargo(
    titulo VARCHAR2(12) CHECK (titulo IN ('Funcionário', 'Supervisor')) NOT NULL,
    salario INTEGER NOT NULL,
    CONSTRAINT cargo_pkey PRIMARY KEY (titulo)
);


CREATE TABLE Funcionario(
    num_alugueis INTEGER NOT NULL,  -- Inicia com 0
    cpf_f VARCHAR2(14) NOT NULL,
    cargo VARCHAR2(12) NOT NULL,
    cpf_s VARCHAR2(14),
    CONSTRAINT funcionario_pkey PRIMARY KEY (cpf_f),
    CONSTRAINT funcionario_fkey FOREIGN KEY (cpf_f) REFERENCES Pessoa(cpf),
    CONSTRAINT funcionario_fkey2 FOREIGN KEY (cpf_s) REFERENCES Funcionario(cpf_f),
    CONSTRAINT funcionario_fkey3 FOREIGN KEY (cargo) REFERENCES Cargo(titulo)
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
    CONSTRAINT produto_pkey PRIMARY KEY (id)
);

CREATE TABLE Genero_produto(
    id_produto INTEGER NOT NULL, 
    genero VARCHAR2(25) NOT NULL,
    CONSTRAINT genero_produto_pkey PRIMARY KEY (id_produto, genero),
    CONSTRAINT genero_produto_fkey FOREIGN KEY (id_produto) REFERENCES Produto(id)
);

CREATE TABLE Produtora_produto(
    id_produto INTEGER NOT NULL,
    produtora VARCHAR2(100) NOT NULL,
    CONSTRAINT produtora_produto_pkey PRIMARY KEY (id_produto, produtora),
    CONSTRAINT produtora_produto_fkey FOREIGN KEY (id_produto) REFERENCES Produto(id)
);

CREATE TABLE Criadores_produto(
    id_produto INTEGER NOT NULL,
    criadores VARCHAR2(100),
    CONSTRAINT criadores_produto_pkey PRIMARY KEY (id_produto, criadores),
    CONSTRAINT criadores_produto_fkey FOREIGN KEY (id_produto) REFERENCES Produto(id)
);

CREATE SEQUENCE id_bonus INCREMENT BY 1 START WITH 1;

CREATE TABLE Bonus(
    id_bonus INTEGER NOT NULL,
    valor NUMBER NOT NULL,
    CONSTRAINT bonus_pkey PRIMARY KEY (id_bonus)
);

--CONTA
CREATE SEQUENCE num INCREMENT BY 1 START WITH 1;

CREATE TABLE Conta(
    num INTEGER NOT NULL,
    cpf_cc VARCHAR2(14) NOT NULL,
    credito NUMBER,
    qnt_alugada INTEGER,
    CONSTRAINT conta_pkey PRIMARY KEY (num),
    CONSTRAINT conta_fkey FOREIGN KEY (cpf_cc) REFERENCES Cliente(cpf_c)
);

CREATE TABLE Ganha(    
    num_conta INTEGER NOT NULL,     
    id_bonus INTEGER NOT NULL,   
    CONSTRAINT ganha_pkey PRIMARY KEY (num_conta, id_bonus),
    CONSTRAINT ganha_fkey2 FOREIGN KEY (num_conta) REFERENCES Conta(num),
    CONSTRAINT ganha_fkey3 FOREIGN KEY (id_bonus) REFERENCES Bonus(id_bonus)
);

CREATE TABLE Avalia(
    cpf_c VARCHAR2(14) NOT NULL,
    id    INTEGER      NOT NULL,
    valor NUMBER(3,1)  NOT NULL CHECK (valor >= 0 AND valor <= 10),
    CONSTRAINT avalia_pkey PRIMARY KEY (cpf_c, id),
    CONSTRAINT avalia_fkey_cliente FOREIGN KEY (cpf_c) REFERENCES Cliente(cpf_c),
    CONSTRAINT avalia_fkey_produto FOREIGN KEY (id) REFERENCES Produto(id)
);

CREATE TABLE Avalia2 (
    cpf_responsavel VARCHAR2(14) NOT NULL,
    num_seq         INTEGER      NOT NULL,
    id              INTEGER      NOT NULL,
    valor           NUMBER(3,1)  NOT NULL CHECK (valor >= 0 AND valor <= 10),
    CONSTRAINT avalia2_pkey PRIMARY KEY (cpf_responsavel, num_seq, id),
    CONSTRAINT avalia2_fkey_dependente FOREIGN KEY (cpf_responsavel, num_seq) REFERENCES Dependente(cpf_responsavel, num_seq),
    CONSTRAINT avalia2_fkey_produto FOREIGN KEY (id) REFERENCES Produto(id)
);

CREATE TABLE Aluga (
    cpf_f           VARCHAR2(14)  NOT NULL,
    num             INTEGER        NOT NULL,
    id              INTEGER        NOT NULL,
    data_inicio     DATE           NOT NULL,
    multa           NUMBER(8,2),
    preco           NUMBER(8,2)    NOT NULL,
    forma_pgmto     VARCHAR2(30)   NOT NULL,
    prazo_devolucao DATE           NOT NULL,
    CONSTRAINT aluga_pkey PRIMARY KEY (cpf_f, num, id),
    CONSTRAINT aluga_fkey_funcionario FOREIGN KEY (cpf_f) REFERENCES Funcionario(cpf_f),
    CONSTRAINT aluga_fkey_conta FOREIGN KEY (num) REFERENCES Conta(num),
    CONSTRAINT aluga_fkey_produto FOREIGN KEY (id) REFERENCES Produto(id)

);
